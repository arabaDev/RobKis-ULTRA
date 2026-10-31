---
name: orch-concurrency-limits
description: "Limites de concorrência de subagentes e chamadas, com fila para o excedente."
metadata:
  id: SK-35-06
  department: "Orquestração e roteamento"
  version: "1.0"
  revised: "2026-10-18"
---

# orch-concurrency-limits

Limites de concorrência de subagentes e chamadas, com fila para o excedente.

**Quando usar:** Muitos subagentes ou chamadas.

**Regras**
- Limite de tarefas simultâneas.
- Fila para o excedente.
- Priorize o caminho crítico.

**Verificação:** A concorrência fica dentro do limite.

**Complementares (sugeridas por similaridade):** `pipe-geometry-limits`, `inv-capacity-limits`, `data-budget-limits`

**Limites e recuperação:** Use o mínimo de agentes e skills; sem subagentes reais, siga em sequência. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
