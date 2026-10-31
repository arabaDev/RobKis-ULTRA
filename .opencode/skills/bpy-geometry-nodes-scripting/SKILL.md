---
name: bpy-geometry-nodes-scripting
description: "Geometry Nodes por script: grupo, entradas e modificador."
metadata:
  id: SK-20-14
  department: "Blender Python"
  version: "1.0"
  revised: "2026-10-18"
---

# bpy-geometry-nodes-scripting

Geometry Nodes por script: grupo, entradas e modificador.

**Quando usar:** Geração procedural repetível.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Crie o grupo com bpy.data.node_groups.new do tipo GeometryNodeTree.
- Defina entradas e saídas conforme a versão do Blender.
- Aplique com um modificador do tipo NODES.

**Verificação:** O modificador gera a malha esperada com os valores de entrada.

**Complementares (sugeridas por similaridade):** `proc-geometry-nodes-intro`, `mat-shader-nodes-scripting`, `pipe-geometry-limits`

**Limites e recuperação:** A API muda entre versões do Blender; confirme a versão antes de rodar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
