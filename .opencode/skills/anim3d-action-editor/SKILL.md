---
name: anim3d-action-editor
description: "Action Editor e gerenciamento de ações."
metadata:
  id: SK-26-13
  department: "Animação 3D"
  version: "1.0"
  revised: "2026-10-18"
---

# anim3d-action-editor

Action Editor e gerenciamento de ações.

**Quando usar:** Várias animações no mesmo rig.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Uma Action por animação, com nome estável.
- Fake user evita perder ações sem uso.
- Cada Action tem seu intervalo de quadros.

**Verificação:** Cada Action tem nome e intervalo e exporta separadamente.

**Complementares (sugeridas por similaridade):** `anim3d-nla-actions`, `mcp-write-conflict-prevention`, `orch-parallel-safety`

**Limites e recuperação:** Valide a animação no Studio, não só no Blender. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
