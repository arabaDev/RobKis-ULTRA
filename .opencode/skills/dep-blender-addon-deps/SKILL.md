---
name: dep-blender-addon-deps
description: "Dependências de addons do Blender."
metadata:
  id: SK-34-08
  department: "Análise de dependências"
  version: "1.0"
  revised: "2026-10-18"
---

# dep-blender-addon-deps

Dependências de addons do Blender.

**Quando usar:** Scripts que usam addons.

**Regras**
- Liste addons e versões.
- Ative por script se possível.
- Teste em Blender limpo.

**Verificação:** O script roda com a lista informada.

**Complementares (sugeridas por similaridade):** `compat-blender-versions`, `light-blender-preview-render`, `mcp-blender-usage`

**Limites e recuperação:** Confirme com busca real; não presuma dependências. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
