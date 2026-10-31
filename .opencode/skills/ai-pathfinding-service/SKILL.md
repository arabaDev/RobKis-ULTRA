---
name: ai-pathfinding-service
description: "PathfindingService com parâmetros de agente, custos e modificadores."
metadata:
  id: SK-12-03
  department: "Inteligência artificial para jogos"
  version: "1.0"
  revised: "2026-10-18"
---

# ai-pathfinding-service

PathfindingService com parâmetros de agente, custos e modificadores.

**Quando usar:** Navegação em mapas complexos.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Parâmetros AgentRadius, AgentHeight, AgentCanJump e Costs em CreatePath.
- PathfindingModifier e PathfindingLink para áreas e saltos.
- Recalcule com frequência limitada.

**Verificação:** Navegação funciona em escadas, portas e obstáculos do mapa.

**Complementares (sugeridas por similaridade):** `arq-service-layering`, `dep-service-order`, `net-teleport-service`

**Limites e recuperação:** Meça o custo de CPU da IA antes de aumentar a complexidade. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
