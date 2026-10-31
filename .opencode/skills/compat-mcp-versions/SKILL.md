---
name: compat-mcp-versions
description: "Versões de servidores MCP."
metadata:
  id: SK-37-11
  department: "Compatibilidade de versões"
  version: "1.0"
  revised: "2026-10-18"
---

# compat-mcp-versions

Versões de servidores MCP.

**Quando usar:** Ferramentas que mudam.

**Regras**
- Registre versões.
- Releia as ferramentas após atualizar.
- Teste uma chamada simples.

**Verificação:** A ferramenta responde na versão atual.

**Complementares (sugeridas por similaridade):** `dep-tool-versions`, `compat-blender-versions`, `compat-luau-versions`

**Limites e recuperação:** Confirme versões na documentação e no ambiente do usuário. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
