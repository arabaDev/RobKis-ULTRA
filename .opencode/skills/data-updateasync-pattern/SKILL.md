---
name: data-updateasync-pattern
description: "UpdateAsync para leitura e escrita atômicas."
metadata:
  id: SK-15-03
  department: "DataStore e persistência"
  version: "1.0"
  revised: "2026-10-18"
---

# data-updateasync-pattern

UpdateAsync para leitura e escrita atômicas.

**Quando usar:** Alterações que dependem do valor anterior.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- A função recebe o valor atual e retorna o novo.
- Retorne nil para cancelar a alteração.
- Evite yield dentro da função.

**Verificação:** Duas alterações concorrentes não se perdem.

**Complementares (sugeridas por similaridade):** `rec-state-rollback`, `bug-race-conditions`, `dep-service-order`

**Limites e recuperação:** Limites e orçamentos mudam; confirme na documentação atual e nunca teste em dados reais. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
