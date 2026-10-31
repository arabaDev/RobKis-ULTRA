--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.ConfirmationDialog
-- Tipo: ModuleScript (componente cliente, singleton) | Função: confirmação de operações importantes.
-- Publica ctx.Confirm({ Title, Message, ConfirmText?, CancelText?, Danger? }, function(confirmou: boolean) ... end).
-- Pedidos simultâneos entram em fila.

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)

local M = {}

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	local queue: { any } = {}
	local current: any = nil

	local dim = UIUtils.create("TextButton", {
		Name = "ConfirmationDialog", Parent = ctx.Layers.Overlay, Text = "", AutoButtonColor = false, Active = true,
		BackgroundColor3 = Color3.new(0, 0, 0), BackgroundTransparency = 1, BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1), ZIndex = 50, Visible = false,
	})
	local card = UIUtils.create("CanvasGroup", {
		Parent = dim, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(340, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, GroupTransparency = 1,
	})
	local body = UIUtils.create("Frame", { Parent = card, BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y })
	self:Skin(body, "Surface")
	UIUtils.create("UIPadding", {
		Parent = body, PaddingTop = UDim.new(0, 14), PaddingBottom = UDim.new(0, 14), PaddingLeft = UDim.new(0, 16), PaddingRight = UDim.new(0, 16),
	})
	UIUtils.create("UIListLayout", { Parent = body, Padding = UDim.new(0, 10), SortOrder = Enum.SortOrder.LayoutOrder })
	local title = UIUtils.create("TextLabel", {
		Parent = body, BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y,
		TextXAlignment = Enum.TextXAlignment.Left, TextWrapped = true, LayoutOrder = 1, Text = "",
	})
	self:Text(title, "Title")
	local message = UIUtils.create("TextLabel", {
		Parent = body, BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y,
		TextXAlignment = Enum.TextXAlignment.Left, TextWrapped = true, LayoutOrder = 2, Text = "",
	})
	self:Text(message, "Muted")
	local row = UIUtils.create("Frame", { Parent = body, BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 38), LayoutOrder = 3 })
	UIUtils.create("UIListLayout", {
		Parent = row, FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0, 8),
		HorizontalAlignment = Enum.HorizontalAlignment.Right, SortOrder = Enum.SortOrder.LayoutOrder,
	})
	local cancelButton = self:Button(row, "Cancelar", "Surface", function()
		self:Resolve(false)
	end)
	cancelButton.LayoutOrder = 1
	local confirmButton = self:Button(row, "Confirmar", "Primary", function()
		self:Resolve(true)
	end)
	confirmButton.LayoutOrder = 2

	local function present(request: any)
		current = request
		local opts = request.Options
		title.Text = tostring(opts.Title or "Confirmar")
		message.Text = tostring(opts.Message or "")
		cancelButton.Text = tostring(opts.CancelText or "Cancelar")
		confirmButton.Text = tostring(opts.ConfirmText or "Confirmar")
		local t = self:Theme()
		local role = "Primary"
		if opts.Danger then
			role = "Error"
		end
		confirmButton.BackgroundColor3 = UIUtils.roleColor(t, role)
		confirmButton.TextColor3 = UIUtils.contrastColor(confirmButton.BackgroundColor3)
		dim.Visible = true
		self:Tween(dim, { BackgroundTransparency = 0.5 })
		self:Tween(card, { GroupTransparency = 0 })
	end

	function self:Resolve(result: boolean)
		local request = current
		if request == nil then
			return
		end
		current = nil
		self:Tween(card, { GroupTransparency = 1 })
		self:Tween(dim, { BackgroundTransparency = 1 })
		local nextRequest = table.remove(queue, 1)
		if nextRequest then
			present(nextRequest)
		else
			task.delay(self:Theme().AnimationDuration + 0.03, function()
				if current == nil then
					dim.Visible = false
				end
			end)
		end
		task.spawn(request.Callback, result)
	end

	ctx.Confirm = function(options: any, callback: (boolean) -> ())
		local request = { Options = options or {}, Callback = callback }
		if current then
			table.insert(queue, request)
		else
			present(request)
		end
	end
	self.Cleaner:Add(function()
		ctx.Confirm = nil
	end)
	self.Instance = dim
	return self
end

return M
