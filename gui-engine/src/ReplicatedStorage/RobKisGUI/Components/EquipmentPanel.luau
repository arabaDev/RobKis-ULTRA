--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.EquipmentPanel
-- Tipo: ModuleScript (componente cliente) | Função: lista os slots de equipamento e o item equipado em cada um.

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)

local M = {}

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	local window: any = ctx.Registry:Create("ModalWindow", { Panel = config.Panel or "Equipment", Title = config.Title or "Equipamentos", Size = UDim2.fromScale(0.5, 0.66) }, ctx)
	self.Window = window
	self.Instance = window.Instance
	self.Cleaner:Add(window)
	local list = UIUtils.scroller(window.Content, "List", nil, 8)
	local rows: { Instance } = {}
	local pendingSlots: { [string]: boolean } = {}

	local function rebuild()
		for _, row in rows do
			row:Destroy()
		end
		table.clear(rows)
		local catalog = ctx.State:Get("Catalog")
		if type(catalog) ~= "table" then
			return
		end
		local items = UIUtils.indexById(catalog.Items)
		local equipped = ctx.State:Get("Equipped") or {}
		for index, slotId in catalog.Slots or {} do
			local row = UIUtils.create("Frame", { Parent = list, BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 52), LayoutOrder = index })
			self:Skin(row, "Panel")
			local slotName = (catalog.SlotNames and catalog.SlotNames[slotId]) or slotId
			local title = UIUtils.create("TextLabel", {
				Parent = row, BackgroundTransparency = 1, Position = UDim2.fromOffset(12, 4), Size = UDim2.new(0.6, 0, 0, 22),
				TextXAlignment = Enum.TextXAlignment.Left, Text = tostring(slotName),
			})
			self:Text(title, "Muted", 0.85)
			local item = items[equipped[slotId]]
			local value = UIUtils.create("TextLabel", {
				Parent = row, BackgroundTransparency = 1, Position = UDim2.fromOffset(12, 26), Size = UDim2.new(0.6, 0, 0, 22),
				TextXAlignment = Enum.TextXAlignment.Left, Text = item and tostring(item.Name) or "Vazio",
			})
			self:Text(value, "Title", 0.8)
			if item then
				local button = self:Button(row, "Remover", "Surface", function()
					if pendingSlots[slotId] then
						return
					end
					pendingSlots[slotId] = true
					ctx.Request("Unequip", { slot = slotId }, function()
						pendingSlots[slotId] = nil
					end)
				end)
				button.AnchorPoint = Vector2.new(1, 0.5)
				button.Position = UDim2.new(1, -10, 0.5, 0)
				button.Size = UDim2.fromOffset(96, 32)
			end
			table.insert(rows, row)
		end
	end

	self.Cleaner:Add(ctx.State:Subscribe("Equipped", rebuild))
	self.Cleaner:Add(ctx.State:Subscribe("Catalog", rebuild))
	rebuild()
	return self
end

return M
