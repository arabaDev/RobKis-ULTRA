---
name: flow-game-system
description: "Fluxo genérico para implementar um sistema de jogo com segurança e testes."
metadata:
  id: SK-44-03
  department: "Fluxos compostos"
  version: "1.0"
  revised: "2026-10-18"
---

# flow-game-system

Fluxo genérico para implementar um sistema de jogo com segurança e testes.

**Quando usar:** Novo sistema com várias dependências.

**Procedimento**
1. Transforme os requisitos em critérios com `test-acceptance-checklists`.
2. Defina camadas com `arq-service-layering`.
3. Fixe os contratos com `arq-api-contracts`.
4. Divida o trabalho com `orch-subtask-splitting`.
5. Implemente com `luau-strict-types` e `luau-error-handling`.
6. Rode análise estática com `luau-linting-formatting`.
7. Cubra casos extremos com `test-edge-cases`.
8. Revise segurança com `review-security`.
9. Integre e revise com `review-integration`.
10. Avalie o impacto com `regr-diff-impact`.
11. Meça com `perf-script-profiling`.
12. Documente limitações com `doc-known-issues`.

**Regras do fluxo**
- Uma subtarefa por arquivo para permitir paralelismo seguro.
- Sem dependência circular entre os módulos novos.

**Verificação:** Critérios de aceitação verificados item a item e limitações documentadas.

**Skills complementares:** `test-acceptance-checklists`, `arq-service-layering`, `arq-api-contracts`, `orch-subtask-splitting`, `luau-strict-types`, `luau-error-handling`, `luau-linting-formatting`, `test-edge-cases`, `review-security`, `review-integration`, `regr-diff-impact`, `perf-script-profiling`, `doc-known-issues`

**Limites e recuperação:** Este fluxo só ordena skills; cada etapa deve ser verificada pela skill correspondente, e o estado real de cada etapa deve ser reportado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
