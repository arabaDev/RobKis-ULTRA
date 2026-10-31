---
name: mcp-latency-logging
description: "Registro de latência de ferramentas."
metadata:
  id: SK-19-10
  department: "Integração e MCP"
  version: "1.0"
  revised: "2026-10-18"
---

# mcp-latency-logging

Registro de latência de ferramentas.

**Quando usar:** Medir e otimizar fluxo de trabalho.

**Requer:** MCP conectado. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Anote tempo por ferramenta.
- Compare chamadas comparáveis.
- Atualize o TOOL_REGISTRY.

**Verificação:** Há valores observados no registro.

**Complementares (sugeridas por similaridade):** `rec-failure-logging`, `combat-latency-testing`, `net-latency-jitter`

**Limites e recuperação:** Nunca simule uma ferramenta; use só o que está realmente conectado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
