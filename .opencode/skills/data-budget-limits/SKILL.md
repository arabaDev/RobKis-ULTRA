---
name: data-budget-limits
description: "Limites de requisições e de tamanho do DataStore."
metadata:
  id: SK-15-06
  department: "DataStore e persistência"
  version: "1.0"
  revised: "2026-10-18"
---

# data-budget-limits

Limites de requisições e de tamanho do DataStore.

**Quando usar:** Erros de limite ou dados grandes.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Cheque GetRequestBudgetForRequestType.
- Valor limitado a cerca de 4 MB e chave a 50 caracteres; confirme na doc atual.
- Junte dados em um registro por jogador.

**Verificação:** Nenhuma operação excede o orçamento.

**Complementares (sugeridas por similaridade):** `pipe-geometry-limits`, `rig-bone-limits`, `fx-performance-limits`

**Limites e recuperação:** Limites e orçamentos mudam; confirme na documentação atual e nunca teste em dados reais. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
