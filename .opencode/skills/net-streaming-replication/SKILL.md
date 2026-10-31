---
name: net-streaming-replication
description: "Interação entre StreamingEnabled e código replicado."
metadata:
  id: SK-07-11
  department: "Multiplayer e replicação"
  version: "1.0"
  revised: "2026-10-18"
---

# net-streaming-replication

Interação entre StreamingEnabled e código replicado.

**Quando usar:** Jogo com streaming ligado.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Objetos podem não existir no cliente no momento.
- Use WaitForChild com tolerância ou eventos de entrada.
- Para objetos críticos use modo persistente de streaming.

**Verificação:** Entrar em locais distantes não gera erro de nil.

**Complementares (sugeridas por similaridade):** `npc-streaming-considerations`, `studio-streaming-enabled`, `net-attributes-replication`

**Limites e recuperação:** Limites de rede mudam; confirme na documentação atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
