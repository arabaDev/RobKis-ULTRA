--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.ModalWindow
-- Tipo: ModuleScript (componente cliente) | Função: janela com título, botão fechar e animação de entrada/saída.
-- Liga-se ao estado: abre quando UIState.ActivePanel == Config.Panel. Preencha window.Content.

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)

local M = {}

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	local name: string = config.Panel or config.Title or "Window"
	self.Name = name
	self.IsOpen = false
	self.Opened = UIUtils.Signal.new()
	self.Closed = UIUtils.Signal.new()
	self.Cleaner:Add(self.Opened)
	self.Cleaner:Add(self.Closed)
	local defaultSize = config.Size or UDim2.fromScale(0.62, 0.74)

	local root = UIUtils.create("CanvasGroup", {
		Name = name .. "Window", Parent = ctx.Layers.Panels, AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5), Size = defaultSize, BackgroundTransparency = 1,
		GroupTransparency = 1, Visible = false, BorderSizePixel = 0,
	})
	UIUtils.create("UISizeConstraint", { Parent = root, MinSize = Vector2.new(280, 180), MaxSize = config.MaxSize or Vector2.new(920, 620) })
	local scale = UIUtils.create("UIScale", { Parent = root, Scale = 0.92 })
	local panel = UIUtils.create("Frame", { Name = "Panel", Parent = root, Size = UDim2.fromScale(1, 1), BorderSizePixel = 0 })
	self:Skin(panel, "Surface")

	local header = UIUtils.create("Frame", { Name = "Header", Parent = panel, BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 46) })
	local title = UIUtils.create("TextLabel", {
		Parent = header, BackgroundTransparency = 1, Text = config.Title or name, TextXAlignment = Enum.TextXAlignment.Left,
		Position = UDim2.fromOffset(14, 0), Size = UDim2.new(1, -64, 1, 0), TextTruncate = Enum.TextTruncate.AtEnd,
	})
	self:Text(title, "Title")
	local closeButton = self:Button(header, "X", "Error", function()
		ctx.State:ClosePanel(name)
	end)
	closeButton.AnchorPoint = Vector2.new(1, 0.5)
	closeButton.Position = UDim2.new(1, -8, 0.5, 0)
	closeButton.Size = UDim2.fromOffset(34, 34)

	local pad = 12
	self.Content = UIUtils.create("Frame", {
		Name = "Content", Parent = panel, BackgroundTransparency = 1,
		Position = UDim2.fromOffset(pad, 50), Size = UDim2.new(1, -pad * 2, 1, -50 - pad),
	})

	local token = 0
	function self:Open()
		if self.IsOpen then
			return
		end
		token += 1
		self.IsOpen = true
		root.Visible = true
		self:Tween(root, { GroupTransparency = 0 })
		self:Tween(scale, { Scale = 1 })
		self.Opened:Fire()
	end
	function self:Close()
		if not self.IsOpen then
			return
		end
		token += 1
		local mine = token
		self.IsOpen = false
		self:Tween(root, { GroupTransparency = 1 })
		self:Tween(scale, { Scale = 0.92 })
		task.delay(self:Theme().AnimationDuration + 0.03, function()
			if token == mine and not self.IsOpen then
				root.Visible = false
			end
		end)
		self.Closed:Fire()
	end

	self:Watch("ActivePanel", function(active: any)
		if active == name then
			self:Open()
		else
			self:Close()
		end
	end)

	local function fit()
		if ctx.Device == "Mobile" then
			root.Size = UDim2.fromScale(0.94, 0.92)
		else
			root.Size = defaultSize
		end
	end
	fit()
	self.Cleaner:Add(ctx.DeviceChanged:Connect(fit))

	self.Instance = root
	return self
end

return M
