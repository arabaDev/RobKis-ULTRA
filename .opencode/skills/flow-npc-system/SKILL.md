---
name: flow-npc-system
description: "Fluxo de NPC: spawn, IA, navegação, rede, vida e custo de CPU."
metadata:
  id: SK-44-06
  department: "Fluxos compostos"
  version: "1.0"
  revised: "2026-10-18"
---

# flow-npc-system

Fluxo de NPC: spawn, IA, navegação, rede, vida e custo de CPU.

**Quando usar:** Inimigos ou NPCs novos.

**Procedimento**
1. Crie o personagem com `npc-character-spawning`.
2. Modele o comportamento com `ai-state-machines`.
3. Navegue com `npc-path-following`.
4. Perceba jogadores com `ai-perception-sight`.
5. Escolha alvos com `npc-aggro-targeting`.
6. Defina a rede com `npc-network-ownership`.
7. Animações com `npc-animations`.
8. Vida com `npc-health-bars`.
9. Recompensas com `npc-loot-drops`.
10. Controle o custo com `ai-performance-throttling`.
11. Considere streaming com `npc-streaming-considerations`.
12. Teste com `test-edge-cases`.

**Regras do fluxo**
- Meça o custo de IA com muitos NPCs antes de concluir.

**Verificação:** Vários NPCs funcionam sem lag e sem erros de nil.

**Skills complementares:** `npc-character-spawning`, `ai-state-machines`, `npc-path-following`, `ai-perception-sight`, `npc-aggro-targeting`, `npc-network-ownership`, `npc-animations`, `npc-health-bars`, `npc-loot-drops`, `ai-performance-throttling`, `npc-streaming-considerations`, `test-edge-cases`

**Limites e recuperação:** Este fluxo só ordena skills; cada etapa deve ser verificada pela skill correspondente, e o estado real de cada etapa deve ser reportado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
