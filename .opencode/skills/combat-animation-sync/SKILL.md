---
name: combat-animation-sync
description: "Sincronizar animação, hitbox e efeito pelo mesmo tempo."
metadata:
  id: SK-04-18
  department: "Sistemas de combate"
  version: "1.0"
  revised: "2026-10-18"
---

# combat-animation-sync

Sincronizar animação, hitbox e efeito pelo mesmo tempo.

**Quando usar:** Golpe que acerta antes ou depois do visual.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Marcadores de animação definem o quadro de impacto no cliente.
- O servidor usa o mesmo atraso configurado para abrir a hitbox.
- A duração do golpe vem de config e não da animação.

**Verificação:** O dano ocorre no quadro de impacto com ping baixo e alto.

**Complementares (sugeridas por similaridade):** `net-gameplay-sync-timing`, `tool-animation-binding`, `inv-ui-sync`

**Limites e recuperação:** Valores de balanceamento são ponto de partida; ajuste por teste de jogo. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
