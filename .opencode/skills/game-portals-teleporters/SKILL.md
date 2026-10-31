---
name: game-portals-teleporters
description: "Portais dentro do mesmo lugar e entre lugares."
metadata:
  id: SK-42-08
  department: "Sistemas completos de jogo"
  version: "1.0"
  revised: "2026-10-18"
---

# game-portals-teleporters

Portais dentro do mesmo lugar e entre lugares.

**Quando usar:** Atalhos e mudança de mapa.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- No mesmo servidor use PivotTo no personagem com cooldown.
- Entre lugares use TeleportService dentro de pcall.
- Valide o destino.

**Verificação:** O jogador chega ao destino e não fica em loop de portal.

**Complementares (sugeridas por similaridade):** `regr-bisect`, `regr-network-contracts`, `anim3d-validation-in-studio`

**Limites e recuperação:** Sistemas completos tocam dados salvos e economia; valide segurança e persistência antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
