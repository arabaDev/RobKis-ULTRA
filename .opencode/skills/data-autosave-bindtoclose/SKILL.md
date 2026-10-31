---
name: data-autosave-bindtoclose
description: "Salvamento periódico, em PlayerRemoving e em BindToClose."
metadata:
  id: SK-15-05
  department: "DataStore e persistência"
  version: "1.0"
  revised: "2026-10-18"
---

# data-autosave-bindtoclose

Salvamento periódico, em PlayerRemoving e em BindToClose.

**Quando usar:** Evitar perda de progresso.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Salve em PlayerRemoving.
- game:BindToClose salva quem restou.
- Intervalo de autosave moderado.

**Verificação:** Fechar o servidor salva todos os jogadores.

**Complementares (sugeridas por similaridade):** `game-quest-system`, `net-player-lifecycle`, `data-corruption-recovery`

**Limites e recuperação:** Limites e orçamentos mudam; confirme na documentação atual e nunca teste em dados reais. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
