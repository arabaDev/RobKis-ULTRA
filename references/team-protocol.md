# team-protocol — ROViral (estratégia) × RobKis (engenharia)

**Quando usar:** em todo projeto de nível 3 ou mais (sistema, jogo, reconstrução). Em nível 1–2 o mesmo agente faz tudo direto, sem cerimônia.

## Papéis (cada tarefa tem UM dono)
| Papel | Dono de | Não faz |
|---|---|---|
| **ROViral** (cérebro) | ideias, pesquisa, análise de projeto, design, especificação, critérios de aceitação, revisão independente, recomendação de próximos passos | não escreve o sistema que ele mesmo vai revisar |
| **RobKis** (engenheiro) | Luau, cliente/servidor, GUIs, builds, modelos 3D/Blender, VFX/som, DataStore, otimização, testes técnicos, integração, entrega dos arquivos | não muda escopo, conceito ou preferência do usuário sem voltar ao ROViral |
Ambos podem apontar problemas; quem decide é o dono da tarefa.

## Como os dois existem de verdade em cada ambiente
- **Claude Code:** o agente principal é o ROViral (comando `/ROViral`); a execução pesada pode ser delegada ao subagente `robkis` (`.claude/agents/robkis.md`) e a revisão independente ao `qa-reviewer`/`security-reviewer`.
- **OpenCode:** agente primário `roviral`; subagentes `robkis`, `roblox-engineer`, `blender-artist`, `asset-pipeline`, `debugger`, `game-optimizer`, `security-reviewer`, `qa-reviewer` (`.opencode/agents/`).
- **Claude.ai / sem subagentes:** fluxo sequencial no mesmo agente, trocando de chapéu explicitamente ("ROViral → spec", "RobKis → implementação", "ROViral → revisão"). Não finja que houve um agente independente.
- **Comunicação por arquivos (sempre que houver disco):** `.roviral/projetos/<id>/` com `spec.md`, `status.json`, `review.md`, `entrega.md`. Isso evita retrabalho e permite retomar outro dia.

## As 10 fases
1. **Descoberta (ROViral):** entende a ideia ou acha a oportunidade (`idea-engine.md`).
2. **Pesquisa (ROViral):** referências e tendências, se houver ferramenta (`trend-research.md`).
3. **Design (ROViral):** experiência, mecânicas, identidade visual, arquitetura (`viral-science.md`, `rk-visual-direction`, `rk-genre-templates`).
4. **Especificação (ROViral):** `spec.md` no formato abaixo.
5. **Execução (RobKis):** sistemas, builds, modelos, GUIs, em etapas pequenas e reversíveis. Mecânica principal jogável antes de tudo.
6. **Verificação técnica (RobKis):** `python scripts/fastcheck.py` no nível certo + MCP do Studio quando conectado.
7. **Revisão independente (ROViral):** compara com a spec usando o checklist abaixo; abre itens em `review.md`.
8. **Correção (RobKis):** itens por prioridade (P0 quebra/segurança, P1 spec não cumprida, P2 qualidade).
9. **Validação final (ambos):** critérios de aceitação marcados com estado real; limitações registradas.
10. **Entrega:** RobKis organiza arquivos (`entrega.md`); ROViral avalia qualidade geral e recomenda próximos passos (incluindo plano de `viral-validation.md`).

## Formato da especificação (`spec.md`)
```
# <id-do-projeto> — <nome>
Objetivo e descrição: <2–4 linhas; frase de 5 s>
Mecânicas principais: <lista>
Funcionalidades obrigatórias (MVP): <lista em ordem de prioridade>
Arquitetura recomendada: <scaffold + serviços; servidor autoritativo>
Sistemas: <nome — entradas, saídas, dependências, comportamento esperado>
Estrutura de arquivos/objetos: <árvore de serviços/pastas>
Scripts e módulos: <nome, local, tipo, função>
Modelos e construções: <lista + estilo + budget (rk-map-budget)>
GUIs: <telas, estilo do GUI Engine, mobile>
Dependências e integrações: <MCP, Blender, DataStore, produtos>
Prioridades: P0 / P1 / P2
Critérios de aceitação: <verificáveis, um por linha>
Testes necessários: <estática, unidade, integração, partida real>
Riscos conhecidos: <...>
Decisões pendentes (precisam do usuário): <...>
```
Detalhado o bastante para eliminar dúvida; sem burocracia além disso.

## `status.json` (troca estruturada)
```json
{"projeto": "id", "fase": 5, "tarefas": [{"id": "T1", "dono": "RobKis", "prioridade": "P0", "estado": "em_andamento",
  "arquivos": ["src/ServerScriptService/..."], "depende_de": [], "aceite": ["..."], "testes": {"estatica": "aprovado", "studio": "nao_executado"}}],
 "problemas": [], "decisoes_pendentes": []}
```
Estados de tarefa: `pendente`, `em_andamento`, `pronta_para_revisao`, `corrigindo`, `concluida`, `bloqueada`.

## Checklist de revisão independente (ROViral)
- [ ] Implementação corresponde à spec (item por item).
- [ ] Mecânicas funcionam como planejado (evidência, não aparência).
- [ ] Sistemas integrados (remotes, dados, GUI ↔ servidor).
- [ ] GUIs coerentes com a identidade e usáveis no celular.
- [ ] Modelos/builds dentro do estilo e do budget.
- [ ] Problemas anteriores corrigidos; sem regressão.
- [ ] Segurança: servidor valida tudo que envolve moeda, item, dano, progresso.
- [ ] Primeiros 60 s entregam a promessa da frase de 5 s.
Problema encontrado → instrução específica, reproduzível e priorizada. Nunca aprovar porque "parece certo".

## Resultados de teste (transparência)
Cada teste tem um destes resultados: **Aprovado**, **Falhou**, **Não executado**, **Bloqueado por limitação externa**. Sempre diga o TIPO: análise estática, teste automatizado, integração, partida real no Studio. Passar na estática não significa jogo sem erros.

## Melhoria contínua
Ao fim de cada projeto ou etapa grande, registre em `.roviral/aprendizados.md`: o que funcionou, o que falhou, erros repetidos, ferramentas úteis, processos a simplificar, maior melhoria possível. Erro repetido 2 vezes vira regra nova na skill/referência certa (proponha a mudança ao usuário).
