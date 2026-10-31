---
name: net-disconnect-handling
description: "Tratamento de desconexão no meio de ações."
metadata:
  id: SK-07-18
  department: "Multiplayer e replicação"
  version: "1.0"
  revised: "2026-10-18"
---

# net-disconnect-handling

Tratamento de desconexão no meio de ações.

**Quando usar:** Jogador sai durante troca, combate ou compra.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Cancele ou conclua ações pendentes em PlayerRemoving.
- Operações com dois jogadores revertem se um deles sair.
- Não referencie um Player destruído depois do evento.

**Verificação:** Sair no meio de uma troca não deixa itens perdidos nem duplicados.

**Complementares (sugeridas por similaridade):** `bpy-error-handling-verify`, `luau-error-handling`, `rec-timeout-handling`

**Limites e recuperação:** Limites de rede mudam; confirme na documentação atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
