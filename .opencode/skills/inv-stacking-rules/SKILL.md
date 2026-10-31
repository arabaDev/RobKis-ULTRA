---
name: inv-stacking-rules
description: "Regras de empilhamento e limites."
metadata:
  id: SK-13-02
  department: "Sistemas de inventário"
  version: "1.0"
  revised: "2026-10-18"
---

# inv-stacking-rules

Regras de empilhamento e limites.

**Quando usar:** Itens iguais e limites por pilha.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Cada item define máximo por pilha.
- Adição divide em novas pilhas quando necessário.
- Sobra volta ao chamador.

**Verificação:** Adicionar além do limite não perde itens.

**Complementares (sugeridas por similaridade):** `orch-escalation-rules`, `inv-equip-system`, `move-speed-modifiers`

**Limites e recuperação:** Toda ação de inventário é decidida no servidor. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
