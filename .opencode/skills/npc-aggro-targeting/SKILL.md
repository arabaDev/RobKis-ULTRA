---
name: npc-aggro-targeting
description: "Escolha e perda de alvo com distância e linha de visão."
metadata:
  id: SK-11-09
  department: "Personagens e NPCs"
  version: "1.0"
  revised: "2026-10-18"
---

# npc-aggro-targeting

Escolha e perda de alvo com distância e linha de visão.

**Quando usar:** NPCs que perseguem jogadores.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Distância e raycast de visão.
- Escolha o alvo por regra clara (mais próximo, maior ameaça).
- Perda de alvo por distância ou tempo.

**Verificação:** O NPC alterna alvos de forma previsível.

**Complementares (sugeridas por similaridade):** `sec-distance-sanity-checks`, `ai-perception-sight`, `net-latency-jitter`

**Limites e recuperação:** Teste com vários NPCs e jogadores, não só um. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
