---
name: ai-steering-avoidance
description: "Desvio de obstáculos e separação entre NPCs."
metadata:
  id: SK-12-07
  department: "Inteligência artificial para jogos"
  version: "1.0"
  revised: "2026-10-18"
---

# ai-steering-avoidance

Desvio de obstáculos e separação entre NPCs.

**Quando usar:** Grupos de NPCs que se empurram.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Força de separação por vizinhos próximos.
- Raycasts curtos para obstáculos.
- Combine com o caminho do Pathfinding.

**Verificação:** Um grupo se move sem empilhar.

**Complementares (sugeridas por similaridade):** `npc-network-ownership`, `combat-knockback`, `phys-collision-groups`

**Limites e recuperação:** Meça o custo de CPU da IA antes de aumentar a complexidade. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
