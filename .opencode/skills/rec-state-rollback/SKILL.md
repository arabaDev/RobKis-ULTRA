---
name: rec-state-rollback
description: "Reverter para um estado anterior bom."
metadata:
  id: SK-38-04
  department: "Recuperação de falhas"
  version: "1.0"
  revised: "2026-10-18"
---

# rec-state-rollback

Reverter para um estado anterior bom.

**Quando usar:** Uma alteração deixou algo quebrado.

**Regras**
- Tenha um ponto de retorno.
- Reverter só a parte afetada.
- Verificar depois.

**Verificação:** O estado bom foi restaurado.

**Complementares (sugeridas por similaridade):** `vcs-rollback-recovery`, `mcp-state-verification`, `arq-state-management`

**Limites e recuperação:** Tentativas sempre limitadas; nunca em loop. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
