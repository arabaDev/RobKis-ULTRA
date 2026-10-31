---
name: orch-obsolete-task-cancellation
description: "Cancelar tarefas que ficaram obsoletas."
metadata:
  id: SK-35-17
  department: "Orquestração e roteamento"
  version: "1.0"
  revised: "2026-10-18"
---

# orch-obsolete-task-cancellation

Cancelar tarefas que ficaram obsoletas.

**Quando usar:** O plano mudou ou o resultado já não importa.

**Regras**
- Marque as tarefas dependentes de uma que falhou.
- Cancele se o framework permitir.
- Registre o que foi descartado.

**Verificação:** Nenhum trabalho obsoleto continua.

**Complementares (sugeridas por similaridade):** `bench-task-suite`, `orch-task-classification`, `luau-task-library`

**Limites e recuperação:** Use o mínimo de agentes e skills; sem subagentes reais, siga em sequência. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
