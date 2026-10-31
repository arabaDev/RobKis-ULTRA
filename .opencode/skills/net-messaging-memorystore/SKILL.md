---
name: net-messaging-memorystore
description: "MessagingService e MemoryStoreService entre servidores."
metadata:
  id: SK-07-13
  department: "Multiplayer e replicação"
  version: "1.0"
  revised: "2026-10-18"
---

# net-messaging-memorystore

MessagingService e MemoryStoreService entre servidores.

**Quando usar:** Eventos globais e dados compartilhados entre servidores.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- MessagingService:PublishAsync e SubscribeAsync para avisos entre servidores.
- MemoryStore guarda dados com expiração.
- Ambos têm limites de uso; confira a documentação atual.

**Verificação:** Uma mensagem publicada chega a outro servidor em teste.

**Complementares (sugeridas por similaridade):** `data-memorystore-usage`, `arq-api-contracts`, `net-teleport-service`

**Limites e recuperação:** Limites de rede mudam; confirme na documentação atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
