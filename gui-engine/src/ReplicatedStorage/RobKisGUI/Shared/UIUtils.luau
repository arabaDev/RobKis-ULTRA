--!strict
-- Local: ReplicatedStorage.RobKisGUI.Shared.UIUtils
-- Tipo: ModuleScript | Função: utilitários de baixo nível: Signal, Cleaner, criação de instâncias,
-- tween sem concorrência, formatação, cores, dispositivo e escala.

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")
local Debris = game:GetService("Debris")

local UIUtils = {}

---------------------------------------------------------------- Signal
local Signal = {}
Signal.__index = Signal

function Signal.new(): any
	return setmetatable({ _handlers = {} }, Signal)
end

function Signal.Connect(self: any, fn: (...any) -> ()): any
	local handlers = self._handlers
	local conn: any = { Connected = true }
	function conn.Disconnect(c: any)
		c.Connected = false
		handlers[c] = nil
	end
	handlers[conn] = fn
	return conn
end

function Signal.Fire(self: any, ...: any)
	local snapshot = {}
	for conn, fn in self._handlers do
		snapshot[conn] = fn
	end
	for conn, fn in snapshot do
		if conn.Connected then
			task.spawn(fn, ...)
		end
	end
end

function Signal.Destroy(self: any)
	table.clear(self._handlers)
end

UIUtils.Signal = Signal

---------------------------------------------------------------- Cleaner
function UIUtils.newCleaner(): any
	local items: { any } = {}
	local cleaner: any = {}
	function cleaner.Add(_: any, item: any): any
		table.insert(items, item)
		return item
	end
	function cleaner.Clean(_: any)
		for i = #items, 1, -1 do
			local item = items[i]
			items[i] = nil
			local kind = typeof(item)
			if kind == "RBXScriptConnection" then
				item:Disconnect()
			elseif kind == "Instance" then
				item:Destroy()
			elseif kind == "function" then
				item()
			elseif kind == "table" then
				if type(item.Disconnect) == "function" then
					item:Disconnect()
				elseif type(item.Destroy) == "function" then
					item:Destroy()
				end
			end
		end
	end
	return cleaner
end

---------------------------------------------------------------- Instâncias
function UIUtils.create(className: string, props: { [string]: any }?, children: { Instance }?): any
	local inst: any = Instance.new(className)
	local parent = nil
	if props then
		for key, value in props do
			if key == "Parent" then
				parent = value
			else
				inst[key] = value
			end
		end
	end
	if children then
		for _, child in children do
			child.Parent = inst
		end
	end
	if parent then
		inst.Parent = parent
	end
	return inst
end

-- ScrollingFrame + layout (lista ou grade). Retorna (scroller, layout).
function UIUtils.scroller(parent: Instance, layout: string, cell: UDim2?, gap: number): (any, any)
	local sf = UIUtils.create("ScrollingFrame", {
		Parent = parent,
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 6,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollingDirection = Enum.ScrollingDirection.Y,
	})
	local lay: any
	if layout == "Grid" then
		lay = UIUtils.create("UIGridLayout", {
			Parent = sf,
			CellSize = cell or UDim2.fromOffset(88, 100),
			CellPadding = UDim2.fromOffset(gap, gap),
			SortOrder = Enum.SortOrder.LayoutOrder,
		})
	else
		lay = UIUtils.create("UIListLayout", {
			Parent = sf,
			Padding = UDim.new(0, gap),
			SortOrder = Enum.SortOrder.LayoutOrder,
		})
	end
	UIUtils.create("UIPadding", {
		Parent = sf,
		PaddingTop = UDim.new(0, 4),
		PaddingBottom = UDim.new(0, 4),
		PaddingLeft = UDim.new(0, 4),
		PaddingRight = UDim.new(0, 8),
	})
	return sf, lay
end

---------------------------------------------------------------- Tween sem concorrência
local active: { [Instance]: { [string]: Tween } } = setmetatable({}, { __mode = "k" }) :: any

-- Cancela tweens anteriores nas mesmas propriedades. Com Reduced = true aplica o valor na hora.
function UIUtils.tween(inst: Instance, props: { [string]: any }, duration: number?, opts: { [string]: any }?): Tween?
	local options = opts or {}
	local anyInst: any = inst
	if options.Reduced == true or (duration ~= nil and duration <= 0) then
		for key, value in props do
			anyInst[key] = value
		end
		return nil
	end
	local perInstance = active[inst]
	if perInstance == nil then
		perInstance = {}
		active[inst] = perInstance
	end
	local registry: { [string]: Tween } = perInstance :: any
	for key in props do
		local old = registry[key]
		if old then
			old:Cancel()
		end
	end
	local style = options.Style or Enum.EasingStyle.Quad
	local direction = options.Direction or Enum.EasingDirection.Out
	local tw = TweenService:Create(inst, TweenInfo.new(duration or 0.2, style, direction), props)
	for key in props do
		registry[key] = tw
	end
	tw.Completed:Once(function()
		for key in props do
			if registry[key] == tw then
				registry[key] = nil
			end
		end
	end)
	tw:Play()
	return tw
