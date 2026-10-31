---
name: phys-collision-fidelity
description: "CollisionFidelity de MeshParts e custo de física."
metadata:
  id: SK-06-08
  department: "Física e colisões"
  version: "1.0"
  revised: "2026-10-18"
---

# phys-collision-fidelity

CollisionFidelity de MeshParts e custo de física.

**Quando usar:** Malhas complexas com colisão pesada.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Box, Hull, Default e PreciseConvexDecomposition têm custos crescentes.
- Use Box ou Hull sempre que a forma aceitar.
- Malha de colisão separada, simples, para objetos grandes.

**Verificação:** Colisão aceitável com o modo mais barato possível.

**Complementares (sugeridas por similaridade):** `topo-collision-hulls`, `phys-collision-groups`, `pipe-collision-setup`

**Limites e recuperação:** Física varia com latência e propriedade de rede; teste com mais de um cliente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
