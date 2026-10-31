---
name: combat-hitbox-raycast
description: "Detecção de acerto por raycast no servidor com RaycastParams."
metadata:
  id: SK-04-01
  department: "Sistemas de combate"
  version: "1.0"
  revised: "2026-10-18"
---

# combat-hitbox-raycast

Detecção de acerto por raycast no servidor com RaycastParams.

**Quando usar:** Armas de tiro e golpes lineares.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- workspace:Raycast com RaycastParams e FilterType Exclude, ignorando o atacante.
- Resolva o Humanoid pelo ancestral Model do Instance atingido.
- Alcance e direção calculados no servidor a partir do personagem.

**Verificação:** Acertar, errar e acertar parede estão cobertos em teste.

**Complementares (sugeridas por similaridade):** `combat-hitbox-overlap`, `phys-raycast-filtering`, `combat-hitscan-weapons`

**Limites e recuperação:** Valores de balanceamento são ponto de partida; ajuste por teste de jogo. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
