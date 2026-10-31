---
name: npc-humanoid-states
description: "Estados do Humanoid e como controlá-los em NPCs."
metadata:
  id: SK-11-02
  department: "Personagens e NPCs"
  version: "1.0"
  revised: "2026-10-18"
---

# npc-humanoid-states

Estados do Humanoid e como controlá-los em NPCs.

**Quando usar:** Morte, queda e movimento do NPC.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Humanoid.Died para limpeza.
- Humanoid:ChangeState com Enum.HumanoidStateType.
- WalkSpeed e JumpPower em config.

**Verificação:** O NPC morre e é removido sem sobras.

**Complementares (sugeridas por similaridade):** `move-humanoid-speed-jump`, `npc-animations`, `phys-ragdoll`

**Limites e recuperação:** Teste com vários NPCs e jogadores, não só um. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
