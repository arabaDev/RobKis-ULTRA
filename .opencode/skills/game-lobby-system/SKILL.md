---
name: game-lobby-system
description: "Lobby com preparação e início automático."
metadata:
  id: SK-42-05
  department: "Sistemas completos de jogo"
  version: "1.0"
  revised: "2026-10-18"
---

# game-lobby-system

Lobby com preparação e início automático.

**Quando usar:** Antes de cada partida.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Mínimo de jogadores e contagem regressiva.
- Cancele ao cair abaixo do mínimo.
- Teletransporte controlado para a partida.

**Verificação:** A contagem reinicia e cancela conforme a regra.

**Complementares (sugeridas por similaridade):** `combat-stun-system`, `fx-music-system`, `game-ability-system`

**Limites e recuperação:** Sistemas completos tocam dados salvos e economia; valide segurança e persistência antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
