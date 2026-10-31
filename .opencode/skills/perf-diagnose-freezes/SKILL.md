---
name: perf-diagnose-freezes
description: "Diagnóstico de travamentos (picos de frame)."
metadata:
  id: SK-16-20
  department: "Otimização de desempenho"
  version: "1.0"
  revised: "2026-10-18"
---

# perf-diagnose-freezes

Diagnóstico de travamentos (picos de frame).

**Quando usar:** O jogo trava por instantes.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Capture o frame no MicroProfiler.
- Procure criação em massa, GetDescendants ou DataStore dentro de loops.
- Correlacione com eventos do jogo.

**Verificação:** A causa do pico foi identificada e o pico some.

**Complementares (sugeridas por similaridade):** `perf-microprofiler`, `perf-loop-optimization`, `review-performance`

**Limites e recuperação:** Sem medição não há otimização; reporte medido versus estimado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
