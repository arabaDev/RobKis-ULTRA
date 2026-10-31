--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.Tabs
-- Tipo: ModuleScript (componente cliente) | Função: abas com transição suave. Cada aba tem um CanvasGroup de conteúdo.
-- Config.Tabs = { { Id = "a", Label = "A" }, ... }. Use tabs.Contents[id] para preencher.

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)

local M = {}

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	self.Changed = UIUtils.Signal.new()
	self.Cleaner:Add(self.Changed)
	self.Contents = {}
	self.Current = nil
	local buttons: { [string]: any } = {}
	local token = 0

	local root = UIUtils.create("Frame", { Name = "Tabs", BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) })
	local bar = UIUtils.create("ScrollingFrame", {
		Parent = root, BackgroundTransparency = 1, BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 38),
		ScrollBarThickness = 0, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.X,
		ScrollingDirection = Enum.ScrollingDirection.X,
	})
	UIUtils.create("UIListLayout", {
		Parent = bar, FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder,
	})
	local body = UIUtils.create("Frame", {
		Parent = root, BackgroundTransparency = 1, Position = UDim2.fromOffset(0, 44), Size = UDim2.new(1, 0, 1, -44),
	})

	local function paintTabs()
		local t = self:Theme()
		for id, btn in buttons do
			if id == self.Current then
				btn.BackgroundColor3 = t.Colors.Primary
			else
				btn.BackgroundColor3 = t.Colors.Surface
			end
			btn.TextColor3 = UIUtils.contrastColor(btn.BackgroundColor3)
		end
	end

	for index, tab in config.Tabs or {} do
		local btn = self:Button(bar, tab.Label, "Surface", function()
			self:Select(tab.Id)
		end)
		btn.Size = UDim2.new(0, 0, 1, -4)
		btn.AutomaticSize = Enum.AutomaticSize.X
		btn.LayoutOrder = index
		UIUtils.create("UIPadding", { Parent = btn, PaddingLeft = UDim.new(0, 14), PaddingRight = UDim.new(0, 14) })
		buttons[tab.Id] = btn
		self.Contents[tab.Id] = UIUtils.create("CanvasGroup", {
			Name = tab.Id, Parent = body, BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1),
			GroupTransparency = 1, Visible = false,
		})
	end
	self:Themed(paintTabs)

	function self:Select(id: string)
		if self.Current == id or self.Contents[id] == nil then
			return
		end
		token += 1
		local mine = token
		local old = self.Contents[self.Current]
		local new = self.Contents[id]
		self.Current = id
		if old then
			self:Tween(old, { GroupTransparency = 1 })
			local d = self:Theme().AnimationDuration
			task.delay(d + 0.02, function()
				if token == mine then
					old.Visible = false
				end
			end)
		end
		new.Visible = true
		new.GroupTransparency = 1
		self:Tween(new, { GroupTransparency = 0 })
		paintTabs()
		self.Changed:Fire(id)
	end

	local first = config.Default
	if first == nil and config.Tabs and config.Tabs[1] then
		first = config.Tabs[1].Id
	end
	if first then
		self.Current = nil
		self:Select(first)
		-- a primeira seleção não precisa esperar animação
		local c = self.Contents[first]
		if c then
			c.GroupTransparency = 0
		end
	end

	self:Mount(root, {
		Layer = "HUD", AnchorPoint = Vector2.zero, Position = UDim2.fromOffset(10, 10), Size = UDim2.fromOffset(300, 200),
	})
	return self
end

return M
