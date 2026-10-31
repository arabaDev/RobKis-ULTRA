---
name: anim-priorities
description: "Prioridades de animação (Core, Idle, Movement, Action)."
metadata:
  id: SK-10-02
  department: "Animações Roblox"
  version: "1.0"
  revised: "2026-10-18"
---

# anim-priorities

Prioridades de animação (Core, Idle, Movement, Action).

**Quando usar:** Quando uma animação não sobrepõe outra.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- AnimationTrack.Priority usa Enum.AnimationPriority.
- Action sobrepõe Movement e Idle.
- Defina na publicação ou no código.

**Verificação:** A animação desejada vence a de movimento.

**Complementares (sugeridas por similaridade):** `anim3d-looping`, `tool-animation-binding`, `anim-ownership-permissions`

**Limites e recuperação:** Animações publicadas dependem do dono do jogo; confirme permissões. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
