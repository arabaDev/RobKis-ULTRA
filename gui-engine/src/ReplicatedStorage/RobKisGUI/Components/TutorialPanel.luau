--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.TutorialPanel
-- Tipo: ModuleScript (componente cliente) | Função: tutorial em passos (Próximo / Pular). Com Config.AutoStart inicia uma vez,
-- depois que os dados carregam e se TutorialDone ainda não estiver salvo. Passos: Config.Steps ou UIConfig.TutorialSteps.

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)
local UIConfig = require(Shared.UIConfig)

local M = {}

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	local steps: { any } = config.Steps or UIConfig.TutorialSteps
	local index = 0
	local active = false

	local card = UIUtils.create("CanvasGroup", {
		Name = "TutorialPanel", Parent = ctx.Layers.Overlay, AnchorPoint = Vector2.new(0.5, 1), Position = UDim2.new(0.5, 0, 1, -96),
		Size = UDim2.fromOffset(380, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, GroupTransparency = 1, Visible = false, ZIndex = 20,
	})
	local body = UIUtils.create("Frame", { Parent = card, BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y })
	self:Skin(body, "Surface")
	UIUtils.create("UIPadding", {
		Parent = body, PaddingTop = UDim.new(0, 12), PaddingBottom = UDim.new(0, 12), PaddingLeft = UDim.new(0, 14), PaddingRight = UDim.new(0, 14),
	})
	UIUtils.create("UIListLayout", { Parent = body, Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder })
	local counter = self:Label(body, "", "Muted", 0.75)
	counter.LayoutOrder = 1
	counter.Size = UDim2.new(1, 0, 0, 16)
	local title = self:Label(body, "", "Title", 0.9)
	title.LayoutOrder = 2
	local text = self:Label(body, "", "Body", 0.9)
	text.LayoutOrder = 3
	text.Size = UDim2.new(1, 0, 0, 0)
	text.AutomaticSize = Enum.AutomaticSize.Y
	local row = UIUtils.create("Frame", { Parent = body, BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 36), LayoutOrder = 4 })
	UIUtils.create("UIListLayout", {
		Parent = row, FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0, 8),
		HorizontalAlignment = Enum.HorizontalAlignment.Right, SortOrder = Enum.SortOrder.LayoutOrder,
	})
	local skip = self:Button(row, "Pular", "Surface", nil)
	skip.LayoutOrder = 1
	local nextButton = self:Button(row, "Próximo", "Primary", nil)
	nextButton.LayoutOrder = 2

	local function finish()
		active = false
		self:Tween(card, { GroupTransparency = 1 })
		task.delay(self:Theme().AnimationDuration + 0.03, function()
			if not active then
				card.Visible = false
			end
		end)
		if ctx.State:Get("TutorialDone") ~= true then
			ctx.State:Set("TutorialDone", true)
			local settings = ctx.Theme:Serialize()
			settings.TutorialDone = true
			ctx.Request("SaveSettings", { settings = settings, silent = true }, nil)
		end
	end

	local function show()
		local step = steps[index]
		if step == nil then
			finish()
			return
		end
		counter.Text = string.format("Passo %d de %d", index, #steps)
		title.Text = tostring(step.Title)
		text.Text = tostring(step.Body)
		if index == #steps then
			nextButton.Text = "Concluir"
		else
			nextButton.Text = "Próximo"
		end
	end

	function self:Start()
		if #steps == 0 then
			return
		end
		index = 1
		active = true
		card.Visible = true
		self:Tween(card, { GroupTransparency = 0 })
		show()
	end

	self.Cleaner:Add(nextButton.Activated:Connect(function()
		if not active then
			return
		end
		index += 1
		show()
	end))
	self.Cleaner:Add(skip.Activated:Connect(function()
		if active then
			finish()
		end
	end))
	self.Cleaner:Add(ctx.Events.TutorialRequested:Connect(function()
		self:Start()
	end))

	if config.AutoStart then
		local started = false
		self:Watch("Loaded", function(loaded: any)
			if loaded == true and not started and ctx.State:Get("TutorialDone") ~= true then
				started = true
				task.delay(0.6, function()
					if ctx.State:Get("TutorialDone") ~= true then
						self:Start()
					end
				end)
			end
		end)
	end

	self.Instance = card
	return self
end

return M
