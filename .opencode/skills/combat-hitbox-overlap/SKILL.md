---
name: combat-hitbox-overlap
description: "Hitbox por volume com GetPartBoundsInBox e OverlapParams."
metadata:
  id: SK-04-02
  department: "Sistemas de combate"
  version: "1.0"
  revised: "2026-10-18"
---

# combat-hitbox-overlap

Hitbox por volume com GetPartBoundsInBox e OverlapParams.

**Quando usar:** Golpes corpo a corpo e áreas.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- workspace:GetPartBoundsInBox, GetPartBoundsInRadius ou GetPartsInPart com OverlapParams.
- Deduplique por Humanoid, pois um personagem tem várias partes.
- Posicione o volume a partir do CFrame do atacante no servidor.

**Verificação:** Um alvo com várias partes toma dano uma única vez por golpe.

**Complementares (sugeridas por similaridade):** `combat-hitbox-raycast`, `uv-mirror-overlap`, `combat-melee-combos`

**Limites e recuperação:** Valores de balanceamento são ponto de partida; ajuste por teste de jogo. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
