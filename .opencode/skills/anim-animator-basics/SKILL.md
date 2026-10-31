---
name: anim-animator-basics
description: "Animator, AnimationTrack e como carregar e tocar animações."
metadata:
  id: SK-10-01
  department: "Animações Roblox"
  version: "1.0"
  revised: "2026-10-18"
---

# anim-animator-basics

Animator, AnimationTrack e como carregar e tocar animações.

**Quando usar:** Qualquer animação de personagem ou rig.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Obtenha o Animator do Humanoid ou AnimationController.
- Animator:LoadAnimation retorna a AnimationTrack; Humanoid:LoadAnimation é legado.
- Carregue uma vez e reutilize a track.

**Verificação:** A animação toca e termina sem erros no Output.

**Complementares (sugeridas por similaridade):** `anim3d-keyframe-basics`, `phys-constraints-basics`, `uv-unwrap-basics`

**Limites e recuperação:** Animações publicadas dependem do dono do jogo; confirme permissões. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
