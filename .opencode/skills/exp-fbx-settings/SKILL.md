---
name: exp-fbx-settings
description: "Configuração de exportação FBX para jogos."
metadata:
  id: SK-27-01
  department: "Exportação de assets"
  version: "1.0"
  revised: "2026-10-18"
---

# exp-fbx-settings

Configuração de exportação FBX para jogos.

**Quando usar:** Exportar malhas e rigs.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- use_selection, eixos e escala explícitos.
- add_leaf_bones desligado para rigs.
- Testar a importação.

**Verificação:** O FBX importa com escala e orientação corretas.

**Complementares (sugeridas por similaridade):** `exp-gltf-settings`, `exp-obj-settings`, `light-eevee-cycles-settings`

**Limites e recuperação:** Só dê a exportação por concluída com arquivo verificado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
