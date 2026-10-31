---
name: ui-input-handling
description: "Entrada de mouse, toque, teclado e gamepad."
metadata:
  id: SK-09-07
  department: "Interfaces e GUIs"
  version: "1.0"
  revised: "2026-10-18"
---

# ui-input-handling

Entrada de mouse, toque, teclado e gamepad.

**Quando usar:** Controles e menus.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- UserInputService.InputBegan com gameProcessedEvent.
- ContextActionService:BindAction para ações com botão de toque.
- Use eventos Activated em botões para todos os dispositivos.

**Verificação:** A mesma ação funciona em teclado, toque e gamepad.

**Complementares (sugeridas por similaridade):** `compat-input-devices`, `studio-device-emulator`, `sec-remote-input-validation`

**Limites e recuperação:** Valide em pelo menos um celular e um desktop antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
