---
name: dep-impact-analysis
description: "Análise de impacto de mudanças."
metadata:
  id: SK-34-09
  department: "Análise de dependências"
  version: "1.0"
  revised: "2026-10-18"
---

# dep-impact-analysis

Análise de impacto de mudanças.

**Quando usar:** Antes de alterar algo compartilhado.

**Regras**
- Busque todos os usos.
- Estime o impacto.
- Planeje a verificação.

**Verificação:** Todos os usos foram checados.

**Complementares (sugeridas por similaridade):** `regr-diff-impact`, `luau-linting-formatting`, `regr-baseline-capture`

**Limites e recuperação:** Confirme com busca real; não presuma dependências. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
