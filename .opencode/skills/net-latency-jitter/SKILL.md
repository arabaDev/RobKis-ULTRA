---
name: net-latency-jitter
description: "Lidar com latência variável (jitter) e perda de pacotes."
metadata:
  id: SK-07-15
  department: "Multiplayer e replicação"
  version: "1.0"
  revised: "2026-10-18"
---

# net-latency-jitter

Lidar com latência variável (jitter) e perda de pacotes.

**Quando usar:** Ações que falham só para alguns jogadores.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Meça o ping por jogador e registre as variações.
- Não valide com tempos fixos muito curtos.
- Interpole o estado exibido em vez de saltar.

**Verificação:** A mecânica funciona com atraso e variação simulados.

**Complementares (sugeridas por similaridade):** `net-latency-prediction`, `combat-latency-testing`, `mcp-latency-logging`

**Limites e recuperação:** Limites de rede mudam; confirme na documentação atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
