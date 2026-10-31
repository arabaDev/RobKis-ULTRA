---
name: game-checkpoints
description: "Checkpoints com persistência opcional."
metadata:
  id: SK-42-07
  department: "Sistemas completos de jogo"
  version: "1.0"
  revised: "2026-10-18"
---

# game-checkpoints

Checkpoints com persistência opcional.

**Quando usar:** Obbies e fases.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Cada checkpoint tem ordem e ponto de respawn.
- Só avance, nunca retroceda ao tocar um anterior.
- Salve o último se houver persistência.

**Verificação:** Renascer leva ao último checkpoint válido.

**Complementares (sugeridas por similaridade):** `move-dash-roll`, `ai-boss-patterns`, `inv-persistence`

**Limites e recuperação:** Sistemas completos tocam dados salvos e economia; valide segurança e persistência antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
