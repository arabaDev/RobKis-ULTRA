---
name: rec-failure-logging
description: "Registro de falhas e causas."
metadata:
  id: SK-38-11
  department: "Recuperação de falhas"
  version: "1.0"
  revised: "2026-10-18"
---

# rec-failure-logging

Registro de falhas e causas.

**Quando usar:** Falhas que ensinam algo.

**Regras**
- O que falhou, por quê e como corrigiu.
- Curto.
- Em local conhecido.

**Verificação:** A falha e a solução estão registradas.

**Complementares (sugeridas por similaridade):** `mcp-latency-logging`, `bpy-script-failure-diagnosis`, `rec-partial-failure`

**Limites e recuperação:** Tentativas sempre limitadas; nunca em loop. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
