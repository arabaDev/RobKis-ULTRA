---
name: combat-shapecast
description: "Blockcast e Spherecast para hitboxes grossas em movimento."
metadata:
  id: SK-04-03
  department: "Sistemas de combate"
  version: "1.0"
  revised: "2026-10-18"
---

# combat-shapecast

Blockcast e Spherecast para hitboxes grossas em movimento.

**Quando usar:** Projéteis largos ou golpes que varrem espaço.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- WorldRoot:Blockcast e Spherecast varrem um volume ao longo de uma direção.
- Útil para evitar atravessar alvos finos em alta velocidade.
- Use as mesmas RaycastParams para filtro.

**Verificação:** Um projétil rápido não atravessa um alvo fino em teste.

**Complementares (sugeridas por similaridade):** `anim3d-root-motion`, `combat-knockback`, `perf-object-pooling`

**Limites e recuperação:** Valores de balanceamento são ponto de partida; ajuste por teste de jogo. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
