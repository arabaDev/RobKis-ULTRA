---
name: bench-continuous-improvement
description: "Melhoria contínua guiada por dados."
metadata:
  id: SK-40-12
  department: "Benchmark e qualidade"
  version: "1.0"
  revised: "2026-10-18"
---

# bench-continuous-improvement

Melhoria contínua guiada por dados.

**Quando usar:** Ciclo após cada versão.

**Regras**
- Ataque o maior gargalo medido.
- Meça de novo.
- Registre o resultado.

**Verificação:** Cada melhoria tem medição antes e depois.

**Complementares (sugeridas por similaridade):** `net-player-lifecycle`, `regr-smoke-suite`, `data-schema-versioning`

**Limites e recuperação:** Nunca invente resultados nem compare com ferramenta que não foi testada. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
