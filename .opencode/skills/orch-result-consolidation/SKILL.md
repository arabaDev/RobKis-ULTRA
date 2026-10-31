---
name: orch-result-consolidation
description: "Consolidar resultados de subtarefas, verificar a integração e reportar estados reais."
metadata:
  id: SK-35-07
  department: "Orquestração e roteamento"
  version: "1.0"
  revised: "2026-10-18"
---

# orch-result-consolidation

Consolidar resultados de subtarefas, verificar a integração e reportar estados reais.

**Quando usar:** Fim de subtarefas.

**Regras**
- Junte as saídas.
- Verifique a integração.
- Reporte estados reais.

**Verificação:** Resultado único e coerente.

**Complementares (sugeridas por similaridade):** `review-final-result`, `mat-export-checks`, `arq-game-loop-design`

**Limites e recuperação:** Use o mínimo de agentes e skills; sem subagentes reais, siga em sequência. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
