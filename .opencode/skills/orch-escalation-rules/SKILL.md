---
name: orch-escalation-rules
description: "Escalonar bloqueios e falhas repetidas após tentativas limitadas, dizendo o que foi tentado."
metadata:
  id: SK-35-09
  department: "Orquestração e roteamento"
  version: "1.0"
  revised: "2026-10-18"
---

# orch-escalation-rules

Escalonar bloqueios e falhas repetidas após tentativas limitadas, dizendo o que foi tentado.

**Quando usar:** Bloqueios e falhas repetidas.

**Regras**
- Escale após tentativas limitadas.
- Informe o que foi tentado.
- Peça a informação essencial.

**Verificação:** O usuário recebe um bloqueio claro.

**Complementares (sugeridas por similaridade):** `inv-stacking-rules`, `mcp-timeouts-retries`, `rec-failure-logging`

**Limites e recuperação:** Use o mínimo de agentes e skills; sem subagentes reais, siga em sequência. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
