--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.ProgressBar
-- Tipo: ModuleScript (componente cliente) | Função: barra de progresso animada e reutilizável (base de vida, energia, XP).

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)

local M = {}

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	local role: string = config.ColorRole or "Primary"
	local track = UIUtils.create("Frame", { Name = "ProgressBar", BorderSizePixel = 0, ClipsDescendants = true })
	self:Skin(track, "Panel")
	local fill = UIUtils.create("Frame", { Name = "Fill", Parent = track, BorderSizePixel = 0, Size = UDim2.fromScale(0, 1) })
	local fillCorner = UIUtils.create("UICorner", { Parent = fill })
	local label = UIUtils.create("TextLabel", {
		Parent = track, BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), ZIndex = 2, Text = "",
		TextColor3 = Color3.new(1, 1, 1), TextStrokeTransparency = 0.45, TextStrokeColor3 = Color3.new(0, 0, 0),
	})
	self:Text(label, "Body", 0.8)
	self:Themed(function(t: any)
		fill.BackgroundColor3 = UIUtils.roleColor(t, role)
		fillCorner.CornerRadius = UDim.new(0, math.max(0, t.CornerRadius - 2))
		label.TextColor3 = Color3.new(1, 1, 1)
	end)

	self.Value = config.Value or 0
	self.Max = config.Max or 100

	function self:SetValue(value: number, max: number?)
		if max then
			self.Max = max
		end
		self.Value = math.clamp(value, 0, self.Max)
		local ratio = 0
		if self.Max > 0 then
			ratio = self.Value / self.Max
		end
		self:Tween(fill, { Size = UDim2.fromScale(ratio, 1) })
		if config.Format then
			label.Text = config.Format(self.Value, self.Max)
		elseif config.ShowText ~= false and config.Text == nil then
			label.Text = ""
		end
	end

	function self:SetText(text: string)
		label.Text = text
	end

	function self:SetRole(newRole: string)
		role = newRole
		self:Restyle()
	end

	self:Mount(track, {
		Layer = "HUD", AnchorPoint = Vector2.zero,
		Position = UDim2.fromOffset(10, 10), Size = UDim2.fromOffset(200, 22),
	})
	self:SetValue(self.Value, self.Max)
	return self
end

return M
