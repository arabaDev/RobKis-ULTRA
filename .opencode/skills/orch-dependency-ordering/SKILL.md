---
name: orch-dependency-ordering
description: "Ordenar tarefas por dependências e priorizar o caminho crítico."
metadata:
  id: SK-35-04
  department: "Orquestração e roteamento"
  version: "1.0"
  revised: "2026-10-18"
---

# orch-dependency-ordering

Ordenar tarefas por dependências e priorizar o caminho crítico.

**Quando usar:** Tarefas que dependem de outras.

**Regras**
- Identifique bloqueios.
- Ordene a execução.
- Antecipe o caminho crítico.

**Verificação:** Nenhuma tarefa espera sem motivo.

**Complementares (sugeridas por similaridade):** `orch-parallel-safety`, `bug-race-conditions`, `data-updateasync-pattern`

**Limites e recuperação:** Use o mínimo de agentes e skills; sem subagentes reais, siga em sequência. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
