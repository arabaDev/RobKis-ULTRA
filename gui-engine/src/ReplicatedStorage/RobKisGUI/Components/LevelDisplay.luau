--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.LevelDisplay
-- Tipo: ModuleScript (componente cliente) | Função: mostra "Lv. N" (estado Level) e dá um pulso ao subir de nível.

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)

local M = {}

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	local pill = UIUtils.create("TextLabel", { Name = "LevelDisplay", BorderSizePixel = 0, Text = "Lv. 1" })
	self:Skin(pill, "Primary")
	local scale = UIUtils.create("UIScale", { Parent = pill })
	self:Themed(function(t: any)
		pill.Font = t.FontBold
		pill.TextSize = math.floor(t.TextSize * 0.95)
		pill.TextColor3 = UIUtils.contrastColor(pill.BackgroundColor3)
	end)

	self:Watch("Level", function(level: any, old: any)
		pill.Text = "Lv. " .. tostring(level or 1)
		if type(old) == "number" and type(level) == "number" and level > old then
			self:Tween(scale, { Scale = 1.25 }, 0.12)
			task.delay(0.14, function()
				if pill.Parent then
					self:Tween(scale, { Scale = 1 }, 0.18)
				end
			end)
			self:Notify("Success", "Nível " .. tostring(level) .. "!")
		end
	end)

	self:Mount(pill, { Layer = "HUD", AnchorPoint = Vector2.zero, Position = UDim2.fromOffset(10, 10), Size = UDim2.fromOffset(84, 30) })
	return self
end

return M
