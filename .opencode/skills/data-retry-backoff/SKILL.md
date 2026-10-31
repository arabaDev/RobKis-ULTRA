---
name: data-retry-backoff
description: "Tentativas com espera crescente para DataStore."
metadata:
  id: SK-15-04
  department: "DataStore e persistência"
  version: "1.0"
  revised: "2026-10-18"
---

# data-retry-backoff

Tentativas com espera crescente para DataStore.

**Quando usar:** Falhas temporárias.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- pcall em cada chamada.
- Número máximo de tentativas.
- Espera crescente com task.wait.

**Verificação:** Falha persistente termina com erro tratado.

**Complementares (sugeridas por similaridade):** `rec-retry-policy`, `orch-escalation-rules`, `bug-datastore-failures`

**Limites e recuperação:** Limites e orçamentos mudam; confirme na documentação atual e nunca teste em dados reais. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
