---
name: move-wall-climb
description: "Escalada de paredes por detecção e movimento controlado."
metadata:
  id: SK-41-06
  department: "Gameplay e sistemas de movimento"
  version: "1.0"
  revised: "2026-10-18"
---

# move-wall-climb

Escalada de paredes por detecção e movimento controlado.

**Quando usar:** Parkour e exploração.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Um raycast frontal detecta a superfície escalável.
- O estado de escalada bloqueia a gravidade e define a velocidade.
- Saia ao fim da parede ou sem estamina.

**Verificação:** O personagem escala e solta sem ficar preso.

**Complementares (sugeridas por similaridade):** `move-ledge-mantle`, `combat-hitbox-raycast`, `fx-footstep-sounds`

**Limites e recuperação:** Movimento depende de latência e propriedade de rede; teste com mais de um cliente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
