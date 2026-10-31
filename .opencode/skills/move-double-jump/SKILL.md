---
name: move-double-jump
description: "Pulo duplo com detecção de estado."
metadata:
  id: SK-41-04
  department: "Gameplay e sistemas de movimento"
  version: "1.0"
  revised: "2026-10-18"
---

# move-double-jump

Pulo duplo com detecção de estado.

**Quando usar:** Plataformas e ação.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Detecte o estado Freefall e o pedido de salto.
- Limite os saltos extras por pouso.
- Valide no servidor se importar para jogo competitivo.

**Verificação:** Só ocorre o número de saltos permitido.

**Complementares (sugeridas por similaridade):** `move-humanoid-speed-jump`, `move-slide`, `combat-hitbox-raycast`

**Limites e recuperação:** Movimento depende de latência e propriedade de rede; teste com mais de um cliente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
