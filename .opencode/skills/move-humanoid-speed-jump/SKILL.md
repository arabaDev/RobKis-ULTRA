---
name: move-humanoid-speed-jump
description: "Velocidade e salto do Humanoid: WalkSpeed e JumpHeight."
metadata:
  id: SK-41-01
  department: "Gameplay e sistemas de movimento"
  version: "1.0"
  revised: "2026-10-18"
---

# move-humanoid-speed-jump

Velocidade e salto do Humanoid: WalkSpeed e JumpHeight.

**Quando usar:** Qualquer ajuste de movimento.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Use Humanoid.WalkSpeed e JumpHeight (ou JumpPower com UseJumpPower ligado).
- Mantenha os valores em config.
- Alterações que importam partem do servidor, não do cliente.

**Verificação:** O personagem anda e salta com os valores definidos.

**Complementares (sugeridas por similaridade):** `npc-humanoid-states`, `anim-looping-speed`, `move-speed-modifiers`

**Limites e recuperação:** Movimento depende de latência e propriedade de rede; teste com mais de um cliente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
