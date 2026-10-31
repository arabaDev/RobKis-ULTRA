---
name: perf-microprofiler
description: "Medir quedas de FPS e picos de frame com o MicroProfiler, antes e depois."
metadata:
  id: SK-16-01
  department: "Otimização de desempenho"
  version: "1.0"
  revised: "2026-10-18"
---

# perf-microprofiler

Medir quedas de FPS e picos de frame com o MicroProfiler, antes e depois.

**Quando usar:** Quedas de FPS ou picos de frame.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Abra o MicroProfiler e capture um frame ruim.
- Identifique o rótulo mais caro.
- Compare depois da mudança.

**Verificação:** Há captura antes e depois.

**Complementares (sugeridas por similaridade):** `perf-fps-regression-tracking`, `perf-diagnose-freezes`, `anim3d-fps-export`

**Limites e recuperação:** Sem medição não há otimização; reporte medido versus estimado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
