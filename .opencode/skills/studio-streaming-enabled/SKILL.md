---
name: studio-streaming-enabled
description: "Configuração de StreamingEnabled e modos de streaming de modelos."
metadata:
  id: SK-03-08
  department: "Roblox Studio"
  version: "1.0"
  revised: "2026-10-18"
---

# studio-streaming-enabled

Configuração de StreamingEnabled e modos de streaming de modelos.

**Quando usar:** Em mapas grandes ou projetos para mobile.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Ajuste raio de streaming e ModelStreamingMode conforme a importância do modelo.
- Código cliente deve esperar por objetos que podem não ter chegado.
- Não assuma que todo o Workspace existe no cliente.

**Verificação:** Jogar com streaming ligado não gera erros de objeto nil.

**Complementares (sugeridas por similaridade):** `npc-streaming-considerations`, `perf-streaming-tuning`, `net-streaming-replication`

**Limites e recuperação:** Ações no Studio exigem o Studio aberto; sem MCP, entregue passos manuais exatos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
