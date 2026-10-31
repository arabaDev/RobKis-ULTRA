---
name: combat-knockback
description: "Empurrão com impulso físico respeitando propriedade de rede."
metadata:
  id: SK-04-12
  department: "Sistemas de combate"
  version: "1.0"
  revised: "2026-10-18"
---

# combat-knockback

Empurrão com impulso físico respeitando propriedade de rede.

**Quando usar:** Golpes que empurram o alvo.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- BasePart:ApplyImpulse ou LinearVelocity com tempo curto.
- Considere o dono de rede da parte; personagens costumam ser do cliente.
- Limite a magnitude para não lançar o alvo para fora do mapa.

**Verificação:** O empurrão tem o mesmo efeito para quem acerta e para quem é atingido.

**Complementares (sugeridas por similaridade):** `npc-network-ownership`, `phys-vehicles`, `phys-network-ownership`

**Limites e recuperação:** Valores de balanceamento são ponto de partida; ajuste por teste de jogo. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
