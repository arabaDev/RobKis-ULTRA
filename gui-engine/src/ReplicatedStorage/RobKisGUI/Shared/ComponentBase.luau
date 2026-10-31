--!strict
-- Local: ReplicatedStorage.RobKisGUI.Shared.ComponentBase
-- Tipo: ModuleScript (cliente) | Função: comportamento comum a todos os componentes:
-- ligação com o tema, posicionamento por dispositivo, botões com feedback, limpeza e observação de estado.

local UIUtils = require(script.Parent.UIUtils)

local Base = {}
Base.__index = Base

local PADDING: { [string]: number } = { Compact = 4, Normal = 8, Comfortable = 12 }

function Base.new(ctx: any, config: { [string]: any }?): any
	local self: any = setmetatable({}, Base)
	self.Ctx = ctx
	self.Config = config or {}
	self.Cleaner = UIUtils.newCleaner()
	self.Instance = nil
	self._themed = {}
	self.Cleaner:Add(ctx.Theme.Changed:Connect(function()
		self:Restyle()
	end))
	return self
end

function Base.Theme(self: any): any
	return self.Ctx.Theme:Get()
end

function Base.Pad(self: any): number
	return PADDING[self:Theme().Density] or 8
end

-- Registra uma função de estilo: roda agora e a cada mudança de tema.
function Base.Themed(self: any, fn: (any) -> ())
	table.insert(self._themed, fn)
	fn(self:Theme())
end

function Base.Restyle(self: any)
	local theme = self:Theme()
	for _, fn in self._themed do
		fn(theme)
	end
end

function Base.Watch(self: any, key: string, fn: (any, any) -> ())
	self.Cleaner:Add(self.Ctx.State:Subscribe(key, fn))
	fn(self.Ctx.State:Get(key), nil)
end

function Base.Tween(self: any, inst: Instance, props: { [string]: any }, duration: number?): Tween?
	local theme = self:Theme()
	return UIUtils.tween(inst, props, duration or theme.AnimationDuration, { Reduced = theme.ReducedMotion })
end

function Base.Sound(self: any, kind: string)
	local theme = self:Theme()
	if theme.Sounds.Enabled == true then
		UIUtils.playSound(theme.Sounds[kind], theme.Sounds.Volume)
	end
end

-- Aparência de superfície/botão: cantos, borda e gradiente vindos do tema.
function Base.Skin(self: any, inst: any, role: string)
	local corner = UIUtils.create("UICorner", { Parent = inst })
	local stroke = UIUtils.create("UIStroke", { Parent = inst, ApplyStrokeMode = Enum.ApplyStrokeMode.Border })
	local grad = UIUtils.create("UIGradient", { Parent = inst, Rotation = 90 })
	local isSurface = role == "Surface" or role == "Panel"
	self:Themed(function(t: any)
		local base = UIUtils.roleColor(t, role)
		inst.BackgroundColor3 = base
		if isSurface then
			inst.BackgroundTransparency = t.BackgroundTransparency
			stroke.Color = t.Colors.Stroke
		else
			inst.BackgroundTransparency = 0
			stroke.Color = UIUtils.shade(base, 0.6)
		end
		stroke.Thickness = t.StrokeThickness
		corner.CornerRadius = UDim.new(0, t.CornerRadius)
		grad.Enabled = t.Gradient
		local tail = 1 - 0.4 * t.GradientStrength
		grad.Color = ColorSequence.new(Color3.new(1, 1, 1), Color3.new(tail, tail, tail))
	end)
end

-- Papéis de texto: Title, Body, Muted.
function Base.Text(self: any, label: any, role: string?, sizeMult: number?)
	self:Themed(function(t: any)
		if role == "Title" then
			label.Font = t.FontBold
			label.TextSize = math.floor(t.TextSize * 1.25 * (sizeMult or 1))
		else
			label.Font = t.Font
			label.TextSize = math.floor(t.TextSize * (sizeMult or 1))
		end
		if role == "Muted" then
			label.TextColor3 = t.Colors.TextMuted
		else
			label.TextColor3 = t.Colors.Text
		end
	end)
end

function Base.Label(self: any, parent: Instance, text: string, role: string?, sizeMult: number?): any
	local label = UIUtils.create("TextLabel", {
		Parent = parent,
		BackgroundTransparency = 1,
		Text = text,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextWrapped = true,
		Size = UDim2.new(1, 0, 0, 24),
	})
	self:Text(label, role, sizeMult)
	return label
