---
name: mcp-batching-calls
description: "Agrupar operações em chamadas únicas quando possível."
metadata:
  id: SK-19-04
  department: "Integração e MCP"
  version: "1.0"
  revised: "2026-10-18"
---

# mcp-batching-calls

Agrupar operações em chamadas únicas quando possível.

**Quando usar:** Várias alterações independentes.

**Requer:** MCP conectado. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Use operações em lote se a ferramenta suportar.
- Consultas independentes em paralelo.
- Não agrupe escritas dependentes.

**Verificação:** Menos chamadas sem perda de verificação.

**Complementares (sugeridas por similaridade):** `net-bandwidth-batching`, `orch-parallel-safety`, `mcp-write-conflict-prevention`

**Limites e recuperação:** Nunca simule uma ferramenta; use só o que está realmente conectado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
