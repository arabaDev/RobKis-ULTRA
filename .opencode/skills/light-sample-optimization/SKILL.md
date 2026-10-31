---
name: light-sample-optimization
description: "Otimização de amostras de render."
metadata:
  id: SK-30-17
  department: "Iluminação e renderização"
  version: "1.0"
  revised: "2026-10-18"
---

# light-sample-optimization

Otimização de amostras de render.

**Quando usar:** Render lento.

**Requer:** Blender disponível, Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Reduza amostras e use denoise.
- Compare qualidade e tempo.
- Defina um limite por tipo de render.

**Verificação:** O tempo medido cai com qualidade aceitável.

**Complementares (sugeridas por similaridade):** `perf-loop-optimization`, `perf-particle-optimization`, `ui-update-optimization`

**Limites e recuperação:** Confirme identificadores de motor de render na versão do Blender em uso. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
