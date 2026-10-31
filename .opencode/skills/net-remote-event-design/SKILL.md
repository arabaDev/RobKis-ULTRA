---
name: net-remote-event-design
description: "Projeto de RemoteEvents: nomes, direção e payload mínimo."
metadata:
  id: SK-07-01
  department: "Multiplayer e replicação"
  version: "1.0"
  revised: "2026-10-18"
---

# net-remote-event-design

Projeto de RemoteEvents: nomes, direção e payload mínimo.

**Quando usar:** Ao criar comunicação cliente e servidor.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Um Remote por ação, com nome verbo e objeto.
- Payload pequeno e tipado.
- Em OnServerEvent o primeiro argumento é sempre o Player.

**Verificação:** Todo Remote tem handler com validação.

**Complementares (sugeridas por similaridade):** `arq-event-driven-design`, `arq-design-patterns-luau`, `eco-currency-design`

**Limites e recuperação:** Limites de rede mudam; confirme na documentação atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
