---
name: orch-subtask-splitting
description: "Dividir uma tarefa em subtarefas com entrada, saída e teste próprios."
metadata:
  id: SK-35-02
  department: "Orquestração e roteamento"
  version: "1.0"
  revised: "2026-10-18"
---

# orch-subtask-splitting

Dividir uma tarefa em subtarefas com entrada, saída e teste próprios.

**Quando usar:** Sistemas com várias partes.

**Regras**
- Cada subtarefa tem entrada, saída esperada e teste verificável.
- Defina as interfaces entre elas antes de começar.
- Subtarefas independentes não compartilham arquivos.
- Ordene as dependentes e execute em paralelo as independentes.

**Verificação:** Cada subtarefa pode ser verificada sozinha e as interfaces estão escritas.

**Complementares (sugeridas por similaridade):** `test-performance-smoke`, `orch-report-compaction`, `combat-hit-dedup`

**Limites e recuperação:** Use o mínimo de agentes e skills; sem subagentes reais, siga em sequência. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
