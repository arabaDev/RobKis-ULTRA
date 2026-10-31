---
name: ai-difficulty-scaling
description: "Escala de dificuldade por parâmetros de IA."
metadata:
  id: SK-12-09
  department: "Inteligência artificial para jogos"
  version: "1.0"
  revised: "2026-10-18"
---

# ai-difficulty-scaling

Escala de dificuldade por parâmetros de IA.

**Quando usar:** Níveis ou ondas progressivas.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Curva de dificuldade em config: vida, dano, reação.
- Evite somente inflar números.
- Teste com jogadores novos e experientes.

**Verificação:** A dificuldade sobe de forma gradual e mensurável.

**Complementares (sugeridas por similaridade):** `doc-api-reference`, `ai-pathfinding-service`, `arq-game-loop-design`

**Limites e recuperação:** Meça o custo de CPU da IA antes de aumentar a complexidade. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
