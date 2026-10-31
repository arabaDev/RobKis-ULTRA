--!strict
-- Local: ServerScriptService.RobKisServer.PlayerStore
-- Tipo: ModuleScript (servidor) | Função: dados de sessão de cada jogador (moedas, inventário, missões, nível...)
-- e persistência das CONFIGURAÇÕES de interface em DataStore.
-- ATENÇÃO: moedas/inventário/missões ficam só na sessão (não persistem). Para persistir, integre ao seu sistema de dados
-- (ver gui-engine/README.md, seção Dependências).

local DataStoreService = game:GetService("DataStoreService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Shared = ReplicatedStorage:WaitForChild("RobKisGUI"):WaitForChild("Shared")
local Validators = require(Shared:WaitForChild("Validators"))
local Catalog = require(script.Parent.Catalog)

local PlayerStore = {}

local SETTINGS_STORE = "RobKisGUI_Settings_v1"
local STARTING = { Coins = 500, Gems = 20 } -- valores de DESENVOLVIMENTO: ajuste/zere em produção
local sessions: { [Player]: any } = {}
local store: DataStore? = nil
do
	local ok, result = pcall(function()
		return DataStoreService:GetDataStore(SETTINGS_STORE)
	end)
	if ok then
		store = result
	end
end

function PlayerStore.xpToNext(level: number): number
	return 100 + (level - 1) * 50
end

local function settingsKey(player: Player): string
	return "u_" .. tostring(player.UserId)
end

local function retry(fn: () -> any): (boolean, any)
	local ok, result = false, nil
	for attempt = 1, 3 do
		ok, result = pcall(fn)
		if ok then
			return true, result
		end
		task.wait(attempt)
	end
	return false, result
end

function PlayerStore.loadSettings(player: Player): any
	if store == nil then
		return nil
	end
	local ds = store :: DataStore
	local ok, result = retry(function()
		return ds:GetAsync(settingsKey(player))
	end)
	if not ok then
		warn("[RobKisGUI] não foi possível carregar configurações: " .. tostring(result))
		return nil
	end
	if type(result) == "table" then
		local valid, clean = Validators.validateSettings(result)
		if valid then
			return clean
		end
	end
	return nil
end

function PlayerStore.saveSettings(player: Player)
	local session = sessions[player]
	if store == nil or session == nil or session.Settings == nil then
		return
	end
	local ds = store :: DataStore
	local payload = session.Settings
	local ok, err = retry(function()
		ds:SetAsync(settingsKey(player), payload)
		return true
	end)
	if not ok then
		warn("[RobKisGUI] falha ao salvar configurações: " .. tostring(err))
	end
end

function PlayerStore.init(player: Player): any
	local session: any = {
		Currencies = { Coins = STARTING.Coins, Gems = STARTING.Gems },
		Inventory = {},
		Equipped = {},
		Quests = {},
		Level = 1, XP = 0, Energy = 100, MaxEnergy = 100,
		Class = nil, OwnedClasses = { c_adventurer = true },
		Settings = nil, TutorialDone = false,
		Cooldowns = {}, LastAction = {},
	}
	for _, quest in Catalog.Quests do
		session.Quests[quest.Id] = { Progress = 0, Claimed = false }
	end
	local saved = PlayerStore.loadSettings(player)
	if saved then
		session.Settings = saved
		session.TutorialDone = saved.TutorialDone == true
	end
	if player.Parent == nil then
		return nil
	end
	sessions[player] = session
	return session
end

function PlayerStore.get(player: Player): any
	return sessions[player]
end

function PlayerStore.waitFor(player: Player, timeout: number): any
	local started = os.clock()
	while sessions[player] == nil and player.Parent ~= nil and os.clock() - started < timeout do
		task.wait(0.1)
	end
	return sessions[player]
end

function PlayerStore.release(player: Player)
	sessions[player] = nil
end

local function copy(source: { [any]: any }): { [any]: any }
	local out = {}
	for k, v in source do
		out[k] = v
	end
	return out
end

-- Dados seguros para o cliente (sem cooldowns/estado interno).
function PlayerStore.snapshot(player: Player, withCatalog: boolean): any?
	local s = sessions[player]
	if s == nil then
		return nil
	end
	local quests = {}
	for id, entry in s.Quests do
		quests[id] = { Progress = entry.Progress, Claimed = entry.Claimed }
	end
	local snap: { [string]: any } = {
		Currencies = copy(s.Currencies), Inventory = copy(s.Inventory), Equipped = copy(s.Equipped),
		Quests = quests, Level = s.Level, XP = s.XP, XPToNext = PlayerStore.xpToNext(s.Level),
		Energy = s.Energy, MaxEnergy = s.MaxEnergy, Class = s.Class, OwnedClasses = copy(s.OwnedClasses),
		TutorialDone = s.TutorialDone,
	}
	if withCatalog then
		snap.Catalog = Catalog.View()
		snap.Settings = s.Settings
	end
	return snap
end

return PlayerStore
