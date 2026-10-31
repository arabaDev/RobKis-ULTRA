---
name: rec-fallback-strategies
description: "Alternativas quando o plano principal falha."
metadata:
  id: SK-38-03
  department: "Recuperação de falhas"
  version: "1.0"
  revised: "2026-10-18"
---

# rec-fallback-strategies

Alternativas quando o plano principal falha.

**Quando usar:** Ferramentas ou etapas indisponíveis.

**Regras**
- Tenha uma opção B real.
- Diga a limitação.
- Não simule resultados.

**Verificação:** O usuário recebe uma alternativa utilizável.

**Complementares (sugeridas por similaridade):** `mcp-fallback-manual`, `mcp-error-triage`, `test-datastore-offline`

**Limites e recuperação:** Tentativas sempre limitadas; nunca em loop. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
