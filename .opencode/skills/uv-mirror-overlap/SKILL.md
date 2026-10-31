---
name: uv-mirror-overlap
description: "UVs espelhadas e sobrepostas."
metadata:
  id: SK-24-05
  department: "UV mapping"
  version: "1.0"
  revised: "2026-10-18"
---

# uv-mirror-overlap

UVs espelhadas e sobrepostas.

**Quando usar:** Economizar espaço em peças simétricas.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Sobrepor só onde a textura é igual.
- Cuidado com normal map espelhado.
- Detalhes únicos separados.

**Verificação:** Nenhuma assimetria quebrada.

**Complementares (sugeridas por similaridade):** `combat-hitbox-overlap`, `bpy-modifiers-api`, `anim3d-root-motion`

**Limites e recuperação:** Valide visualmente com um padrão de teste antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
