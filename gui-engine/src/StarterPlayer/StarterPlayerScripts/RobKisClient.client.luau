--!strict
-- Local: StarterPlayer.StarterPlayerScripts.RobKisClient
-- Tipo: LocalScript (cliente) | Função: monta a interface a partir de UIConfig, aplica responsividade (UIScale, área segura,
-- dispositivo), liga atalhos e conversa com o servidor. A interface persiste entre respawns (ResetOnSpawn = false).

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")

local GUI = ReplicatedStorage:WaitForChild("RobKisGUI")
local Shared = GUI:WaitForChild("Shared")
local UIUtils = require(Shared:WaitForChild("UIUtils"))
local ThemeConfig = require(Shared:WaitForChild("ThemeConfig"))
local UIState = require(Shared:WaitForChild("UIState"))
local ComponentRegistry = require(Shared:WaitForChild("ComponentRegistry"))
local UIConfig = require(Shared:WaitForChild("UIConfig"))
local actionEvent = GUI:WaitForChild("Remotes"):WaitForChild("UIActionEvent") :: RemoteEvent

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local ERROR_TEXT: { [string]: string } = {
	insufficient_funds = "Saldo insuficiente.",
	already_owned = "Você já possui este item.",
	not_owned = "Você não possui este item.",
	cooldown = "Habilidade em recarga.",
	no_energy = "Energia insuficiente.",
	level_too_low = "Nível insuficiente.",
	quest_incomplete = "Missão ainda não concluída.",
	already_claimed = "Recompensa já resgatada.",
	rate_limited = "Calma! Tente novamente em instantes.",
	timeout = "O servidor demorou a responder.",
	no_session = "Seus dados ainda estão carregando.",
}

-- Recria a interface se o script reiniciar
local old = playerGui:FindFirstChild("RobKisInterface")
if old then
	old:Destroy()
end

local theme = ThemeConfig.new(UIConfig.Style, UIConfig.ThemeOverrides)
local state = UIState.new({
	Loaded = false, Currencies = {}, Inventory = {}, Equipped = {}, Quests = {}, OwnedClasses = {},
	Level = 1, XP = 0, XPToNext = 100, Energy = 100, MaxEnergy = 100, TutorialDone = false,
})
local registry = ComponentRegistry.new()
registry:RegisterFolder(GUI:WaitForChild("Components"))

local screen = UIUtils.create("ScreenGui", {
	Name = "RobKisInterface", ResetOnSpawn = false, IgnoreGuiInset = true, DisplayOrder = 10,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling, Parent = playerGui,
})
local root = UIUtils.create("Frame", { Name = "Root", Parent = screen, BackgroundTransparency = 1, BorderSizePixel = 0 })
local uiScale = UIUtils.create("UIScale", { Parent = root })

local function makeLayer(name: string, z: number): any
	return UIUtils.create("Frame", {
		Name = name, Parent = root, BackgroundTransparency = 1, BorderSizePixel = 0, Size = UDim2.fromScale(1, 1), ZIndex = z,
	})
end
local layers = { HUD = makeLayer("HUD", 1), Panels = makeLayer("Panels", 2), Toasts = makeLayer("Toasts", 3), Overlay = makeLayer("Overlay", 4) }

local ctx: any = {
	Theme = theme, State = state, Registry = registry, Layers = layers, Root = root, ScaleValue = 1,
	Device = UIUtils.getDevice(), DeviceChanged = UIUtils.Signal.new(),
	Events = {
		HotbarSelected = UIUtils.Signal.new(), SkillUsed = UIUtils.Signal.new(), TutorialRequested = UIUtils.Signal.new(),
	},
}

-- Responsividade: escala por dispositivo + área segura (barra superior do Roblox) nas camadas de HUD/painéis/avisos
local function applyLayout()
	local camera = workspace.CurrentCamera
	local viewport = Vector2.new(1280, 720)
	if camera then
		viewport = camera.ViewportSize
	end
	local reference = UIConfig.Responsive.Reference[ctx.Device] or Vector2.new(1280, 720)
	local scale = UIUtils.computeScale(viewport, reference, UIConfig.Responsive.MinScale, UIConfig.Responsive.MaxScale)
	scale = math.clamp(scale * theme:Get().Scale, 0.4, 2.5)
	uiScale.Scale = scale
	ctx.ScaleValue = scale
	root.Size = UDim2.fromScale(1 / scale, 1 / scale)
	local top = GuiService:GetGuiInset().Y / scale
	for _, name in { "HUD", "Panels", "Toasts" } do
		local layer = layers[name]
		layer.Position = UDim2.fromOffset(0, top)
		layer.Size = UDim2.new(1, 0, 1, -top)
	end
