---
name: net-server-movement-sanity
description: "Checagens de sanidade no servidor para movimento."
metadata:
  id: SK-07-10
  department: "Multiplayer e replicação"
  version: "1.0"
  revised: "2026-10-18"
---

# net-server-movement-sanity

Checagens de sanidade no servidor para movimento.

**Quando usar:** Anti teletransporte e velocidade absurda.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Compare posição entre amostras com margem de tolerância.
- Considere latência e propriedade de rede.
- Responda corrigindo posição, não banindo automaticamente.

**Verificação:** Movimento legítimo com ping alto não é punido.

**Complementares (sugeridas por similaridade):** `sec-distance-sanity-checks`, `arq-client-server-boundary`, `inv-server-actions`

**Limites e recuperação:** Limites de rede mudam; confirme na documentação atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
