---
name: rec-timeout-handling
description: "Tratamento de tempo esgotado."
metadata:
  id: SK-38-07
  department: "Recuperação de falhas"
  version: "1.0"
  revised: "2026-10-18"
---

# rec-timeout-handling

Tratamento de tempo esgotado.

**Quando usar:** Chamadas longas.

**Regras**
- Limite explícito.
- Cancelar quando possível.
- Verificar se a operação concluiu.

**Verificação:** Nenhuma operação fica pendente sem registro.

**Complementares (sugeridas por similaridade):** `luau-error-handling`, `bpy-error-handling-verify`, `net-disconnect-handling`

**Limites e recuperação:** Tentativas sempre limitadas; nunca em loop. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
