---
name: combat-stun-system
description: "Atordoamento com duração, imunidade e interrupção de ações."
metadata:
  id: SK-04-17
  department: "Sistemas de combate"
  version: "1.0"
  revised: "2026-10-18"
---

# combat-stun-system

Atordoamento com duração, imunidade e interrupção de ações.

**Quando usar:** Habilidades que impedem o alvo de agir.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- O estado de stun no servidor bloqueia ataque, habilidade e movimento conforme a regra.
- Duração máxima e imunidade curta depois evitam stun infinito.
- Ao terminar restaure WalkSpeed e controles.

**Verificação:** Um alvo não fica preso em stun encadeado.

**Complementares (sugeridas por similaridade):** `combat-status-effects`, `game-ability-system`, `game-class-system`

**Limites e recuperação:** Valores de balanceamento são ponto de partida; ajuste por teste de jogo. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
