--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.PetPanel
-- Tipo: ModuleScript (componente cliente) | Função: mascotes do jogador (itens com Category = "Pet" no catálogo).
-- Equipar usa o mesmo fluxo validado do inventário (slot "Pet"). O multiplicador exibido vem do catálogo do servidor.

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)

local M = {}

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	local window: any = ctx.Registry:Create("ModalWindow", { Panel = config.Panel or "Pets", Title = config.Title or "Mascotes", Size = UDim2.fromScale(0.6, 0.7) }, ctx)
	self.Window = window
	self.Instance = window.Instance
	self.Cleaner:Add(window)
	local grid = UIUtils.scroller(window.Content, "Grid", UDim2.fromOffset(118, 138), 10)
	local cards: { any } = {}
	local pending = false

	local function clear()
		for _, card in cards do
			card:Destroy()
		end
		table.clear(cards)
	end

	local function rebuild()
		clear()
		local catalog = ctx.State:Get("Catalog")
		local inventory = ctx.State:Get("Inventory")
		if type(catalog) ~= "table" or type(inventory) ~= "table" then
			return
		end
		local equipped = ctx.State:Get("Equipped") or {}
		for index, item in catalog.Items or {} do
			if item.Category == "Pet" and inventory[item.Id] then
				local subtitle = ""
				if item.Multiplier then
					subtitle = "x" .. tostring(item.Multiplier)
				end
				local title = tostring(item.Name)
				local isEquipped = equipped[item.Slot or "Pet"] == item.Id
				if isEquipped then
					title = title .. " *"
				end
				local card: any = ctx.Registry:Create("RarityCard", {
					Parent = grid, Rarity = item.Rarity or "Common", Title = title, Subtitle = subtitle,
					Icon = item.Icon, LayoutOrder = index, Size = UDim2.fromOffset(118, 138),
				}, ctx)
				card.Clicked:Connect(function()
					if pending then
						return
					end
					pending = true
					local done = function()
						pending = false
					end
					if isEquipped then
						ctx.Request("Unequip", { slot = item.Slot or "Pet" }, done)
					else
						ctx.Request("Equip", { itemId = item.Id }, done)
					end
				end)
				table.insert(cards, card)
			end
		end
	end

	self.Cleaner:Add(ctx.State:Subscribe("Inventory", rebuild))
	self.Cleaner:Add(ctx.State:Subscribe("Equipped", rebuild))
	self.Cleaner:Add(ctx.State:Subscribe("Catalog", rebuild))
	self.Cleaner:Add(clear)
	rebuild()
	return self
end

return M
