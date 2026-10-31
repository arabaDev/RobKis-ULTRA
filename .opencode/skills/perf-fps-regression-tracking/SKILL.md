---
name: perf-fps-regression-tracking
description: "Acompanhamento de regressões de FPS entre versões."
metadata:
  id: SK-16-21
  department: "Otimização de desempenho"
  version: "1.0"
  revised: "2026-10-18"
---

# perf-fps-regression-tracking

Acompanhamento de regressões de FPS entre versões.

**Quando usar:** Depois de adicionar conteúdo ou sistemas.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Use uma cena de referência fixa.
- Meça FPS médio e mínimo.
- Registre por versão em BENCHMARK.

**Verificação:** Há um número por versão e as quedas são explicadas.

**Complementares (sugeridas por similaridade):** `bench-regression-compare`, `dep-asset-ids-tracking`, `anim3d-fps-export`

**Limites e recuperação:** Sem medição não há otimização; reporte medido versus estimado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
