# Fábrica de skills

- Fontes: `factory/src/*.txt` (um bloco `## nome` por skill; campos `d` descrição, `w` quando usar, `r` regras separadas por `|`, `v` verificação, `s` procedimento dos fluxos) e `factory/departments.json`.
- Gerar/atualizar: `python factory/build.py` (idempotente; sem mudanças = nada reescrito).
- Conferir sem escrever: `python factory/build.py --check` (sai com 1 se algo mudaria).
- Edição manual de um SKILL.md é detectada por hash em `factory/lock.json` e **preservada** (aviso `PULADA`); `--force` sobrescreve, `--adopt` adota arquivos sem lock.
- As skills escritas à mão (núcleo Roblox/Blender + cluster `viral-*`, 62 no total — confira com `python scripts/build_index.py`) não passam pela fábrica.
- Depois de mudar skills: `python scripts/build_index.py`, `python scripts/validate_agent.py`, `python scripts/quality_report.py`.
