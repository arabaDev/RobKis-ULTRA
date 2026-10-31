---
name: anim-preloading
description: "Pré-carregamento de animações com ContentProvider."
metadata:
  id: SK-10-07
  department: "Animações Roblox"
  version: "1.0"
  revised: "2026-10-18"
---

# anim-preloading

Pré-carregamento de animações com ContentProvider.

**Quando usar:** Animações que atrasam no primeiro uso.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- ContentProvider:PreloadAsync com as animações.
- Carregue as tracks no início, não no primeiro uso.
- Faça isso uma vez.

**Verificação:** O primeiro uso não tem atraso perceptível.

**Complementares (sugeridas por similaridade):** `tool-animation-binding`, `anim3d-fps-export`, `luau-table-performance`

**Limites e recuperação:** Animações publicadas dependem do dono do jogo; confirme permissões. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
