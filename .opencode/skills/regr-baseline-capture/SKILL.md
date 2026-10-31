---
name: regr-baseline-capture
description: "Registrar o comportamento atual antes de mudar."
metadata:
  id: SK-36-01
  department: "Testes de regressão"
  version: "1.0"
  revised: "2026-10-18"
---

# regr-baseline-capture

Registrar o comportamento atual antes de mudar.

**Quando usar:** Antes de alterar sistemas existentes.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Anote o que funciona hoje.
- Guarde saídas e capturas.
- Defina como comparar depois.

**Verificação:** Existe um baseline para comparar.

**Complementares (sugeridas por similaridade):** `bench-baselines`, `review-regressions`, `arq-extensibility-patterns`

**Limites e recuperação:** Compare sempre com um baseline registrado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
