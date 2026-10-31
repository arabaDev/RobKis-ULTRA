---
name: sec-dupe-prevention
description: "Prevenção de duplicação de itens em troca, salvamento e teleporte."
metadata:
  id: SK-08-07
  department: "Segurança cliente-servidor"
  version: "1.0"
  revised: "2026-10-18"
---

# sec-dupe-prevention

Prevenção de duplicação de itens em troca, salvamento e teleporte.

**Quando usar:** Trocas, entregas e transferência entre servidores.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Operações de transferência são atômicas e registradas.
- Use UpdateAsync para mover entre donos.
- Bloqueie o item durante a transação.

**Verificação:** Fechar o jogo no meio da troca não duplica nem perde o item.

**Complementares (sugeridas por similaridade):** `mcp-redundant-call-prevention`, `mcp-write-conflict-prevention`, `net-teleport-service`

**Limites e recuperação:** Nenhuma defesa é absoluta; combine camadas e registre tentativas suspeitas. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
