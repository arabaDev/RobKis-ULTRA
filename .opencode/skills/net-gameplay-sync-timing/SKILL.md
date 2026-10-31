---
name: net-gameplay-sync-timing
description: "Sincronizar tempo entre servidor e clientes com GetServerTimeNow."
metadata:
  id: SK-07-16
  department: "Multiplayer e replicação"
  version: "1.0"
  revised: "2026-10-18"
---

# net-gameplay-sync-timing

Sincronizar tempo entre servidor e clientes com GetServerTimeNow.

**Quando usar:** Contagens regressivas, ondas e eventos temporizados.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- workspace:GetServerTimeNow dá um relógio comum ao servidor e ao cliente.
- Replique o instante de fim, não o tempo restante.
- A UI calcula o restante localmente.

**Verificação:** Dois clientes mostram o mesmo tempo restante com diferença menor que o ping.

**Complementares (sugeridas por similaridade):** `combat-animation-sync`, `inv-ui-sync`, `anim3d-timing-spacing`

**Limites e recuperação:** Limites de rede mudam; confirme na documentação atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
