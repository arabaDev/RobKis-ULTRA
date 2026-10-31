---
name: mcp-redundant-call-prevention
description: "Evitar chamadas MCP redundantes."
metadata:
  id: SK-19-15
  department: "Integração e MCP"
  version: "1.0"
  revised: "2026-10-18"
---

# mcp-redundant-call-prevention

Evitar chamadas MCP redundantes.

**Quando usar:** Latência alta ou muitas leituras iguais.

**Requer:** MCP conectado. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Reaproveite o resultado de leitura ainda válido.
- Invalide depois de uma escrita.
- Combine consultas quando possível.

**Verificação:** Nenhuma leitura é repetida sem mudança de estado.

**Complementares (sugeridas por similaridade):** `mcp-write-conflict-prevention`, `sec-dupe-prevention`, `mcp-cache-invalidation`

**Limites e recuperação:** Nunca simule uma ferramenta; use só o que está realmente conectado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
