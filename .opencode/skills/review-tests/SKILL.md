---
name: review-tests
description: "Revisão da qualidade dos testes."
metadata:
  id: SK-32-06
  department: "Revisão independente"
  version: "1.0"
  revised: "2026-10-18"
---

# review-tests

Revisão da qualidade dos testes.

**Quando usar:** Antes de aceitar que testes passaram.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Os testes cobrem o que mudou.
- Os testes falham quando deveriam.
- Nada foi apagado para passar.

**Verificação:** A cobertura dos casos de risco foi avaliada.

**Complementares (sugeridas por similaridade):** `regr-flaky-tests`, `bench-baselines`, `light-visual-qc`

**Limites e recuperação:** Não aprove o que não verificou; reporte evidência. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
