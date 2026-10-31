---
name: bug-bisect-regressions
description: "Bisseção para achar a mudança que quebrou algo."
metadata:
  id: SK-17-11
  department: "Diagnóstico de bugs"
  version: "1.0"
  revised: "2026-10-18"
---

# bug-bisect-regressions

Bisseção para achar a mudança que quebrou algo.

**Quando usar:** Algo que funcionava deixou de funcionar.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Divida o histórico de mudanças ao meio.
- Teste cada ponto.
- Isole a mudança responsável.

**Verificação:** A mudança causadora foi identificada.

**Complementares (sugeridas por similaridade):** `regr-bisect`, `review-regressions`, `rec-state-rollback`

**Limites e recuperação:** Corrija a causa raiz; nunca remova funcionalidade para o teste passar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
