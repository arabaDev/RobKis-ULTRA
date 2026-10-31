# ROViral ULTRA — histórico de decisões

- 2026-10-26 — Fusão ROViral + RobKis ULTRA em **ROViral ULTRA**, comando único `/ROViral`. Base do catálogo: versão ROViral das skills (descrições específicas; a do RobKis tinha 444 descrições genéricas e texto padrão repetido); 10 skills em que o RobKis era mais rico (`luau-best-practices`, `roblox-game-ux` e 8 `rk-*`) vieram dele, sem o texto padrão. Do RobKis ULTRA vieram GUI Engine, decide/fastcheck, referências e empacotador.
- 2026-10-26 — Viral Engine 2.0 baseado no algoritmo de recomendação de 2026 (janela de 28 dias, play-through, bounce de 60/180 s, play days D1/D2–7/D8–28, co-play, spend; penalidade para jogos não únicos). Fontes em `references/viral-science.md`.
- 2026-10-26 — `decide.py`: palavras-chave passam a casar no início de palavra ("terror" acionava "erro" → bug).
- NÃO testado no Claude Code, Claude.ai nem OpenCode reais (sem acesso no ambiente onde foi montado); testado por scripts e validadores.

- 2026-10-26 (v2.1) — Web (WebSearch/WebFetch nativos + `scripts/web.py` + `scripts/roblox_game.py` com API pública), visão (`scripts/image_tool.py`, `references/vision.md`), porta única `scripts/rv.py` com `brief` (decisão + essencial em 1 chamada), prompt do agente primário enxuto, subagente `pesquisador`, permissões pré-liberadas (`.claude/settings.json`, `opencode.json`, frontmatter dos agentes), compatibilidade Python 3.8–3.13 e console UTF-8 no Windows.
- 2026-10-26 (v2.3) — Volta ao ROViral + RobKis juntos (estrutura da v2.1, a experiência de agente único da v2.2 foi desfeita). **Um arquivo só** (`ROViral ULTRA.zip`) para Claude.ai, Claude Code e OpenCode: `SKILL.md` e `references/` passaram para a raiz da pasta `roviral-ultra/`; `scripts/package.py` gera e valida o zip.
