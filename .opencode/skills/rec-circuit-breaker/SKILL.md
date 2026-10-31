---
name: rec-circuit-breaker
description: "Interromper chamadas a um recurso que falha."
metadata:
  id: SK-38-02
  department: "Recuperação de falhas"
  version: "1.0"
  revised: "2026-10-18"
---

# rec-circuit-breaker

Interromper chamadas a um recurso que falha.

**Quando usar:** Serviço indisponível.

**Regras**
- Pare depois de falhas consecutivas.
- Verifique de novo após um intervalo.
- Use alternativa.

**Verificação:** Sem tempestade de chamadas.

**Complementares (sugeridas por similaridade):** `mcp-error-triage`, `luau-error-handling`, `mcp-argument-validation`

**Limites e recuperação:** Tentativas sempre limitadas; nunca em loop. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
