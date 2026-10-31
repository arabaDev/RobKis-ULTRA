---
name: flow-animation-pipeline
description: "Fluxo de animação: rig, animação, exportação, importação e validação no Studio."
metadata:
  id: SK-44-10
  department: "Fluxos compostos"
  version: "1.0"
  revised: "2026-10-18"
---

# flow-animation-pipeline

Fluxo de animação: rig, animação, exportação, importação e validação no Studio.

**Quando usar:** Personagem ou criatura animada vinda do Blender.

**Procedimento**
1. Monte a hierarquia com `rig-bone-hierarchy` e `rig-naming-roblox`.
2. Pese com `rig-weight-painting`.
3. Teste poses com `rig-pose-testing`.
4. Anime com `anim3d-keyframe-basics`.
5. Garanta loops com `anim3d-looping`.
6. Bake com `anim3d-bake-export`.
7. Exporte com `exp-fbx-settings`.
8. Importe com `pipe-rig-import-animation`.
9. Confirme permissões com `anim-ownership-permissions`.
10. Defina prioridades com `anim-priorities`.
11. Eventos com `anim-markers-events`.
12. Valide com `anim3d-validation-in-studio`.

**Regras do fluxo**
- Valide a animação no Studio, não só no Blender.

**Verificação:** A animação toca no rig importado, com a duração e o loop esperados.

**Skills complementares:** `rig-bone-hierarchy`, `rig-naming-roblox`, `rig-weight-painting`, `rig-pose-testing`, `anim3d-keyframe-basics`, `anim3d-looping`, `anim3d-bake-export`, `exp-fbx-settings`, `pipe-rig-import-animation`, `anim-ownership-permissions`, `anim-priorities`, `anim-markers-events`, `anim3d-validation-in-studio`

**Limites e recuperação:** Este fluxo só ordena skills; cada etapa deve ser verificada pela skill correspondente, e o estado real de cada etapa deve ser reportado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
