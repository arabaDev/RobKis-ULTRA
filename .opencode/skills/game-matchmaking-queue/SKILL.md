---
name: game-matchmaking-queue
description: "Fila de partidas e formação de grupos."
metadata:
  id: SK-42-03
  department: "Sistemas completos de jogo"
  version: "1.0"
  revised: "2026-10-18"
---

# game-matchmaking-queue

Fila de partidas e formação de grupos.

**Quando usar:** Jogos competitivos ou cooperativos.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Fila no servidor ou no MemoryStore para vários servidores.
- Critérios simples como tamanho e nível.
- Timeout e cancelamento.

**Verificação:** Os grupos se formam e quem sai da fila é removido.

**Complementares (sugeridas por similaridade):** `ai-group-coordination`, `sec-anti-speed-fly`, `arq-game-loop-design`

**Limites e recuperação:** Sistemas completos tocam dados salvos e economia; valide segurança e persistência antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
