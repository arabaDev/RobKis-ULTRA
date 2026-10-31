---
name: test-performance-smoke
description: "Teste rápido de desempenho com carga realista."
metadata:
  id: SK-18-09
  department: "Testes automatizados"
  version: "1.0"
  revised: "2026-10-18"
---

# test-performance-smoke

Teste rápido de desempenho com carga realista.

**Quando usar:** Mudanças em sistemas pesados.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Crie carga de NPCs, projéteis ou jogadores simulados.
- Meça tempo de script e memória.
- Compare ao baseline.

**Verificação:** Valores medidos dentro do limite combinado.

**Complementares (sugeridas por similaridade):** `review-performance`, `regr-smoke-suite`, `ai-performance-throttling`

**Limites e recuperação:** Diga o que foi executado e o que depende de teste manual no Studio. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
