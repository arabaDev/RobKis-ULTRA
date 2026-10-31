---
name: bug-log-instrumentation
description: "Instrumentação de logs para depuração."
metadata:
  id: SK-17-12
  department: "Diagnóstico de bugs"
  version: "1.0"
  revised: "2026-10-18"
---

# bug-log-instrumentation

Instrumentação de logs para depuração.

**Quando usar:** Bug difícil de observar.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Logs com contexto e nível.
- Remova os temporários.
- Evite spam no Output.

**Verificação:** Os logs mostram o caminho até o erro.

**Complementares (sugeridas por similaridade):** `mcp-operation-audit-log`, `bug-reproduce-minimal`, `ai-behavior-trees`

**Limites e recuperação:** Corrija a causa raiz; nunca remova funcionalidade para o teste passar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
