---
name: inv-drag-drop
description: "Arrastar e soltar itens na UI."
metadata:
  id: SK-13-10
  department: "Sistemas de inventário"
  version: "1.0"
  revised: "2026-10-18"
---

# inv-drag-drop

Arrastar e soltar itens na UI.

**Quando usar:** Reorganizar slots.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- A UI só envia o pedido de mover.
- Servidor valida origem e destino.
- Mostre estado pendente.

**Verificação:** Movimento inválido volta ao lugar de origem.

**Complementares (sugeridas por similaridade):** `inv-data-model`, `inv-equip-system`, `arq-service-layering`

**Limites e recuperação:** Toda ação de inventário é decidida no servidor. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
