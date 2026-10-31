---
name: rec-checkpointing
description: "Pontos de controle em tarefas longas."
metadata:
  id: SK-38-05
  department: "Recuperação de falhas"
  version: "1.0"
  revised: "2026-10-18"
---

# rec-checkpointing

Pontos de controle em tarefas longas.

**Quando usar:** Trabalho de várias etapas.

**Regras**
- Salve o estado após cada etapa verificada.
- Registre o que falta.
- Retome do último ponto.

**Verificação:** Retomar não repete o que já funcionou.

**Complementares (sugeridas por similaridade):** `orch-incremental-verification`, `orch-parallel-safety`, `rec-timeout-handling`

**Limites e recuperação:** Tentativas sempre limitadas; nunca em loop. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
