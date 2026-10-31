---
name: tool-ui-hotbar
description: "Hotbar personalizada no lugar do Backpack padrão."
metadata:
  id: SK-05-13
  department: "Ferramentas e armas"
  version: "1.0"
  revised: "2026-10-18"
---

# tool-ui-hotbar

Hotbar personalizada no lugar do Backpack padrão.

**Quando usar:** Interfaces de inventário próprias.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Desligue o Backpack padrão com StarterGui:SetCoreGuiEnabled.
- A UI lê o Backpack e pede equip ao servidor ou usa Humanoid:EquipTool.
- Atualize em ChildAdded e ChildRemoved.

**Verificação:** Itens adicionados ou removidos refletem na hotbar.

**Complementares (sugeridas por similaridade):** `move-custom-camera`, `tool-backpack-handling`, `test-ui-responsive`

**Limites e recuperação:** Confirme se o jogo usa R6, R15 ou rigs próprios antes de ajustar empunhadura. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
