---
name: mcp-cache-invalidation
description: "Cache seguro de leituras de MCP."
metadata:
  id: SK-19-06
  department: "Integração e MCP"
  version: "1.0"
  revised: "2026-10-18"
---

# mcp-cache-invalidation

Cache seguro de leituras de MCP.

**Quando usar:** Leituras repetidas do mesmo estado.

**Requer:** MCP conectado. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Guarde só dados que não mudam sozinhos.
- Invalide após qualquer escrita relacionada.
- Confirme o estado antes de mudanças importantes.

**Verificação:** Nenhuma decisão tomada com dado vencido.

**Complementares (sugeridas por similaridade):** `orch-cache-reuse`, `orch-parallel-safety`, `mcp-redundant-call-prevention`

**Limites e recuperação:** Nunca simule uma ferramenta; use só o que está realmente conectado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
