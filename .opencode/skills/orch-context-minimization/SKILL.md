---
name: orch-context-minimization
description: "Contexto mínimo por tarefa."
metadata:
  id: SK-35-10
  department: "Orquestração e roteamento"
  version: "1.0"
  revised: "2026-10-18"
---

# orch-context-minimization

Contexto mínimo por tarefa.

**Quando usar:** Reduzir custo e ruído.

**Regras**
- Passe só o necessário.
- Leia trechos, não arquivos inteiros.
- Resuma o estado.

**Verificação:** Contexto pequeno e suficiente.

**Complementares (sugeridas por similaridade):** `bpy-context-overrides`, `bpy-instances`, `ui-update-optimization`

**Limites e recuperação:** Use o mínimo de agentes e skills; sem subagentes reais, siga em sequência. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
