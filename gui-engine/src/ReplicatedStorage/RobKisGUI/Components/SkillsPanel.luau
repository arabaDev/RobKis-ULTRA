--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.SkillsPanel
-- Tipo: ModuleScript (componente cliente) | Função: lista de habilidades (nível mínimo, recarga, energia) com botão Usar.
-- O servidor valida nível, energia e recarga; o efeito da habilidade é do SEU jogo (ver evento SkillActivated no servidor).

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)

local M = {}

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	local window: any = ctx.Registry:Create("ModalWindow", { Panel = config.Panel or "Skills", Title = config.Title or "Habilidades", Size = UDim2.fromScale(0.55, 0.7) }, ctx)
	self.Window = window
	self.Instance = window.Instance
	self.Cleaner:Add(window)
	local list = UIUtils.scroller(window.Content, "List", nil, 8)
	local rows: { Instance } = {}
	local pending: { [string]: boolean } = {}

	local function rebuild()
		for _, row in rows do
			row:Destroy()
		end
		table.clear(rows)
		local catalog = ctx.State:Get("Catalog")
		if type(catalog) ~= "table" then
			return
		end
		local level = ctx.State:Get("Level") or 1
		for index, skill in catalog.Skills or {} do
			local row = UIUtils.create("Frame", { Parent = list, BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 70), LayoutOrder = index })
			self:Skin(row, "Panel")
			local locked = (skill.MinLevel or 1) > level
			local title = UIUtils.create("TextLabel", {
				Parent = row, BackgroundTransparency = 1, Position = UDim2.fromOffset(12, 4), Size = UDim2.new(1, -130, 0, 22),
				TextXAlignment = Enum.TextXAlignment.Left, Text = tostring(skill.Name),
			})
			self:Text(title, "Title", 0.85)
			local desc = UIUtils.create("TextLabel", {
				Parent = row, BackgroundTransparency = 1, Position = UDim2.fromOffset(12, 26), Size = UDim2.new(1, -130, 0, 20),
				TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Text = tostring(skill.Description or ""),
			})
			self:Text(desc, "Body", 0.8)
			local meta = UIUtils.create("TextLabel", {
				Parent = row, BackgroundTransparency = 1, Position = UDim2.fromOffset(12, 46), Size = UDim2.new(1, -130, 0, 18),
				TextXAlignment = Enum.TextXAlignment.Left,
				Text = string.format("Nv. %d · Recarga %ss · Energia %d", skill.MinLevel or 1, tostring(skill.Cooldown), skill.EnergyCost or 0),
			})
			self:Text(meta, "Muted", 0.75)
			local label = "Usar"
			if locked then
				label = "Bloqueada"
			end
			local use = self:Button(row, label, "Primary", function()
				if pending[skill.Id] then
					return
				end
				pending[skill.Id] = true
				ctx.Request("UseSkill", { skillId = skill.Id }, function()
					pending[skill.Id] = nil
				end)
			end)
			use.AnchorPoint = Vector2.new(1, 0.5)
			use.Position = UDim2.new(1, -10, 0.5, 0)
			use.Size = UDim2.fromOffset(104, 34)
			self:SetEnabled(use, not locked)
			table.insert(rows, row)
		end
	end

	self.Cleaner:Add(ctx.State:Subscribe("Catalog", rebuild))
	self.Cleaner:Add(ctx.State:Subscribe("Level", rebuild))
	rebuild()
	return self
end

return M
