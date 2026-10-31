--!strict
-- Local: ReplicatedStorage.RobKisGUI.Shared.ThemeConfig
-- Tipo: ModuleScript | Função: tema central. Troca de estilo e ajustes atualizam todos os componentes
-- (evento Changed) sem reconstruir a interface. Valores inválidos são corrigidos (sanitize).

local UIUtils = require(script.Parent.UIUtils)
local Presets = require(script.Parent.ThemePresets)

local ThemeConfig = {}
ThemeConfig.__index = ThemeConfig

export type Theme = {
	Style: string,
	Colors: { [string]: Color3 },
	Rarity: { [string]: Color3 },
	BackgroundTransparency: number,
	CornerRadius: number,
	StrokeThickness: number,
	Font: Enum.Font,
	FontBold: Enum.Font,
	TextSize: number,
	Gradient: boolean,
	GradientStrength: number,
	AnimationDuration: number,
	ReducedMotion: boolean,
	Scale: number,
	Density: string,
	Sounds: { [string]: any },
}

local RANGES: { [string]: { number } } = {
	BackgroundTransparency = { 0, 1 },
	CornerRadius = { 0, 32 },
	StrokeThickness = { 0, 6 },
	TextSize = { 12, 32 },
	AnimationDuration = { 0, 1 },
	Scale = { 0.5, 2 },
	GradientStrength = { 0, 1 },
}

local DENSITIES = { "Compact", "Normal", "Comfortable" }

local function merge(base: any, patch: any): any
	local out: { [any]: any } = {}
	for k, v in base do
		if type(v) == "table" then
			out[k] = merge(v, {})
		else
			out[k] = v
		end
	end
	for k, v in patch do
		if type(v) == "table" and type(out[k]) == "table" then
			out[k] = merge(out[k], v)
		else
			out[k] = v
		end
	end
	return out
end

local function sanitize(theme: any): any
	for key, range in RANGES do
		local v = theme[key]
		if type(v) ~= "number" or v ~= v then
			v = (Presets.Default :: any)[key]
		end
		theme[key] = math.clamp(v, range[1], range[2])
	end
	for name, fallback in Presets.Default.Colors do
		if typeof(theme.Colors[name]) ~= "Color3" then
			theme.Colors[name] = fallback
		end
	end
	for name, fallback in Presets.Default.Rarity do
		if typeof(theme.Rarity[name]) ~= "Color3" then
			theme.Rarity[name] = fallback
		end
	end
	if table.find(DENSITIES, theme.Density) == nil then
		theme.Density = "Normal"
	end
	if typeof(theme.Font) ~= "EnumItem" then
		theme.Font = Presets.Default.Font
	end
	if typeof(theme.FontBold) ~= "EnumItem" then
		theme.FontBold = Presets.Default.FontBold
	end
	theme.Gradient = theme.Gradient == true
	theme.ReducedMotion = theme.ReducedMotion == true
	return theme
end

local function build(style: string, overrides: any?): any
	local data = merge(Presets.Default, {})
	local source = style
	if style == "Custom" then
		source = "Minimalist"
	end
	local preset = Presets.Styles[source]
	if preset then
		data = merge(data, preset)
	end
	data.Style = style
	if overrides then
		data = merge(data, overrides)
	end
	return sanitize(data)
end

function ThemeConfig.new(style: string?, overrides: { [string]: any }?): any
	local self = setmetatable({}, ThemeConfig)
	local startStyle = style or Presets.Default.Style
	if table.find(Presets.Order, startStyle) == nil then
		startStyle = Presets.Default.Style
	end
	local this: any = self
	this.Changed = UIUtils.Signal.new()
	this._prefs = overrides or {}
	this._custom = {}
	this._data = build(startStyle, this._prefs)
	return this
end

function ThemeConfig.Get(self: any): Theme
	return self._data
end

function ThemeConfig.Color(self: any, name: string): Color3
	return self._data.Colors[name] or Presets.Default.Colors.Text
end

-- Troca de estilo. Preferências de acessibilidade (escala, movimento reduzido, sons) são preservadas.
function ThemeConfig.SetStyle(self: any, style: string): boolean
	if type(style) ~= "string" or table.find(Presets.Order, style) == nil then
		return false
	end
	local overrides = self._prefs
	if style == "Custom" then
		overrides = merge(self._custom, self._prefs)
	end
	self._data = build(style, overrides)
	self.Changed:Fire(self._data)
	return true
end

-- Ajustes que não mudam o estilo (Scale, ReducedMotion, Sounds...).
function ThemeConfig.Patch(self: any, patch: { [string]: any })
	self._prefs = merge(self._prefs, patch)
	self._data = sanitize(merge(self._data, patch))
	self.Changed:Fire(self._data)
end

-- Ajustes visuais do usuário (cores, raio...). Muda o estilo para "Custom", partindo do visual atual.
function ThemeConfig.Customize(self: any, patch: { [string]: any })
	local current = self._data
	if current.Style ~= "Custom" then
		self._custom = {
			Colors = merge(current.Colors, {}),
			CornerRadius = current.CornerRadius,
			StrokeThickness = current.StrokeThickness,
			Gradient = current.Gradient,
			Font = current.Font,
			FontBold = current.FontBold,
			BackgroundTransparency = current.BackgroundTransparency,
		}
	end
	self._custom = merge(self._custom, patch)
	self._data = build("Custom", merge(self._custom, self._prefs))
	self.Changed:Fire(self._data)
end

-- Formato salvo/enviado ao servidor (sem Color3: só strings e números válidos para o Validators).
function ThemeConfig.Serialize(self: any): { [string]: any }
	local d = self._data
	local out: { [string]: any } = {
		Style = d.Style,
		CornerRadius = d.CornerRadius,
		Scale = d.Scale,
		AnimationDuration = d.AnimationDuration,
		ReducedMotion = d.ReducedMotion,
		SoundsEnabled = d.Sounds.Enabled == true,
	}
	if d.Style == "Custom" then
		out.Primary = UIUtils.colorToHex(d.Colors.Primary)
		out.Secondary = UIUtils.colorToHex(d.Colors.Secondary)
		out.Background = UIUtils.colorToHex(d.Colors.Background)
	end
	return out
end

-- Aplica configurações já validadas (vindas do servidor).
function ThemeConfig.ApplySaved(self: any, saved: { [string]: any })
	local prefs: { [string]: any } = {}
	if saved.Scale ~= nil then
		prefs.Scale = saved.Scale
	end
	if saved.AnimationDuration ~= nil then
		prefs.AnimationDuration = saved.AnimationDuration
	end
	if saved.ReducedMotion ~= nil then
		prefs.ReducedMotion = saved.ReducedMotion
	end
	if saved.SoundsEnabled ~= nil then
		prefs.Sounds = { Enabled = saved.SoundsEnabled }
	end
	self._prefs = merge(self._prefs, prefs)
	if saved.Style == "Custom" then
		local colors: { [string]: Color3 } = {}
		for _, key in { "Primary", "Secondary", "Background" } do
			local hex = saved[key]
			if type(hex) == "string" then
				local color = UIUtils.colorFromHex(hex)
				if color then
					colors[key] = color
				end
			end
		end
		self._custom = { Colors = colors, CornerRadius = saved.CornerRadius }
		self._data = build("Custom", merge(self._custom, self._prefs))
		self.Changed:Fire(self._data)
	elseif type(saved.Style) == "string" then
		self:SetStyle(saved.Style)
	else
		self:Patch({})
	end
end

return ThemeConfig
