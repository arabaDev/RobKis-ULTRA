--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.SearchField
-- Tipo: ModuleScript (componente cliente) | Função: campo de busca com debounce e botão de limpar.
-- GetText() devolve o texto já limpo (sem bordas, minúsculo) e limitado a 30 caracteres.

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)

local M = {}
local MAX_LENGTH = 30

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	self.Changed = UIUtils.Signal.new()
	self.Cleaner:Add(self.Changed)
	local token = 0

	local frame = UIUtils.create("Frame", { Name = "SearchField", BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 36) })
	self:Skin(frame, "Panel")
	local box = UIUtils.create("TextBox", {
		Parent = frame, BackgroundTransparency = 1, ClearTextOnFocus = false, Text = "",
		PlaceholderText = config.Placeholder or "Buscar...", TextXAlignment = Enum.TextXAlignment.Left,
		Position = UDim2.fromOffset(10, 0), Size = UDim2.new(1, -44, 1, 0),
	})
	self:Themed(function(t: any)
		box.Font = t.Font
		box.TextSize = t.TextSize
		box.TextColor3 = t.Colors.Text
		box.PlaceholderColor3 = t.Colors.TextMuted
	end)
	local clear = self:Button(frame, "X", "Surface", function()
		self:SetText("")
	end)
	clear.AnchorPoint = Vector2.new(1, 0.5)
	clear.Position = UDim2.new(1, -4, 0.5, 0)
	clear.Size = UDim2.fromOffset(28, 28)

	function self:GetText(): string
		local text = string.sub(box.Text, 1, MAX_LENGTH)
		return string.lower(string.match(text, "^%s*(.-)%s*$") or "")
	end
	function self:SetText(text: string)
		box.Text = string.sub(text, 1, MAX_LENGTH)
	end

	self.Cleaner:Add(box:GetPropertyChangedSignal("Text"):Connect(function()
		if #box.Text > MAX_LENGTH then
			box.Text = string.sub(box.Text, 1, MAX_LENGTH)
			return
		end
		token += 1
		local mine = token
		task.delay(0.15, function()
			if token == mine then
				self.Changed:Fire(self:GetText())
			end
		end)
	end))

	self:Mount(frame, {
		Layer = "HUD", AnchorPoint = Vector2.zero, Position = UDim2.fromOffset(10, 10), Size = UDim2.fromOffset(240, 36),
	})
	return self
end

return M
