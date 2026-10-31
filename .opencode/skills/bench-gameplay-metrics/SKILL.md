---
name: bench-gameplay-metrics
description: "Métricas de qualidade de gameplay: loop jogável, erros no Output e desempenho."
metadata:
  id: SK-40-11
  department: "Benchmark e qualidade"
  version: "1.0"
  revised: "2026-10-18"
---

# bench-gameplay-metrics

Métricas de qualidade de gameplay: loop jogável, erros no Output e desempenho.

**Quando usar:** Avaliar jogos gerados.

**Regras**
- Verifique se o loop principal fecha: ação, feedback e recompensa.
- Conte erros e avisos no Output durante a sessão de teste.
- Meça FPS médio e mínimo no dispositivo alvo.
- Registre o tempo até o primeiro objetivo cumprido.

**Verificação:** Há números de erros, FPS e tempo até o objetivo para a versão testada.

**Complementares (sugeridas por similaridade):** `regr-gameplay-checklist`, `net-gameplay-sync-timing`, `studio-output-console`

**Limites e recuperação:** Nunca invente resultados nem compare com ferramenta que não foi testada. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
