---
name: rec-tool-outage
description: "Queda de ferramenta ou MCP."
metadata:
  id: SK-38-09
  department: "Recuperação de falhas"
  version: "1.0"
  revised: "2026-10-18"
---

# rec-tool-outage

Queda de ferramenta ou MCP.

**Quando usar:** Ferramenta deixa de responder.

**Regras**
- Confirme o problema.
- Use alternativa.
- Reporte.

**Verificação:** O trabalho continua pelo caminho alternativo.

**Complementares (sugeridas por similaridade):** `mcp-tool-selection`, `mcp-tool-discovery`, `dep-tool-versions`

**Limites e recuperação:** Tentativas sempre limitadas; nunca em loop. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
