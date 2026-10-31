---
name: rig-skinning-vs-parenting
description: "Skinning ou parentesco rígido de peças."
metadata:
  id: SK-25-15
  department: "Rigging e esqueletos"
  version: "1.0"
  revised: "2026-10-18"
---

# rig-skinning-vs-parenting

Skinning ou parentesco rígido de peças.

**Quando usar:** Escolher como ligar a malha aos ossos.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Peças rígidas como armadura e armas podem ser parentadas a um osso.
- Corpo deformável usa skinning com pesos.
- Escolha por peça, não pelo modelo inteiro.

**Verificação:** Cada peça se move como esperado na animação.

**Complementares (sugeridas por similaridade):** `rig-fixing-common-problems`, `proc-geometry-nodes-intro`, `mat-shader-nodes-scripting`

**Limites e recuperação:** Confirme requisitos atuais do importador de rigs do Roblox. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
