---
name: bug-read-stack
description: "Ler mensagens de erro e stacks completos."
metadata:
  id: SK-17-02
  department: "Diagnóstico de bugs"
  version: "1.0"
  revised: "2026-10-18"
---

# bug-read-stack

Ler mensagens de erro e stacks completos.

**Quando usar:** Qualquer erro no Output.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Anote script, linha e tipo.
- Siga a pilha até o ponto de origem.
- Não corrija pelo título.

**Verificação:** A causa aponta para uma linha específica.

**Complementares (sugeridas por similaridade):** `sec-sanitize-text`, `net-bandwidth-batching`, `bench-gameplay-metrics`

**Limites e recuperação:** Corrija a causa raiz; nunca remova funcionalidade para o teste passar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
