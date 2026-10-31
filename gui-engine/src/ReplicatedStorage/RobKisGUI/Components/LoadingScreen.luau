--!strict
-- Local: ReplicatedStorage.RobKisGUI.Components.LoadingScreen
-- Tipo: ModuleScript (componente cliente) | Função: tela de carregamento. Some quando UIState.Loaded = true
-- (primeira sincronização do servidor) ou após Config.Timeout segundos, avisando o jogador.

local Shared = script.Parent.Parent.Shared
local Base = require(Shared.ComponentBase)
local UIUtils = require(Shared.UIUtils)
local UIConfig = require(Shared.UIConfig)

local M = {}

function M.new(ctx: any, config: any): any
	local self: any = Base.new(ctx, config)
	local timeout: number = config.Timeout or 10
	local hidden = false

	local screen = UIUtils.create("CanvasGroup", {
		Name = "LoadingScreen", Parent = ctx.Layers.Overlay, Size = UDim2.fromScale(1, 1), BorderSizePixel = 0,
		ZIndex = 200, GroupTransparency = 0, Active = true,
	})
	self:Themed(function(t: any)
		screen.BackgroundColor3 = t.Colors.Background
	end)
	local title = UIUtils.create("TextLabel", {
		Parent = screen, BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.4), Size = UDim2.fromScale(0.8, 0.14), Text = config.Title or "Carregando",
	})
	self:Text(title, "Title", 2)
	local tip = UIUtils.create("TextLabel", {
		Parent = screen, BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.62), Size = UDim2.fromScale(0.8, 0.08), Text = "", TextWrapped = true,
	})
	self:Text(tip, "Muted")

	local bar = ctx.Registry:Create("ProgressBar", {
		Parent = screen, Size = UDim2.fromOffset(280, 14), ColorRole = "Primary", Max = 1, Value = 0,
	}, ctx)
	bar.Instance.AnchorPoint = Vector2.new(0.5, 0.5)
	bar.Instance.Position = UDim2.fromScale(0.5, 0.52)
	self.Cleaner:Add(bar)

	function self:SetProgress(ratio: number)
		bar:SetValue(ratio, 1)
	end

	function self:Hide()
		if hidden then
			return
		end
		hidden = true
		bar:SetValue(1, 1)
		self:Tween(screen, { GroupTransparency = 1 }, 0.35)
		task.delay(0.4, function()
			screen.Visible = false
		end)
	end

	function self:Show()
		hidden = false
		screen.Visible = true
		screen.GroupTransparency = 0
	end

	-- dicas rotativas e barra "otimista" até a primeira sincronização
	local tips: { string } = UIConfig.LoadingTips
	task.spawn(function()
		local index = 0
		local started = os.clock()
		while not hidden and screen.Parent do
			index += 1
			if #tips > 0 then
				tip.Text = tips[(index - 1) % #tips + 1]
			end
			bar:SetValue(math.min(0.9, (os.clock() - started) / timeout), 1)
			task.wait(1)
		end
	end)

	self:Watch("Loaded", function(loaded: any)
		if loaded == true then
			self:Hide()
		end
	end)
	task.delay(timeout, function()
		if not hidden then
			self:Hide()
			self:Notify("Warning", "Não foi possível sincronizar com o servidor. Alguns dados podem estar desatualizados.")
		end
	end)

	self.Instance = screen
	return self
end

return M
