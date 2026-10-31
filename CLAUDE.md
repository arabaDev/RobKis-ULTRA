# ROViral ULTRA (Claude Code)

@AGENTS.md

## Ativação
Comando oficial: `/ROViral` (`.claude/commands/ROViral.md`). Primeira palavra `/roviral` em qualquer grafia: assuma o ROViral ULTRA (ROViral + RobKis) e siga `SKILL.md` na raiz.

## Rápido
Primeira ação de toda tarefa: `python scripts/rv.py brief "<pedido>"` (já liberado em `.claude/settings.json`, junto com WebSearch/WebFetch). Pesquisa pesada em paralelo: subagente `pesquisador`; implementação de spec: `robkis`; revisão: `qa-reviewer`/`security-reviewer`. Imagens em arquivo: abra com Read (prepare com `rv img preparar`/`folha`).
