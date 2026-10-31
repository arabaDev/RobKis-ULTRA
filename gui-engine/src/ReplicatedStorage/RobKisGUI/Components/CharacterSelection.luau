--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.CharacterSelection
-- Tipo: ModuleScript (componente cliente) | Função: seleção de classe: lista à esquerda, detalhes e itens iniciais à direita.
-- Comprar/selecionar é validado no servidor (SelectClass). O que a classe concede ao nascer é do SEU jogo.

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)

local M = {}

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	local window: any = ctx.Registry:Create("ModalWindow", { Panel = config.Panel or "Characters", Title = config.Title or "Classes" }, ctx)
	self.Window = window
	self.Instance = window.Instance
	self.Cleaner:Add(window)
	local content = window.Content

	local listHolder = UIUtils.create("Frame", { Parent = content, BackgroundTransparency = 1, Size = UDim2.new(0.3, 0, 1, 0) })
	local list = UIUtils.scroller(listHolder, "List", nil, 6)
	local detail = UIUtils.create("Frame", { Parent = content, BorderSizePixel = 0, Position = UDim2.new(0.32, 0, 0, 0), Size = UDim2.new(0.68, 0, 1, 0) })
	self:Skin(detail, "Panel")
	UIUtils.create("UIPadding", {
		Parent = detail, PaddingTop = UDim.new(0, 12), PaddingBottom = UDim.new(0, 12), PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 12),
	})
	local nameLabel = self:Label(detail, "Selecione uma classe", "Title")
	local descLabel = self:Label(detail, "", "Muted", 0.9)
	descLabel.Position = UDim2.fromOffset(0, 30)
	descLabel.Size = UDim2.new(1, 0, 0, 48)
	descLabel.TextYAlignment = Enum.TextYAlignment.Top
	local itemsLabel = self:Label(detail, "", "Body", 0.9)
	itemsLabel.Position = UDim2.fromOffset(0, 84)
	itemsLabel.Size = UDim2.new(1, 0, 1, -140)
	itemsLabel.TextYAlignment = Enum.TextYAlignment.Top
	local action = self:Button(detail, "Selecionar", "Primary", nil)
	action.AnchorPoint = Vector2.new(0.5, 1)
	action.Position = UDim2.fromScale(0.5, 1)
	action.Size = UDim2.fromOffset(180, 40)
	self:SetEnabled(action, false)

	local buttons: { Instance } = {}
	local selectedId: string? = nil
	local pending = false

	local function currentClass(): any
		local catalog = ctx.State:Get("Catalog")
		if selectedId == nil or type(catalog) ~= "table" then
			return nil
		end
		return UIUtils.indexById(catalog.Classes)[selectedId]
	end

	local function refreshDetail()
		local class = currentClass()
		if class == nil then
			nameLabel.Text = "Selecione uma classe"
			descLabel.Text = ""
			itemsLabel.Text = ""
			self:SetEnabled(action, false)
			return
		end
		nameLabel.Text = tostring(class.Name)
		descLabel.Text = tostring(class.Description or "")
		local lines = { "Itens iniciais:" }
		for _, entry in class.StartItems or {} do
			table.insert(lines, string.format("%s  x%d", tostring(entry.Name), entry.Count or 1))
		end
		itemsLabel.Text = table.concat(lines, "\n")
		local owned = ctx.State:Get("OwnedClasses") or {}
		local active = ctx.State:Get("Class")
		if active == class.Id then
			action.Text = "Selecionada"
			self:SetEnabled(action, false)
		elseif owned[class.Id] or (class.Price or 0) <= 0 then
			action.Text = "Selecionar"
			self:SetEnabled(action, not pending)
		else
			action.Text = "Comprar - " .. UIUtils.formatNumber(class.Price) .. " " .. tostring(class.Currency)
			self:SetEnabled(action, not pending)
		end
	end

	local function rebuild()
		for _, button in buttons do
			button:Destroy()
		end
		table.clear(buttons)
		local catalog = ctx.State:Get("Catalog")
		if type(catalog) ~= "table" then
			return
		end
		for index, class in catalog.Classes or {} do
			local button = self:Button(list, tostring(class.Name), "Surface", function()
				selectedId = class.Id
				refreshDetail()
			end)
			button.Size = UDim2.new(1, 0, 0, 40)
			button.LayoutOrder = index
			button.TextXAlignment = Enum.TextXAlignment.Left
			UIUtils.create("UIPadding", { Parent = button, PaddingLeft = UDim.new(0, 12) })
			table.insert(buttons, button)
		end
		refreshDetail()
	end

	self.Cleaner:Add(action.Activated:Connect(function()
		local class = currentClass()
		if class == nil or pending then
			return
		end
		pending = true
		self:SetEnabled(action, false)
		ctx.Request("SelectClass", { classId = class.Id }, function(ok: boolean)
			pending = false
			if ok then
				self:Notify("Success", "Classe selecionada: " .. tostring(class.Name))
			end
			refreshDetail()
		end)
	end))
	self.Cleaner:Add(ctx.State:Subscribe("Catalog", rebuild))
	self.Cleaner:Add(ctx.State:Subscribe("Class", refreshDetail))
	self.Cleaner:Add(ctx.State:Subscribe("OwnedClasses", refreshDetail))
	rebuild()
	return self
end

return M
