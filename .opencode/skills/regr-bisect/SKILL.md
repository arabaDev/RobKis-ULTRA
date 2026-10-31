---
name: regr-bisect
description: "Bisseção para achar qual mudança causou uma regressão entre duas versões."
metadata:
  id: SK-36-11
  department: "Testes de regressão"
  version: "1.0"
  revised: "2026-10-18"
---

# regr-bisect

Bisseção para achar qual mudança causou uma regressão entre duas versões.

**Quando usar:** Algo quebrou entre duas versões.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Teste o ponto médio.
- Reduza o intervalo.
- Isole a mudança.

**Verificação:** A mudança culpada foi encontrada.

**Complementares (sugeridas por similaridade):** `bug-bisect-regressions`, `vcs-rollback-recovery`, `rec-state-rollback`

**Limites e recuperação:** Compare sempre com um baseline registrado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
