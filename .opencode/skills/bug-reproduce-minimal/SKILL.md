---
name: bug-reproduce-minimal
description: "Reproduzir o bug com a menor entrada possível."
metadata:
  id: SK-17-01
  department: "Diagnóstico de bugs"
  version: "1.0"
  revised: "2026-10-18"
---

# bug-reproduce-minimal

Reproduzir o bug com a menor entrada possível.

**Quando usar:** Início de toda investigação.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Reduza a cena e o código até o erro continuar.
- Registre os passos.
- Verifique se é constante ou intermitente.

**Verificação:** Os passos reproduzem o bug de forma repetida.

**Complementares (sugeridas por similaridade):** `bug-log-instrumentation`, `mcp-batching-calls`, `orch-subtask-splitting`

**Limites e recuperação:** Corrija a causa raiz; nunca remova funcionalidade para o teste passar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
