---
name: 3d-game-assets
description: "Convenções de assets 3D para jogos — nomenclatura, orçamento, LOD, colisão e checklist de entrega. Use ao definir requisitos ou conferir um asset antes de levar ao Roblox."
metadata:
  id: SK-46-01
  department: "Núcleo Roblox"
  version: 1.0
  revised: 2026-10-18
---
# 3D Game Assets

## Nomenclatura

`SM_<Nome>` malha estática · `SK_<Nome>` skinned · `<Nome>_COL` colisão simplificada · `<Nome>_LOD1/2` níveis de detalhe · `M_<Nome>` material.

## Orçamento (confirme limites atuais na doc do Roblox)

Há limite de triângulos por malha no upload (na casa de dezenas de milhares) e limites de textura; trabalhe bem abaixo para mobile. Defina o orçamento por categoria no início.

## Checklist de entrega

- [ ] Escala real e coerente com o jogo (objeto de referência)
- [ ] Origem/pivô correto; transformações aplicadas
- [ ] Normais corretas, sem geometria interna ou duplicada
- [ ] Contagem de triângulos dentro do orçamento
- [ ] Materiais/texturas nomeados e com resolução adequada
- [ ] Malha de colisão simples quando a forma é complexa
- [ ] Arquivo exportado existe, tamanho > 0, caminho registrado
- [ ] Importado e visto no Studio (ou marcado como "import manual pendente")

**Verificação:** Checklist de entrega preenchido item a item.
