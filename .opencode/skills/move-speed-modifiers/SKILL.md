---
name: move-speed-modifiers
description: "Empilhamento de modificadores de velocidade."
metadata:
  id: SK-41-13
  department: "Gameplay e sistemas de movimento"
  version: "1.0"
  revised: "2026-10-18"
---

# move-speed-modifiers

Empilhamento de modificadores de velocidade.

**Quando usar:** Buffs, debuffs e terreno atuando juntos.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Mantenha a lista de modificadores, não só o valor final.
- Recalcule WalkSpeed a partir da base.
- Defina regras de empilhamento.

**Verificação:** Remover um modificador devolve a velocidade correta.

**Complementares (sugeridas por similaridade):** `bpy-modifiers-api`, `anim-looping-speed`, `move-humanoid-speed-jump`

**Limites e recuperação:** Movimento depende de latência e propriedade de rede; teste com mais de um cliente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
