---
name: perf-loading-time
description: "Tempo de carregamento e tela de loading."
metadata:
  id: SK-16-11
  department: "Otimização de desempenho"
  version: "1.0"
  revised: "2026-10-18"
---

# perf-loading-time

Tempo de carregamento e tela de loading.

**Quando usar:** Entrada demorada.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- ContentProvider:PreloadAsync só do essencial.
- Carregue o resto em segundo plano.
- Mostre progresso.

**Verificação:** Tempo de entrada medido.

**Complementares (sugeridas por similaridade):** `anim-preloading`, `test-datastore-offline`, `fx-presentation-polish`

**Limites e recuperação:** Sem medição não há otimização; reporte medido versus estimado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
