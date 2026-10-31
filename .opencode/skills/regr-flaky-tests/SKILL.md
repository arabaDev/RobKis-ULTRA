---
name: regr-flaky-tests
description: "Tratar testes instáveis que mudam de resultado sem alteração de código."
metadata:
  id: SK-36-10
  department: "Testes de regressão"
  version: "1.0"
  revised: "2026-10-18"
---

# regr-flaky-tests

Tratar testes instáveis que mudam de resultado sem alteração de código.

**Quando usar:** Resultados que mudam sem alteração.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Reexecute para confirmar.
- Procure dependência de tempo ou ordem.
- Corrija a causa.

**Verificação:** O teste é estável em várias execuções.

**Complementares (sugeridas por similaridade):** `review-tests`, `mcp-untrusted-content-handling`, `sec-exploit-resistant-ui`

**Limites e recuperação:** Compare sempre com um baseline registrado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
