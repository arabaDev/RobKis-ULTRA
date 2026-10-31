---
name: inv-trading-safe
description: "Troca entre jogadores em duas fases."
metadata:
  id: SK-13-07
  department: "Sistemas de inventário"
  version: "1.0"
  revised: "2026-10-18"
---

# inv-trading-safe

Troca entre jogadores em duas fases.

**Quando usar:** Sistemas de troca.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Ambos confirmam; servidor executa de forma atômica.
- Cancela se algum perder o item ou sair.
- Registre a transação.

**Verificação:** Sair no meio da troca não duplica nem perde itens.

**Complementares (sugeridas por similaridade):** `bpy-safe-execution`, `rec-safe-abort`, `ui-safe-areas`

**Limites e recuperação:** Toda ação de inventário é decidida no servidor. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
