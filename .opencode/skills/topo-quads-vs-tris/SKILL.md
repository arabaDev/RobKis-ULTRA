---
name: topo-quads-vs-tris
description: "Quads na modelagem e triângulos na exportação."
metadata:
  id: SK-22-01
  department: "Topologia e geometria"
  version: "1.0"
  revised: "2026-10-18"
---

# topo-quads-vs-tris

Quads na modelagem e triângulos na exportação.

**Quando usar:** Planejar a malha.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Quads facilitam edição.
- Engines triangulam na importação.
- Evite n-gons.

**Verificação:** Sem n-gons indesejados.

**Complementares (sugeridas por similaridade):** `bpy-mesh-stats`, `model-high-poly`, `topo-mesh-validation`

**Limites e recuperação:** Meça contagens reais; não estime triângulos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
