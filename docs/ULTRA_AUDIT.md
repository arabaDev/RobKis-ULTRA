# Auditoria do RobKis para o ULTRA (2026-10-25)

Só fatos verificados nos arquivos. Sem acesso à internet nem ao Roblox Studio/MCP nesta sessão.

## Arquitetura real
- Agente OpenCode: `.opencode/agents/` (robkis, roviral, ultra + 7 especialistas), comandos em `.opencode/commands/`, 687+ pastas de skills em `.opencode/skills/` (678 no índice `docs/skills_index.json`).
- Skills de GUI já existentes: `roblox-gui`, `roblox-ui`, `roblox-ui-implementation`, `roblox-game-ux`, `rk-visual-direction` e 19 `ui-*`/afins. Há sobreposição entre `roblox-ui`, `roblox-gui` e `roblox-ui-implementation` (não removido; só registrado).
- Python existente: `factory/build.py` (gera skills a partir de `factory/src` + `departments.json`, idempotente, com lock por hash) e `factory/tools/*`.
- Geração de Luau/Python, modelos, animações e assets: via skills e agentes (`roblox-engineer`, `blender-artist`, `asset-pipeline`); não há código de pipeline neste pacote.

## Achados
1. **Scripts citados e ausentes:** `scripts/skill_plan.py`, `skill_search.py`, `bench.py`, `build_index.py`, `validate_agent.py`, `quality_report.py`. Criado: `skill_search.py` e `fastcheck.py`. Seguem ausentes os demais.
2. **`opencode.jsonc` ausente:** `docs/MCP_SETUP.md` o cita, mas o arquivo não está no pacote; nenhum MCP de Studio/Blender é configurável a partir daqui. `docs/TOOL_REGISTRY.md` diz "não testado".
3. **Mojibake residual** (`â€“` no lugar de `–`) em 17 arquivos (skills `pipe-*`, `departments.json`, índice, registry), apesar de `AGENTS.md` dar o reparo como concluído. Corrigido; `build.py --check` continua limpo.
4. **68 skills do núcleo com texto-padrão** ("Quando houver demanda relacionada a ...", "Siga as convenções do departamento"). Não alterado; candidatas a reescrita.
5. **Índice desatualizado:** `references/gui-engine.md` e `roblox-studio-editable-mesh` (e as novas `rk-*`) não estão em `docs/skills_index.json`; sem `build_index.py` não há como regenerar aqui.

## Pesquisa de Skills
Escopo: **apenas as skills locais** (busca por `skill_search.py` e leitura de `roblox-game-ux`, `rk-visual-direction`, `roblox-ui`, `roblox-gui`). Não foi possível pesquisar fontes externas (sem rede). Incorporado: o protocolo de direção visual e o checklist anti-genérico de `roblox-game-ux`/`rk-visual-direction` foram estendidos em `references/gui-design-human.md`; mobile-first e áreas seguras de `roblox-gui`/`ui-safe-areas` já estão no engine.
