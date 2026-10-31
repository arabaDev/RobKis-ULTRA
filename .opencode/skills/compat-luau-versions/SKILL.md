---
name: compat-luau-versions
description: "Recursos de Luau e versões."
metadata:
  id: SK-37-02
  department: "Compatibilidade de versões"
  version: "1.0"
  revised: "2026-10-18"
---

# compat-luau-versions

Recursos de Luau e versões.

**Quando usar:** Sintaxe que não compila.

**Regras**
- Confirme o recurso na documentação.
- Evite depender de recurso experimental.
- Teste no Studio.

**Verificação:** O código compila no Studio.

**Complementares (sugeridas por similaridade):** `compat-blender-versions`, `compat-mcp-versions`, `arq-design-patterns-luau`

**Limites e recuperação:** Confirme versões na documentação e no ambiente do usuário. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
