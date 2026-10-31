--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.InventoryPanel
-- Tipo: ModuleScript (componente cliente) | Função: inventário com busca, grade de itens e detalhes.
-- Equipar/desequipar são pedidos ao servidor (Equip/Unequip); o botão fica bloqueado enquanto o pedido está pendente.

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)

local M = {}
local RANK: { [string]: number } = { Legendary = 4, Epic = 3, Rare = 2, Common = 1 }

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	local window: any = ctx.Registry:Create("ModalWindow", { Panel = config.Panel or "Inventory", Title = config.Title or "Inventário" }, ctx)
	self.Window = window
	self.Instance = window.Instance
	self.Cleaner:Add(window)
	local content = window.Content

	local search: any = ctx.Registry:Create("SearchField", { Parent = content, Size = UDim2.new(0.62, 0, 0, 36) }, ctx)
	self.Cleaner:Add(search)
	local gridHolder = UIUtils.create("Frame", {
		Parent = content, BackgroundTransparency = 1, Position = UDim2.fromOffset(0, 44), Size = UDim2.new(0.62, 0, 1, -44),
	})
	local scroller = UIUtils.scroller(gridHolder, "Grid", UDim2.fromOffset(88, 104), 8)

	local details = UIUtils.create("Frame", {
		Parent = content, BorderSizePixel = 0, Position = UDim2.new(0.64, 0, 0, 0), Size = UDim2.new(0.36, 0, 1, 0),
	})
	self:Skin(details, "Panel")
	UIUtils.create("UIPadding", {
		Parent = details, PaddingTop = UDim.new(0, 10), PaddingBottom = UDim.new(0, 10), PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10),
	})
	local nameLabel = self:Label(details, "Selecione um item", "Title", 0.9)
	local metaLabel = self:Label(details, "", "Muted", 0.85)
	metaLabel.Position = UDim2.fromOffset(0, 28)
	local descLabel = self:Label(details, "", "Body", 0.85)
	descLabel.Position = UDim2.fromOffset(0, 54)
	descLabel.Size = UDim2.new(1, 0, 1, -110)
	descLabel.TextYAlignment = Enum.TextYAlignment.Top
	local actionButton = self:Button(details, "Equipar", "Primary", nil)
	actionButton.AnchorPoint = Vector2.new(0, 1)
	actionButton.Position = UDim2.new(0, 0, 1, 0)
	actionButton.Size = UDim2.new(1, 0, 0, 38)
	actionButton.Visible = false

	local cards: { [string]: any } = {}
	local selectedId: string? = nil
	local pending = false

	local function clearCards()
		for _, card in cards do
			card:Destroy()
		end
		table.clear(cards)
	end

	local function refreshDetails()
		local catalog = ctx.State:Get("Catalog")
		local item = nil
		if selectedId and type(catalog) == "table" then
			item = UIUtils.indexById(catalog.Items)[selectedId]
		end
		for id, card in cards do
			card:SetSelected(id == selectedId)
		end
		if item == nil then
			nameLabel.Text = "Selecione um item"
			metaLabel.Text = ""
			descLabel.Text = ""
			actionButton.Visible = false
			return
		end
		nameLabel.Text = tostring(item.Name)
		metaLabel.Text = tostring(item.Rarity or "Common") .. " · " .. tostring(item.Slot or "-")
		descLabel.Text = tostring(item.Description or "")
		actionButton.Visible = item.Slot ~= nil
		local equipped = ctx.State:Get("Equipped") or {}
		if equipped[item.Slot] == item.Id then
			actionButton.Text = "Desequipar"
		else
			actionButton.Text = "Equipar"
		end
		self:SetEnabled(actionButton, not pending)
	end

	local function rebuild()
		clearCards()
		local catalog = ctx.State:Get("Catalog")
		local inventory = ctx.State:Get("Inventory")
		if type(catalog) ~= "table" or type(inventory) ~= "table" then
			return
		end
		local filter = search:GetText()
		local list: { any } = {}
		for _, item in catalog.Items or {} do
			if inventory[item.Id] and (filter == "" or string.find(string.lower(item.Name), filter, 1, true)) then
				table.insert(list, item)
			end
		end
		table.sort(list, function(a: any, b: any): boolean
			local ra, rb = RANK[a.Rarity or "Common"] or 1, RANK[b.Rarity or "Common"] or 1
			if ra ~= rb then
				return ra > rb
			end
			return a.Name < b.Name
		end)
		for index, item in list do
			local card: any = ctx.Registry:Create("ItemCard", {
				Parent = scroller, Item = item, Count = inventory[item.Id], LayoutOrder = index,
				Size = UDim2.fromOffset(88, 104),
			}, ctx)
			card.Clicked:Connect(function()
				selectedId = item.Id
				refreshDetails()
			end)
			cards[item.Id] = card
		end
		refreshDetails()
	end

	self.Cleaner:Add(actionButton.Activated:Connect(function()
		if pending or selectedId == nil then
			return
		end
		local catalog = ctx.State:Get("Catalog")
		local item = UIUtils.indexById(catalog and catalog.Items)[selectedId]
		if item == nil or item.Slot == nil then
			return
		end
		local equipped = ctx.State:Get("Equipped") or {}
		pending = true
		self:SetEnabled(actionButton, false)
		local done = function()
			pending = false
			refreshDetails()
		end
		if equipped[item.Slot] == item.Id then
			ctx.Request("Unequip", { slot = item.Slot }, done)
		else
			ctx.Request("Equip", { itemId = item.Id }, done)
		end
	end))
	self.Cleaner:Add(search.Changed:Connect(rebuild))
	self.Cleaner:Add(ctx.State:Subscribe("Inventory", rebuild))
	self.Cleaner:Add(ctx.State:Subscribe("Catalog", rebuild))
	self.Cleaner:Add(ctx.State:Subscribe("Equipped", refreshDetails))
	self.Cleaner:Add(clearCards)
	rebuild()
	return self
end

return M
