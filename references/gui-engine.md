# gui-engine

Motor de interfaces do RobKis. O código-fonte real fica em `gui-engine/` (Rojo: `gui-engine/default.project.json`). Esta skill diz **como usar, personalizar e entregar** sem reescrever a interface a cada estilo.

**Quando usar:** pedidos de HUD, inventário, loja, missões, habilidades, configurações, troca de estilo visual, GUI responsiva (PC, celular, tablet).

## Fluxo

1. **Inspecione o projeto** (MCP, se conectado: `inspect_instance`; senão, peça a hierarquia). Confirme se já existem `ReplicatedStorage.RobKisGUI`, economia, inventário e DataStore. Não sobrescreva nada existente sem ler.
2. **Direção visual**: leia `references/gui-design-human.md` primeiro; se o usuário não escolheu, ofereça os 9 estilos (AnimeAdventure, WesternSurvival, Simulator, RPGFantasy, MilitaryTactical, SciFi, Horror, Minimalist, Custom) ou imagem de referência (skill `roblox-game-ux`). Imagens de referência são inspiração: nunca copie layout/arte/marca de outro jogo.
3. **Configure só em `Shared/UIConfig.luau`**: `Style`, `ThemeOverrides`, `Layout` (componentes, `Placement`, `Devices`), `Keybinds`, `Menu`. Não edite componentes para mudar aparência.
4. **Dados e regras ficam no servidor**: edite `RobKisServer/Catalog.luau` (preços, itens, habilidades, missões, classes) e troque `EconomyAdapter.luau` pela economia real. O cliente só envia ids.
5. **Novos componentes**: crie um ModuleScript em `Components/` com `new(ctx, config)` usando `ComponentBase` (`Skin`, `Text`, `Button`, `Mount`, `Watch`). Ele é registrado sozinho. Cores e fontes sempre vindas do tema.
6. **Verifique**: `python scripts/fastcheck.py --level 2` (cobre `check_luau.py` e o autoteste); no Studio, rode `gui-engine/tests/RunTests.server.luau` e o teste manual do README.

## Regras

- Nunca confiar em preço, saldo ou quantidade vindos do cliente; toda ação passa por `Validators.validateAction`.
- Um painel ativo por vez (`UIState.ActivePanel`); botões desativados enquanto o pedido está pendente.
- Tweens só via `UIUtils.tween` (cancela tween concorrente; respeita `ReducedMotion`).
- Sem Terrain, sem if-expressão em Luau do engine (o verificador não as conta como bloco).
- Sons só tocam com `Sounds.Enabled` e ids configurados; nunca invente asset ids.
- Nunca afirme que criou ou testou no Studio sem confirmação real do MCP; diferencie testes executados, reprovados e manuais.

**Verificação:** `check_luau.py` sem erros; Output do Studio limpo ao dar Play; compra duplicada, saldo insuficiente e remote com payload inválido são recusados pelo servidor.

**Limites e recuperação:** o verificador Python é estático (não compila Luau). Se `luau-analyze` estiver disponível, rode-o também. Após duas falhas iguais, mude de abordagem.
