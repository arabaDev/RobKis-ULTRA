---
name: move-slopes-floor
description: "Inclinação e superfícies: MaxSlopeAngle e FloorMaterial."
metadata:
  id: SK-41-08
  department: "Gameplay e sistemas de movimento"
  version: "1.0"
  revised: "2026-10-18"
---

# move-slopes-floor

Inclinação e superfícies: MaxSlopeAngle e FloorMaterial.

**Quando usar:** Terreno irregular.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Humanoid.MaxSlopeAngle limita a subida.
- FloorMaterial identifica o piso.
- Ajuste a velocidade por superfície em config.

**Verificação:** O personagem não sobe o que não deveria e muda de velocidade por piso.

**Complementares (sugeridas por similaridade):** `anim-procedural`, `model-hard-surface`, `phys-custom-properties`

**Limites e recuperação:** Movimento depende de latência e propriedade de rede; teste com mais de um cliente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
