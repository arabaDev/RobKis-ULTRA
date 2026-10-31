---
name: combat-lag-compensation
description: "Tolerância a latência sem abrir brechas de exploit."
metadata:
  id: SK-04-10
  department: "Sistemas de combate"
  version: "1.0"
  revised: "2026-10-18"
---

# combat-lag-compensation

Tolerância a latência sem abrir brechas de exploit.

**Quando usar:** Quando o acerto parece falhar para jogadores com ping alto.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Margem pequena e fixa de distância, nunca ilimitada.
- Previsão visual no cliente; decisão final no servidor.
- Registre posições recentes só se for realmente necessário.

**Verificação:** Teste com latência simulada ainda rejeita acertos impossíveis.

**Complementares (sugeridas por similaridade):** `net-latency-jitter`, `perf-network-cost`, `rec-safe-abort`

**Limites e recuperação:** Valores de balanceamento são ponto de partida; ajuste por teste de jogo. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
