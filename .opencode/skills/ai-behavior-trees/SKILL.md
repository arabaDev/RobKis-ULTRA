---
name: ai-behavior-trees
description: "Árvores de comportamento para IA com muitas decisões."
metadata:
  id: SK-12-02
  department: "Inteligência artificial para jogos"
  version: "1.0"
  revised: "2026-10-18"
---

# ai-behavior-trees

Árvores de comportamento para IA com muitas decisões.

**Quando usar:** Quando uma máquina de estados fica grande demais.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Nós Sequence, Selector e Action com resultado Sucesso, Falha ou Executando.
- Reavalie a árvore por tick com custo controlado.
- Ações longas guardam estado no nó.

**Verificação:** Uma árvore de teste produz a sequência esperada.

**Complementares (sugeridas por similaridade):** `arq-extensibility-patterns`, `ai-state-machines`, `arq-game-loop-design`

**Limites e recuperação:** Meça o custo de CPU da IA antes de aumentar a complexidade. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
