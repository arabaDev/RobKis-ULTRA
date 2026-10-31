---
name: net-player-lifecycle
description: "Ciclo de vida de jogadores: PlayerAdded, PlayerRemoving e jogadores já presentes."
metadata:
  id: SK-07-09
  department: "Multiplayer e replicação"
  version: "1.0"
  revised: "2026-10-18"
---

# net-player-lifecycle

Ciclo de vida de jogadores: PlayerAdded, PlayerRemoving e jogadores já presentes.

**Quando usar:** Inicialização de dados por jogador.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Processe Players:GetPlayers() e conecte PlayerAdded para os próximos.
- Limpe tabelas por jogador em PlayerRemoving.
- Salve dados antes de remover.

**Verificação:** Entrar tarde e sair cedo não gera erro nem vazamento.

**Complementares (sugeridas por similaridade):** `tool-equip-lifecycle`, `ui-health-bar`, `bench-continuous-improvement`

**Limites e recuperação:** Limites de rede mudam; confirme na documentação atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
