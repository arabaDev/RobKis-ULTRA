---
name: orch-parallel-safety
description: "Paralelismo seguro: só tarefas sem arquivos em comum, nunca duas escritas no mesmo arquivo."
metadata:
  id: SK-35-05
  department: "Orquestração e roteamento"
  version: "1.0"
  revised: "2026-10-18"
---

# orch-parallel-safety

Paralelismo seguro: só tarefas sem arquivos em comum, nunca duas escritas no mesmo arquivo.

**Quando usar:** Várias tarefas independentes.

**Regras**
- Só tarefas sem arquivos em comum.
- Nunca duas escritas no mesmo arquivo.
- Consolide ao fim.

**Verificação:** Sem conflito de escrita.

**Complementares (sugeridas por similaridade):** `mcp-write-conflict-prevention`, `dep-removal-safety`, `mcp-permissions-safety`

**Limites e recuperação:** Use o mínimo de agentes e skills; sem subagentes reais, siga em sequência. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
