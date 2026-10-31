---
name: arq-game-loop-design
description: "Modela o ciclo de partida como máquina de estados (lobby, rodada, fim)."
metadata:
  id: SK-01-13
  department: "Arquitetura de software"
  version: "1.0"
  revised: "2026-10-18"
---

# arq-game-loop-design

Modela o ciclo de partida como máquina de estados (lobby, rodada, fim).

**Quando usar:** Jogos com rodadas, ondas ou partidas.

**Regras**
- Estados explícitos como Lobby, Intermission, Playing e Ending, com transições únicas.
- Um serviço dono decide as transições e o resto reage a eventos.
- Tempo da rodada vive no servidor e é replicado por atributo para a UI.

**Verificação:** Todo estado é alcançável e tem saída; nenhuma transição fica sem dono.

**Complementares (sugeridas por similaridade):** `rk-famous-game-mode`, `game-round-manager`, `eco-currency-design`

**Limites e recuperação:** Decisões dependem do jogo real; confirme a estrutura existente antes de impor padrões. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
