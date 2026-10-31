---
name: npc-streaming-considerations
description: "NPCs e streaming de Workspace."
metadata:
  id: SK-11-12
  department: "Personagens e NPCs"
  version: "1.0"
  revised: "2026-10-18"
---

# npc-streaming-considerations

NPCs e streaming de Workspace.

**Quando usar:** Mapas grandes com StreamingEnabled.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Modelos de NPC podem não existir no cliente longe.
- Use modo persistente quando necessário.
- Servidor decide, cliente só mostra.

**Verificação:** Nenhum erro de nil quando NPCs entram e saem do raio.

**Complementares (sugeridas por similaridade):** `studio-streaming-enabled`, `perf-streaming-tuning`, `net-streaming-replication`

**Limites e recuperação:** Teste com vários NPCs e jogadores, não só um. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
