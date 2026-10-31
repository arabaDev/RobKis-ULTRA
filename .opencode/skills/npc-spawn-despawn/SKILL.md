---
name: npc-spawn-despawn
description: "Gerenciamento de nascimento e remoção de NPCs."
metadata:
  id: SK-11-05
  department: "Personagens e NPCs"
  version: "1.0"
  revised: "2026-10-18"
---

# npc-spawn-despawn

Gerenciamento de nascimento e remoção de NPCs.

**Quando usar:** Ondas e mapas com muitos inimigos.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Limite de NPCs ativos.
- Reaproveite em vez de recriar quando possível.
- Destrua ao sair da área ou da partida.

**Verificação:** Número de NPCs ativos respeita o limite.

**Complementares (sugeridas por similaridade):** `npc-character-spawning`, `npc-streaming-considerations`, `arq-component-based-design`

**Limites e recuperação:** Teste com vários NPCs e jogadores, não só um. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
