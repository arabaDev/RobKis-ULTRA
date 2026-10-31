--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.ToggleButton
-- Tipo: ModuleScript (componente cliente) | Função: interruptor com rótulo, animação e evento Changed.

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)

local M = {}

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	local value: boolean = config.Value == true
	self.Changed = UIUtils.Signal.new()
	self.Cleaner:Add(self.Changed)

	local row = UIUtils.create("Frame", { Name = "ToggleButton", BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 34) })
	local label = UIUtils.create("TextLabel", {
		Parent = row, BackgroundTransparency = 1, Text = config.Label or "", TextXAlignment = Enum.TextXAlignment.Left,
		Size = UDim2.new(1, -64, 1, 0), TextWrapped = true,
	})
	self:Text(label, "Body")
	local track = UIUtils.create("TextButton", {
		Parent = row, Text = "", AutoButtonColor = false, BorderSizePixel = 0,
		AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, 0, 0.5, 0), Size = UDim2.fromOffset(52, 26),
	})
	self:Skin(track, "Surface")
	local knob = UIUtils.create("Frame", {
		Parent = track, BorderSizePixel = 0, AnchorPoint = Vector2.new(0, 0.5),
		Size = UDim2.fromOffset(20, 20), Position = UDim2.new(0, 3, 0.5, 0),
	})
	UIUtils.create("UICorner", { Parent = knob, CornerRadius = UDim.new(1, 0) })
	local function paint(animate: boolean)
		local t = self:Theme()
		local target = UDim2.new(0, 3, 0.5, 0)
		if value then
			target = UDim2.new(1, -23, 0.5, 0)
		end
		if animate then
			self:Tween(knob, { Position = target }, 0.12)
		else
			knob.Position = target
		end
		if value then
			track.BackgroundColor3 = t.Colors.Primary
		else
			track.BackgroundColor3 = t.Colors.Secondary:Lerp(t.Colors.Background, 0.6)
		end
		knob.BackgroundColor3 = UIUtils.contrastColor(track.BackgroundColor3)
	end
	self:Themed(function()
		paint(false)
	end)

	function self:Set(newValue: boolean, silent: boolean?)
		if value == newValue then
			return
		end
		value = newValue
		paint(true)
		if not silent then
			self.Changed:Fire(value)
		end
	end
	function self:Get(): boolean
		return value
	end

	self.Cleaner:Add(track.Activated:Connect(function()
		self:Sound("Click")
		self:Set(not value)
	end))

	self:Mount(row, {
		Layer = "HUD", AnchorPoint = Vector2.zero, Position = UDim2.fromOffset(10, 10), Size = UDim2.fromOffset(240, 34),
	})
	return self
end

return M
