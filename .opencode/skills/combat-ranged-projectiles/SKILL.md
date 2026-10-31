---
name: combat-ranged-projectiles
description: "Projéteis físicos ou simulados com tempo de vida e colisão."
metadata:
  id: SK-04-08
  department: "Sistemas de combate"
  version: "1.0"
  revised: "2026-10-18"
---

# combat-ranged-projectiles

Projéteis físicos ou simulados com tempo de vida e colisão.

**Quando usar:** Flechas, bolas de fogo e granadas.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Simule no servidor ou valide o resultado; cliente mostra o efeito.
- Defina velocidade, gravidade e tempo de vida em config.
- Destrua e desconecte ao acertar ou expirar.

**Verificação:** Nenhum projétil permanece no Workspace depois do fim da vida.

**Complementares (sugeridas por similaridade):** `combat-projectile-trajectories`, `fx-particle-emitters`, `ui-hud-design`

**Limites e recuperação:** Valores de balanceamento são ponto de partida; ajuste por teste de jogo. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
