---
name: npc-health-bars
description: "Barras de vida com BillboardGui."
metadata:
  id: SK-11-06
  department: "Personagens e NPCs"
  version: "1.0"
  revised: "2026-10-18"
---

# npc-health-bars

Barras de vida com BillboardGui.

**Quando usar:** Mostrar vida de inimigos.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- BillboardGui no cliente a partir de Health e MaxHealth.
- Atualize por HealthChanged.
- Oculte à distância.

**Verificação:** A barra acompanha a vida e some ao morrer.

**Complementares (sugeridas por similaridade):** `ui-health-bar`, `combat-ranged-projectiles`, `fx-particle-emitters`

**Limites e recuperação:** Teste com vários NPCs e jogadores, não só um. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
