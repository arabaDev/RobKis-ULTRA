---
name: bench-token-accounting
description: "Contagem de tokens e custo."
metadata:
  id: SK-40-03
  department: "Benchmark e qualidade"
  version: "1.0"
  revised: "2026-10-18"
---

# bench-token-accounting

Contagem de tokens e custo.

**Quando usar:** Otimizar consumo.

**Regras**
- Registre tokens por tarefa.
- Estime custo só se houver dados.
- Compare em condições iguais.

**Verificação:** Números vindos do ambiente.

**Complementares (sugeridas por similaridade):** `move-sprint-stamina`, `perf-instance-count`, `sec-secrets-handling`

**Limites e recuperação:** Nunca invente resultados nem compare com ferramenta que não foi testada. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
