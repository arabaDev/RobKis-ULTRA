---
name: perf-object-pooling
description: "Pool de objetos para projéteis e efeitos."
metadata:
  id: SK-16-08
  department: "Otimização de desempenho"
  version: "1.0"
  revised: "2026-10-18"
---

# perf-object-pooling

Pool de objetos para projéteis e efeitos.

**Quando usar:** Criação e destruição frequentes.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Pré-crie e reaproveite.
- Reinicie o estado ao devolver.
- Limite o tamanho do pool.

**Verificação:** Menos picos de coleta e criação.

**Complementares (sugeridas por similaridade):** `net-unreliable-remotes`, `perf-debris-cleanup`, `review-performance`

**Limites e recuperação:** Sem medição não há otimização; reporte medido versus estimado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
