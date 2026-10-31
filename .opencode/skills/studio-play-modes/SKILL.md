---
name: studio-play-modes
description: "Diferenças entre Play, Run e Test com servidor e clientes locais."
metadata:
  id: SK-03-02
  department: "Roblox Studio"
  version: "1.0"
  revised: "2026-10-18"
---

# studio-play-modes

Diferenças entre Play, Run e Test com servidor e clientes locais.

**Quando usar:** Ao testar replicação e lógica cliente-servidor.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Play simula um jogador; Run roda só o servidor, sem personagem.
- O teste com servidor local e vários clientes mostra problemas de replicação.
- Alterne a vista de cliente e servidor ao conferir o Workspace.

**Verificação:** A funcionalidade foi vista no modo que realmente a exercita.

**Complementares (sugeridas por similaridade):** `test-multiplayer-local-server`, `light-technology-modes`, `bug-replication-desync`

**Limites e recuperação:** Ações no Studio exigem o Studio aberto; sem MCP, entregue passos manuais exatos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
