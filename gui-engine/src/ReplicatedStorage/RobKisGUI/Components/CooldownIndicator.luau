--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.CooldownIndicator
-- Tipo: ModuleScript (componente cliente) | Função: sobreposição de recarga (preenchimento + contagem).
-- Exige Config.Parent (o botão/slot que ele cobre). Start(segundos) reinicia sem acumular tweens.

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)

local M = {}

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	local token = 0
	self.Finished = UIUtils.Signal.new()
	self.Cleaner:Add(self.Finished)

	local holder = UIUtils.create("Frame", {
		Name = "CooldownIndicator", BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), ZIndex = 5, Visible = false,
	})
	local overlay = UIUtils.create("Frame", {
		Parent = holder, BackgroundColor3 = Color3.new(0, 0, 0), BackgroundTransparency = 0.4, BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0, 1), Position = UDim2.fromScale(0, 1), Size = UDim2.fromScale(1, 1), ZIndex = 5,
	})
	UIUtils.create("UICorner", { Parent = overlay })
	local label = UIUtils.create("TextLabel", {
		Parent = holder, BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), ZIndex = 6, Text = "",
		TextColor3 = Color3.new(1, 1, 1), TextStrokeTransparency = 0.4,
	})
	self:Text(label, "Title", 0.9)
	self:Themed(function(t: any)
		label.TextColor3 = Color3.new(1, 1, 1)
		local corner = overlay:FindFirstChildOfClass("UICorner")
		if corner then
			corner.CornerRadius = UDim.new(0, t.CornerRadius)
		end
	end)

	function self:IsActive(): boolean
		return holder.Visible
	end

	function self:Start(duration: number)
		if type(duration) ~= "number" or duration <= 0 then
			return
		end
		token += 1
		local mine = token
		holder.Visible = true
		overlay.Size = UDim2.fromScale(1, 1)
		local theme = self:Theme()
		UIUtils.tween(overlay, { Size = UDim2.fromScale(1, 0) }, duration, {
			Reduced = theme.ReducedMotion, Style = Enum.EasingStyle.Linear,
		})
		task.spawn(function()
			local endsAt = os.clock() + duration
			while token == mine and os.clock() < endsAt do
				label.Text = UIUtils.formatTime(endsAt - os.clock())
				task.wait(0.1)
			end
			if token == mine then
				holder.Visible = false
				label.Text = ""
				self.Finished:Fire()
			end
		end)
	end

	function self:Cancel()
		token += 1
		holder.Visible = false
		label.Text = ""
	end

	if config.Parent == nil then
		error("[RobKisGUI] CooldownIndicator exige Config.Parent", 2)
	end
	self.Instance = holder
	holder.Parent = config.Parent
	return self
end

return M
