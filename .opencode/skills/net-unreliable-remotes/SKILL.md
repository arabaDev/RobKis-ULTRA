---
name: net-unreliable-remotes
description: "UnreliableRemoteEvent para dados descartáveis."
metadata:
  id: SK-07-03
  department: "Multiplayer e replicação"
  version: "1.0"
  revised: "2026-10-18"
---

# net-unreliable-remotes

UnreliableRemoteEvent para dados descartáveis.

**Quando usar:** Efeitos visuais e posições frequentes sem exigir entrega.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Pode perder ou reordenar pacotes.
- Nunca use para compra, dano ou estado importante.
- Mantenha o payload pequeno.

**Verificação:** Perder um pacote não deixa o jogo inconsistente.

**Complementares (sugeridas por similaridade):** `test-fuzzing-remotes`, `perf-object-pooling`, `fx-client-side-effects`

**Limites e recuperação:** Limites de rede mudam; confirme na documentação atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
