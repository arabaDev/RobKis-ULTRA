---
name: review-regressions
description: "Revisão de regressões nas funcionalidades vizinhas a uma mudança."
metadata:
  id: SK-32-07
  department: "Revisão independente"
  version: "1.0"
  revised: "2026-10-18"
---

# review-regressions

Revisão de regressões nas funcionalidades vizinhas a uma mudança.

**Quando usar:** Depois de alterações em sistemas existentes.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Liste funcionalidades vizinhas.
- Compare com o comportamento anterior.
- Teste o essencial.

**Verificação:** Nenhuma funcionalidade anterior quebrou.

**Complementares (sugeridas por similaridade):** `bug-bisect-regressions`, `perf-fps-regression-tracking`, `regr-ui-snapshots`

**Limites e recuperação:** Não aprove o que não verificou; reporte evidência. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
