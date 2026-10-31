--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.RarityCard
-- Tipo: ModuleScript (componente cliente) | Função: cartão de raridade (faixa colorida, título, bônus).
-- Config: Rarity ("Common"|"Rare"|"Epic"|"Legendary"), Title, Subtitle, Icon?. Evento Clicked.

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)

local M = {}

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	self.Clicked = UIUtils.Signal.new()
	self.Cleaner:Add(self.Clicked)
	local rarity: string = config.Rarity or "Common"

	local card = UIUtils.create("TextButton", {
		Name = "RarityCard", Text = "", AutoButtonColor = false, BorderSizePixel = 0, Size = config.Size or UDim2.fromOffset(110, 130),
	})
	self:Skin(card, "Surface")
	local stroke = card:FindFirstChildOfClass("UIStroke") :: UIStroke
	local band = UIUtils.create("TextLabel", {
		Parent = card, BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 22), Text = string.upper(rarity),
	})
	local bandCorner = UIUtils.create("UICorner", { Parent = band })
	local icon = UIUtils.create("ImageLabel", {
		Parent = card, BackgroundTransparency = 1, Position = UDim2.fromScale(0.15, 0.2), Size = UDim2.fromScale(0.7, 0.42),
		ScaleType = Enum.ScaleType.Fit, Image = config.Icon or "",
	})
	local title = UIUtils.create("TextLabel", {
		Parent = card, BackgroundTransparency = 1, Position = UDim2.fromScale(0.04, 0.64), Size = UDim2.fromScale(0.92, 0.18),
		Text = config.Title or "", TextTruncate = Enum.TextTruncate.AtEnd,
	})
	self:Text(title, "Body", 0.85)
	local subtitle = UIUtils.create("TextLabel", {
		Parent = card, BackgroundTransparency = 1, Position = UDim2.fromScale(0.04, 0.82), Size = UDim2.fromScale(0.92, 0.16),
		Text = config.Subtitle or "",
	})
	self:Text(subtitle, "Title", 0.8)
	self:Themed(function(t: any)
		local color = t.Rarity[rarity] or t.Rarity.Common
		stroke.Color = color
		band.BackgroundColor3 = color
		band.Font = t.FontBold
		band.TextSize = math.floor(t.TextSize * 0.7)
		band.TextColor3 = UIUtils.contrastColor(color)
		bandCorner.CornerRadius = UDim.new(0, math.max(0, t.CornerRadius - 2))
		subtitle.TextColor3 = color
	end)
	icon.Visible = icon.Image ~= ""

	function self:SetData(data: any)
		rarity = data.Rarity or rarity
		band.Text = string.upper(rarity)
		title.Text = data.Title or title.Text
		subtitle.Text = data.Subtitle or subtitle.Text
		self:Restyle()
	end

	self.Cleaner:Add(card.Activated:Connect(function()
		self:Sound("Click")
		self.Clicked:Fire(config)
	end))
	self:Mount(card, { Layer = "HUD", AnchorPoint = Vector2.zero, Position = UDim2.fromOffset(10, 10), Size = UDim2.fromOffset(110, 130) })
	return self
end

return M
