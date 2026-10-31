--!strict
-- Local: ReplicatedStorage.RobKisGUI.Shared.UIConfig
-- Tipo: ModuleScript (dados) | Função: ÚNICO lugar para o desenvolvedor escolher estilo, componentes, posições,
-- atalhos e responsividade. Trocar valores aqui não exige mexer em nenhum componente.

local UIConfig = {}

-- 1. Estilo inicial: AnimeAdventure | WesternSurvival | Simulator | RPGFantasy | MilitaryTactical | SciFi | Minimalist | Custom
UIConfig.Style = "Simulator"

-- 2. Ajustes sobre o estilo (opcional). Exemplo: { Colors = { Primary = Color3.fromRGB(255, 120, 40) }, CornerRadius = 6 }
UIConfig.ThemeOverrides = {}

-- 3. Textos de dica na tela de carregamento
UIConfig.LoadingTips = {
	"Dica: abra o inventário com B.",
	"Dica: complete missões para ganhar recompensas.",
	"Dica: use os números do teclado para as habilidades.",
}

-- 4. Responsividade: resolução de referência por dispositivo (o UIScale é calculado a partir dela)
UIConfig.Responsive = {
	MinScale = 0.55,
	MaxScale = 1.5,
	Reference = {
		Desktop = Vector2.new(1280, 720),
		Console = Vector2.new(1280, 720),
		Tablet = Vector2.new(1024, 600),
		Mobile = Vector2.new(800, 400),
	},
}

-- 5. Atalhos de teclado (apenas computador). Use nil para desativar um atalho.
UIConfig.Keybinds = {
	Inventory = Enum.KeyCode.B,
	Shop = Enum.KeyCode.N,
	Quests = Enum.KeyCode.J,
	Skills = Enum.KeyCode.K,
	Settings = Enum.KeyCode.O,
}

-- 6. Componentes montados, em ordem. Enabled = false remove o componente. Config é repassado ao componente.
-- Placement/Devices permitem mudar AnchorPoint/Position/Size por dispositivo sem editar o componente.
UIConfig.Layout = {
	-- Sistemas de sobreposição (precisam vir primeiro: outros componentes os usam)
	{ Component = "TooltipSystem" },
	{ Component = "NotificationSystem" },
	{ Component = "ConfirmationDialog" },
	-- HUD
	{ Component = "MainHUD" },
	{ Component = "TopBar" },
	{ Component = "Hotbar", Config = { Slots = 4, Source = "Skills" } },
	-- Painéis (janelas)
	{ Component = "InventoryPanel" },
	{ Component = "EquipmentPanel" },
	{ Component = "ShopPanel", Config = { ConfirmPurchase = true } },
	{ Component = "SkillsPanel" },
	{ Component = "QuestPanel" },
	{ Component = "PetPanel" },
	{ Component = "CharacterSelection" },
	{ Component = "SettingsPanel" },
	{ Component = "TutorialPanel", Config = { AutoStart = true } },
	-- Tela de carregamento por último: fica por cima e some quando o servidor sincroniza
	{ Component = "LoadingScreen", Config = { Title = "RobKis" } },
}

-- 7. Botões do menu lateral do MainHUD: { Painel, Texto } (o painel precisa estar montado acima)
UIConfig.Menu = {
	{ Panel = "Shop", Text = "Loja" },
	{ Panel = "Inventory", Text = "Inventário" },
	{ Panel = "Quests", Text = "Missões" },
	{ Panel = "Skills", Text = "Habilidades" },
	{ Panel = "Settings", Text = "Ajustes" },
}

-- 8. Passos do tutorial (TutorialPanel)
UIConfig.TutorialSteps = {
	{ Title = "Bem-vindo!", Body = "Use o menu à esquerda para abrir loja, inventário, missões e habilidades." },
	{ Title = "Habilidades", Body = "A barra inferior mostra suas habilidades. Toque ou use as teclas 1 a 4." },
	{ Title = "Seu visual", Body = "Em Ajustes você troca o estilo da interface e personaliza as cores." },
}

return UIConfig
