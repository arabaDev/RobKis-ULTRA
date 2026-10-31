---
name: flow-release-update
description: "Fluxo de lançamento de atualização: backup, regressão, medição, publicação e reversão."
metadata:
  id: SK-44-12
  department: "Fluxos compostos"
  version: "1.0"
  revised: "2026-10-18"
---

# flow-release-update

Fluxo de lançamento de atualização: backup, regressão, medição, publicação e reversão.

**Quando usar:** Antes de publicar uma nova versão do jogo.

**Procedimento**
1. Faça backup com `vcs-backup-before-risk`.
2. Capture o baseline com `regr-baseline-capture`.
3. Rode `regr-smoke-suite`.
4. Percorra `regr-gameplay-checklist`.
5. Confira `regr-data-compat`.
6. Confira `regr-network-contracts`.
7. Compare FPS com `perf-fps-regression-tracking`.
8. Revise com `review-final-result`.
9. Escreva `doc-changelogs`.
10. Passe pelo `regr-release-gate`.
11. Publique com `studio-publishing` após autorização.
12. Marque `vcs-release-tags`.
13. Tenha pronto `vcs-rollback-recovery`.

**Regras do fluxo**
- Publicar exige autorização explícita do usuário.
- Sem baseline não há comparação de regressão.

**Verificação:** O portão de entrega foi aprovado com evidência e o plano de reversão existe.

**Skills complementares:** `vcs-backup-before-risk`, `regr-baseline-capture`, `regr-smoke-suite`, `regr-gameplay-checklist`, `regr-data-compat`, `regr-network-contracts`, `perf-fps-regression-tracking`, `review-final-result`, `doc-changelogs`, `regr-release-gate`, `studio-publishing`, `vcs-release-tags`, `vcs-rollback-recovery`

**Limites e recuperação:** Este fluxo só ordena skills; cada etapa deve ser verificada pela skill correspondente, e o estado real de cada etapa deve ser reportado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
