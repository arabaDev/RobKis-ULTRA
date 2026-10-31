---
name: net-attributes-replication
description: "Atributos como canal simples de estado replicado."
metadata:
  id: SK-07-06
  department: "Multiplayer e replicação"
  version: "1.0"
  revised: "2026-10-18"
---

# net-attributes-replication

Atributos como canal simples de estado replicado.

**Quando usar:** Valores pequenos que a UI precisa ver.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Atributos definidos no servidor replicam para o cliente.
- GetAttributeChangedSignal evita polling.
- Não confie em atributo editado pelo cliente.

**Verificação:** A UI reage à mudança de atributo sem polling.

**Complementares (sugeridas por similaridade):** `luau-attributes-tags`, `net-streaming-replication`, `net-replication-model`

**Limites e recuperação:** Limites de rede mudam; confirme na documentação atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
