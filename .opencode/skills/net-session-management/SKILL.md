---
name: net-session-management
description: "Gerenciamento de sessões de jogador e de servidor."
metadata:
  id: SK-07-17
  department: "Multiplayer e replicação"
  version: "1.0"
  revised: "2026-10-18"
---

# net-session-management

Gerenciamento de sessões de jogador e de servidor.

**Quando usar:** Estado que vive enquanto o jogador está no servidor.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Crie o objeto de sessão em PlayerAdded e destrua em PlayerRemoving.
- Dados da sessão ficam em uma tabela dona, não espalhados.
- Salve antes de destruir.

**Verificação:** Entrar, sair e reentrar não deixa sessão antiga ativa.

**Complementares (sugeridas por similaridade):** `arq-state-management`, `data-session-locking`, `ui-state-management`

**Limites e recuperação:** Limites de rede mudam; confirme na documentação atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
