---
name: anim-blending-weights
description: "Mistura de animações com peso e tempo de fade."
metadata:
  id: SK-10-04
  department: "Animações Roblox"
  version: "1.0"
  revised: "2026-10-18"
---

# anim-blending-weights

Mistura de animações com peso e tempo de fade.

**Quando usar:** Transições suaves.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- AnimationTrack:Play(fadeTime, weight, speed).
- Stop(fadeTime) para saída suave.
- Ajuste pesos com AdjustWeight.

**Verificação:** A transição não tem salto visível.

**Complementares (sugeridas por similaridade):** `rig-auto-weights`, `anim3d-timing-spacing`, `ui-tween-animation`

**Limites e recuperação:** Animações publicadas dependem do dono do jogo; confirme permissões. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
