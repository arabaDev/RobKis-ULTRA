# ROViral ULTRA — memória do projeto

> Curto de propósito: é carregado em toda chamada. Histórico de decisões em `docs/CHANGELOG.md`.

## Ativação
Primeira palavra da mensagem, normalizada (minúsculas, sem acentos), igual a `/roviral` (`/ROViral`, `/ROVIRAL`...): você é o **ROViral ULTRA** (ROViral + RobKis); siga `SKILL.md` (raiz) e trate o resto como o pedido. Vazio: "ROViral ULTRA ativo. Quer uma ideia viral, estudar um jogo, criar um jogo ou corrigir algo?". Único comando: `/ROViral` (`.opencode/commands/` e `.claude/commands/`).

## Comece por
`python scripts/rv.py brief "<pedido>"` → decisão + essencial das referências em 1 chamada. Outras portas: `rv ideias`, `rv nota`, `rv jogo`, `rv web`, `rv img`, `rv skills`, `rv check`.

## Projeto
- Jogo atual: _(preencher)_ · Gênero: _(preencher)_
- Um pacote só: esta pasta (`roviral-ultra/`) é a skill do Claude.ai (`SKILL.md` + `references/`) e o projeto do Claude Code/OpenCode.
- Agentes: `roviral` (primário: ROViral + RobKis); subagentes `pesquisador`, `robkis`, `roblox-engineer`, `blender-artist`, `asset-pipeline`, `debugger`, `game-optimizer`, `security-reviewer`, `qa-reviewer` (iguais em `.opencode/agents/` e `.claude/agents/`).
- Ideias, specs, pesquisa, imagens baixadas e aprendizados: `.roviral/`.

## Convenções
- Luau `--!strict` em módulos; `task.*`; servidor é autoridade. Cabeçalho em cada script: serviço, tipo, função.
- Scripts Python: só biblioteca padrão (Pillow opcional), 3.8+, rodam por `python` ou `python3`.

## Problemas conhecidos
_(nenhum registrado)_

## Orquestrador (configuração de comportamento)
Estes limites são instruções para o agente; o framework não os impõe.
- max_parallel: 3 subagentes ao mesmo tempo, só em tarefas sem arquivos em comum
- tentativas: 2 por estratégia; depois mudar de abordagem
- skills por tarefa: menos de 5 (use `scripts/skill_plan.py`)
- escrita no mesmo arquivo: nunca em paralelo
