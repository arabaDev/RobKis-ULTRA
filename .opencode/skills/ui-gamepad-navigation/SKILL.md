---
name: ui-gamepad-navigation
description: "Navegação de UI por gamepad."
metadata:
  id: SK-09-17
  department: "Interfaces e GUIs"
  version: "1.0"
  revised: "2026-10-18"
---

# ui-gamepad-navigation

Navegação de UI por gamepad.

**Quando usar:** Jogos com suporte a controle.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Selectable nos botões e GuiService.SelectedObject para o foco inicial.
- Ordem de foco coerente com o layout.
- Botão de voltar mapeado.

**Verificação:** Todos os botões são alcançáveis sem mouse.

**Complementares (sugeridas por similaridade):** `ui-menu-navigation`, `compat-input-devices`, `ui-accessibility-controls`

**Limites e recuperação:** Valide em pelo menos um celular e um desktop antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
