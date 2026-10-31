---
name: mcp-tool-discovery
description: "Descobrir quais ferramentas MCP estão realmente disponíveis."
metadata:
  id: SK-19-01
  department: "Integração e MCP"
  version: "1.0"
  revised: "2026-10-18"
---

# mcp-tool-discovery

Descobrir quais ferramentas MCP estão realmente disponíveis.

**Quando usar:** Início de sessão ou antes de planejar.

**Requer:** MCP conectado. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Liste as ferramentas conectadas e seus parâmetros.
- Não invente nomes.
- Registre no TOOL_REGISTRY.

**Verificação:** A lista confere com o que o ambiente expõe.

**Complementares (sugeridas por similaridade):** `mcp-tool-selection`, `rec-tool-outage`, `dep-tool-versions`

**Limites e recuperação:** Nunca simule uma ferramenta; use só o que está realmente conectado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
