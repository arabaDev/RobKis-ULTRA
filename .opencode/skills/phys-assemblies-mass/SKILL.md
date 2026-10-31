---
name: phys-assemblies-mass
description: "Assemblies, massa, Massless e velocidade da assembly."
metadata:
  id: SK-06-05
  department: "Física e colisões"
  version: "1.0"
  revised: "2026-10-18"
---

# phys-assemblies-mass

Assemblies, massa, Massless e velocidade da assembly.

**Quando usar:** Ao calcular impulsos ou resolver comportamento estranho.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- AssemblyMass soma a massa das partes ligadas.
- Massless zera a contribuição de acessórios.
- Prefira AssemblyLinearVelocity à propriedade Velocity legada.

**Verificação:** O impulso aplicado produz a velocidade prevista.

**Complementares (sugeridas por similaridade):** `topo-triangulation`, `anim-looping-speed`, `combat-projectile-trajectories`

**Limites e recuperação:** Física varia com latência e propriedade de rede; teste com mais de um cliente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
