---
name: light-shadows-cost
description: "Custo de sombras e GlobalShadows em cenas pesadas, com medição de FPS."
metadata:
  id: SK-30-07
  department: "Iluminação e renderização"
  version: "1.0"
  revised: "2026-10-18"
---

# light-shadows-cost

Custo de sombras e GlobalShadows em cenas pesadas, com medição de FPS.

**Quando usar:** Cenas pesadas.

**Requer:** Blender disponível, Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- GlobalShadows e luzes com sombra custam.
- Desative onde não ajuda.
- Teste a diferença.

**Verificação:** FPS medido com e sem sombras.

**Complementares (sugeridas por similaridade):** `perf-physics-cost`, `perf-render-cost`, `perf-network-cost`

**Limites e recuperação:** Confirme identificadores de motor de render na versão do Blender em uso. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
