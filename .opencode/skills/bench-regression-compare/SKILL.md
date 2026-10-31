---
name: bench-regression-compare
description: "Comparação entre versões do agente."
metadata:
  id: SK-40-05
  department: "Benchmark e qualidade"
  version: "1.0"
  revised: "2026-10-18"
---

# bench-regression-compare

Comparação entre versões do agente.

**Quando usar:** Medir melhora real.

**Regras**
- Mesmas tarefas e condições.
- Diferenças com contexto.
- Sem conclusão forte com poucos dados.

**Verificação:** Tabela comparável.

**Complementares (sugeridas por similaridade):** `perf-fps-regression-tracking`, `bench-task-suite`, `bpy-version-compat`

**Limites e recuperação:** Nunca invente resultados nem compare com ferramenta que não foi testada. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
