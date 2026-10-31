---
name: rec-strategy-switching
description: "Mudar de abordagem após falhas."
metadata:
  id: SK-38-10
  department: "Recuperação de falhas"
  version: "1.0"
  revised: "2026-10-18"
---

# rec-strategy-switching

Mudar de abordagem após falhas.

**Quando usar:** A mesma tentativa falhou duas vezes.

**Regras**
- Pare de repetir.
- Reanalise a causa.
- Escolha outro caminho.

**Verificação:** A nova abordagem foi tentada.

**Complementares (sugeridas por similaridade):** `phys-anchoring-strategy`, `regr-data-compat`, `orch-escalation-rules`

**Limites e recuperação:** Tentativas sempre limitadas; nunca em loop. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
