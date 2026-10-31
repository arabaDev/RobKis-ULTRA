---
name: topo-normals-fixing
description: "Corrigir normais invertidas e inconsistentes."
metadata:
  id: SK-22-04
  department: "Topologia e geometria"
  version: "1.0"
  revised: "2026-10-18"
---

# topo-normals-fixing

Corrigir normais invertidas e inconsistentes.

**Quando usar:** Faces escuras ou invisíveis.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Recalcular para fora.
- bmesh.ops.recalc_face_normals.
- Verifique com a visualização de orientação.

**Verificação:** Faces voltadas para fora.

**Complementares (sugeridas por similaridade):** `rig-fixing-common-problems`, `topo-hard-surface-bevels`, `bpy-mesh-stats`

**Limites e recuperação:** Meça contagens reais; não estime triângulos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
