---
name: perf-reduce-allocations
description: "Reduzir alocações de tabelas e strings em loops."
metadata:
  id: SK-16-14
  department: "Otimização de desempenho"
  version: "1.0"
  revised: "2026-10-18"
---

# perf-reduce-allocations

Reduzir alocações de tabelas e strings em loops.

**Quando usar:** Código quente que cria muito lixo.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Reaproveite tabelas com table.clear.
- Evite criar closures e strings dentro de loops quentes.
- Pré-aloque com table.create.

**Verificação:** Menos alocações por frame, medidas antes e depois.

**Complementares (sugeridas por similaridade):** `luau-table-performance`, `review-performance`, `perf-loop-optimization`

**Limites e recuperação:** Sem medição não há otimização; reporte medido versus estimado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
