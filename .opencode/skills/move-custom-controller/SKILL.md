---
name: move-custom-controller
description: "Controle de personagem personalizado sobre o PlayerModule."
metadata:
  id: SK-41-09
  department: "Gameplay e sistemas de movimento"
  version: "1.0"
  revised: "2026-10-18"
---

# move-custom-controller

Controle de personagem personalizado sobre o PlayerModule.

**Quando usar:** Movimento que foge do padrão.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Use o PlayerModule como base e substitua só o necessário.
- Entrada por ContextActionService.
- Mantenha a compatibilidade com toque e gamepad.

**Verificação:** O movimento funciona em teclado, toque e gamepad.

**Complementares (sugeridas por similaridade):** `move-custom-camera`, `anim-custom-rigs`, `bpy-custom-operators`

**Limites e recuperação:** Movimento depende de latência e propriedade de rede; teste com mais de um cliente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
