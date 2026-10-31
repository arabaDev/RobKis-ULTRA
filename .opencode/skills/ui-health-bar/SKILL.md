---
name: ui-health-bar
description: "Barra de vida com animação e cor por faixa."
metadata:
  id: SK-09-15
  department: "Interfaces e GUIs"
  version: "1.0"
  revised: "2026-10-18"
---

# ui-health-bar

Barra de vida com animação e cor por faixa.

**Quando usar:** HUD do jogador e de alvos.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Atualize por Humanoid.HealthChanged.
- Largura proporcional por Scale.
- Tween curto suaviza e a cor muda por faixa de vida.

**Verificação:** A barra acompanha dano e cura, inclusive com MaxHealth diferente.

**Complementares (sugeridas por similaridade):** `npc-health-bars`, `net-player-lifecycle`, `ui-hud-design`

**Limites e recuperação:** Valide em pelo menos um celular e um desktop antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
