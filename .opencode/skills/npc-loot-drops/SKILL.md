---
name: npc-loot-drops
description: "Itens que os NPCs soltam ao morrer."
metadata:
  id: SK-11-11
  department: "Personagens e NPCs"
  version: "1.0"
  revised: "2026-10-18"
---

# npc-loot-drops

Itens que os NPCs soltam ao morrer.

**Quando usar:** Recompensas de combate.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Tabelas de drop com peso e raridade em config.
- Sorteio no servidor com Random.
- Conceda uma vez por morte.

**Verificação:** A proporção de drops confere com a tabela em muitas simulações.

**Complementares (sugeridas por similaridade):** `rk-math-rng`, `tool-dropping-pickup`, `ai-steering-avoidance`

**Limites e recuperação:** Teste com vários NPCs e jogadores, não só um. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
