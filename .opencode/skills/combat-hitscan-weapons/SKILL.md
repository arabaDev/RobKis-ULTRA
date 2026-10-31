---
name: combat-hitscan-weapons
description: "Armas de acerto instantâneo com dispersão e alcance."
metadata:
  id: SK-04-09
  department: "Sistemas de combate"
  version: "1.0"
  revised: "2026-10-18"
---

# combat-hitscan-weapons

Armas de acerto instantâneo com dispersão e alcance.

**Quando usar:** Pistolas, rifles e armas de laser.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Cliente envia origem e direção; servidor recalcula a partir do personagem e confere o desvio.
- Dispersão com Random.new no servidor.
- Limite a taxa de disparo por arma.

**Verificação:** Pedido com origem falsa é rejeitado ou corrigido.

**Complementares (sugeridas por similaridade):** `combat-hitbox-raycast`, `proc-weapon-generator`, `tool-rarity-stats`

**Limites e recuperação:** Valores de balanceamento são ponto de partida; ajuste por teste de jogo. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
