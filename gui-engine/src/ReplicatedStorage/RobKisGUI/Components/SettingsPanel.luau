--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.SettingsPanel
-- Tipo: ModuleScript (componente cliente) | Função: ajustes. Aparência (estilo, cores, cantos, escala) e acessibilidade
-- (movimento reduzido, sons). Tudo atualiza ao vivo pelo ThemeConfig; "Salvar" envia ao servidor (validado).

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)
local Presets = require(Shared.ThemePresets)

local M = {}

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	local theme = ctx.Theme
	local window: any = ctx.Registry:Create("ModalWindow", { Panel = config.Panel or "Settings", Title = config.Title or "Ajustes", Size = UDim2.fromScale(0.6, 0.76) }, ctx)
	self.Window = window
	self.Instance = window.Instance
	self.Cleaner:Add(window)
	local content = window.Content

	local tabsHolder = UIUtils.create("Frame", { Parent = content, BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, -48) })
	local tabs: any = ctx.Registry:Create("Tabs", {
		Parent = tabsHolder, Tabs = { { Id = "Appearance", Label = "Aparência" }, { Id = "Accessibility", Label = "Acessibilidade" } },
	}, ctx)
	self.Cleaner:Add(tabs)

	-------------------------------------------------- Aparência
	local appearance = tabs.Contents.Appearance
	local scroller = UIUtils.scroller(appearance, "List", nil, 10)
	self:Label(scroller, "Estilo da interface", "Title", 0.85).LayoutOrder = 1
	local styleGrid = UIUtils.create("Frame", { Parent = scroller, BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, LayoutOrder = 2 })
	UIUtils.create("UIGridLayout", { Parent = styleGrid, CellSize = UDim2.fromOffset(132, 36), CellPadding = UDim2.fromOffset(8, 8), SortOrder = Enum.SortOrder.LayoutOrder })
	local styleButtons: { [string]: any } = {}
	for index, style in Presets.Order do
		local button = self:Button(styleGrid, Presets.DisplayNames[style] or style, "Surface", function()
			theme:SetStyle(style)
		end)
		button.LayoutOrder = index
		styleButtons[style] = button
	end
	local function markStyle()
		local current = theme:Get().Style
		for style, button in styleButtons do
			local stroke = button:FindFirstChildOfClass("UIStroke")
			if stroke then
				if style == current then
					stroke.Color = theme:Get().Colors.Primary
					stroke.Thickness = theme:Get().StrokeThickness + 2
				else
					stroke.Color = theme:Get().Colors.Stroke
					stroke.Thickness = theme:Get().StrokeThickness
				end
			end
		end
	end
	self.Cleaner:Add(theme.Changed:Connect(markStyle))
	self:Themed(markStyle)

	self:Label(scroller, "Cores personalizadas (hex, ex.: #FF8800)", "Title", 0.85).LayoutOrder = 3
	for index, key in { "Primary", "Secondary", "Background" } do
		local row = UIUtils.create("Frame", { Parent = scroller, BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 34), LayoutOrder = 3 + index })
		local label = UIUtils.create("TextLabel", {
			Parent = row, BackgroundTransparency = 1, Size = UDim2.new(0.4, 0, 1, 0), TextXAlignment = Enum.TextXAlignment.Left,
			Text = ({ Primary = "Principal", Secondary = "Secundária", Background = "Fundo" })[key],
		})
		self:Text(label, "Body", 0.9)
		local boxFrame = UIUtils.create("Frame", { Parent = row, BorderSizePixel = 0, AnchorPoint = Vector2.new(1, 0), Position = UDim2.fromScale(1, 0), Size = UDim2.new(0.55, 0, 1, 0) })
		self:Skin(boxFrame, "Panel")
		local box = UIUtils.create("TextBox", {
			Parent = boxFrame, BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), ClearTextOnFocus = false,
			Text = UIUtils.colorToHex(theme:Get().Colors[key]), PlaceholderText = "#RRGGBB",
		})
		self:Themed(function(t: any)
			box.Font = t.Font
			box.TextSize = t.TextSize
			box.TextColor3 = t.Colors.Text
		end)
		self.Cleaner:Add(box.FocusLost:Connect(function()
			local color = UIUtils.colorFromHex(string.upper(box.Text))
			if color == nil then
				self:Notify("Error", "Cor inválida. Use o formato #RRGGBB.")
			else
				theme:Customize({ Colors = { [key] = color } })
			end
			box.Text = UIUtils.colorToHex(theme:Get().Colors[key])
		end))
	end

	local function stepper(order: number, text: string, getValue: () -> string, onMinus: () -> (), onPlus: () -> ())
		local row = UIUtils.create("Frame", { Parent = scroller, BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 36), LayoutOrder = order })
		local label = UIUtils.create("TextLabel", {
			Parent = row, BackgroundTransparency = 1, Size = UDim2.new(0.5, 0, 1, 0), TextXAlignment = Enum.TextXAlignment.Left, Text = text,
		})
		self:Text(label, "Body", 0.9)
		local plus = self:Button(row, "+", "Surface", onPlus)
		plus.AnchorPoint = Vector2.new(1, 0.5)
		plus.Position = UDim2.new(1, 0, 0.5, 0)
		plus.Size = UDim2.fromOffset(40, 32)
		local value = UIUtils.create("TextLabel", {
			Parent = row, BackgroundTransparency = 1, AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -46, 0.5, 0), Size = UDim2.fromOffset(64, 32), Text = "",
		})
		self:Text(value, "Title", 0.85)
		local minus = self:Button(row, "-", "Surface", onMinus)
		minus.AnchorPoint = Vector2.new(1, 0.5)
		minus.Position = UDim2.new(1, -114, 0.5, 0)
		minus.Size = UDim2.fromOffset(40, 32)
		local function paint()
			value.Text = getValue()
		end
		self.Cleaner:Add(theme.Changed:Connect(paint))
		paint()
	end
	stepper(7, "Arredondamento dos cantos", function()
		return tostring(math.floor(theme:Get().CornerRadius))
	end, function()
		theme:Customize({ CornerRadius = theme:Get().CornerRadius - 2 })
	end, function()
		theme:Customize({ CornerRadius = theme:Get().CornerRadius + 2 })
	end)
	stepper(8, "Tamanho da interface", function()
		return string.format("%.1fx", theme:Get().Scale)
	end, function()
		theme:Patch({ Scale = theme:Get().Scale - 0.1 })
	end, function()
		theme:Patch({ Scale = theme:Get().Scale + 0.1 })
	end)

	-------------------------------------------------- Acessibilidade
	local access = tabs.Contents.Accessibility
	local accessList = UIUtils.scroller(access, "List", nil, 10)
	local reduced: any = ctx.Registry:Create("ToggleButton", { Parent = accessList, Label = "Animações reduzidas", Value = theme:Get().ReducedMotion, LayoutOrder = 1 }, ctx)
	self.Cleaner:Add(reduced)
	reduced.Changed:Connect(function(value: boolean)
		theme:Patch({ ReducedMotion = value })
	end)
	local sounds: any = ctx.Registry:Create("ToggleButton", { Parent = accessList, Label = "Sons da interface", Value = theme:Get().Sounds.Enabled == true, LayoutOrder = 2 }, ctx)
	self.Cleaner:Add(sounds)
	sounds.Changed:Connect(function(value: boolean)
		theme:Patch({ Sounds = { Enabled = value } })
	end)
	local replay = self:Button(accessList, "Rever tutorial", "Surface", function()
		ctx.State:ClosePanel("Settings")
		ctx.Events.TutorialRequested:Fire()
	end)
	replay.LayoutOrder = 3
	replay.Size = UDim2.fromOffset(160, 36)

	-------------------------------------------------- Salvar
	local saving = false
	local save = self:Button(content, "Salvar", "Primary", nil)
	save.AnchorPoint = Vector2.new(1, 1)
	save.Position = UDim2.fromScale(1, 1)
	save.Size = UDim2.fromOffset(140, 38)
	self.Cleaner:Add(save.Activated:Connect(function()
		if saving then
			return
		end
		saving = true
		self:SetEnabled(save, false)
		local settings = theme:Serialize()
		settings.TutorialDone = ctx.State:Get("TutorialDone") == true
		ctx.Request("SaveSettings", { settings = settings }, function(ok: boolean)
			saving = false
			self:SetEnabled(save, true)
			if ok then
				self:Notify("Success", "Configurações salvas.")
			end
		end)
	end))
	return self
end

return M
