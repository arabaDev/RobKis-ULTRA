---
name: net-bandwidth-batching
description: "Agrupa e reduz mensagens de rede."
metadata:
  id: SK-07-08
  department: "Multiplayer e replicação"
  version: "1.0"
  revised: "2026-10-18"
---

# net-bandwidth-batching

Agrupa e reduz mensagens de rede.

**Quando usar:** Quando há muitos disparos por segundo.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Agrupe atualizações em um pacote por tick.
- Envie mudanças, não o estado inteiro.
- Dados só do servidor não devem replicar.

**Verificação:** Mensagens por segundo medidas antes e depois.

**Complementares (sugeridas por similaridade):** `mcp-batching-calls`, `review-performance`, `sec-sanitize-text`

**Limites e recuperação:** Limites de rede mudam; confirme na documentação atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
