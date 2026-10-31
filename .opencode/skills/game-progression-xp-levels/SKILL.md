---
name: game-progression-xp-levels
description: "Progressão com XP e níveis."
metadata:
  id: SK-42-02
  department: "Sistemas completos de jogo"
  version: "1.0"
  revised: "2026-10-18"
---

# game-progression-xp-levels

Progressão com XP e níveis.

**Quando usar:** Jogos com evolução do jogador.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Curva de XP em config.
- A subida de nível ocorre no servidor, com laço para XP em excesso.
- Benefícios por nível em config.

**Verificação:** Ganhar muito XP de uma vez sobe vários níveis corretamente.

**Complementares (sugeridas por similaridade):** `rk-math-rng`, `combat-cooldowns`, `move-sprint-stamina`

**Limites e recuperação:** Sistemas completos tocam dados salvos e economia; valide segurança e persistência antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
