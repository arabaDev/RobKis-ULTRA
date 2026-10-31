--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.ShopPanel
-- Tipo: ModuleScript (componente cliente) | Função: loja por categorias (Tabs), com confirmação de compra.
-- O PREÇO E A VALIDAÇÃO SÃO DO SERVIDOR: o cliente só envia o itemId. Itens já possuídos não podem ser recomprados.

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)

local M = {}

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	local window: any = ctx.Registry:Create("ModalWindow", { Panel = config.Panel or "Shop", Title = config.Title or "Loja" }, ctx)
	self.Window = window
	self.Instance = window.Instance
	self.Cleaner:Add(window)
	local content = window.Content
	local confirmPurchase = config.ConfirmPurchase ~= false

	local tabsHolder = UIUtils.create("Frame", { Parent = content, BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, -58) })
	local bottom = UIUtils.create("Frame", { Parent = content, BorderSizePixel = 0, AnchorPoint = Vector2.new(0, 1), Position = UDim2.fromScale(0, 1), Size = UDim2.new(1, 0, 0, 50) })
	self:Skin(bottom, "Panel")
	local info = UIUtils.create("TextLabel", {
		Parent = bottom, BackgroundTransparency = 1, Position = UDim2.fromOffset(12, 0), Size = UDim2.new(1, -150, 1, 0),
		TextXAlignment = Enum.TextXAlignment.Left, TextWrapped = true, Text = "Selecione um item",
	})
	self:Text(info, "Body", 0.9)
	local buyButton = self:Button(bottom, "Comprar", "Primary", nil)
	buyButton.AnchorPoint = Vector2.new(1, 0.5)
	buyButton.Position = UDim2.new(1, -8, 0.5, 0)
	buyButton.Size = UDim2.fromOffset(120, 36)
	self:SetEnabled(buyButton, false)

	local tabs: any = nil
	local cards: { any } = {}
	local selected: any = nil
	local pending = false

	local function priceText(item: any): string
		return UIUtils.formatNumber(item.Price) .. " " .. tostring(item.Currency)
	end

	local function refreshBottom()
		if selected == nil then
			info.Text = "Selecione um item"
			self:SetEnabled(buyButton, false)
			return
		end
		local inventory = ctx.State:Get("Inventory") or {}
		local currencies = ctx.State:Get("Currencies") or {}
		local owned = inventory[selected.Id] ~= nil
		if owned then
			info.Text = tostring(selected.Name) .. " - você já possui"
			buyButton.Text = "Possui"
		else
			info.Text = tostring(selected.Name) .. " - " .. priceText(selected)
			if (currencies[selected.Currency] or 0) < selected.Price then
				info.Text = info.Text .. " (saldo insuficiente)"
			end
			buyButton.Text = "Comprar"
		end
		self:SetEnabled(buyButton, not owned and not pending)
	end

	local function rebuild()
		for _, card in cards do
			card:Destroy()
		end
		table.clear(cards)
		if tabs then
			tabs:Destroy()
			tabs = nil
		end
		local catalog = ctx.State:Get("Catalog")
		if type(catalog) ~= "table" or type(catalog.Items) ~= "table" then
			return
		end
		local seen: { [string]: boolean } = {}
		local tabList: { any } = {}
		for _, item in catalog.Items do
			local category = item.Category or "Geral"
			if not seen[category] then
				seen[category] = true
				table.insert(tabList, { Id = category, Label = category })
			end
		end
		if #tabList == 0 then
			return
		end
		tabs = ctx.Registry:Create("Tabs", { Parent = tabsHolder, Tabs = tabList }, ctx)
		local inventory = ctx.State:Get("Inventory") or {}
		local scrollers: { [string]: any } = {}
		for _, tab in tabList do
			scrollers[tab.Id] = UIUtils.scroller(tabs.Contents[tab.Id], "Grid", UDim2.fromOffset(96, 118), 8)
		end
		for index, item in catalog.Items do
			local footer = priceText(item)
			if inventory[item.Id] then
				footer = "Possui"
			end
			local card: any = ctx.Registry:Create("ItemCard", {
				Parent = scrollers[item.Category or "Geral"], Item = item, Footer = footer,
				LayoutOrder = index, Size = UDim2.fromOffset(96, 118),
			}, ctx)
			card.Clicked:Connect(function()
				selected = item
				for _, other in cards do
					other:SetSelected(other:GetItem().Id == item.Id)
				end
				refreshBottom()
			end)
			table.insert(cards, card)
		end
		refreshBottom()
	end

	local function doPurchase(item: any)
		pending = true
		self:SetEnabled(buyButton, false)
		ctx.Request("Purchase", { itemId = item.Id }, function(ok: boolean)
			pending = false
			if ok then
				self:Notify("Success", "Compra concluída: " .. tostring(item.Name))
			end
			refreshBottom()
		end)
	end

	self.Cleaner:Add(buyButton.Activated:Connect(function()
		if selected == nil or pending then
			return
		end
		local item = selected
		if not confirmPurchase or ctx.Confirm == nil then
			doPurchase(item)
			return
		end
		ctx.Confirm({
			Title = "Confirmar compra",
			Message = "Comprar " .. tostring(item.Name) .. " por " .. priceText(item) .. "?",
			ConfirmText = "Comprar",
		}, function(accepted: boolean)
			if accepted then
				doPurchase(item)
			end
		end)
	end))
	self.Cleaner:Add(ctx.State:Subscribe("Catalog", rebuild))
	self.Cleaner:Add(ctx.State:Subscribe("Inventory", rebuild))
	self.Cleaner:Add(ctx.State:Subscribe("Currencies", refreshBottom))
	self.Cleaner:Add(function()
		for _, card in cards do
			card:Destroy()
		end
		if tabs then
			tabs:Destroy()
		end
	end)
	rebuild()
	return self
end

return M
