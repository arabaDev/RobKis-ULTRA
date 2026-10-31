--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.EnergyBar
-- Tipo: ModuleScript (componente cliente) | Função: barra de energia (estado Energy/MaxEnergy, definido pelo servidor).

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)

local M = {}

function M.new(ctx: any, config: any): any
	local cfg = Base.withDefaults(config, {
		ColorRole = "Accent",
		Placement = { Position = UDim2.fromOffset(12, 40), Size = UDim2.fromOffset(220, 20) },
		Format = function(value: number, max: number): string
			return string.format("EN %d/%d", math.floor(value), math.floor(max))
		end,
	})
	local bar: any = ctx.Registry:Create("ProgressBar", cfg, ctx)
	local function update()
		bar:SetValue(ctx.State:Get("Energy") or 0, ctx.State:Get("MaxEnergy") or 100)
	end
	bar.Cleaner:Add(ctx.State:Subscribe("Energy", update))
	bar.Cleaner:Add(ctx.State:Subscribe("MaxEnergy", update))
	update()
	return bar
end

return M