end

function Base.SetEnabled(_: any, btn: any, enabled: boolean)
	btn:SetAttribute("RKDisabled", not enabled)
	if enabled then
		btn.TextTransparency = 0
	else
		btn.TextTransparency = 0.5
	end
end

-- Botão com hover (mouse), feedback de toque, bloqueio quando desativado e som opcional.
function Base.Button(self: any, parent: Instance, text: string, role: string, onClick: (() -> ())?): any
	local btn = UIUtils.create("TextButton", {
		Parent = parent,
		Text = text,
		AutoButtonColor = false,
		BorderSizePixel = 0,
		TextWrapped = true,
		Size = UDim2.fromOffset(120, 36),
	})
	self:Skin(btn, role)
	local scale = UIUtils.create("UIScale", { Parent = btn })
	self:Themed(function(t: any)
		btn.Font = t.FontBold
		btn.TextSize = t.TextSize
		btn.TextColor3 = UIUtils.contrastColor(btn.BackgroundColor3)
	end)
	local function disabled(): boolean
		return btn:GetAttribute("RKDisabled") == true
	end
	local cleaner = self.Cleaner
	cleaner:Add(btn.MouseEnter:Connect(function()
		if not disabled() then
			self:Tween(scale, { Scale = 1.04 }, 0.1)
		end
	end))
	cleaner:Add(btn.MouseLeave:Connect(function()
		self:Tween(scale, { Scale = 1 }, 0.1)
	end))
	cleaner:Add(btn.InputBegan:Connect(function(input: InputObject)
		local t = input.UserInputType
		if (t == Enum.UserInputType.MouseButton1 or t == Enum.UserInputType.Touch) and not disabled() then
			self:Tween(scale, { Scale = 0.94 }, 0.08)
		end
	end))
	cleaner:Add(btn.InputEnded:Connect(function(input: InputObject)
		local t = input.UserInputType
		if t == Enum.UserInputType.MouseButton1 or t == Enum.UserInputType.Touch then
			self:Tween(scale, { Scale = 1 }, 0.1)
		end
	end))
	cleaner:Add(btn.Activated:Connect(function()
		if disabled() then
			return
		end
		self:Sound("Click")
		if onClick then
			onClick()
		end
	end))
	return btn
end

local function applyPlacement(target: { [string]: any }, source: any)
	if type(source) ~= "table" then
		return
	end
	for _, key in { "AnchorPoint", "Position", "Size" } do
		if source[key] ~= nil then
			target[key] = source[key]
		end
	end
end

-- Posiciona o componente: padrões do componente < Config.Placement < Config.Devices[dispositivo].
-- Com Config.Parent o componente é "embutido": só respeita Config.Size.
function Base.Mount(self: any, frame: any, defaults: { [string]: any })
	self.Instance = frame
	local cfg = self.Config
	if cfg.Parent then
		frame.Parent = cfg.Parent
		if cfg.Size then
			frame.Size = cfg.Size
		end
		if cfg.LayoutOrder then
			frame.LayoutOrder = cfg.LayoutOrder
		end
		return
	end
	frame.Parent = self.Ctx.Layers[cfg.Layer or defaults.Layer or "HUD"]
	local function place()
		local p: { [string]: any } = {}
		applyPlacement(p, defaults)
		applyPlacement(p, cfg.Placement)
		if type(cfg.Devices) == "table" then
			applyPlacement(p, cfg.Devices[self.Ctx.Device])
		end
		frame.AnchorPoint = p.AnchorPoint or Vector2.zero
		frame.Position = p.Position or UDim2.new()
		frame.Size = p.Size or UDim2.fromOffset(100, 100)
	end
	place()
	self.Cleaner:Add(self.Ctx.DeviceChanged:Connect(place))
end

function Base.Notify(self: any, kind: string, text: string)
	if self.Ctx.Notify then
		self.Ctx.Notify(kind, text)
	end
end

-- Copia Config e preenche as chaves ausentes com os padrões (não altera as tabelas originais).
function Base.withDefaults(config: { [string]: any }?, defaults: { [string]: any }): { [string]: any }
	local out: { [string]: any } = {}
	for k, v in defaults do
		out[k] = v
	end
	if config then
		for k, v in config do
			out[k] = v
		end
	end
	return out
end

function Base.Destroy(self: any)
	self.Cleaner:Clean()
	if self.Instance then
		self.Instance:Destroy()
		self.Instance = nil
	end
end

return Base
