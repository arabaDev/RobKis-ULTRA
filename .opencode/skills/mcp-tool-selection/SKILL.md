---
name: mcp-tool-selection
description: "Escolher a ferramenta MCP adequada."
metadata:
  id: SK-19-13
  department: "Integração e MCP"
  version: "1.0"
  revised: "2026-10-18"
---

# mcp-tool-selection

Escolher a ferramenta MCP adequada.

**Quando usar:** Várias ferramentas parecidas.

**Requer:** MCP conectado. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Prefira a ferramenta de menor efeito que resolve.
- Leitura antes de escrita.
- Confirme o escopo da ferramenta.

**Verificação:** A ferramenta escolhida foi a de menor impacto suficiente.

**Complementares (sugeridas por similaridade):** `rec-tool-outage`, `mcp-tool-discovery`, `dep-tool-versions`

**Limites e recuperação:** Nunca simule uma ferramenta; use só o que está realmente conectado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
