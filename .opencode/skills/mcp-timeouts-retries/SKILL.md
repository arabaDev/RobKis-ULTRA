---
name: mcp-timeouts-retries
description: "Timeouts e tentativas limitadas em chamadas MCP."
metadata:
  id: SK-19-05
  department: "Integração e MCP"
  version: "1.0"
  revised: "2026-10-18"
---

# mcp-timeouts-retries

Timeouts e tentativas limitadas em chamadas MCP.

**Quando usar:** Chamadas lentas ou que falham.

**Requer:** MCP conectado. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Defina limite de tempo e de tentativas.
- Não repita escritas sem verificar se a anterior concluiu.
- Mude de abordagem após falhas repetidas.

**Verificação:** Nenhuma chamada fica em loop de tentativa.

**Complementares (sugeridas por similaridade):** `orch-escalation-rules`, `mcp-argument-validation`, `mcp-permissions-safety`

**Limites e recuperação:** Nunca simule uma ferramenta; use só o que está realmente conectado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
