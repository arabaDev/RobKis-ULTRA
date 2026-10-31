---
name: perf-particle-optimization
description: "Otimização de partículas e efeitos."
metadata:
  id: SK-16-17
  department: "Otimização de desempenho"
  version: "1.0"
  revised: "2026-10-18"
---

# perf-particle-optimization

Otimização de partículas e efeitos.

**Quando usar:** Efeitos pesados em combate.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Reduza Rate, Lifetime e tamanho de textura.
- Desative emissores fora da vista ou distantes.
- Prefira poucas partículas grandes a muitas pequenas.

**Verificação:** O custo de renderização medido cai.

**Complementares (sugeridas por similaridade):** `light-sample-optimization`, `perf-loop-optimization`, `fx-particle-emitters`

**Limites e recuperação:** Sem medição não há otimização; reporte medido versus estimado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
