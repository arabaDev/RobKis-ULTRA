--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.NotificationSystem
-- Tipo: ModuleScript (componente cliente, singleton) | Função: avisos temporários empilhados (máx. 4).
-- Publica ctx.Notify(tipo, texto, duração?) com tipo = "Success" | "Warning" | "Error" | "Info".

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)

local M = {}
local MAX_VISIBLE = 4
local KIND_COLORS: { [string]: string } = { Success = "Success", Warning = "Warning", Error = "Error", Info = "Accent" }

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	local list = UIUtils.create("Frame", {
		Name = "Notifications", Parent = ctx.Layers.Toasts, BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.new(0.5, 0, 0, 10),
		Size = UDim2.fromOffset(320, 0), AutomaticSize = Enum.AutomaticSize.Y,
	})
	UIUtils.create("UIListLayout", {
		Parent = list, Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
	})
	UIUtils.create("UISizeConstraint", { Parent = list, MaxSize = Vector2.new(360, math.huge) })
	local active: { any } = {}
	local order = 0

	local function dismiss(toast: any)
		local index = table.find(active, toast)
		if index then
			table.remove(active, index)
		end
		if toast.Parent == nil then
			return
		end
		self:Tween(toast, { GroupTransparency = 1 })
		task.delay(self:Theme().AnimationDuration + 0.05, function()
			toast:Destroy()
		end)
	end

	function self:Show(kind: string, text: string, duration: number?)
		local colorKey = KIND_COLORS[kind] or "Accent"
		order += 1
		local toast = UIUtils.create("CanvasGroup", {
			Parent = list, BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y,
			GroupTransparency = 1, LayoutOrder = order,
		})
		local body = UIUtils.create("Frame", { Parent = toast, BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y })
		self:Skin(body, "Surface")
		local stripe = UIUtils.create("Frame", { Parent = body, BorderSizePixel = 0, Size = UDim2.new(0, 5, 1, 0) })
		UIUtils.create("UIPadding", {
			Parent = body, PaddingTop = UDim.new(0, 8), PaddingBottom = UDim.new(0, 8), PaddingLeft = UDim.new(0, 16), PaddingRight = UDim.new(0, 10),
		})
		local label = UIUtils.create("TextLabel", {
			Parent = body, BackgroundTransparency = 1, Text = text, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y,
		})
		self:Text(label, "Body", 0.9)
		self:Themed(function(t: any)
			stripe.BackgroundColor3 = t.Colors[colorKey]
		end)
		table.insert(active, toast)
		self:Tween(toast, { GroupTransparency = 0 })
		while #active > MAX_VISIBLE do
			dismiss(active[1])
		end
		task.delay(duration or 3, function()
			dismiss(toast)
		end)
	end

	ctx.Notify = function(kind: string, text: string, duration: number?)
		self:Show(kind, text, duration)
	end
	self.Cleaner:Add(function()
		ctx.Notify = nil
	end)
	self.Instance = list
	return self
end

return M
