--!strict
-- Local: ReplicatedStorage.RobKisGUI.Shared.ThemePresets
-- Tipo: ModuleScript (dados puros) | Função: valores padrão e os 8 estilos visuais. Só dados, sem lógica de UI.

local function c(r: number, g: number, b: number): Color3
	return Color3.fromRGB(r, g, b)
end

local Presets = {}

Presets.Order = {
	"AnimeAdventure", "WesternSurvival", "Simulator", "RPGFantasy",
	"MilitaryTactical", "SciFi", "Horror", "Classic", "Farm", "Tycoon", "Competitive",
	"Minimalist", "Custom",
}

Presets.DisplayNames = {
	AnimeAdventure = "Anime Adventure",
	WesternSurvival = "Western Survival",
	Simulator = "Simulator",
	RPGFantasy = "RPG Fantasy",
	MilitaryTactical = "Military Tactical",
	SciFi = "Sci-Fi",
	Horror = "Horror",
	Classic = "Clássico",
	Farm = "Fazenda",
	Tycoon = "Tycoon",
	Competitive = "Competitivo",
	Minimalist = "Minimalista",
	Custom = "Custom",
}

-- Padrão seguro: qualquer estilo parte daqui e só sobrescreve o que muda.
Presets.Default = {
	Style = "Simulator",
	Colors = {
		Background = c(25, 25, 32),
		Surface = c(38, 40, 52),
		Primary = c(90, 255, 60),
		Secondary = c(35, 180, 80),
		Accent = c(0, 220, 230),
		Text = c(255, 255, 255),
		TextMuted = c(170, 175, 190),
		Success = c(70, 210, 110),
		Warning = c(255, 190, 50),
		Error = c(255, 75, 75),
		Stroke = c(10, 10, 14),
	},
	Rarity = {
		Common = c(190, 190, 200),
		Rare = c(70, 170, 255),
		Epic = c(170, 90, 255),
		Legendary = c(255, 180, 40),
	},
	BackgroundTransparency = 0.05,
	CornerRadius = 12,
	StrokeThickness = 2,
	Font = Enum.Font.GothamBold,
	FontBold = Enum.Font.GothamBlack,
	TextSize = 18,
	Gradient = false,
	GradientStrength = 0.5, -- 0 a 1: quão escuro o gradiente chega (só vale com Gradient = true)
	AnimationDuration = 0.2,
	ReducedMotion = false,
	Scale = 1,
	Density = "Normal",
	-- Ids de som ficam vazios de propósito: só toca se o desenvolvedor configurar um asset próprio.
	Sounds = { Enabled = false, Click = "", Hover = "", Success = "", Error = "", Volume = 0.5 },
}

