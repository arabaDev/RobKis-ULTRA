---
name: npc-path-following
description: "Seguir caminhos com PathfindingService e Humanoid:MoveTo."
metadata:
  id: SK-11-03
  department: "Personagens e NPCs"
  version: "1.0"
  revised: "2026-10-18"
---

# npc-path-following

Seguir caminhos com PathfindingService e Humanoid:MoveTo.

**Quando usar:** NPCs que andam até um alvo.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- PathfindingService:CreatePath com parâmetros do agente.
- path:ComputeAsync e GetWaypoints; confira o Status.
- Recalcule se o caminho for bloqueado.

**Verificação:** O NPC chega ao destino ou desiste com tratamento de falha.

**Complementares (sugeridas por similaridade):** `npc-aggro-targeting`, `npc-character-spawning`, `pipe-texture-upload-workflow`

**Limites e recuperação:** Teste com vários NPCs e jogadores, não só um. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
