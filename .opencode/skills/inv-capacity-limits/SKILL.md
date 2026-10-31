---
name: inv-capacity-limits
description: "Limites de capacidade e peso."
metadata:
  id: SK-13-05
  department: "Sistemas de inventário"
  version: "1.0"
  revised: "2026-10-18"
---

# inv-capacity-limits

Limites de capacidade e peso.

**Quando usar:** Inventários com espaço limitado.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Capacidade em config.
- Falha clara ao exceder.
- Itens de missão podem ter regras próprias.

**Verificação:** Exceder o limite é recusado com mensagem.

**Complementares (sugeridas por similaridade):** `orch-concurrency-limits`, `data-budget-limits`, `fx-performance-limits`

**Limites e recuperação:** Toda ação de inventário é decidida no servidor. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
