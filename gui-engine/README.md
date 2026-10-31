# RobKis GUI Engine

Motor de interfaces para Roblox (Luau). Troque o estilo e personalize tudo por configuração, sem reescrever componentes.

## O que tem
- **13 estilos**: AnimeAdventure, WesternSurvival, Simulator, RPGFantasy, MilitaryTactical, SciFi, Horror, Classic, Farm, Tycoon, Competitive, Minimalist, Custom (`ThemePresets`).
- **Tema central** (`ThemeConfig`): cores, transparência, bordas, cantos, fontes, gradiente, animação, escala, densidade, sons. Trocar tema atualiza tudo ao vivo (evento `Changed`).
- **29 componentes** em `Components/` (MainHUD, TopBar, CurrencyDisplay, HealthBar, EnergyBar, ExperienceBar, LevelDisplay, InventoryPanel, Hotbar, SkillsPanel, QuestPanel, ShopPanel, CharacterSelection, PetPanel, EquipmentPanel, SettingsPanel, TutorialPanel, NotificationSystem, ConfirmationDialog, LoadingScreen, TooltipSystem, ModalWindow, ProgressBar, ToggleButton, Tabs, SearchField, ItemCard, RarityCard, CooldownIndicator).
- **Servidor autoritativo** (`RobKisServer`): compra, equipar, habilidade (energia + recarga), missões, classes, salvar ajustes. Esquema de payload, limite de frequência e checagens de posse/saldo.
- **Responsivo**: UIScale por dispositivo, área segura do topo, HUD ajustado no celular (menu fora da zona do joystick/pulo).

## Instalação (Rojo)
1. `rojo serve gui-engine/default.project.json` e conecte no Studio.
2. Dê Play. O cliente cria `PlayerGui.RobKisInterface` sozinho.

## Instalação manual (sem Rojo)
Crie e cole cada arquivo como:
| Pasta no projeto | Tipo no Studio | Destino |
|---|---|---|
| `src/ReplicatedStorage/RobKisGUI/Shared/*.luau` | ModuleScript | ReplicatedStorage > RobKisGUI > Shared |
| `src/ReplicatedStorage/RobKisGUI/Components/*.luau` | ModuleScript | ReplicatedStorage > RobKisGUI > Components |
| `Remotes/UIActionEvent` | RemoteEvent (o servidor cria se faltar) | ReplicatedStorage > RobKisGUI > Remotes |
| `src/ServerScriptService/RobKisServer/init.server.luau` | Script chamado `RobKisServer` | ServerScriptService |
| `Catalog`, `PlayerStore`, `EconomyAdapter`, `API` (.luau) | ModuleScript | filhos de `RobKisServer` |
| `src/StarterPlayer/StarterPlayerScripts/RobKisClient.client.luau` | LocalScript `RobKisClient` | StarterPlayerScripts |

## Personalizar
- Estilo/posições/atalhos: `Shared/UIConfig.luau`. Itens, preços, missões: `RobKisServer/Catalog.luau`.
- Jogador: painel **Ajustes** (estilo, cores em hex, cantos, tamanho, movimento reduzido, sons) e botão Salvar.
- No seu jogo (servidor): `require(ServerScriptService.RobKisServer.API)` → `AddQuestProgress`, `AddXP`, `SetEnergy`, `GrantCurrency`, `GrantItem`, evento `SkillActivated(player, skillId)`.
- Hotbar `Source = "Equipped"` dispara `ctx.Events.HotbarSelected(itemId)` para o seu sistema de tools.

## Dependências externas
- **Economia/inventário/missões**: por padrão só na sessão (não persistem). Integre o seu sistema trocando `EconomyAdapter` e `PlayerStore`. Só as configurações de interface usam DataStore (`RobKisGUI_Settings_v1`; no Studio precisa de "Enable Studio Access to API Services").
- Efeito das habilidades e itens iniciais das classes: do seu jogo.
- Sem sons/ícones por padrão: configure ids próprios em `Theme.Sounds` e no campo `Icon` dos itens.

## Verificação
```
python gui-engine/tools/check_luau.py          # estático: blocos, requires, componentes, fontes
python gui-engine/tools/test_check_luau.py     # autoteste do verificador
```
No Studio: copie `tests/RunTests.server.luau` para ServerScriptService, dê Play e leia o Output.

## Teste manual (celular, PC, tablet)
1. Device Emulator (celular e tablet) e janela redimensionada no PC. 2. Abrir/fechar cada painel (menu e atalhos B/N/J/K/O). 3. Comprar item (confirmação), tentar recomprar (deve recusar), saldo insuficiente. 4. Equipar/desequipar. 5. Habilidades 1–4 (recarga, energia). 6. Resgatar missão. 7. Trocar os 13 estilos e Custom. 8. Morrer/respawn (HealthBar volta; painéis fecham). 9. Ajustes → Salvar → sair e entrar.

## Limitações conhecidas
Ver o relatório de entrega: código ainda não executado no Studio nem passado em `luau-analyze`.
