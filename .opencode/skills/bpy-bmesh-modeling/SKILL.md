---
name: bpy-bmesh-modeling
description: "Modelagem por código com bmesh."
metadata:
  id: SK-20-02
  department: "Blender Python"
  version: "1.0"
  revised: "2026-10-18"
---

# bpy-bmesh-modeling

Modelagem por código com bmesh.

**Quando usar:** Gerar geometria própria.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- bmesh.new, criar vértices e faces, to_mesh e free.
- Chame mesh.update depois.
- Verifique contagens.

**Verificação:** A malha criada tem os vértices e faces esperados.

**Complementares (sugeridas por similaridade):** `secan-threat-modeling`, `model-low-poly`, `topo-merge-doubles`

**Limites e recuperação:** A API muda entre versões do Blender; confirme a versão antes de rodar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
