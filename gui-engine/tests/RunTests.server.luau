--!strict
-- Local: ServerScriptService (coloque temporariamente para testar; remova depois)
-- Tipo: Script (servidor) | Função: testes de lógica pura do GUI Engine (Validators, UIUtils, ThemeConfig, UIState, ComponentRegistry).
-- Como rodar: Studio > Play. Veja o resultado no Output ("[RobKisGUI][TESTES] ..."). ESTES TESTES AINDA NÃO FORAM EXECUTADOS.

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage:WaitForChild("RobKisGUI"):WaitForChild("Shared")
local Validators = require(Shared:WaitForChild("Validators"))
local UIUtils = require(Shared:WaitForChild("UIUtils"))
local ThemeConfig = require(Shared:WaitForChild("ThemeConfig"))
local UIState = require(Shared:WaitForChild("UIState"))
local ComponentRegistry = require(Shared:WaitForChild("ComponentRegistry"))

local passed, failed = 0, 0
local function check(name: string, condition: boolean)
	if condition then
		passed += 1
	else
		failed += 1
		warn("[RobKisGUI][TESTES] FALHOU: " .. name)
	end
end

-- Validators: ações
local ok = Validators.validateAction("Purchase", { itemId = "sword_flame", rid = 3 })
check("Purchase válido", ok)
check("Purchase sem itemId", not Validators.validateAction("Purchase", {}))
check("Purchase com id malicioso", not Validators.validateAction("Purchase", { itemId = "a b;drop" }))
check("Purchase com id longo", not Validators.validateAction("Purchase", { itemId = string.rep("a", 40) }))
check("Ação desconhecida", not Validators.validateAction("GiveMoney", { amount = 1e9 }))
check("Ação não-string", not Validators.validateAction(5, {}))
check("Payload não-tabela", not Validators.validateAction("Equip", "x"))
check("rid NaN", not Validators.validateAction("Equip", { itemId = "a", rid = 0 / 0 }))
local _, clean = Validators.validateAction("Purchase", { itemId = "a", price = 0 })
check("campos extras descartados", clean.price == nil)

-- Validators: configurações
local settingsOk, settings = Validators.validateSettings({ Style = "SciFi", Scale = 9, ReducedMotion = true })
check("settings válidas", settingsOk)
check("Scale é limitado a 2", settings.Scale == 2)
check("estilo inválido", not Validators.validateSettings({ Style = "Hack" }))
check("hex inválido", not Validators.validateSettings({ Primary = "red" }))
check("hex válido", Validators.validateSettings({ Primary = "#FF8800" }))
check("tipo errado", not Validators.validateSettings({ ReducedMotion = "yes" }))

-- UIUtils
check("formatNumber 999", UIUtils.formatNumber(999) == "999")
check("formatNumber 12540", UIUtils.formatNumber(12540) == "12.5K")
check("formatNumber 1000", UIUtils.formatNumber(1000) == "1K")
check("formatNumber 2.5M", UIUtils.formatNumber(2500000) == "2.5M")
check("formatTime 59", UIUtils.formatTime(58.2) == "59")
check("formatTime 61", UIUtils.formatTime(61) == "1:01")
check("colorFromHex válido", UIUtils.colorFromHex("#FF0000") == Color3.fromRGB(255, 0, 0))
check("colorFromHex inválido", UIUtils.colorFromHex("FF0000") == nil)
check("colorToHex", UIUtils.colorToHex(Color3.fromRGB(0, 128, 255)) == "#0080FF")
check("computeScale limita", UIUtils.computeScale(Vector2.new(10000, 10000), Vector2.new(1280, 720), 0.55, 1.5) == 1.5)
local list = UIUtils.indexById({ { Id = "a" }, { Id = "b" } })
check("indexById", list.a ~= nil and list.b ~= nil)

-- ThemeConfig
local theme = ThemeConfig.new("Simulator")
local changes = 0
theme.Changed:Connect(function()
	changes += 1
end)
check("estilo inicial", theme:Get().Style == "Simulator")
check("SetStyle válido", theme:SetStyle("WesternSurvival"))
check("SetStyle inválido", not theme:SetStyle("Nada"))
check("Changed disparou", changes == 1)
theme:Patch({ Scale = 99 })
check("Scale limitado", theme:Get().Scale == 2)
theme:Patch({ ReducedMotion = true })
theme:SetStyle("SciFi")
check("preferências sobrevivem à troca de estilo", theme:Get().ReducedMotion == true)
theme:Customize({ Colors = { Primary = Color3.fromRGB(1, 2, 3) } })
check("Customize muda para Custom", theme:Get().Style == "Custom")
check("Customize aplica cor", theme:Get().Colors.Primary == Color3.fromRGB(1, 2, 3))
local serialized = theme:Serialize()
check("Serialize passa no validador", Validators.validateSettings(serialized))
theme:Patch({ Colors = { Primary = "não é cor" } })
check("cor inválida é corrigida", typeof(theme:Get().Colors.Primary) == "Color3")

-- UIState
local state = UIState.new({ A = 1 })
local seen = 0
state:Subscribe("A", function()
	seen += 1
end)
state:Set("A", 1)
check("mesmo valor não notifica", seen == 0)
state:Set("A", 2)
check("novo valor notifica", seen == 1)
state:OpenPanel("Shop")
state:TogglePanel("Inventory")
check("um painel por vez", state:Get("ActivePanel") == "Inventory")
state:ClosePanel("Shop")
check("fechar outro painel não fecha o ativo", state:Get("ActivePanel") == "Inventory")
state:TogglePanel("Inventory")
check("toggle fecha", state:Get("ActivePanel") == nil)

-- ComponentRegistry
local registry = ComponentRegistry.new()
registry:Register("Dummy", { new = function(_, config: any)
	return { Value = config.Value }
end })
check("Create usa config", registry:Create("Dummy", { Value = 7 }, {}).Value == 7)
check("Create desconhecido falha", not pcall(function()
	registry:Create("Nada", {}, {})
end))
check("Register inválido falha", not pcall(function()
	registry:Register("X", {})
end))

print(string.format("[RobKisGUI][TESTES] aprovados: %d | reprovados: %d", passed, failed))
