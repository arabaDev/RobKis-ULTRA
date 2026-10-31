---
name: exp-obj-settings
description: "Exportação OBJ para malhas simples."
metadata:
  id: SK-27-03
  department: "Exportação de assets"
  version: "1.0"
  revised: "2026-10-18"
---

# exp-obj-settings

Exportação OBJ para malhas simples.

**Quando usar:** Só geometria.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Na série 4 do Blender use wm.obj_export.
- Sem rig nem animação.
- Materiais em arquivo separado.

**Verificação:** A malha importa sem erros.

**Complementares (sugeridas por similaridade):** `exp-fbx-settings`, `exp-gltf-settings`, `light-eevee-cycles-settings`

**Limites e recuperação:** Só dê a exportação por concluída com arquivo verificado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
