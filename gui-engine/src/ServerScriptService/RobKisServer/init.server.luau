--!strict
-- Local: ServerScriptService.RobKisServer
-- Tipo: Script (servidor) | Função: ÚNICA autoridade da interface. Recebe ações do cliente por UIActionEvent,
-- valida (esquema + limite de frequência + regras de negócio) e responde com Result/Sync.
-- O cliente nunca envia preço, saldo ou quantidade: só ids.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GUI = ReplicatedStorage:WaitForChild("RobKisGUI")
local Validators = require(GUI:WaitForChild("Shared"):WaitForChild("Validators"))
local Catalog = require(script.Catalog)
local PlayerStore = require(script.PlayerStore)
local Economy = require(script.EconomyAdapter)
local API = require(script.API)

-- Remotes (criados aqui se o projeto não usa Rojo)
local remotes = GUI:FindFirstChild("Remotes")
if remotes == nil then
	remotes = Instance.new("Folder")
	remotes.Name = "Remotes"
	remotes.Parent = GUI
end
local actionEvent = remotes:FindFirstChild("UIActionEvent")
if actionEvent == nil then
	actionEvent = Instance.new("RemoteEvent")
	actionEvent.Name = "UIActionEvent"
	actionEvent.Parent = remotes
end
local remote = actionEvent :: RemoteEvent

local MIN_INTERVAL: { [string]: number } = { SaveSettings = 2, RequestSync = 1 }
local DEFAULT_INTERVAL = 0.15
local ENERGY_REGEN = 5

local function pushSync(player: Player, withCatalog: boolean?)
	local snap = PlayerStore.snapshot(player, withCatalog == true)
	if snap and player.Parent then
		remote:FireClient(player, "Sync", snap)
	end
end
API._setSyncCallback(function(player: Player)
	pushSync(player, false)
end)

-- Handlers: (player, sessão, dadosValidados) -> (ok, códigoDeErro?, dados?)
local handlers: { [string]: (Player, any, any) -> (boolean, string?, any?) } = {}

handlers.RequestSync = function(player, _, _)
	pushSync(player, true)
	return true, nil, nil
end

handlers.Purchase = function(player, s, data)
	local item = Catalog.ItemsById[data.itemId]
	if item == nil then
		return false, "item_unknown", nil
	end
	if s.Inventory[item.Id] then
		return false, "already_owned", nil
	end
	if not Economy.spend(player, item.Currency, item.Price) then
		return false, "insufficient_funds", nil
	end
	s.Inventory[item.Id] = 1
	return true, nil, { itemId = item.Id }
end

handlers.Equip = function(_, s, data)
	local item = Catalog.ItemsById[data.itemId]
	if item == nil or item.Slot == nil then
		return false, "item_unknown", nil
	end
	if not s.Inventory[item.Id] then
		return false, "not_owned", nil
	end
	s.Equipped[item.Slot] = item.Id
	return true, nil, nil
end

handlers.Unequip = function(_, s, data)
	if not Catalog.SlotSet[data.slot] then
		return false, "slot_unknown", nil
	end
	if s.Equipped[data.slot] == nil then
		return false, "nothing_equipped", nil
	end
	s.Equipped[data.slot] = nil
	return true, nil, nil
end

handlers.UseSkill = function(player, s, data)
	local skill = Catalog.SkillsById[data.skillId]
	if skill == nil then
		return false, "skill_unknown", nil
	end
	if s.Level < skill.MinLevel then
		return false, "level_too_low", nil
	end
	local now = os.clock()
	local readyAt = s.Cooldowns[skill.Id]
	if readyAt and readyAt > now then
		return false, "cooldown", nil
	end
	if s.Energy < skill.EnergyCost then
		return false, "no_energy", nil
	end
	s.Energy -= skill.EnergyCost
	s.Cooldowns[skill.Id] = now + skill.Cooldown
	API.SkillActivated:Fire(player, skill.Id)
	return true, nil, { skillId = skill.Id, cooldown = skill.Cooldown }
end

handlers.ClaimQuest = function(player, s, data)
	local quest = Catalog.QuestsById[data.questId]
	if quest == nil then
		return false, "quest_unknown", nil
	end
	local entry = s.Quests[quest.Id]
	if entry.Claimed then
		return false, "already_claimed", nil
	end
	if entry.Progress < quest.Goal then
		return false, "quest_incomplete", nil
	end
	entry.Claimed = true
	Economy.grant(player, quest.Reward.Currency, quest.Reward.Amount)
	return true, nil, nil
end

handlers.SelectClass = function(player, s, data)
	local class = Catalog.ClassesById[data.classId]
	if class == nil then
		return false, "class_unknown", nil
	end
	if not s.OwnedClasses[class.Id] then
		if class.Price > 0 and not Economy.spend(player, class.Currency, class.Price) then
			return false, "insufficient_funds", nil
		end
		s.OwnedClasses[class.Id] = true
	end
	s.Class = class.Id
	return true, nil, nil
end

handlers.SaveSettings = function(_, s, data)
	s.Settings = data.settings
	if data.settings.TutorialDone ~= nil then
		s.TutorialDone = data.settings.TutorialDone
	end
	return true, nil, nil
end

remote.OnServerEvent:Connect(function(player: Player, action: any, payload: any)
	local valid, dataOrCode, rid = Validators.validateAction(action, payload)
	local function reply(ok: boolean, code: string?, extra: any?)
		if rid ~= nil and player.Parent then
			remote:FireClient(player, "Result", { rid = rid, action = action, ok = ok, code = code, data = extra })
		end
	end
	if not valid then
		reply(false, tostring(dataOrCode), nil)
		return
	end
	local session = PlayerStore.waitFor(player, 5)
	if session == nil then
		reply(false, "no_session", nil)
		return
	end
	local now = os.clock()
	local last = session.LastAction[action]
	local interval = MIN_INTERVAL[action] or DEFAULT_INTERVAL
	if last ~= nil and now - last < interval then
		reply(false, "rate_limited", nil)
		return
	end
	session.LastAction[action] = now
	local handler = handlers[action]
	if handler == nil then
		reply(false, "action_unknown", nil)
		return
	end
	local ok, success, code, extra = pcall(handler, player, session, dataOrCode)
	if not ok then
		warn("[RobKisGUI] erro em " .. tostring(action) .. ": " .. tostring(success))
		reply(false, "server_error", nil)
		return
	end
	reply(success, code, extra)
	if action ~= "RequestSync" then
		pushSync(player, false)
	end
end)

local function onPlayerAdded(player: Player)
	PlayerStore.init(player)
end

Players.PlayerAdded:Connect(onPlayerAdded)
for _, player in Players:GetPlayers() do
	task.spawn(onPlayerAdded, player)
end

Players.PlayerRemoving:Connect(function(player: Player)
	PlayerStore.saveSettings(player)
	PlayerStore.release(player)
end)

game:BindToClose(function()
	for _, player in Players:GetPlayers() do
		PlayerStore.saveSettings(player)
	end
end)

-- Regeneração de energia (servidor é a autoridade)
task.spawn(function()
	while true do
		task.wait(2)
		for _, player in Players:GetPlayers() do
			local s = PlayerStore.get(player)
			if s and s.Energy < s.MaxEnergy then
				s.Energy = math.min(s.MaxEnergy, s.Energy + ENERGY_REGEN)
				pushSync(player, false)
			end
		end
	end
end)
