---
name: perf-instance-count
description: "Contagem de instâncias e partes."
metadata:
  id: SK-16-02
  department: "Otimização de desempenho"
  version: "1.0"
  revised: "2026-10-18"
---

# perf-instance-count

Contagem de instâncias e partes.

**Quando usar:** Mapas pesados.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Meça o total de instâncias e partes.
- Reduza partes ocultas e duplicadas.
- Prefira MeshPart ou união para detalhes.

**Verificação:** O número de instâncias caiu de forma medida.

**Complementares (sugeridas por similaridade):** `bench-token-accounting`, `perf-particle-optimization`, `test-performance-smoke`

**Limites e recuperação:** Sem medição não há otimização; reporte medido versus estimado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
