---
name: orch-skill-search-protocol
description: "Protocolo de busca de skills sem carregar todas."
metadata:
  id: SK-35-12
  department: "Orquestração e roteamento"
  version: "1.0"
  revised: "2026-10-18"
---

# orch-skill-search-protocol

Protocolo de busca de skills sem carregar todas.

**Quando usar:** Quando há muitas skills disponíveis.

**Regras**
- Rode python scripts/skill_search.py com palavras-chave.
- Leia o SKILL.md das melhores.
- Não carregue em massa.

**Verificação:** Menos de cinco skills lidas por tarefa.

**Complementares (sugeridas por similaridade):** `arq-extensibility-patterns`, `ai-utility-scoring`, `ai-behavior-trees`

**Limites e recuperação:** Use o mínimo de agentes e skills; sem subagentes reais, siga em sequência. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
