--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.TooltipSystem
-- Tipo: ModuleScript (componente cliente, singleton) | Função: dicas ao passar o mouse ou manter o toque pressionado.
-- Publica ctx.Tooltip:Attach(guiObject, function() return titulo, texto end) -> conexão (Disconnect).

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)

local M = {}

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)

	local tip = UIUtils.create("Frame", {
		Name = "Tooltip", Parent = ctx.Layers.Overlay, Visible = false, ZIndex = 100, BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.XY, Size = UDim2.fromOffset(0, 0),
	})
	self:Skin(tip, "Surface")
	UIUtils.create("UISizeConstraint", { Parent = tip, MaxSize = Vector2.new(260, 400) })
	UIUtils.create("UIPadding", {
		Parent = tip, PaddingTop = UDim.new(0, 8), PaddingBottom = UDim.new(0, 8), PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10),
	})
	UIUtils.create("UIListLayout", { Parent = tip, Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder })
	local titleLabel = UIUtils.create("TextLabel", {
		Parent = tip, BackgroundTransparency = 1, AutomaticSize = Enum.AutomaticSize.XY, Size = UDim2.fromOffset(0, 0),
		TextXAlignment = Enum.TextXAlignment.Left, LayoutOrder = 1, Text = "", TextWrapped = true,
	})
	self:Text(titleLabel, "Title", 0.8)
	local bodyLabel = UIUtils.create("TextLabel", {
		Parent = tip, BackgroundTransparency = 1, AutomaticSize = Enum.AutomaticSize.XY, Size = UDim2.fromOffset(0, 0),
		TextXAlignment = Enum.TextXAlignment.Left, LayoutOrder = 2, Text = "", TextWrapped = true,
	})
	self:Text(bodyLabel, "Muted", 0.85)

	local followConnection: RBXScriptConnection? = nil
	local currentTarget: GuiObject? = nil

	local function toRoot(screenPosition: Vector2): Vector2
		local scale = ctx.ScaleValue or 1
		return (screenPosition - ctx.Root.AbsolutePosition) / scale
	end

	local function place(target: GuiObject, touch: boolean)
		local scale = ctx.ScaleValue or 1
		local viewport = ctx.Root.AbsoluteSize / scale
		local size = tip.AbsoluteSize / scale
		local pos: Vector2
		if touch then
			local anchor = toRoot(target.AbsolutePosition)
			pos = anchor + Vector2.new(0, -size.Y - 8)
		else
			pos = toRoot(UserInputService:GetMouseLocation()) + Vector2.new(14, 16)
		end
		local x = math.clamp(pos.X, 4, math.max(4, viewport.X - size.X - 4))
		local y = math.clamp(pos.Y, 4, math.max(4, viewport.Y - size.Y - 4))
		tip.Position = UDim2.fromOffset(x, y)
	end

	local function hide()
		currentTarget = nil
		tip.Visible = false
		if followConnection then
			followConnection:Disconnect()
			followConnection = nil
		end
	end

	local function show(target: GuiObject, getContent: () -> (any, any), touch: boolean)
		local title, body = getContent()
		if (title == nil or title == "") and (body == nil or body == "") then
			return
		end
		titleLabel.Text = tostring(title or "")
		titleLabel.Visible = title ~= nil and title ~= ""
		bodyLabel.Text = tostring(body or "")
		bodyLabel.Visible = body ~= nil and body ~= ""
		currentTarget = target
		tip.Visible = true
		place(target, touch)
		if followConnection then
			followConnection:Disconnect()
		end
		followConnection = RunService.RenderStepped:Connect(function()
			if currentTarget and currentTarget.Parent then
				place(currentTarget, touch)
			else
				hide()
			end
		end)
	end

	-- Retorna um objeto com Disconnect para o chamador guardar no próprio Cleaner.
	function self:Attach(target: GuiObject, getContent: () -> (any, any)): any
		local cleaner = UIUtils.newCleaner()
		local pressToken = 0
		cleaner:Add(target.MouseEnter:Connect(function()
			show(target, getContent, false)
		end))
		cleaner:Add(target.MouseLeave:Connect(function()
			if currentTarget == target then
				hide()
			end
		end))
		cleaner:Add(target.InputBegan:Connect(function(input: InputObject)
			if input.UserInputType == Enum.UserInputType.Touch then
				pressToken += 1
				local mine = pressToken
				task.delay(0.4, function()
					if pressToken == mine then
						show(target, getContent, true)
					end
				end)
			end
		end))
		cleaner:Add(target.InputEnded:Connect(function(input: InputObject)
			if input.UserInputType == Enum.UserInputType.Touch then
				pressToken += 1
				local mine = pressToken
				task.delay(1.2, function()
					if pressToken == mine and currentTarget == target then
						hide()
					end
				end)
			end
		end))
		cleaner:Add(function()
			if currentTarget == target then
				hide()
			end
		end)
		return { Disconnect = function()
			cleaner:Clean()
		end }
	end

	self.Cleaner:Add(function()
		hide()
		if ctx.Tooltip == self then
			ctx.Tooltip = nil
		end
	end)
	self.Instance = tip
	ctx.Tooltip = self
	return self
end

return M
