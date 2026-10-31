---
name: move-dash-roll
description: "Dash e esquiva com impulso curto e invulnerabilidade opcional."
metadata:
  id: SK-41-03
  department: "Gameplay e sistemas de movimento"
  version: "1.0"
  revised: "2026-10-18"
---

# move-dash-roll

Dash e esquiva com impulso curto e invulnerabilidade opcional.

**Quando usar:** Combate ágil.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Impulso por LinearVelocity ou deslocamento por tempo curto.
- Cooldown e custo no servidor.
- Janela de invulnerabilidade em config.

**Verificação:** O dash tem distância fixa e respeita o cooldown.

**Complementares (sugeridas por similaridade):** `combat-knockback`, `game-checkpoints`, `doc-decision-records`

**Limites e recuperação:** Movimento depende de latência e propriedade de rede; teste com mais de um cliente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
