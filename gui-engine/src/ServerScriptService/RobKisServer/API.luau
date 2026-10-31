--!strict
-- Local: ServerScriptService.RobKisServer.API
-- Tipo: ModuleScript (servidor) | Função: pontos de entrada para o SEU jogo alimentar a interface com segurança.
-- Exemplo: require(game.ServerScriptService.RobKisServer.API).AddQuestProgress(player, "q_first_steps", 1)
-- O evento API.SkillActivated dispara (player, skillId) quando o servidor aprova o uso de uma habilidade.

local PlayerStore = require(script.Parent.PlayerStore)
local Catalog = require(script.Parent.Catalog)
local Economy = require(script.Parent.EconomyAdapter)

local API = {}

API.SkillActivated = Instance.new("BindableEvent")
local pushSync: ((Player) -> ())? = nil

function API._setSyncCallback(fn: (Player) -> ())
	pushSync = fn
end

local function sync(player: Player)
	if pushSync then
		pushSync(player)
	end
end

function API.AddQuestProgress(player: Player, questId: string, amount: number)
	local s = PlayerStore.get(player)
	local quest = Catalog.QuestsById[questId]
	if s == nil or quest == nil or type(amount) ~= "number" or amount <= 0 then
		return
	end
	local entry = s.Quests[questId]
	if entry.Claimed then
		return
	end
	entry.Progress = math.min(quest.Goal, entry.Progress + amount)
	sync(player)
end

function API.AddXP(player: Player, amount: number)
	local s = PlayerStore.get(player)
	if s == nil or type(amount) ~= "number" or amount <= 0 then
		return
	end
	s.XP += amount
	while s.XP >= PlayerStore.xpToNext(s.Level) do
		s.XP -= PlayerStore.xpToNext(s.Level)
		s.Level += 1
	end
	sync(player)
end

function API.SetEnergy(player: Player, value: number, max: number?)
	local s = PlayerStore.get(player)
	if s == nil or type(value) ~= "number" then
		return
	end
	if max then
		s.MaxEnergy = math.max(1, max)
	end
	s.Energy = math.clamp(value, 0, s.MaxEnergy)
	sync(player)
end

function API.GrantCurrency(player: Player, currency: string, amount: number)
	if Economy.grant(player, currency, amount) then
		sync(player)
	end
end

function API.GrantItem(player: Player, itemId: string)
	local s = PlayerStore.get(player)
	if s == nil or Catalog.ItemsById[itemId] == nil then
		return
	end
	s.Inventory[itemId] = 1
	sync(player)
end

return API
