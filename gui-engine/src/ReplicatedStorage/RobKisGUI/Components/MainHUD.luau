--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.MainHUD
-- Tipo: ModuleScript (componente cliente) | Função: HUD principal: vitais (nível, vida, energia, XP),
-- menu lateral que abre os painéis e rastreador da missão atual. Compõe outros componentes, não duplica lógica.

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)
local UIConfig = require(Shared.UIConfig)

local M = {}

local function firstOpenQuest(state: any): (any, any)
	local catalog = state:Get("Catalog")
	local progress = state:Get("Quests")
	if type(catalog) ~= "table" or type(progress) ~= "table" or type(catalog.Quests) ~= "table" then
		return nil, nil
	end
	for _, quest in catalog.Quests do
		local entry = progress[quest.Id]
		if entry and not entry.Claimed then
			return quest, entry
		end
	end
	return nil, nil
end

local function claimableCount(state: any): number
	local catalog = state:Get("Catalog")
	local progress = state:Get("Quests")
	local count = 0
	if type(catalog) == "table" and type(progress) == "table" and type(catalog.Quests) == "table" then
		for _, quest in catalog.Quests do
			local entry = progress[quest.Id]
			if entry and not entry.Claimed and entry.Progress >= quest.Goal then
				count += 1
			end
		end
	end
	return count
end

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	local root = UIUtils.create("Frame", {
		Name = "MainHUD", Parent = ctx.Layers.HUD, BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1),
	})
	self.Instance = root

	-- Vitais (canto superior esquerdo)
	local vitals = UIUtils.create("Frame", {
		Name = "Vitals", Parent = root, BackgroundTransparency = 1, Position = UDim2.fromOffset(12, 8),
		Size = UDim2.fromOffset(230, 0), AutomaticSize = Enum.AutomaticSize.Y,
	})
	UIUtils.create("UIListLayout", { Parent = vitals, Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder })
	local parts = {
		{ "LevelDisplay", UDim2.fromOffset(84, 28) },
		{ "HealthBar", UDim2.fromOffset(220, 22) },
		{ "EnergyBar", UDim2.fromOffset(220, 18) },
		{ "ExperienceBar", UDim2.fromOffset(220, 14) },
	}
	for index, part in parts do
		local child: any = ctx.Registry:Create(part[1], { Parent = vitals, Size = part[2], LayoutOrder = index }, ctx)
		self.Cleaner:Add(child)
	end

	-- Menu lateral
	local menu = UIUtils.create("Frame", {
		Name = "Menu", Parent = root, BackgroundTransparency = 1, AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 10, 0.5, 0), Size = UDim2.fromOffset(110, 0), AutomaticSize = Enum.AutomaticSize.Y,
	})
	UIUtils.create("UIListLayout", { Parent = menu, Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder })
	local menuButtons: { any } = {}
	local questBadge: any = nil
	for index, entry in UIConfig.Menu do
		local button = self:Button(menu, entry.Text, "Surface", function()
			ctx.State:TogglePanel(entry.Panel)
		end)
		button.LayoutOrder = index
		button.Size = UDim2.new(1, 0, 0, 38)
		table.insert(menuButtons, button)
		if entry.Panel == "Quests" then
			questBadge = UIUtils.create("TextLabel", {
				Parent = button, BorderSizePixel = 0, AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, 4, 0, -4),
				Size = UDim2.fromOffset(18, 18), Text = "!", Visible = false, ZIndex = 3,
			})
			UIUtils.create("UICorner", { Parent = questBadge, CornerRadius = UDim.new(1, 0) })
			self:Themed(function(t: any)
				questBadge.BackgroundColor3 = t.Colors.Error
				questBadge.Font = t.FontBold
				questBadge.TextSize = 14
				questBadge.TextColor3 = Color3.new(1, 1, 1)
			end)
		end
	end

	-- Rastreador da missão atual (lado direito)
	local tracker = UIUtils.create("TextButton", {
		Name = "QuestTracker", Parent = root, Text = "", AutoButtonColor = false, BorderSizePixel = 0,
		AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -10, 0.5, -30), Size = UDim2.fromOffset(190, 62), Visible = false,
	})
	self:Skin(tracker, "Surface")
	local trackerTitle = UIUtils.create("TextLabel", {
		Parent = tracker, BackgroundTransparency = 1, Position = UDim2.fromOffset(8, 4), Size = UDim2.new(1, -16, 0, 22),
		TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Text = "",
	})
	self:Text(trackerTitle, "Body", 0.85)
	local trackerBar: any = ctx.Registry:Create("ProgressBar", {
		Parent = tracker, Size = UDim2.new(1, -16, 0, 16), ColorRole = "Primary",
	}, ctx)
	trackerBar.Instance.Position = UDim2.new(0, 8, 0, 34)
	self.Cleaner:Add(trackerBar)
	self.Cleaner:Add(tracker.Activated:Connect(function()
		self:Sound("Click")
		ctx.State:TogglePanel("Quests")
	end))

	local function refreshQuests()
		local quest, entry = firstOpenQuest(ctx.State)
		tracker.Visible = quest ~= nil
		if quest and entry then
			trackerTitle.Text = tostring(quest.Title)
			trackerBar:SetValue(entry.Progress, quest.Goal)
			trackerBar:SetText(string.format("%d/%d", math.min(entry.Progress, quest.Goal), quest.Goal))
		end
		if questBadge then
			questBadge.Visible = claimableCount(ctx.State) > 0
		end
	end
	self.Cleaner:Add(ctx.State:Subscribe("Quests", refreshQuests))
	self.Cleaner:Add(ctx.State:Subscribe("Catalog", refreshQuests))
	refreshQuests()

	-- Ajuste por dispositivo: menu e rastreador menores no celular para não cobrir joystick/pulo
	local function fit()
		if ctx.Device == "Mobile" then
			menu.AnchorPoint = Vector2.new(0, 0)
			menu.Position = UDim2.new(0, 8, 0, 62)
			menu.Size = UDim2.fromOffset(84, 0)
			for _, button in menuButtons do
				button.Size = UDim2.new(1, 0, 0, 30)
			end
			tracker.Size = UDim2.fromOffset(150, 56)
			tracker.AnchorPoint = Vector2.new(1, 0)
			tracker.Position = UDim2.new(1, -8, 0, 50)
		else
			menu.AnchorPoint = Vector2.new(0, 0.5)
			menu.Position = UDim2.new(0, 10, 0.5, 0)
			menu.Size = UDim2.fromOffset(110, 0)
			for _, button in menuButtons do
				button.Size = UDim2.new(1, 0, 0, 38)
			end
			tracker.Size = UDim2.fromOffset(190, 62)
			tracker.AnchorPoint = Vector2.new(1, 0.5)
			tracker.Position = UDim2.new(1, -10, 0.5, -30)
		end
	end
	fit()
	self.Cleaner:Add(ctx.DeviceChanged:Connect(fit))
	return self
end

return M
