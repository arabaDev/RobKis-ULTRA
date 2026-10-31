---
name: uv-multiple-uv-sets
description: "Múltiplos conjuntos de UV."
metadata:
  id: SK-24-09
  department: "UV mapping"
  version: "1.0"
  revised: "2026-10-18"
---

# uv-multiple-uv-sets

Múltiplos conjuntos de UV.

**Quando usar:** Texturas com usos diferentes.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- obj.data.uv_layers.new.
- Confirme suporte do destino.
- Documente o uso de cada conjunto.

**Verificação:** Cada conjunto tem função clara.

**Complementares (sugeridas por similaridade):** `mat-pbr-texture-set`, `tool-rarity-stats`, `anim3d-retargeting`

**Limites e recuperação:** Valide visualmente com um padrão de teste antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
