---
name: rec-partial-failure
description: "Falhas parciais em lotes."
metadata:
  id: SK-38-06
  department: "Recuperação de falhas"
  version: "1.0"
  revised: "2026-10-18"
---

# rec-partial-failure

Falhas parciais em lotes.

**Quando usar:** Muitos itens, alguns falham.

**Regras**
- Continue com os outros.
- Liste os que falharam.
- Repita só esses.

**Verificação:** O relatório distingue sucessos e falhas.

**Complementares (sugeridas por similaridade):** `bpy-script-failure-diagnosis`, `rec-failure-logging`, `net-latency-jitter`

**Limites e recuperação:** Tentativas sempre limitadas; nunca em loop. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
