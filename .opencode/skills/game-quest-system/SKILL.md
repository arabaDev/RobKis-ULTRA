---
name: game-quest-system
description: "Sistema de quests com objetivos e progresso."
metadata:
  id: SK-42-01
  department: "Sistemas completos de jogo"
  version: "1.0"
  revised: "2026-10-18"
---

# game-quest-system

Sistema de quests com objetivos e progresso.

**Quando usar:** Missões e conquistas.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- A quest é dado (id, objetivos, recompensa) e o progresso é estado do jogador.
- Objetivos escutam eventos do jogo.
- Conclusão e recompensa no servidor, uma única vez.

**Verificação:** Concluir duas vezes não entrega duas recompensas.

**Complementares (sugeridas por similaridade):** `npc-dialogue-system`, `fx-music-system`, `game-ability-system`

**Limites e recuperação:** Sistemas completos tocam dados salvos e economia; valide segurança e persistência antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
