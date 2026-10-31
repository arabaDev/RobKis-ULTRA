---
name: combat-melee-combos
description: "Combos corpo a corpo com janela de input e estado."
metadata:
  id: SK-04-07
  department: "Sistemas de combate"
  version: "1.0"
  revised: "2026-10-18"
---

# combat-melee-combos

Combos corpo a corpo com janela de input e estado.

**Quando usar:** Espadas, socos e sequências de ataque.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Estado do combo no servidor com índice e prazo de reinício.
- Cada golpe tem janela, dano e duração em config.
- Cancelamento por stun ou morte limpa o estado.

**Verificação:** Sequência correta, estouro de janela e cancelamento testados.

**Complementares (sugeridas por similaridade):** `combat-hitbox-overlap`, `combat-parry-block`, `compat-input-devices`

**Limites e recuperação:** Valores de balanceamento são ponto de partida; ajuste por teste de jogo. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
