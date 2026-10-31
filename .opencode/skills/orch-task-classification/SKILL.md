---
name: orch-task-classification
description: "Classificação de tarefas em níveis 1 a 5."
metadata:
  id: SK-35-01
  department: "Orquestração e roteamento"
  version: "1.0"
  revised: "2026-10-18"
---

# orch-task-classification

Classificação de tarefas em níveis 1 a 5.

**Quando usar:** Início de qualquer pedido.

**Regras**
- Escolha o nível pelo escopo e pelas dependências.
- Aplique o fluxo mais curto.
- Reclassifique se o escopo crescer.

**Verificação:** Fluxo proporcional ao tamanho da tarefa.

**Complementares (sugeridas por similaridade):** `bench-task-suite`, `orch-obsolete-task-cancellation`, `luau-task-library`

**Limites e recuperação:** Use o mínimo de agentes e skills; sem subagentes reais, siga em sequência. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
