---
name: ai-perception-sight
description: "Visão da IA com cone, distância e raycast."
metadata:
  id: SK-12-04
  department: "Inteligência artificial para jogos"
  version: "1.0"
  revised: "2026-10-18"
---

# ai-perception-sight

Visão da IA com cone, distância e raycast.

**Quando usar:** Detectar jogadores sem ver através de paredes.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Ângulo por produto escalar entre frente e direção ao alvo.
- Raycast confirma linha de visão.
- Distância máxima em config.

**Verificação:** O NPC não detecta atrás de parede nem fora do cone.

**Complementares (sugeridas por similaridade):** `npc-aggro-targeting`, `sec-distance-sanity-checks`, `fx-ambient-loops`

**Limites e recuperação:** Meça o custo de CPU da IA antes de aumentar a complexidade. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
