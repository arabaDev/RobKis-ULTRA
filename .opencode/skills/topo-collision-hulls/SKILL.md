---
name: topo-collision-hulls
description: "Malhas de colisão simplificadas."
metadata:
  id: SK-22-09
  department: "Topologia e geometria"
  version: "1.0"
  revised: "2026-10-18"
---

# topo-collision-hulls

Malhas de colisão simplificadas.

**Quando usar:** Formas complexas.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Caixas ou cascos convexos.
- Menos faces que a malha visual.
- Nome com sufixo de colisão.

**Verificação:** A colisão cobre o essencial.

**Complementares (sugeridas por similaridade):** `phys-collision-fidelity`, `phys-collision-groups`, `pipe-collision-setup`

**Limites e recuperação:** Meça contagens reais; não estime triângulos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
