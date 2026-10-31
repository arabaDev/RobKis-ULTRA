---
name: phys-ragdoll
description: "Ragdoll com BallSocketConstraint e estado de Humanoid."
metadata:
  id: SK-06-13
  department: "Física e colisões"
  version: "1.0"
  revised: "2026-10-18"
---

# phys-ragdoll

Ragdoll com BallSocketConstraint e estado de Humanoid.

**Quando usar:** Morte ou nocaute com física.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Substitua Motor6D por BallSocketConstraint com limites.
- Humanoid:ChangeState para o estado de física.
- Reverta tudo ao levantar ou renascer.

**Verificação:** O personagem cai, não entra no chão e volta ao normal.

**Complementares (sugeridas por similaridade):** `npc-humanoid-states`, `npc-animations`, `npc-character-spawning`

**Limites e recuperação:** Física varia com latência e propriedade de rede; teste com mais de um cliente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
