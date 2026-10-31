---
name: npc-character-spawning
description: "Criar NPCs com Humanoid e aparência definida."
metadata:
  id: SK-11-01
  department: "Personagens e NPCs"
  version: "1.0"
  revised: "2026-10-18"
---

# npc-character-spawning

Criar NPCs com Humanoid e aparência definida.

**Quando usar:** Inimigos, vendedores e aliados.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Clone o modelo base de ServerStorage.
- Humanoid com HumanoidDescription para aparência.
- Posicione com PivotTo antes de colocar no Workspace.

**Verificação:** O NPC aparece inteiro, de pé e na posição.

**Complementares (sugeridas por similaridade):** `npc-animations`, `npc-path-following`, `npc-spawn-despawn`

**Limites e recuperação:** Teste com vários NPCs e jogadores, não só um. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
