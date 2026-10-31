---
name: mcp-error-triage
description: "Triagem de erros de ferramentas MCP."
metadata:
  id: SK-19-07
  department: "Integração e MCP"
  version: "1.0"
  revised: "2026-10-18"
---

# mcp-error-triage

Triagem de erros de ferramentas MCP.

**Quando usar:** Chamada que falha ou volta vazia.

**Requer:** MCP conectado. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Leia o erro completo.
- Diferencie ferramenta, permissão, estado e entrada.
- Tente uma alternativa real.

**Verificação:** A causa foi classificada.

**Complementares (sugeridas por similaridade):** `bpy-error-handling-verify`, `luau-error-handling`, `exp-failed-export-triage`

**Limites e recuperação:** Nunca simule uma ferramenta; use só o que está realmente conectado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
