---
name: orch-specialist-selection
description: "Escolha de agente e skills por necessidade."
metadata:
  id: SK-35-03
  department: "Orquestração e roteamento"
  version: "1.0"
  revised: "2026-10-18"
---

# orch-specialist-selection

Escolha de agente e skills por necessidade.

**Quando usar:** Delegar trabalho.

**Regras**
- Pesquise skills com scripts/skill_search.py.
- Carregue só as relevantes.
- Delegue ao agente certo.

**Verificação:** Poucas skills carregadas e relevantes.

**Complementares (sugeridas por similaridade):** `exp-selection-export`, `mcp-tool-selection`, `orch-handoff-format`

**Limites e recuperação:** Use o mínimo de agentes e skills; sem subagentes reais, siga em sequência. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
