---
name: game-round-manager
description: "Gerenciador de rodadas com estados e pontuação."
metadata:
  id: SK-42-04
  department: "Sistemas completos de jogo"
  version: "1.0"
  revised: "2026-10-18"
---

# game-round-manager

Gerenciador de rodadas com estados e pontuação.

**Quando usar:** Partidas com início e fim.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Estados Intermission, Playing e Ending.
- Condições de vitória verificadas no servidor.
- Limpeza e reinício completos.

**Verificação:** Várias rodadas seguidas começam do estado limpo.

**Complementares (sugeridas por similaridade):** `arq-game-loop-design`, `studio-asset-manager`, `orch-result-consolidation`

**Limites e recuperação:** Sistemas completos tocam dados salvos e economia; valide segurança e persistência antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
