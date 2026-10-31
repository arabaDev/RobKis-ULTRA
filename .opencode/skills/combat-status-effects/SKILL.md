---
name: combat-status-effects
description: "Efeitos de status (queimadura, lentidão, atordoamento) com duração."
metadata:
  id: SK-04-11
  department: "Sistemas de combate"
  version: "1.0"
  revised: "2026-10-18"
---

# combat-status-effects

Efeitos de status (queimadura, lentidão, atordoamento) com duração.

**Quando usar:** Habilidades que alteram o alvo por tempo.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Tabela de efeitos ativos por alvo com expiração.
- Regras de empilhamento definidas: renovar, acumular ou ignorar.
- Remova efeitos na morte e ao trocar de personagem.

**Verificação:** Efeito expira no tempo certo e não persiste após o respawn.

**Complementares (sugeridas por similaridade):** `combat-stun-system`, `tool-sounds-effects`, `fx-client-side-effects`

**Limites e recuperação:** Valores de balanceamento são ponto de partida; ajuste por teste de jogo. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
