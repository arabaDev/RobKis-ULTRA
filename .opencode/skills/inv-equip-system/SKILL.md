---
name: inv-equip-system
description: "Equipar itens com slots e regras de conflito."
metadata:
  id: SK-13-03
  department: "Sistemas de inventário"
  version: "1.0"
  revised: "2026-10-18"
---

# inv-equip-system

Equipar itens com slots e regras de conflito.

**Quando usar:** Armas, armaduras e acessórios.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Um slot guarda um item.
- Equipar troca e devolve o anterior.
- Efeitos aplicados e removidos de forma simétrica.

**Verificação:** Equipar, trocar e desequipar volta ao estado base.

**Complementares (sugeridas por similaridade):** `tool-equip-lifecycle`, `combat-stun-system`, `fx-music-system`

**Limites e recuperação:** Toda ação de inventário é decidida no servidor. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
