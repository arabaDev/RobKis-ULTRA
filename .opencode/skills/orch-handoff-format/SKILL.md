---
name: orch-handoff-format
description: "Formato de passagem entre agentes."
metadata:
  id: SK-35-11
  department: "Orquestração e roteamento"
  version: "1.0"
  revised: "2026-10-18"
---

# orch-handoff-format

Formato de passagem entre agentes.

**Quando usar:** Delegar e receber trabalho.

**Regras**
- Objetivo, entradas, saídas e critérios.
- Arquivos envolvidos.
- Estado verificado.

**Verificação:** O receptor não precisa reperguntar.

**Complementares (sugeridas por similaridade):** `secan-audit-report-format`, `pipe-manual-handoff`, `orch-specialist-selection`

**Limites e recuperação:** Use o mínimo de agentes e skills; sem subagentes reais, siga em sequência. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
