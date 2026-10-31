---
name: uv-smart-project-script
description: "UV automática por script com smart_project."
metadata:
  id: SK-24-06
  department: "UV mapping"
  version: "1.0"
  revised: "2026-10-18"
---

# uv-smart-project-script

UV automática por script com smart_project.

**Quando usar:** Muitos assets sem desdobramento manual.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- bpy.ops.uv.smart_project com margem.
- Exige modo de edição.
- Revise o resultado.

**Verificação:** Os UVs ficam dentro do espaço sem sobreposição indevida.

**Complementares (sugeridas por similaridade):** `doc-script-headers`, `pipe-manual-handoff`, `light-batch-rendering`

**Limites e recuperação:** Valide visualmente com um padrão de teste antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
