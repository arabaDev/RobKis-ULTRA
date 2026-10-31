---
name: tool-dropping-pickup
description: "Largar e pegar ferramentas com ProximityPrompt."
metadata:
  id: SK-05-11
  department: "Ferramentas e armas"
  version: "1.0"
  revised: "2026-10-18"
---

# tool-dropping-pickup

Largar e pegar ferramentas com ProximityPrompt.

**Quando usar:** Itens no chão e loot.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Tool.CanBeDropped controla o drop do jogador.
- ProximityPrompt no item; valide distância e posse no servidor.
- Destrua o item do chão ao pegar.

**Verificação:** Dois jogadores pegando ao mesmo tempo resulta em um dono só.

**Complementares (sugeridas por similaridade):** `npc-loot-drops`, `rk-math-rng`, `fx-footstep-sounds`

**Limites e recuperação:** Confirme se o jogo usa R6, R15 ou rigs próprios antes de ajustar empunhadura. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
