---
name: ui-inventory-grids
description: "Grades de inventário com layout e dados ligados."
metadata:
  id: SK-09-09
  department: "Interfaces e GUIs"
  version: "1.0"
  revised: "2026-10-18"
---

# ui-inventory-grids

Grades de inventário com layout e dados ligados.

**Quando usar:** Inventário, loja e equipamento.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- UIGridLayout dentro de ScrollingFrame.
- Reutilize slots em vez de recriar.
- Dados vêm do servidor; UI só reflete.

**Verificação:** Inventário com muitos itens rola sem travar.

**Complementares (sugeridas por similaridade):** `inv-data-model`, `ui-layout-objects`, `ui-shop-screens`

**Limites e recuperação:** Valide em pelo menos um celular e um desktop antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
