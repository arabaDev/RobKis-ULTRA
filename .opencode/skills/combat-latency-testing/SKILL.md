---
name: combat-latency-testing
description: "Testes de combate com latência simulada."
metadata:
  id: SK-04-20
  department: "Sistemas de combate"
  version: "1.0"
  revised: "2026-10-18"
---

# combat-latency-testing

Testes de combate com latência simulada.

**Quando usar:** Antes de liberar combate multiplayer.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Simule atraso de rede com as opções de latência do Studio ou atraso artificial em teste.
- Teste acerto, cooldown e dano duplicado com ping alto.
- Compare com ping baixo.

**Verificação:** Os resultados com ping alto e baixo diferem dentro da tolerância definida.

**Complementares (sugeridas por similaridade):** `perf-low-end-testing`, `ui-usability-testing`, `net-latency-jitter`

**Limites e recuperação:** Valores de balanceamento são ponto de partida; ajuste por teste de jogo. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
