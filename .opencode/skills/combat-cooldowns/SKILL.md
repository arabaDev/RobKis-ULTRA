---
name: combat-cooldowns
description: "Cooldown por jogador validado no servidor com os.clock."
metadata:
  id: SK-04-04
  department: "Sistemas de combate"
  version: "1.0"
  revised: "2026-10-18"
---

# combat-cooldowns

Cooldown por jogador validado no servidor com os.clock.

**Quando usar:** Qualquer ataque ou habilidade com intervalo.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Guarde o último uso por jogador e habilidade em tabela no servidor.
- Rejeite pedido antes do tempo; cliente só mostra a barra.
- Limpe a entrada em PlayerRemoving.

**Verificação:** Disparar o Remote em rajada causa um único efeito por cooldown.

**Complementares (sugeridas por similaridade):** `ui-ability-indicators`, `bench-statistics-small-n`, `tool-server-validation`

**Limites e recuperação:** Valores de balanceamento são ponto de partida; ajuste por teste de jogo. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
