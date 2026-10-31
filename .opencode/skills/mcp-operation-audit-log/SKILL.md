---
name: mcp-operation-audit-log
description: "Registro de operações feitas por ferramentas."
metadata:
  id: SK-19-18
  department: "Integração e MCP"
  version: "1.0"
  revised: "2026-10-18"
---

# mcp-operation-audit-log

Registro de operações feitas por ferramentas.

**Quando usar:** Rastrear o que foi alterado.

**Requer:** MCP conectado. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Registre ferramenta, alvo e resultado.
- Nunca grave segredos no log.
- Faça um resumo curto por tarefa.

**Verificação:** Cada alteração tem registro.

**Complementares (sugeridas por similaridade):** `bug-log-instrumentation`, `secan-audit-report-format`, `secan-economy-exploit-audit`

**Limites e recuperação:** Nunca simule uma ferramenta; use só o que está realmente conectado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
