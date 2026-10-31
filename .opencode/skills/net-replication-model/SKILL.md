---
name: net-replication-model
description: "O que replica entre servidor e cliente."
metadata:
  id: SK-07-05
  department: "Multiplayer e replicação"
  version: "1.0"
  revised: "2026-10-18"
---

# net-replication-model

O que replica entre servidor e cliente.

**Quando usar:** Ao decidir onde guardar objetos e dados.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Servidor para cliente replica Workspace e ReplicatedStorage.
- ServerStorage e ServerScriptService não vão ao cliente.
- Alterações feitas só no cliente não chegam ao servidor.

**Verificação:** Cada objeto está no serviço correto para quem precisa dele.

**Complementares (sugeridas por similaridade):** `sec-script-visibility`, `bug-replication-desync`, `inv-data-model`

**Limites e recuperação:** Limites de rede mudam; confirme na documentação atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
