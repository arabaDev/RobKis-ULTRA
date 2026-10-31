---
name: regr-golden-outputs
description: "Saídas de referência para funções determinísticas, comparadas a cada mudança."
metadata:
  id: SK-36-04
  department: "Testes de regressão"
  version: "1.0"
  revised: "2026-10-18"
---

# regr-golden-outputs

Saídas de referência para funções determinísticas, comparadas a cada mudança.

**Quando usar:** Funções com resultado determinístico.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Entradas fixas.
- Saída esperada guardada.
- Compare.

**Verificação:** A saída bate com a referência.

**Complementares (sugeridas por similaridade):** `regr-smoke-suite`, `arq-api-contracts`, `doc-api-reference`

**Limites e recuperação:** Compare sempre com um baseline registrado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
