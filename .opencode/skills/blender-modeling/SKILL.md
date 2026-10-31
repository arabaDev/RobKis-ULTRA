---
name: blender-modeling
description: "Princípios de modelagem 3D para jogos — topologia, orçamento de polígonos, normais, UV e materiais. Use ao criar ou revisar modelos para Roblox."
metadata:
  id: SK-46-01
  department: "Núcleo Roblox"
  version: 1.0
  revised: 2026-10-18
---
# Blender Modeling para jogos

- Forma primeiro (silhueta legível de longe), detalhe depois. Detalhe pequeno vai em textura/material, não em geometria.
- Orçamento de triângulos definido **antes** (props pequenos: centenas; personagens/armas: poucos milhares; mobile: conservador).
- Quads na modelagem, triangulação na exportação. Evite n-gons e geometria interna invisível.
- Modificadores úteis: Mirror, Bevel (limitado), Weighted Normal, Decimate (último recurso); **aplique** antes de exportar.
- Normais para fora (Recalculate Outside); shade smooth + normais ponderadas ou flat para estilo low-poly.
- UVs sem sobreposição indesejada, com margem; reaproveite texturas/atlas para reduzir materiais.
- Materiais mínimos e nomeados; PBR simples compatível com o importador.
- Origem/pivô na base ou no ponto de uso (cabo da espada, base da árvore). Transformações aplicadas (escala 1).
- Nomes consistentes e coleções organizadas.

**Verificação:** Triângulos dentro do orçamento, normais para fora e transformações aplicadas.
