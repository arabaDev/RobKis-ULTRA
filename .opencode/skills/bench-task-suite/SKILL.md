---
name: bench-task-suite
description: "Conjunto fixo de tarefas de benchmark."
metadata:
  id: SK-40-01
  department: "Benchmark e qualidade"
  version: "1.0"
  revised: "2026-10-18"
---

# bench-task-suite

Conjunto fixo de tarefas de benchmark.

**Quando usar:** Medir evolução do agente.

**Regras**
- Mesmo enunciado em cada versão.
- Cobrir Luau e Blender.
- Registrar em BENCHMARK.md.

**Verificação:** As tarefas estão listadas e fixas.

**Complementares (sugeridas por similaridade):** `orch-obsolete-task-cancellation`, `orch-task-classification`, `regr-smoke-suite`

**Limites e recuperação:** Nunca invente resultados nem compare com ferramenta que não foi testada. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
