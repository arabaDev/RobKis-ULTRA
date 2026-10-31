--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.ItemCard
-- Tipo: ModuleScript (componente cliente) | Função: cartão de item (ícone, nome, quantidade, raridade, rodapé).
-- Item = { Id, Name, Description?, Rarity?, Icon? (rbxassetid) }. Evento Clicked(item).

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)

local M = {}

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	self.Clicked = UIUtils.Signal.new()
	self.Cleaner:Add(self.Clicked)
	local item: any = config.Item or { Id = "", Name = "?" }
	local count = config.Count or 1
	local footer: string = config.Footer or ""
	local selected = false

	local card = UIUtils.create("TextButton", {
		Name = "ItemCard", Text = "", AutoButtonColor = false, BorderSizePixel = 0,
		Size = config.Size or UDim2.fromOffset(88, 104),
	})
	self:Skin(card, "Surface")
	local stroke = card:FindFirstChildOfClass("UIStroke") :: UIStroke
	local icon = UIUtils.create("ImageLabel", {
		Parent = card, BackgroundTransparency = 1, Position = UDim2.fromScale(0.15, 0.06), Size = UDim2.fromScale(0.7, 0.5),
		ScaleType = Enum.ScaleType.Fit, Image = "",
	})
	local initial = UIUtils.create("TextLabel", {
		Parent = card, BackgroundTransparency = 1, Position = UDim2.fromScale(0.1, 0.06), Size = UDim2.fromScale(0.8, 0.5), Text = "",
	})
	self:Text(initial, "Title", 1.6)
	local nameLabel = UIUtils.create("TextLabel", {
		Parent = card, BackgroundTransparency = 1, Position = UDim2.fromScale(0.04, 0.58), Size = UDim2.fromScale(0.92, 0.2),
		TextTruncate = Enum.TextTruncate.AtEnd, Text = "",
	})
	self:Text(nameLabel, "Body", 0.8)
	local footerLabel = UIUtils.create("TextLabel", {
		Parent = card, BackgroundTransparency = 1, Position = UDim2.fromScale(0.04, 0.78), Size = UDim2.fromScale(0.92, 0.2), Text = "",
	})
	self:Text(footerLabel, "Muted", 0.8)
	local badge = UIUtils.create("TextLabel", {
		Parent = card, BackgroundTransparency = 1, AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -4, 0, 2),
		Size = UDim2.fromOffset(34, 18), Text = "", TextXAlignment = Enum.TextXAlignment.Right, ZIndex = 3,
	})
	self:Text(badge, "Title", 0.7)

	local function paint()
		local t = self:Theme()
		local rarity = t.Rarity[item.Rarity or "Common"] or t.Rarity.Common
		if selected then
			stroke.Color = t.Colors.Primary
			stroke.Thickness = t.StrokeThickness + 2
		else
			stroke.Color = rarity
			stroke.Thickness = math.max(1, t.StrokeThickness)
		end
	end
	self:Themed(paint)

	local function refresh()
		nameLabel.Text = tostring(item.Name or "")
		footerLabel.Text = footer
		if count > 1 then
			badge.Text = "x" .. UIUtils.formatNumber(count)
		else
			badge.Text = ""
		end
		local image = item.Icon
		if type(image) == "string" and image ~= "" then
			icon.Image = image
			icon.Visible = true
			initial.Visible = false
		else
			icon.Visible = false
			initial.Visible = true
			initial.Text = string.upper(string.sub(tostring(item.Name or "?"), 1, 1))
		end
		paint()
	end

	function self:SetItem(newItem: any, newCount: number?, newFooter: string?)
		item = newItem
		count = newCount or 1
		footer = newFooter or ""
		refresh()
	end
	function self:SetSelected(value: boolean)
		selected = value
		paint()
	end
	function self:GetItem(): any
		return item
	end

	self.Cleaner:Add(card.Activated:Connect(function()
		self:Sound("Click")
		self.Clicked:Fire(item)
	end))
	if ctx.Tooltip then
		self.Cleaner:Add(ctx.Tooltip:Attach(card, function()
			return item.Name, item.Description
		end))
	end

	self:Mount(card, { Layer = "HUD", AnchorPoint = Vector2.zero, Position = UDim2.fromOffset(10, 10), Size = UDim2.fromOffset(88, 104) })
	refresh()
	return self
end

return M
