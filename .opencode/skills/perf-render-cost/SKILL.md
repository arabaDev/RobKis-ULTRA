---
name: perf-render-cost
description: "Custo de renderização: triângulos, luzes, sombras e partículas."
metadata:
  id: SK-16-04
  department: "Otimização de desempenho"
  version: "1.0"
  revised: "2026-10-18"
---

# perf-render-cost

Custo de renderização: triângulos, luzes, sombras e partículas.

**Quando usar:** GPU limitada ou mobile.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Reduza luzes dinâmicas e partículas.
- Controle o número de triângulos visíveis.
- Verifique o modo de iluminação.

**Verificação:** FPS medido em dispositivo de baixo desempenho.

**Complementares (sugeridas por similaridade):** `light-shadows-cost`, `perf-network-cost`, `perf-physics-cost`

**Limites e recuperação:** Sem medição não há otimização; reporte medido versus estimado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
