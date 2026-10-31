---
name: combat-fire-rate
description: "Cadência de tiro e controle de disparo automático."
metadata:
  id: SK-04-14
  department: "Sistemas de combate"
  version: "1.0"
  revised: "2026-10-18"
---

# combat-fire-rate

Cadência de tiro e controle de disparo automático.

**Quando usar:** Armas automáticas, semiautomáticas e de rajada.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- O intervalo mínimo entre disparos vem de config e é validado no servidor.
- Automático dispara por tempo acumulado, não por frame.
- Rajada conta como uma ação com número fixo de tiros.

**Verificação:** Segurar o botão por 10 segundos gera o número de tiros esperado pela cadência.

**Complementares (sugeridas por similaridade):** `sec-rate-limit-implementation`, `secan-rate-abuse`, `combat-hitbox-raycast`

**Limites e recuperação:** Valores de balanceamento são ponto de partida; ajuste por teste de jogo. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
