---
name: rec-safe-abort
description: "Abortar com segurança quando continuar é arriscado, deixando o projeto utilizável."
metadata:
  id: SK-38-12
  department: "Recuperação de falhas"
  version: "1.0"
  revised: "2026-10-18"
---

# rec-safe-abort

Abortar com segurança quando continuar é arriscado, deixando o projeto utilizável.

**Quando usar:** Não dá para continuar sem risco.

**Regras**
- Pare antes de danificar.
- Deixe o projeto utilizável.
- Explique o motivo.

**Verificação:** O projeto continua íntegro.

**Complementares (sugeridas por similaridade):** `bpy-safe-execution`, `inv-trading-safe`, `ui-safe-areas`

**Limites e recuperação:** Tentativas sempre limitadas; nunca em loop. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
