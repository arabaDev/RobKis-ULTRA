---
name: doc-test-reports
description: "Relatório de testes separando o que passou, falhou e não foi testado."
metadata:
  id: SK-33-11
  department: "Documentação técnica"
  version: "1.0"
  revised: "2026-10-18"
---

# doc-test-reports

Relatório de testes separando o que passou, falhou e não foi testado.

**Quando usar:** Fim de tarefas.

**Regras**
- O que foi testado.
- O que passou e o que falhou.
- O que não foi testado.

**Verificação:** O relatório distingue evidência de suposição.

**Complementares (sugeridas por similaridade):** `orch-obsolete-task-cancellation`, `mcp-operation-audit-log`, `orch-escalation-rules`

**Limites e recuperação:** Documente só o que é verdade no código atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
