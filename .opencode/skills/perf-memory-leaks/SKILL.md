---
name: perf-memory-leaks
description: "Vazamentos de memória em conexões, tabelas e instâncias."
metadata:
  id: SK-16-06
  department: "Otimização de desempenho"
  version: "1.0"
  revised: "2026-10-18"
---

# perf-memory-leaks

Vazamentos de memória em conexões, tabelas e instâncias.

**Quando usar:** Memória que só cresce.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Desconecte eventos e limpe tabelas por jogador.
- Destrua instâncias não usadas.
- Observe o gráfico de memória ao longo do tempo.

**Verificação:** A memória se estabiliza em sessão longa.

**Complementares (sugeridas por similaridade):** `light-render-memory`, `perf-memory-profiling`, `bug-event-leaks`

**Limites e recuperação:** Sem medição não há otimização; reporte medido versus estimado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
