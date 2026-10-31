---
name: compat-python-versions
description: "Versão do Python do Blender."
metadata:
  id: SK-37-10
  department: "Compatibilidade de versões"
  version: "1.0"
  revised: "2026-10-18"
---

# compat-python-versions

Versão do Python do Blender.

**Quando usar:** Bibliotecas em scripts bpy.

**Regras**
- O Blender embute o próprio Python.
- Bibliotecas externas precisam ser instaladas para ele.
- Evite dependências.

**Verificação:** Imports funcionam no Python do Blender.

**Complementares (sugeridas por similaridade):** `compat-blender-versions`, `compat-luau-versions`, `compat-mcp-versions`

**Limites e recuperação:** Confirme versões na documentação e no ambiente do usuário. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
