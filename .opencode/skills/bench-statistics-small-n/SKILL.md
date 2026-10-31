---
name: bench-statistics-small-n
description: "Interpretar benchmarks com poucas execuções usando mediana e intervalo, sem conclusões fortes."
metadata:
  id: SK-40-10
  department: "Benchmark e qualidade"
  version: "1.0"
  revised: "2026-10-18"
---

# bench-statistics-small-n

Interpretar benchmarks com poucas execuções usando mediana e intervalo, sem conclusões fortes.

**Quando usar:** Poucas execuções por tarefa.

**Regras**
- Com poucas execuções use mediana e intervalo, não média.
- Repita a tarefa antes de afirmar melhora.
- Só trate a diferença como real se superar a variação entre execuções.
- Declare o tamanho da amostra junto ao resultado.

**Verificação:** O relatório informa n, mediana e variação, e não afirma melhora dentro do ruído.

**Complementares (sugeridas por similaridade):** `light-denoising`, `combat-cooldowns`, `model-low-poly`

**Limites e recuperação:** Nunca invente resultados nem compare com ferramenta que não foi testada. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