Presets.Styles = {
	AnimeAdventure = {
		Colors = {
			Background = c(18, 22, 52), Surface = c(30, 38, 88), Primary = c(0, 200, 255),
			Secondary = c(150, 80, 255), Accent = c(255, 95, 170), Stroke = c(90, 170, 255),
		},
		CornerRadius = 10, StrokeThickness = 2, Gradient = true,
		Font = Enum.Font.GothamBold, FontBold = Enum.Font.GothamBlack,
	},
	WesternSurvival = {
		Colors = {
			Background = c(44, 30, 20), Surface = c(68, 48, 32), Primary = c(214, 150, 60),
			Secondary = c(120, 90, 60), Accent = c(190, 60, 40), Text = c(245, 232, 210),
			TextMuted = c(190, 170, 140), Stroke = c(30, 20, 12),
		},
		CornerRadius = 4, StrokeThickness = 3, Gradient = false, BackgroundTransparency = 0.1,
		Font = Enum.Font.Antique, FontBold = Enum.Font.Antique,
	},
	Simulator = {
		Colors = { Accent = c(0, 220, 230) },
		CornerRadius = 10, StrokeThickness = 2, Gradient = true, GradientStrength = 0.4,
		Font = Enum.Font.FredokaOne, FontBold = Enum.Font.FredokaOne,
	},
	RPGFantasy = {
		Colors = {
			Background = c(36, 28, 44), Surface = c(56, 44, 70), Primary = c(230, 190, 90),
			Secondary = c(140, 100, 200), Accent = c(90, 200, 160), Text = c(250, 242, 230),
			Stroke = c(150, 120, 60),
		},
		CornerRadius = 8, StrokeThickness = 2,
		Font = Enum.Font.Fantasy, FontBold = Enum.Font.Fantasy,
	},
	MilitaryTactical = {
		Colors = {
			Background = c(28, 32, 26), Surface = c(44, 50, 40), Primary = c(160, 190, 80),
			Secondary = c(110, 120, 90), Accent = c(230, 170, 40), Text = c(225, 230, 215),
			Error = c(210, 60, 50), Stroke = c(15, 18, 12),
		},
		CornerRadius = 2, StrokeThickness = 1, Density = "Compact", TextSize = 16,
		Font = Enum.Font.RobotoCondensed, FontBold = Enum.Font.RobotoCondensed,
	},
	SciFi = {
		Colors = {
			Background = c(8, 16, 32), Surface = c(14, 30, 56), Primary = c(60, 200, 255),
			Secondary = c(40, 110, 220), Accent = c(120, 255, 220), Text = c(225, 240, 255),
			TextMuted = c(140, 165, 200), Stroke = c(50, 140, 220),
		},
		CornerRadius = 6, StrokeThickness = 1, Gradient = true, BackgroundTransparency = 0.15,
		Font = Enum.Font.SciFi, FontBold = Enum.Font.SciFi,
	},
	Horror = {
		Colors = {
			Background = c(14, 10, 12), Surface = c(28, 20, 22), Primary = c(150, 38, 38),
			Secondary = c(82, 72, 64), Accent = c(196, 162, 88), Text = c(224, 213, 200),
			TextMuted = c(140, 125, 115), Error = c(200, 50, 40), Stroke = c(6, 4, 4),
		},
		CornerRadius = 2, StrokeThickness = 2, Gradient = false, BackgroundTransparency = 0.2,
		AnimationDuration = 0.28,
		Font = Enum.Font.SpecialElite, FontBold = Enum.Font.SpecialElite,
	},
	Classic = {
		Colors = {
			Background = c(45, 45, 48), Surface = c(70, 70, 76), Primary = c(0, 162, 255),
			Secondary = c(110, 110, 118), Accent = c(255, 200, 50), Stroke = c(20, 20, 22),
		},
		CornerRadius = 2, StrokeThickness = 2, Gradient = false, BackgroundTransparency = 0.1,
		Font = Enum.Font.SourceSansBold, FontBold = Enum.Font.SourceSansBold, TextSize = 20,
	},
	Farm = {
		Colors = {
			Background = c(58, 40, 26), Surface = c(96, 68, 42), Primary = c(126, 196, 66),
			Secondary = c(210, 160, 70), Accent = c(240, 90, 70), Text = c(255, 248, 230),
			TextMuted = c(214, 196, 164), Stroke = c(38, 24, 14),
		},
		CornerRadius = 8, StrokeThickness = 3, Gradient = false, BackgroundTransparency = 0.05,
		Font = Enum.Font.Cartoon, FontBold = Enum.Font.Cartoon,
	},
	Tycoon = {
		Colors = {
			Background = c(36, 40, 46), Surface = c(58, 64, 72), Primary = c(255, 170, 40),
			Secondary = c(80, 150, 200), Accent = c(120, 200, 90), Text = c(245, 245, 240),
			Stroke = c(16, 18, 22),
		},
		CornerRadius = 6, StrokeThickness = 2, Gradient = false,
		Font = Enum.Font.GothamBold, FontBold = Enum.Font.GothamBlack,
	},
	Competitive = {
		Colors = {
			Background = c(14, 16, 22), Surface = c(26, 30, 40), Primary = c(255, 90, 60),
			Secondary = c(70, 130, 255), Accent = c(255, 220, 60), Text = c(255, 255, 255),
			Stroke = c(6, 8, 12),
		},
		CornerRadius = 3, StrokeThickness = 1, Gradient = false, BackgroundTransparency = 0.25,
		Density = "Compact", TextSize = 16, AnimationDuration = 0.12,
		Font = Enum.Font.RobotoCondensed, FontBold = Enum.Font.RobotoCondensed,
	},
	Minimalist = {
		Colors = {
			Background = c(245, 245, 247), Surface = c(255, 255, 255), Primary = c(40, 40, 46),
			Secondary = c(120, 120, 130), Accent = c(60, 120, 240), Text = c(24, 24, 28),
			TextMuted = c(110, 110, 120), Stroke = c(220, 220, 226),
		},
		CornerRadius = 8, StrokeThickness = 1, Gradient = false, Density = "Comfortable",
		Font = Enum.Font.Gotham, FontBold = Enum.Font.GothamBold,
	},
	-- "Custom" parte do Minimalista e recebe as alterações do usuário (ver ThemeConfig:Customize).
}

return Presets