end

local function refreshDevice()
	local device = UIUtils.getDevice()
	if device ~= ctx.Device then
		ctx.Device = device
		applyLayout()
		ctx.DeviceChanged:Fire(device)
	else
		applyLayout()
	end
end

applyLayout()
theme.Changed:Connect(applyLayout)
UserInputService.LastInputTypeChanged:Connect(refreshDevice)
local function watchCamera()
	local camera = workspace.CurrentCamera
	if camera then
		camera:GetPropertyChangedSignal("ViewportSize"):Connect(refreshDevice)
	end
end
watchCamera()
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	watchCamera()
	refreshDevice()
end)

-- Pedidos ao servidor com callback e tempo limite
local nextRid = 0
local pending: { [number]: any } = {}

local function fail(entry: any, code: string)
	if not entry.silent and ctx.Notify then
		ctx.Notify("Error", ERROR_TEXT[code] or "Não foi possível concluir a ação.")
	end
	if entry.callback then
		entry.callback(false, code)
	end
end

ctx.Request = function(action: string, payload: { [string]: any }?, callback: ((boolean, any) -> ())?): number
	nextRid += 1
	local rid = nextRid
	local body: { [string]: any } = {}
	for key, value in payload or {} do
		body[key] = value
	end
	local silent = body.silent == true
	body.silent = nil
	body.rid = rid
	pending[rid] = { callback = callback, silent = silent }
	actionEvent:FireServer(action, body)
	task.delay(8, function()
		local entry = pending[rid]
		if entry then
			pending[rid] = nil
			fail(entry, "timeout")
		end
	end)
	return rid
end

local settingsApplied = false
local function applySnapshot(snap: any)
	if type(snap) ~= "table" then
		return
	end
	for _, key in { "Currencies", "Inventory", "Equipped", "Quests", "Level", "XP", "XPToNext", "Energy", "MaxEnergy", "Class", "OwnedClasses", "Catalog" } do
		if snap[key] ~= nil or key == "Class" then
			state:Set(key, snap[key])
		end
	end
	if snap.TutorialDone ~= nil then
		state:Set("TutorialDone", snap.TutorialDone)
	end
	if snap.Settings ~= nil and not settingsApplied then
		settingsApplied = true
		theme:ApplySaved(snap.Settings)
	end
	state:Set("Loaded", true)
end

actionEvent.OnClientEvent:Connect(function(kind: any, data: any)
	if kind == "Sync" then
		applySnapshot(data)
	elseif kind == "Result" and type(data) == "table" then
		local entry = pending[data.rid]
		if entry == nil then
			return
		end
		pending[data.rid] = nil
		if data.ok then
			if data.action == "UseSkill" and type(data.data) == "table" then
				ctx.Events.SkillUsed:Fire(data.data.skillId, data.data.cooldown)
			end
			if entry.callback then
				entry.callback(true, data.data)
			end
		else
			fail(entry, tostring(data.code))
		end
	end
end)

-- Monta os componentes de UIConfig.Layout; uma falha não derruba os outros
local mounted: { any } = {}
for _, entry in UIConfig.Layout do
	if entry.Enabled ~= false then
		local ok, err = pcall(function()
			table.insert(mounted, registry:Create(entry.Component, entry.Config, ctx))
		end)
		if not ok then
			warn("[RobKisGUI] falha ao montar " .. tostring(entry.Component) .. ": " .. tostring(err))
		end
	end
end

-- Atalhos e fechar painéis
UserInputService.InputBegan:Connect(function(input: InputObject, processed: boolean)
	if processed then
		return
	end
	if input.KeyCode == Enum.KeyCode.ButtonB then
		state:ClosePanel()
		return
	end
	for panel, key in UIConfig.Keybinds do
		if input.KeyCode == key then
			state:TogglePanel(panel)
			return
		end
	end
end)

-- Respawn: fecha painéis; HealthBar se religa sozinha
player.CharacterAdded:Connect(function()
	state:ResetTransient()
end)

-- Primeira sincronização (com nova tentativa se o servidor ainda estiver carregando os dados)
task.spawn(function()
	for _ = 1, 3 do
		actionEvent:FireServer("RequestSync", { rid = 0 })
		task.wait(3)
		if state:Get("Loaded") then
			return
		end
	end
end)
