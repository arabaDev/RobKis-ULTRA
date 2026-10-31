---
name: rec-retry-policy
description: "Política de novas tentativas com limite, espera crescente e operações seguras."
metadata:
  id: SK-38-01
  department: "Recuperação de falhas"
  version: "1.0"
  revised: "2026-10-18"
---

# rec-retry-policy

Política de novas tentativas com limite, espera crescente e operações seguras.

**Quando usar:** Falhas temporárias.

**Regras**
- Repita só operações seguras de repetir, como leituras e escritas idempotentes.
- Limite o número de tentativas e aumente a espera a cada uma.
- Registre cada falha com o erro completo.
- Depois do limite, mude de abordagem em vez de insistir.

**Verificação:** A operação termina em sucesso ou em falha tratada, nunca em loop.

**Complementares (sugeridas por similaridade):** `data-retry-backoff`, `orch-escalation-rules`, `perf-debris-cleanup`

**Limites e recuperação:** Tentativas sempre limitadas; nunca em loop. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
