# ROViral ULTRA

![modelo](https://img.shields.io/badge/modelo-Claude%20Opus%205.5-d97757)
![Roblox](https://img.shields.io/badge/Roblox-Studio%20%2B%20Luau-00a2ff)
![ambientes](https://img.shields.io/badge/roda%20em-Claude.ai%20%C2%B7%20Claude%20Code%20%C2%B7%20OpenCode-5a67d8)
![Python](https://img.shields.io/badge/Python-3.8%E2%80%933.13-3776ab)
![licença](https://img.shields.io/badge/licen%C3%A7a-MIT-green)

Uma equipe de desenvolvimento de jogos Roblox em **um só agente**, com **um único comando (`/ROViral`)** e **um único arquivo** (`ROViral ULTRA.zip`) para Claude.ai, Claude Code e OpenCode.

- **ROViral (o cérebro):** inventa ideias virais originais, estuda jogos e tendências, desenha a experiência, escreve a especificação e revisa o trabalho com olhar crítico.
- **RobKis (o engenheiro):** transforma a especificação em jogo funcionando — Luau cliente/servidor, GUIs profissionais, mapas, modelos 3D/Blender, DataStore, otimização e testes.

> Fluxo: **inventar → pesquisar → analisar → planejar → construir → testar → revisar → corrigir → otimizar → entregar.**

---

## Por que ele existe

Pedir "um jogo viral" para uma IA costuma devolver o primeiro clichê e números inventados. O ROViral ULTRA faz o caminho inteiro: gera ideias que não se repetem, pontua cada uma contra os sinais reais do algoritmo do Roblox de 2026, especifica, constrói o código, testa e **só afirma o que foi verificado**.

---

## Novidades

### v2.1 — web, visão e velocidade
- **Acesso à web:** busca/leitura nativa de cada ambiente (WebSearch/WebFetch) com plano B pelo terminal (`rv web buscar` / `rv web ler`). `rv jogo <link>` traz dados **reais** de qualquer jogo Roblox pela API pública (jogando agora, visitas, favoritos, aprovação, datas) e baixa as thumbnails.
- **Vê imagens:** abre prints, referências e thumbnails. `rv img preparar` (tamanho ideal), `rv img folha` (várias numa leitura), `rv img paleta` (cores + contraste), `rv img comparar` (antes/depois). Guia em [`references/vision.md`](references/vision.md).
- **Mais rápido (medido):** `rv brief` troca 6–11 chamadas por 1 no começo de cada tarefa; contexto por mensagem caiu de ~6.000 → ~1.960 tokens no OpenCode e ~1.540 → ~730 no Claude Code. Números em [`docs/BENCHMARK.md`](docs/BENCHMARK.md).
- **Sem erros de Python:** testado em 3.8 e 3.13, com e sem Pillow, console Windows (cp1252); ruff, mypy e pytest limpos; 100+ verificações automáticas.

### Viral Engine 2.0
- Baseado em como o Roblox recomenda jogos em 2026: 28 dias de retenção (D1, D2–7, D8–28), quem fica nos primeiros 60–180 s, co-play com amigos, gasto saudável — e penalidade para jogos muito parecidos com outros.
- **25 padrões virais estruturais** (roubar e defender, crescimento em tempo real, +1 por ação, anomalia, horror sensorial, sobrevivência coop por noites, 1 contra muitos...) com twists, riscos e saturação estimada.
- **`idea_forge.py`:** sementes de ideias que nunca se repetem no mesmo lote.
- **`viral_score.py`:** avalia em 9 critérios (0–10) com 7 portões eliminatórios e alertas de honestidade (notas infladas, "verificado" sem fonte, ideias parecidas demais).
- Método de 10 passos, testes de fogo, dossiê de ideia, teardown de jogos em 11 camadas e plano de validação com métricas reais.
- Tudo do RobKis ULTRA: GUI Engine (13 estilos, 29 componentes), motor de decisão, Fast Check em 3 níveis, direção de build, catálogo de 680+ skills.

---

## Instalação (um arquivo só: `ROViral ULTRA.zip`)

O mesmo zip serve para tudo. Dentro há uma pasta `roviral-ultra/` — o nome precisa ser exatamente esse (o Claude.ai exige que a pasta tenha o mesmo nome da skill).

### Claude.ai / Claude Desktop / app do celular
Ligue **Execução de código** e **Busca na web** e envie o `ROViral ULTRA.zip` em **Personalizar → Skills** (sem descompactar). Escreva `/ROViral ...` no começo da mensagem ou peça algo de Roblox — a skill é ativada pela descrição. Sem Studio, MCP ou Blender nesse ambiente, ele entrega ideias, specs e código prontos.

### Claude Code (terminal, VS Code/JetBrains, desktop e web)
Descompacte e abra a pasta `roviral-ultra` como projeto (ou copie o conteúdo para a raiz do seu projeto Roblox). O Claude Code lê `CLAUDE.md`, `.claude/settings.json`, o comando `.claude/commands/ROViral.md` e os subagentes `.claude/agents/`. Use: `/ROViral <pedido>`.

### OpenCode
Mesma pasta descompactada. Lê `opencode.json` (agente padrão `roviral`), `AGENTS.md`, `.opencode/agents/`, `.opencode/commands/ROViral.md` e `.opencode/skills/`. Use: `/ROViral <pedido>`.
- **Busca na web:** `webfetch` já funciona; `websearch` do OpenCode exige modelos Zen ou `OPENCODE_ENABLE_EXA=1`. Sem ele, o agente usa `rv web buscar` sozinho.
- **Imagens:** precisam de modelo com visão (`"modalities": {"input": ["text","image"]}` no `opencode.json`).

Mudou algo e quer gerar o zip de novo? `python scripts/package.py`.

---

## Exemplos

```
/ROViral me dá 5 ideias virais bem diferentes
/ROViral uma ideia de horror cooperativo que segure o jogador por semanas
/ROViral estude o nicho de jogos de anomalia e me diga onde tem espaço
/ROViral crie o MVP da ideia 2 (primeiros 60 s jogáveis primeiro)
/ROViral revise meu jogo e diga por que os jogadores saem no primeiro minuto
/ROViral GUI de loja estilo fazenda para celular
```

---

## Ferramentas

Python 3.8+, só biblioteca padrão (Pillow opcional para imagens). No Windows, use `py` ou `python`. Tudo também roda como `python scripts/rv.py <comando>`.

| Comando | Para quê |
|---|---|
| `rv.py brief "<pedido>"` | **comece aqui**: decisão + essencial em 1 chamada |
| `rv.py web buscar "..."` / `web ler <url>` | web pelo terminal (cache de 6 h) |
| `rv.py jogo <link> [--imagens pasta]` | dados reais + thumbnails de um jogo Roblox |
| `rv.py img paleta/preparar/folha/comparar ...` | imagens (Pillow opcional) |
| `bench_speed.py` | mede contexto, chamadas e tempo |
| `idea_forge.py -n 8 [--max-saturacao media]` | sementes de ideias diversas |
| `viral_score.py ideias.json` | ranking com rubrica e portões |
| `decide.py "<pedido>"` | modo, gênero, estilo, complexidade e o que ler |
| `skill_search.py <palavras>` / `skill_plan.py "<tarefa>"` | achar skills no catálogo |
| `fastcheck.py [--level 2/3]` | verificação rápida/profunda |
| `test_tools.py`, `test_viral.py`, `test_decide.py`, `pytest` | testes (sem internet) |
| `validate_agent.py`, `build_index.py`, `quality_report.py` | saúde do catálogo |
| `package.py` | gera o arquivo único `ROViral ULTRA.zip` |

---

## Estrutura do repositório

| Pasta/arquivo | O que é |
|---|---|
| `SKILL.md` | a skill (ativação, fluxo, limites) |
| `references/` | ciência viral, padrões, engenharia de ideias, GUI, build, visão |
| `scripts/` | `rv.py` (porta única) e todas as ferramentas Python |
| `gui-engine/` | GUI Engine em Luau (13 estilos, 29 componentes) |
| `.opencode/skills/` | catálogo de 680+ skills de Roblox/3D/pipeline |
| `.claude/` · `.opencode/` | comandos `/ROViral` e subagentes por ambiente |
| `factory/` | pipeline de montagem do pacote |
| `extras/fiblox-agent/` | agente extra (FPS PPSh-41 + sistema SHADOW) |
| `docs/` | changelog, benchmark, auditoria, registros de skill/tool |

---

## Honestidade

Potencial viral é hipótese, nunca promessa: ninguém garante que um jogo vai viralizar. O ROViral diferencia dado verificado, estimativa e hipótese; não inventa números; e só diz que algo foi testado quando foi. Saturação de padrões e tendências mudam rápido — revalide a cada mês.

---

## Créditos e licença

Parte do catálogo de skills vem do pacote *roblox-skills* (licença MIT, ver [`LICENSE`](LICENSE) e [`docs/README_roblox-skills_original.md`](docs/README_roblox-skills_original.md)).

Licenciado sob **MIT**.
