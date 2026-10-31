---
name: phys-touched-pitfalls
description: "Armadilhas do evento Touched e alternativas."
metadata:
  id: SK-06-10
  department: "Física e colisões"
  version: "1.0"
  revised: "2026-10-18"
---

# phys-touched-pitfalls

Armadilhas do evento Touched e alternativas.

**Quando usar:** Gatilhos de dano, coleta e checkpoints.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Touched dispara várias vezes e com qualquer parte.
- Debounce por alvo e confirme que é um personagem.
- Prefira consultas espaciais ou ProximityPrompt quando possível.

**Verificação:** O gatilho dispara uma vez por entrada, não por frame.

**Complementares (sugeridas por similaridade):** `luau-semantics-pitfalls`, `combat-hit-dedup`, `anim3d-markers`

**Limites e recuperação:** Física varia com latência e propriedade de rede; teste com mais de um cliente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
