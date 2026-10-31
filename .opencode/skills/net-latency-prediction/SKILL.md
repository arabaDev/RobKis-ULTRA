---
name: net-latency-prediction
description: "Previsão no cliente com reconciliação pelo servidor."
metadata:
  id: SK-07-07
  department: "Multiplayer e replicação"
  version: "1.0"
  revised: "2026-10-18"
---

# net-latency-prediction

Previsão no cliente com reconciliação pelo servidor.

**Quando usar:** Ações que precisam parecer instantâneas.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- O cliente executa feedback imediato.
- O servidor decide e corrige o cliente se divergir.
- Mantenha a lógica de decisão em um módulo compartilhado simples.

**Verificação:** Com latência simulada a ação continua correta.

**Complementares (sugeridas por similaridade):** `net-latency-jitter`, `net-reconciliation`, `combat-latency-testing`

**Limites e recuperação:** Limites de rede mudam; confirme na documentação atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
