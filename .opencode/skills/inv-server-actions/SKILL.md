---
name: inv-server-actions
description: "Ações de inventário decididas no servidor."
metadata:
  id: SK-13-04
  department: "Sistemas de inventário"
  version: "1.0"
  revised: "2026-10-18"
---

# inv-server-actions

Ações de inventário decididas no servidor.

**Quando usar:** Adicionar, remover, mover e usar itens.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Cliente pede, servidor valida e executa.
- Cada ação retorna sucesso ou motivo da falha.
- Operações atômicas.

**Verificação:** Pedido inválido não altera o inventário.

**Complementares (sugeridas por similaridade):** `tool-server-validation`, `arq-client-server-boundary`, `net-server-movement-sanity`

**Limites e recuperação:** Toda ação de inventário é decidida no servidor. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
