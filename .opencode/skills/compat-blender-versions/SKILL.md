---
name: compat-blender-versions
description: "Compatibilidade entre versões do Blender."
metadata:
  id: SK-37-03
  department: "Compatibilidade de versões"
  version: "1.0"
  revised: "2026-10-18"
---

# compat-blender-versions

Compatibilidade entre versões do Blender.

**Quando usar:** Scripts que falham em outra versão.

**Regras**
- Verifique a versão.
- Mudanças de API em séries novas.
- Testar na versão do usuário.

**Verificação:** O script roda na versão alvo.

**Complementares (sugeridas por similaridade):** `compat-python-versions`, `bpy-version-compat`, `compat-luau-versions`

**Limites e recuperação:** Confirme versões na documentação e no ambiente do usuário. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
