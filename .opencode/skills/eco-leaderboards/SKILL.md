---
name: eco-leaderboards
description: "Placares globais com OrderedDataStore."
metadata:
  id: SK-14-09
  department: "Economia e lojas"
  version: "1.0"
  revised: "2026-10-18"
---

# eco-leaderboards

Placares globais com OrderedDataStore.

**Quando usar:** Rankings de jogadores.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- OrderedDataStore:GetSortedAsync para páginas do topo.
- Atualize em intervalos, não a cada ganho.
- Cache local do resultado.

**Verificação:** O placar atualiza sem estourar o orçamento de requisições.

**Complementares (sugeridas por similaridade):** `data-ordered-leaderboards`, `net-messaging-memorystore`, `studio-workspace-settings`

**Limites e recuperação:** Políticas de monetização da plataforma mudam; confirme a política atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
