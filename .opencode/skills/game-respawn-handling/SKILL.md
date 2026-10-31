---
name: game-respawn-handling
description: "Respawn controlado: tempo, local e estado."
metadata:
  id: SK-42-06
  department: "Sistemas completos de jogo"
  version: "1.0"
  revised: "2026-10-18"
---

# game-respawn-handling

Respawn controlado: tempo, local e estado.

**Quando usar:** Mortes e retorno ao jogo.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Players.RespawnTime e CharacterAutoLoads definem o fluxo.
- Local por checkpoint ou por time.
- Restaure ferramentas e estado conforme a regra.

**Verificação:** O jogador volta no local e com o equipamento corretos.

**Complementares (sugeridas por similaridade):** `tool-respawn-cleanup`, `rec-timeout-handling`, `bpy-error-handling-verify`

**Limites e recuperação:** Sistemas completos tocam dados salvos e economia; valide segurança e persistência antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
