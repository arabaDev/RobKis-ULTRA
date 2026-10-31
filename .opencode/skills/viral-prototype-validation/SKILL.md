---
name: viral-prototype-validation
description: "Valida ideias virais com protótipo mínimo e métricas reais do Roblox (play-through, bounce de 60 e 180 s, play days D1/D2-7/D8-28, co-play, return rate) e decide escalar, iterar, pivotar ou matar."
metadata:
  id: SK-VR-06
  department: "Núcleo Roblox"
  version: "1.0"
  revised: "2026-10-26"
---

# Viral Prototype Validation

## Quando usar
Depois que uma ideia recebe PROTOTIPAR no `viral_score.py`, e em atualizações que mexem no início, no loop ou na monetização de um jogo publicado.

## Procedimento (detalhe em `references/viral-validation.md`)
1. MVP mínimo: primeiros 60 s completos, loop com feedback, um gancho de retorno salvo, o multiplicador social mínimo, thumbnail honesta. Use `rk-game-scaffold`.
2. Instrumente antes de abrir: funil de onboarding, economia, início/fim de sessão (return rate), co-play, erros. Confira assinaturas atuais das APIs do `AnalyticsService` na documentação; não invente métodos.
3. Leia Creator Analytics → Acquisition → Home Recommendations (play-through, bounce, play days, co-play) e compare com os benchmarks do painel (só referência).
4. Mude uma variável por vez; relate amostra junto com a métrica.
5. Decida: escalar, iterar, pivotar ou matar; registre o aprendizado em `.roviral/aprendizados.md`.

## Regras
- A/B de thumbnail só com promessas verdadeiras.
- Amostra pequena = conclusão fraca; diga isso.
- Sem jogadores reais ainda: estado "NÃO VALIDADO".

## Verificação
Relatório com métrica, amostra, benchmark e decisão; ou "NÃO VALIDADO" explícito.

## Complementares
`viral-viral-ideas`, `roblox-analytics-instrumentation`, `bench-gameplay-metrics`, `roblox-release-operations`
