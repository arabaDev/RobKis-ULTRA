# Benchmark do RobKis

Tarefas fixas (mesmo enunciado a cada versão):

| ID | Tarefa |
|---|---|
| T01 | Criar uma Tool de combate server-authoritative |
| T02 | Corrigir um script com bug dado |
| T03 | Habilidade com cooldown |
| T04 | Sistema de inventário |
| T05 | Interface responsiva (PC + mobile) |
| T06 | NPC com pathfinding |
| T07 | Proteger um RemoteEvent vulnerável |
| T08 | Otimizar um sistema lento (com medição) |
| T09 | Criar um asset no Blender |
| T10 | Importar e validar esse asset |
| T11 | Integrar sistemas sem regressão |

Registrar por execução: tempo total, tempo em ferramentas, sucesso (0/1), erros pós-teste, regressões, tokens, custo, qualidade (1–5), intervenções manuais.

```
python scripts/bench.py add --version v1 --task T01 --seconds 95 --success 1 --errors 0 --quality 4 --manual 0
python scripts/bench.py report
```

Comparação com outra ferramenta (ex.: Fiblox) só se for possível rodar **a mesma tarefa, mesmos requisitos e critérios**. Se não der, não invente resultado.


## v2.1 — eficiência medida (26/10/2026, `python scripts/bench_speed.py --comparar <v2.0>`)
| Medida | v2.0 | v2.1 |
|---|---|---|
| Contexto em toda mensagem, OpenCode (agente + AGENTS.md) | 21.024 B (~6.000 tokens) | 6.851 B (~1.960 tokens) |
| Contexto em toda mensagem, Claude Code (CLAUDE.md + AGENTS.md) | 5.392 B (~1.540 tokens) | 2.555 B (~730 tokens) |
| Começo de tarefa "5 ideias virais de terror" | 6 chamadas / 26,8 KB lidos | 1 chamada (`rv brief`) / 7,7 KB |
| Começo de tarefa "simulador de pets com loja" | 11 chamadas / 19,7 KB | 1 chamada / 9,2 KB |
| Começo de tarefa "GUI igual à imagem" | 11 chamadas / 24,8 KB | 1 chamada / 10,6 KB |
| `rv brief` (tempo do script) | — | ~62 ms |
Tempo dos scripts já era baixo (40–80 ms); o ganho real está em menos idas e vindas do modelo, menos texto lido e permissões pré-liberadas (sem esperar aprovação a cada script). Latência do modelo e do MCP não é medida aqui.
