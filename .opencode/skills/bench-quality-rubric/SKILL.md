---
name: bench-quality-rubric
description: "Rubrica de qualidade de resultados."
metadata:
  id: SK-40-07
  department: "Benchmark e qualidade"
  version: "1.0"
  revised: "2026-10-18"
---

# bench-quality-rubric

Rubrica de qualidade de resultados.

**Quando usar:** Avaliar além de funcionar.

**Regras**
- Correção, segurança, clareza.
- Escala de 1 a 5 com critério.
- Mesma rubrica entre versões.

**Verificação:** A rubrica é aplicada de forma consistente.

**Complementares (sugeridas por similaridade):** `bench-gameplay-metrics`, `bug-bisect-regressions`, `ui-scale-layout`

**Limites e recuperação:** Nunca invente resultados nem compare com ferramenta que não foi testada. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
