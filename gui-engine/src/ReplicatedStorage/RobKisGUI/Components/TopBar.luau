--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.TopBar
-- Tipo: ModuleScript (componente cliente) | Função: faixa superior direita com as moedas.
-- Config.Currencies = { { Currency = "Coins", Label = "C", ColorRole = "Warning" }, ... }

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)

local M = {}

local DEFAULT_CURRENCIES = {
	{ Currency = "Coins", Label = "C", ColorRole = "Warning" },
	{ Currency = "Gems", Label = "G", ColorRole = "Accent" },
}

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	local row = UIUtils.create("Frame", { Name = "TopBar", BackgroundTransparency = 1, AutomaticSize = Enum.AutomaticSize.X })
	UIUtils.create("UIListLayout", {
		Parent = row, FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0, 8),
		HorizontalAlignment = Enum.HorizontalAlignment.Right, VerticalAlignment = Enum.VerticalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
	for index, entry in config.Currencies or DEFAULT_CURRENCIES do
		local child: any = ctx.Registry:Create("CurrencyDisplay", {
			Parent = row, Currency = entry.Currency, Label = entry.Label, Icon = entry.Icon, ColorRole = entry.ColorRole,
			Size = UDim2.fromOffset(126, 34), LayoutOrder = index,
		}, ctx)
		self.Cleaner:Add(child)
	end
	self:Mount(row, {
		Layer = "HUD", AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -12, 0, 8), Size = UDim2.fromOffset(0, 34),
		})
	return self
end

return M
