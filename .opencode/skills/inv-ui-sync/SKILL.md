---
name: inv-ui-sync
description: "Sincronia entre inventário do servidor e UI."
metadata:
  id: SK-13-09
  department: "Sistemas de inventário"
  version: "1.0"
  revised: "2026-10-18"
---

# inv-ui-sync

Sincronia entre inventário do servidor e UI.

**Quando usar:** UI que mostra itens.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Servidor notifica mudanças.
- UI reconstrói só o que mudou.
- Reconcilie ao entrar.

**Verificação:** A UI sempre coincide com o servidor.

**Complementares (sugeridas por similaridade):** `net-gameplay-sync-timing`, `combat-animation-sync`, `inv-server-actions`

**Limites e recuperação:** Toda ação de inventário é decidida no servidor. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
