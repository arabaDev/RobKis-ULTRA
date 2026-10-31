# decision-engine

**Quando usar:** no início de toda tarefa não trivial, antes de escolher estilo, arquitetura ou skills.

## Passo a passo
1. Rode `python scripts/decide.py "<pedido>" [--style X] [--detail Y] [--images]`. Ele devolve modo, gênero, estilo de GUI e de build, abordagem (realismo, surrealismo, estilização), tipos de tarefa, complexidade 1–5, até 8 skills já verificadas no disco, nível de Fast Check e perguntas essenciais. É uma heurística de palavras-chave: **confirme com o contexto real** (arquivos, imagens, projeto aberto) antes de agir.
2. **Modo:** *autônomo* (padrão: você decide e explica em uma linha), *personalizado* (o usuário escolhe; você executa), *misto* (o usuário fixa algumas coisas, você decide o resto). O que o usuário escolheu nunca é reinterpretado; ele pode trocar estilo ou técnica a qualquer momento sem recomeçar (tema/UIConfig e `proc-*` permitem).
3. **Decisão com fundamento:** cada escolha tem motivo (gênero, imagens, projeto, plataforma, orçamento de desempenho). Nada aleatório; repita o mesmo pedido, obtenha a mesma decisão.
4. **Perguntar só o essencial:** falta o objeto da tarefa, há ação destrutiva sem autorização, ou a decisão depende de algo que só o usuário sabe. Estilo, cores, nível de detalhe e arquitetura você decide.
5. **Carregue pouco:** leia o `SKILL.md` das skills sugeridas (máx. ~5). Se uma sugerida não existir, o script lista em `skills_ausentes_no_disco`; não finja que leu.
6. Execute em etapas pequenas e rode `python scripts/fastcheck.py` no nível indicado.

## Mapa das 20 especializações → skills existentes
Definido em `SPECIALTIES` (`scripts/decide.py`) e validado por `scripts/test_decide.py` (cada skill existe). Novas skills só onde havia lacuna comprovada: `references/build-direction.md`, `references/tycoon-sim-systems.md`, `references/gui-design-human.md`, `references/gui-engine.md`. Antes de criar outra, rode `skill_search.py` e melhore a existente.

**Verificação:** `python scripts/test_decide.py` passa; a resposta ao usuário cita modo, estilo e o motivo.

**Limites e recuperação:** não interpreta imagens (você interpreta; passe `--images`); idioma das palavras-chave é PT/EN. Decisão errada apontada pelo usuário: refaça com a correção como preferência fixa.
