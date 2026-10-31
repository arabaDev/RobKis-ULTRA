---
name: net-reconciliation
description: "Reconciliação de estado após previsão do cliente."
metadata:
  id: SK-07-14
  department: "Multiplayer e replicação"
  version: "1.0"
  revised: "2026-10-18"
---

# net-reconciliation

Reconciliação de estado após previsão do cliente.

**Quando usar:** Previsão no cliente que diverge do servidor.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- O cliente guarda as ações previstas com número de sequência.
- O servidor confirma ou corrige usando a sequência.
- O cliente reaplica as ações pendentes sobre o estado corrigido.

**Verificação:** Uma correção do servidor não causa teletransporte visível além da tolerância.

**Complementares (sugeridas por similaridade):** `net-latency-prediction`, `arq-state-management`, `arq-client-server-boundary`

**Limites e recuperação:** Limites de rede mudam; confirme na documentação atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
