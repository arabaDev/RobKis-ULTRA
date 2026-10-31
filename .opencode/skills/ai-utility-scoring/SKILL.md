---
name: ai-utility-scoring
description: "IA de utilidade: pontua ações e escolhe a melhor."
metadata:
  id: SK-12-06
  department: "Inteligência artificial para jogos"
  version: "1.0"
  revised: "2026-10-18"
---

# ai-utility-scoring

IA de utilidade: pontua ações e escolhe a melhor.

**Quando usar:** Comportamento flexível sem muitas regras fixas.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Cada ação recebe nota a partir de fatores normalizados.
- Escolha a maior, com pequena histerese para não oscilar.
- Pesos em config.

**Verificação:** As escolhas são estáveis, sem trocar de ação a cada frame.

**Complementares (sugeridas por similaridade):** `arq-extensibility-patterns`, `ai-behavior-trees`, `orch-skill-search-protocol`

**Limites e recuperação:** Meça o custo de CPU da IA antes de aumentar a complexidade. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
