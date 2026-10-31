---
name: test-multiplayer-local-server
description: "Testar com servidor local e vários clientes."
metadata:
  id: SK-18-03
  department: "Testes automatizados"
  version: "1.0"
  revised: "2026-10-18"
---

# test-multiplayer-local-server

Testar com servidor local e vários clientes.

**Quando usar:** Replicação e interação entre jogadores.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Inicie servidor e clientes pela aba Test.
- Teste entrada e saída de jogadores.
- Compare a visão de cada cliente.

**Verificação:** Ações de um jogador aparecem corretamente nos outros.

**Complementares (sugeridas por similaridade):** `arq-client-server-boundary`, `studio-play-modes`, `inv-server-actions`

**Limites e recuperação:** Diga o que foi executado e o que depende de teste manual no Studio. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
