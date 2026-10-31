---
name: combat-projectile-trajectories
description: "Trajetórias balísticas com gravidade e velocidade inicial."
metadata:
  id: SK-04-15
  department: "Sistemas de combate"
  version: "1.0"
  revised: "2026-10-18"
---

# combat-projectile-trajectories

Trajetórias balísticas com gravidade e velocidade inicial.

**Quando usar:** Flechas, granadas e projéteis com arco.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Posição no tempo t é p0 mais v0 vezes t mais metade de g vezes t ao quadrado.
- Use workspace.Gravity como g para coerência com a física.
- Cheque colisão por segmento (raycast) entre posições sucessivas.

**Verificação:** Um projétil em alta velocidade não atravessa uma parede fina.

**Complementares (sugeridas por similaridade):** `combat-ranged-projectiles`, `doc-known-issues`, `perf-debris-cleanup`

**Limites e recuperação:** Valores de balanceamento são ponto de partida; ajuste por teste de jogo. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
