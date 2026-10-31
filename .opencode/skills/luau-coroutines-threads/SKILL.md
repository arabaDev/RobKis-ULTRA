---
name: luau-coroutines-threads
description: "Coroutines, threads do scheduler e propagação de erros."
metadata:
  id: SK-02-09
  department: "Programação Luau"
  version: "1.0"
  revised: "2026-10-18"
---

# luau-coroutines-threads

Coroutines, threads do scheduler e propagação de erros.

**Quando usar:** Ao usar coroutine.wrap ou entender por que um erro sumiu.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Prefira task.spawn a coroutine.create para rodar código em paralelo lógico.
- Erro dentro de task.spawn é impresso e não chega ao chamador.
- coroutine.wrap propaga o erro ao retomar; trate com pcall.

**Verificação:** Um erro forçado na thread aparece no Output e não trava o resto.

**Complementares (sugeridas por similaridade):** `luau-error-handling`, `exp-failed-export-triage`, `doc-api-reference`

**Limites e recuperação:** Confirme APIs e sintaxe na documentação oficial atual antes de usar recursos novos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
