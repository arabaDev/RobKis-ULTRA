---
name: bpy-mesh-stats
description: "Estatísticas de malha: vértices, faces e triângulos."
metadata:
  id: SK-20-12
  department: "Blender Python"
  version: "1.0"
  revised: "2026-10-18"
---

# bpy-mesh-stats

Estatísticas de malha: vértices, faces e triângulos.

**Quando usar:** Validar orçamento de polígonos.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- mesh.calc_loop_triangles e len(mesh.loop_triangles).
- Avaliar com modificadores aplicados.
- Reportar números.

**Verificação:** A contagem de triângulos reportada.

**Complementares (sugeridas por similaridade):** `topo-mesh-validation`, `tool-rarity-stats`, `topo-decimation-safely`

**Limites e recuperação:** A API muda entre versões do Blender; confirme a versão antes de rodar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
