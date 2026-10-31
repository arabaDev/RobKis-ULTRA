---
name: ui-scale-layout
description: "Layout com escala (UDim2 Scale), âncoras e restrições."
metadata:
  id: SK-09-01
  department: "Interfaces e GUIs"
  version: "1.0"
  revised: "2026-10-18"
---

# ui-scale-layout

Layout com escala (UDim2 Scale), âncoras e restrições.

**Quando usar:** Qualquer interface que deve funcionar em várias telas.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Posicione e dimensione por Scale; use Offset só para margens pequenas.
- AnchorPoint para alinhar bordas e centro.
- UIAspectRatioConstraint e UISizeConstraint para limites.

**Verificação:** A UI se mantém coerente em retrato, paisagem e desktop.

**Complementares (sugeridas por similaridade):** `exp-scale-units`, `pipe-scale-verification`, `rig-apply-scale`

**Limites e recuperação:** Valide em pelo menos um celular e um desktop antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
