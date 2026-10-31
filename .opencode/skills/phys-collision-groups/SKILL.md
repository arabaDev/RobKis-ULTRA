---
name: phys-collision-groups
description: "Grupos de colisão com PhysicsService e a propriedade CollisionGroup."
metadata:
  id: SK-06-01
  department: "Física e colisões"
  version: "1.0"
  revised: "2026-10-18"
---

# phys-collision-groups

Grupos de colisão com PhysicsService e a propriedade CollisionGroup.

**Quando usar:** Quando objetos não devem colidir entre si.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- PhysicsService:RegisterCollisionGroup e CollisionGroupSetCollidable.
- Atribua BasePart.CollisionGroup nas partes.
- Registre os grupos uma vez no servidor, antes do uso.

**Verificação:** Partes de grupos separados atravessam e as demais colidem.

**Complementares (sugeridas por similaridade):** `pipe-collision-setup`, `phys-collision-fidelity`, `topo-collision-hulls`

**Limites e recuperação:** Física varia com latência e propriedade de rede; teste com mais de um cliente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
