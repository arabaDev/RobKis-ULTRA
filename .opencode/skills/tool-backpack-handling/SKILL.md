---
name: tool-backpack-handling
description: "Backpack, StarterPack e StarterGear."
metadata:
  id: SK-05-05
  department: "Ferramentas e armas"
  version: "1.0"
  revised: "2026-10-18"
---

# tool-backpack-handling

Backpack, StarterPack e StarterGear.

**Quando usar:** Ao dar, tirar ou persistir ferramentas.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- StarterPack entrega no respawn; StarterGear mantém itens entre respawns.
- Dar ferramenta em runtime: clonar e colocar Parent no Backpack.
- Controle quantidade e duplicatas.

**Verificação:** Respawn não duplica nem perde a ferramenta.

**Complementares (sugeridas por similaridade):** `mcp-untrusted-content-handling`, `bpy-error-handling-verify`, `game-respawn-handling`

**Limites e recuperação:** Confirme se o jogo usa R6, R15 ou rigs próprios antes de ajustar empunhadura. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
