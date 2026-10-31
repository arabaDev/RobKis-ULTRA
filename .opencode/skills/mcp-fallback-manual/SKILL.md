---
name: mcp-fallback-manual
description: "Alternativa quando o MCP não está disponível."
metadata:
  id: SK-19-08
  department: "Integração e MCP"
  version: "1.0"
  revised: "2026-10-18"
---

# mcp-fallback-manual

Alternativa quando o MCP não está disponível.

**Quando usar:** MCP desconectado.

**Requer:** MCP conectado. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Diga a limitação claramente.
- Entregue script Luau ou bpy pronto.
- Instrua o passo manual exato.

**Verificação:** O usuário consegue concluir sem o MCP.

**Complementares (sugeridas por similaridade):** `rec-fallback-strategies`, `pipe-manual-handoff`, `mcp-blender-usage`

**Limites e recuperação:** Nunca simule uma ferramenta; use só o que está realmente conectado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
