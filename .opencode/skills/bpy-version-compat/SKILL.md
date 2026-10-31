---
name: bpy-version-compat
description: "Compatibilidade de API entre versões do Blender."
metadata:
  id: SK-20-09
  department: "Blender Python"
  version: "1.0"
  revised: "2026-10-18"
---

# bpy-version-compat

Compatibilidade de API entre versões do Blender.

**Quando usar:** O script falha em outra versão.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Confirme bpy.app.version_string.
- O exportador de OBJ mudou na série 4.
- A suavização automática mudou na 4.1.

**Verificação:** O script foi testado na versão do usuário.

**Complementares (sugeridas por similaridade):** `compat-blender-versions`, `regr-data-compat`, `dep-version-pinning`

**Limites e recuperação:** A API muda entre versões do Blender; confirme a versão antes de rodar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
