---
name: npc-network-ownership
description: "Propriedade de rede em NPCs para evitar jitter."
metadata:
  id: SK-11-07
  department: "Personagens e NPCs"
  version: "1.0"
  revised: "2026-10-18"
---

# npc-network-ownership

Propriedade de rede em NPCs para evitar jitter.

**Quando usar:** NPCs que se movem de forma estranha.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- SetNetworkOwner(nil) mantém a física no servidor.
- Faça isso nas partes não ancoradas do NPC.
- Verifique com GetNetworkOwner.

**Verificação:** O NPC se move suavemente para todos.

**Complementares (sugeridas por similaridade):** `phys-network-ownership`, `anim-ownership-permissions`, `perf-network-cost`

**Limites e recuperação:** Teste com vários NPCs e jogadores, não só um. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
