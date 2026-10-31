---
name: mcp-state-verification
description: "Verificação do estado após escrita via MCP."
metadata:
  id: SK-19-11
  department: "Integração e MCP"
  version: "1.0"
  revised: "2026-10-18"
---

# mcp-state-verification

Verificação do estado após escrita via MCP.

**Quando usar:** Depois de qualquer alteração por ferramenta.

**Requer:** MCP conectado. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Releia o objeto ou arquivo alterado.
- Compare com o esperado.
- Reporte a diferença.

**Verificação:** Estado final conferido e descrito.

**Complementares (sugeridas por similaridade):** `rec-state-rollback`, `pipe-scale-verification`, `orch-incremental-verification`

**Limites e recuperação:** Nunca simule uma ferramenta; use só o que está realmente conectado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
