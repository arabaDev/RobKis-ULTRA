---
name: exp-gltf-settings
description: "Configuração de exportação glTF e GLB."
metadata:
  id: SK-27-02
  department: "Exportação de assets"
  version: "1.0"
  revised: "2026-10-18"
---

# exp-gltf-settings

Configuração de exportação glTF e GLB.

**Quando usar:** Malhas com materiais PBR.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- export_scene.gltf com export_format e use_selection.
- export_apply aplica modificadores.
- Confirme suporte do importador do Roblox.

**Verificação:** O arquivo importa com os materiais.

**Complementares (sugeridas por similaridade):** `exp-fbx-settings`, `exp-obj-settings`, `light-eevee-cycles-settings`

**Limites e recuperação:** Só dê a exportação por concluída com arquivo verificado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
