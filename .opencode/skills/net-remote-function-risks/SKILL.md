---
name: net-remote-function-risks
description: "Riscos de RemoteFunction e quando evitar."
metadata:
  id: SK-07-02
  department: "Multiplayer e replicação"
  version: "1.0"
  revised: "2026-10-18"
---

# net-remote-function-risks

Riscos de RemoteFunction e quando evitar.

**Quando usar:** Quando o código pensa em InvokeClient ou InvokeServer.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Nunca use InvokeClient, pois o cliente pode nunca responder.
- InvokeServer pode travar o cliente se o servidor demorar.
- Prefira RemoteEvent em duas vias.

**Verificação:** Nenhum InvokeClient no projeto.

**Complementares (sugeridas por similaridade):** `secan-injection-risks`, `net-remote-event-design`, `sec-remote-input-validation`

**Limites e recuperação:** Limites de rede mudam; confirme na documentação atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
