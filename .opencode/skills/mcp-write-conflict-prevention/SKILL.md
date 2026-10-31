---
name: mcp-write-conflict-prevention
description: "Evitar escritas conflitantes via MCP."
metadata:
  id: SK-19-16
  department: "Integração e MCP"
  version: "1.0"
  revised: "2026-10-18"
---

# mcp-write-conflict-prevention

Evitar escritas conflitantes via MCP.

**Quando usar:** Várias alterações no mesmo objeto ou arquivo.

**Requer:** MCP conectado. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Uma escrita por vez no mesmo alvo.
- Releia antes de reescrever.
- Escritas independentes em ordem definida.

**Verificação:** Nenhuma escrita sobrescreve outra sem querer.

**Complementares (sugeridas por similaridade):** `mcp-redundant-call-prevention`, `orch-parallel-safety`, `sec-dupe-prevention`

**Limites e recuperação:** Nunca simule uma ferramenta; use só o que está realmente conectado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
