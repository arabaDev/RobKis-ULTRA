---
name: ui-tween-animation
description: "Animações de UI com TweenService."
metadata:
  id: SK-09-06
  department: "Interfaces e GUIs"
  version: "1.0"
  revised: "2026-10-18"
---

# ui-tween-animation

Animações de UI com TweenService.

**Quando usar:** Aberturas, transições e feedback.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- TweenService:Create com TweenInfo e tabela de propriedades.
- Cancele o tween anterior ao iniciar outro no mesmo objeto.
- Evite animar por RenderStepped quando um tween resolve.

**Verificação:** Abrir e fechar rapidamente não deixa a UI em estado errado.

**Complementares (sugeridas por similaridade):** `tool-animation-binding`, `pipe-rig-import-animation`, `fx-tween-vfx`

**Limites e recuperação:** Valide em pelo menos um celular e um desktop antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
