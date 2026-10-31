---
name: perf-loop-optimization
description: "Otimização de laços executados por frame."
metadata:
  id: SK-16-16
  department: "Otimização de desempenho"
  version: "1.0"
  revised: "2026-10-18"
---

# perf-loop-optimization

Otimização de laços executados por frame.

**Quando usar:** Scripts em Heartbeat que custam muito.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Use um loop compartilhado em vez de um por objeto.
- Pule objetos distantes ou inativos.
- Divida trabalho pesado em partes ao longo de vários frames.

**Verificação:** O custo por frame medido cai.

**Complementares (sugeridas por similaridade):** `light-sample-optimization`, `perf-particle-optimization`, `ui-update-optimization`

**Limites e recuperação:** Sem medição não há otimização; reporte medido versus estimado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
