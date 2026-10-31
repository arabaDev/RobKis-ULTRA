--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.CurrencyDisplay
-- Tipo: ModuleScript (componente cliente) | Função: mostra uma moeda do estado (Currencies[Currency]) com contagem animada.
-- Config: Currency ("Coins"), Label (letra do ícone), Icon (rbxassetid opcional), ColorRole ("Warning").

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)

local M = {}

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	local currency: string = config.Currency or "Coins"
	local role: string = config.ColorRole or "Warning"

	local pill = UIUtils.create("Frame", { Name = "Currency_" .. currency, BorderSizePixel = 0 })
	self:Skin(pill, "Surface")
	local badge = UIUtils.create("TextLabel", {
		Parent = pill, BorderSizePixel = 0, Position = UDim2.fromOffset(4, 4), Size = UDim2.new(0, 26, 1, -8),
		Text = string.upper(string.sub(config.Label or currency, 1, 1)),
	})
	UIUtils.create("UICorner", { Parent = badge, CornerRadius = UDim.new(1, 0) })
	local image = UIUtils.create("ImageLabel", {
		Parent = badge, BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Image = config.Icon or "", Visible = config.Icon ~= nil,
	})
	local amount = UIUtils.create("TextLabel", {
		Parent = pill, BackgroundTransparency = 1, Position = UDim2.fromOffset(36, 0), Size = UDim2.new(1, -42, 1, 0),
		TextXAlignment = Enum.TextXAlignment.Left, Text = "0",
	})
	self:Text(amount, "Title", 0.9)
	self:Themed(function(t: any)
		badge.BackgroundColor3 = UIUtils.roleColor(t, role)
		badge.Font = t.FontBold
		badge.TextSize = t.TextSize
		badge.TextColor3 = UIUtils.contrastColor(badge.BackgroundColor3)
	end)
	image.Visible = config.Icon ~= nil
	if image.Visible then
		badge.TextTransparency = 1
	end

	local counter = Instance.new("NumberValue")
	self.Cleaner:Add(counter)
	self.Cleaner:Add(counter.Changed:Connect(function(v: number)
		amount.Text = UIUtils.formatNumber(math.floor(v + 0.5))
	end))

	self:Watch("Currencies", function(currencies: any, old: any)
		local value = 0
		if type(currencies) == "table" and type(currencies[currency]) == "number" then
			value = currencies[currency]
		end
		if old == nil then
			counter.Value = value
		else
			UIUtils.tween(counter, { Value = value }, 0.4, { Reduced = self:Theme().ReducedMotion })
		end
	end)

	self:Mount(pill, { Layer = "HUD", AnchorPoint = Vector2.zero, Position = UDim2.fromOffset(10, 10), Size = UDim2.fromOffset(130, 34) })
	return self
end

return M
