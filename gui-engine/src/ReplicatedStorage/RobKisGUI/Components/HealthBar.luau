--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.HealthBar
-- Tipo: ModuleScript (componente cliente) | Função: barra de vida ligada ao Humanoid local.
-- Reconecta sozinha a cada respawn (CharacterAdded). Reutiliza o ProgressBar.

local Players = game:GetService("Players")

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)

local M = {}

function M.new(ctx: any, config: any): any
	local cfg = Base.withDefaults(config, {
		ColorRole = "Error",
		Placement = { Position = UDim2.fromOffset(12, 12), Size = UDim2.fromOffset(220, 24) },
		Format = function(value: number, max: number): string
			return string.format("HP %d/%d", math.ceil(value), math.ceil(max))
		end,
	})
	local bar: any = ctx.Registry:Create("ProgressBar", cfg, ctx)
	local player = Players.LocalPlayer
	local connections: { RBXScriptConnection } = {}

	local function disconnectAll()
		for _, c in connections do
			c:Disconnect()
		end
		table.clear(connections)
	end

	local function bind(character: Model)
		disconnectAll()
		task.spawn(function()
			local humanoid = character:WaitForChild("Humanoid", 10)
			if humanoid == nil or not humanoid:IsA("Humanoid") or player.Character ~= character then
				return
			end
			local function update()
				bar:SetValue(humanoid.Health, humanoid.MaxHealth)
			end
			table.insert(connections, humanoid.HealthChanged:Connect(update))
			table.insert(connections, humanoid:GetPropertyChangedSignal("MaxHealth"):Connect(update))
			update()
		end)
	end

	bar.Cleaner:Add(player.CharacterAdded:Connect(bind))
	bar.Cleaner:Add(disconnectAll)
	if player.Character then
		bind(player.Character)
	end
	return bar
end

return M
