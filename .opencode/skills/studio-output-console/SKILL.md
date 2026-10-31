---
name: studio-output-console
description: "Output do Studio e console do desenvolvedor em jogo."
metadata:
  id: SK-03-03
  department: "Roblox Studio"
  version: "1.0"
  revised: "2026-10-18"
---

# studio-output-console

Output do Studio e console do desenvolvedor em jogo.

**Quando usar:** Ao caçar erros, avisos e desempenho.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Leia a mensagem completa, com script e linha.
- Filtre o Output por tipo; avisos de infinite yield apontam WaitForChild sem retorno.
- O console do jogo (F9) mostra logs de cliente e servidor.

**Verificação:** O erro original foi reproduzido e sumiu após a correção.

**Complementares (sugeridas por similaridade):** `exp-versioned-output-folders`, `bench-gameplay-metrics`, `perf-memory-profiling`

**Limites e recuperação:** Ações no Studio exigem o Studio aberto; sem MCP, entregue passos manuais exatos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
