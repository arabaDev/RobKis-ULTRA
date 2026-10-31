--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.ExperienceBar
-- Tipo: ModuleScript (componente cliente) | Função: barra de experiência (estado XP/XPToNext, definido pelo servidor).

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)

local M = {}

function M.new(ctx: any, config: any): any
	local cfg = Base.withDefaults(config, {
		ColorRole = "Secondary",
		Placement = { Position = UDim2.fromOffset(12, 66), Size = UDim2.fromOffset(220, 16) },
		Format = function(value: number, max: number): string
			return "XP " .. UIUtils.formatNumber(value) .. "/" .. UIUtils.formatNumber(max)
		end,
	})
	local bar: any = ctx.Registry:Create("ProgressBar", cfg, ctx)
	local function update()
		bar:SetValue(ctx.State:Get("XP") or 0, ctx.State:Get("XPToNext") or 100)
	end
	bar.Cleaner:Add(ctx.State:Subscribe("XP", update))
	bar.Cleaner:Add(ctx.State:Subscribe("XPToNext", update))
	update()
	return bar
end

return M
