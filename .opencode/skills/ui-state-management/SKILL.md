---
name: ui-state-management
description: "Estado de UI separado da apresentação."
metadata:
  id: SK-09-19
  department: "Interfaces e GUIs"
  version: "1.0"
  revised: "2026-10-18"
---

# ui-state-management

Estado de UI separado da apresentação.

**Quando usar:** Telas com muitos estados (carregando, erro, vazio, pronto).

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Um módulo guarda o estado e a UI apenas o reflete.
- Estados explícitos: carregando, vazio, erro e pronto.
- Transições únicas entre estados.

**Verificação:** Cada estado tem aparência definida e testada.

**Complementares (sugeridas por similaridade):** `arq-state-management`, `net-session-management`, `ai-state-machines`

**Limites e recuperação:** Valide em pelo menos um celular e um desktop antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
