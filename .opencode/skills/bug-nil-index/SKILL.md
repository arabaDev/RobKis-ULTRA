---
name: bug-nil-index
description: "Erros de indexar nil."
metadata:
  id: SK-17-03
  department: "Diagnóstico de bugs"
  version: "1.0"
  revised: "2026-10-18"
---

# bug-nil-index

Erros de indexar nil.

**Quando usar:** attempt to index nil.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Descubra qual variável é nil.
- FindFirstChild e WaitForChild com timeout.
- Verifique replicação e streaming.

**Verificação:** O caso nil tem tratamento explícito.

**Complementares (sugeridas por similaridade):** `luau-metatables-oop`, `luau-semantics-pitfalls`, `net-payload-limits`

**Limites e recuperação:** Corrija a causa raiz; nunca remova funcionalidade para o teste passar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
