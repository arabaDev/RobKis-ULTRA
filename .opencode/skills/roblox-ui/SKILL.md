---
name: roblox-ui
description: "Interfaces Roblox responsivas para PC e mobile — escala, layouts, áreas seguras e toque. Use ao criar HUDs, menus, lojas e inventários."
metadata:
  id: SK-46-01
  department: "Núcleo Roblox"
  version: 1.0
  revised: 2026-10-18
---
# Roblox UI

- Dimensione com **Scale** de `UDim2`, não Offset fixo; ancore (`AnchorPoint`) e use `UIAspectRatioConstraint` para manter proporção.
- `UIListLayout`/`UIGridLayout`/`UIPadding` em vez de posicionar manualmente.
- `UIScale` para ajustar o conjunto por tamanho de tela; `UITextSizeConstraint` com `TextScaled` para limitar texto.
- Alvos de toque grandes (~44–48 px equivalentes); não dependa de hover.
- Respeite áreas seguras/inset (`ScreenGui.ScreenInsets`, `GuiService`) para notch e botões nativos do Roblox.
- `ZIndexBehavior = Sibling`; `ResetOnSpawn = false` em HUD persistente.
- Lógica de UI no cliente; qualquer ação que altere dados (comprar, equipar) é **pedido** ao servidor.
- Animações com `TweenService`; evite Heartbeat por elemento.
- Teste no emulador de dispositivo do Studio (celular, tablet, desktop).

**Verificação:** Interface vista em pelo menos um tamanho de celular e um de desktop.
