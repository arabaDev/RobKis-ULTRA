---
name: anim-cleanup-tracks
description: "Limpeza de tracks e conexões de animação."
metadata:
  id: SK-10-12
  department: "Animações Roblox"
  version: "1.0"
  revised: "2026-10-18"
---

# anim-cleanup-tracks

Limpeza de tracks e conexões de animação.

**Quando usar:** Vazamento ao trocar de personagem ou ferramenta.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Pare e destrua tracks ao desequipar.
- Desconecte sinais de marcador.
- Reconstrua no CharacterAdded.

**Verificação:** Respawn não acumula tracks.

**Complementares (sugeridas por similaridade):** `luau-cleanup-patterns`, `perf-debris-cleanup`, `tool-respawn-cleanup`

**Limites e recuperação:** Animações publicadas dependem do dono do jogo; confirme permissões. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
