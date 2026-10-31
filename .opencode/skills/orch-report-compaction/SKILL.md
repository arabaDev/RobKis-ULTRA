---
name: orch-report-compaction
description: "Relatórios compactos com o essencial."
metadata:
  id: SK-35-18
  department: "Orquestração e roteamento"
  version: "1.0"
  revised: "2026-10-18"
---

# orch-report-compaction

Relatórios compactos com o essencial.

**Quando usar:** Fim de uma tarefa.

**Regras**
- Relate o que foi feito, os arquivos, os testes e as pendências.
- Use estados reais.
- Não repita informação.

**Verificação:** O relatório cabe em poucas linhas e é verificável.

**Complementares (sugeridas por similaridade):** `secan-audit-report-format`, `orch-subtask-splitting`, `orch-intent-routing`

**Limites e recuperação:** Use o mínimo de agentes e skills; sem subagentes reais, siga em sequência. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
