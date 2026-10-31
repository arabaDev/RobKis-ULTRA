---
name: data-ordered-leaderboards
description: "OrderedDataStore: valores inteiros ordenados."
metadata:
  id: SK-15-08
  department: "DataStore e persistência"
  version: "1.0"
  revised: "2026-10-18"
---

# data-ordered-leaderboards

OrderedDataStore: valores inteiros ordenados.

**Quando usar:** Placares e rankings.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Só inteiros.
- GetSortedAsync por páginas.
- Atualize com intervalo.

**Verificação:** O ranking retorna na ordem correta.

**Complementares (sugeridas por similaridade):** `eco-leaderboards`, `data-schema-versioning`, `luau-semantics-pitfalls`

**Limites e recuperação:** Limites e orçamentos mudam; confirme na documentação atual e nunca teste em dados reais. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
