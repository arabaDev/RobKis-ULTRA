---
name: net-teleport-service
description: "TeleportService: TeleportAsync, dados de teleporte e servidores reservados."
metadata:
  id: SK-07-12
  department: "Multiplayer e replicação"
  version: "1.0"
  revised: "2026-10-18"
---

# net-teleport-service

TeleportService: TeleportAsync, dados de teleporte e servidores reservados.

**Quando usar:** Mudar de lugar ou de servidor.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- TeleportAsync dentro de pcall, pois pode falhar.
- Dados de teleporte são enviados pelo cliente; valide.
- Servidores reservados para partidas privadas.

**Verificação:** Falha de teleporte é tratada com mensagem e nova tentativa limitada.

**Complementares (sugeridas por similaridade):** `arq-service-layering`, `ai-pathfinding-service`, `dep-service-order`

**Limites e recuperação:** Limites de rede mudam; confirme na documentação atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
