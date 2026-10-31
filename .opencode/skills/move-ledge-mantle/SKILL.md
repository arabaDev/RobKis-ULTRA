---
name: move-ledge-mantle
description: "Subir bordas (mantle) por raycasts de altura e tween curto, para parkour."
metadata:
  id: SK-41-11
  department: "Gameplay e sistemas de movimento"
  version: "1.0"
  revised: "2026-10-18"
---

# move-ledge-mantle

Subir bordas (mantle) por raycasts de altura e tween curto, para parkour.

**Quando usar:** Parkour.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Raycasts de altura detectam a borda.
- O movimento é um tween curto.
- Cancele se não houver espaço livre.

**Verificação:** O personagem sobe bordas válidas e ignora as inválidas.

**Complementares (sugeridas por similaridade):** `move-wall-climb`, `model-hard-surface`, `proc-terrain-heightmaps`

**Limites e recuperação:** Movimento depende de latência e propriedade de rede; teste com mais de um cliente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