end

---------------------------------------------------------------- Formatação
local LIMITS = { 1e12, 1e9, 1e6, 1e3 }
local SUFFIXES = { "T", "B", "M", "K" }

function UIUtils.formatNumber(n: number): string
	if n ~= n then
		return "0"
	end
	local abs = math.abs(n)
	for i, limit in LIMITS do
		if abs >= limit then
			local text = string.format("%.1f", n / limit)
			text = string.gsub(text, "%.0$", "")
			return text .. SUFFIXES[i]
		end
	end
	return tostring(math.floor(n))
end

function UIUtils.formatTime(seconds: number): string
	local s = math.max(0, math.ceil(seconds))
	if s >= 60 then
		return string.format("%d:%02d", s // 60, s % 60)
	end
	return tostring(s)
end

---------------------------------------------------------------- Cores
function UIUtils.colorFromHex(hex: string): Color3?
	if string.match(hex, "^#%x%x%x%x%x%x$") == nil then
		return nil
	end
	local r = tonumber(string.sub(hex, 2, 3), 16)
	local g = tonumber(string.sub(hex, 4, 5), 16)
	local b = tonumber(string.sub(hex, 6, 7), 16)
	if r == nil or g == nil or b == nil then
		return nil
	end
	return Color3.fromRGB(r, g, b)
end

function UIUtils.colorToHex(color: Color3): string
	return string.format("#%02X%02X%02X", math.round(color.R * 255), math.round(color.G * 255), math.round(color.B * 255))
end

function UIUtils.shade(color: Color3, factor: number): Color3
	return Color3.new(math.clamp(color.R * factor, 0, 1), math.clamp(color.G * factor, 0, 1), math.clamp(color.B * factor, 0, 1))
end

-- Texto preto ou branco conforme a luminância do fundo (contraste legível).
function UIUtils.contrastColor(bg: Color3): Color3
	local luminance = 0.299 * bg.R + 0.587 * bg.G + 0.114 * bg.B
	if luminance > 0.6 then
		return Color3.fromRGB(20, 20, 24)
	end
	return Color3.new(1, 1, 1)
end

local ROLE_KEYS: { [string]: string } = {
	Surface = "Surface", Panel = "Background", Primary = "Primary", Secondary = "Secondary",
	Accent = "Accent", Success = "Success", Warning = "Warning", Error = "Error", Danger = "Error",
}

function UIUtils.roleColor(theme: any, role: string): Color3
	local key = ROLE_KEYS[role] or "Surface"
	return theme.Colors[key]
end

-- Lista de tabelas com campo Id -> dicionário por Id.
function UIUtils.indexById(list: { any }?): { [string]: any }
	local out: { [string]: any } = {}
	if list then
		for _, entry in list do
			if type(entry) == "table" and type(entry.Id) == "string" then
				out[entry.Id] = entry
			end
		end
	end
	return out
end

---------------------------------------------------------------- Dispositivo e escala
function UIUtils.getDevice(): string
	local touch = UserInputService.TouchEnabled
	local keyboard = UserInputService.KeyboardEnabled
	if UserInputService.GamepadEnabled and not touch and not keyboard then
		return "Console"
	end
	if touch and not keyboard then
		local cam = workspace.CurrentCamera
		local short = 0
		if cam then
			short = math.min(cam.ViewportSize.X, cam.ViewportSize.Y)
		end
		if short >= 600 then
			return "Tablet"
		end
		return "Mobile"
	end
	return "Desktop"
end

function UIUtils.computeScale(viewport: Vector2, reference: Vector2, minScale: number, maxScale: number): number
	if reference.X <= 0 or reference.Y <= 0 then
		return 1
	end
	local raw = math.min(viewport.X / reference.X, viewport.Y / reference.Y)
	return math.clamp(raw, minScale, maxScale)
end

---------------------------------------------------------------- Som
function UIUtils.playSound(soundId: string?, volume: number?)
	if soundId == nil or soundId == "" then
		return
	end
	local sound = Instance.new("Sound")
	sound.SoundId = soundId
	sound.Volume = volume or 0.5
	sound.Parent = SoundService
	sound:Play()
	Debris:AddItem(sound, 5)
end

return UIUtils
