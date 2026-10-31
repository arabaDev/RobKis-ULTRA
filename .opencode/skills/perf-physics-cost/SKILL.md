---
name: perf-physics-cost
description: "Custo de física: partes móveis, colisões e constraints."
metadata:
  id: SK-16-05
  department: "Otimização de desempenho"
  version: "1.0"
  revised: "2026-10-18"
---

# perf-physics-cost

Custo de física: partes móveis, colisões e constraints.

**Quando usar:** Lag em cenas com física.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Ancore o que for possível.
- Reduza colisão complexa.
- Limite constraints ativas.

**Verificação:** O tempo de física caiu no MicroProfiler.

**Complementares (sugeridas por similaridade):** `light-shadows-cost`, `bug-physics-glitches`, `perf-network-cost`

**Limites e recuperação:** Sem medição não há otimização; reporte medido versus estimado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
