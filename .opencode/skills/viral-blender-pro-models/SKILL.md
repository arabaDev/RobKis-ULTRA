---
name: viral-blender-pro-models
description: "Cria modelos 3D, partes e assets estilo Blender para jogos do Roblox: low-poly estilizado, cores vibrantes, silhueta clara, otimizados para mobile e PC."
metadata:
  id: SK-VR-05
  department: "Modelagem 3D"
  version: "1.0"
  revised: "2026-10-20"
---

# Viral Blender Pro Models

## Quando usar

Quando você precisa de modelos 3D, partes e assets com visual consistente e
profissional para o jogo, gerados diretamente no Roblox Studio sempre que possível.

## Dois caminhos — e por que "hiper-realista sem Blender" tem um limite técnico

Parts e Unions do Roblox são geometria construtiva simples (caixas, cilindros,
cunhas); mesmo com boa composição, isso não chega ao nível de um render
hiper-realista feito no Blender (alta contagem de poligonos, normal maps,
subsurface scattering). Seja honesto sobre isso com o usuário em vez de prometer
o impossível. Dois caminhos reais, conforme o pedido:

1. **Rápido, direto no Studio** (padrão para a maioria dos jogos virais, que são
   estilizados, não fotorrealistas): combine Parts/Unions/MeshParts básicas com
   a ferramenta MCP `generate_procedural_model` quando disponível, aplicando
   material, cor e silhueta com cuidado. Isso cobre bem o visual "estilizado
   premium" que a maioria dos jogos de sucesso no Roblox usa (veja
   `viral-game-inspector` para referências do nicho).
2. **Alta fidelidade** (quando o pedido realmente exige detalhe realista — ex.
   um prop hero específico, um personagem principal): use o pipeline Blender de
   verdade via `bpy-*` + `roblox-blender-pipeline` para modelar, texturizar com
   PBR e exportar. É mais lento, mas é o único caminho honesto para esse nível
   de resultado.

## Regras

- Estilo low-poly estilizado (poucas faces, silhueta clara).
- Cores vibrantes e consistentes com a paleta do jogo.
- Materiais do Roblox (Enum.Material) ou SurfaceAppearance com mapas PBR simples.
- Colisão simples (Box, Hull) para não pesar a física.
- Partes com nomes claros e organizadas em pastas.
- Otimizado para mobile: poucos triângulos, sombras desligadas quando não necessário.
- Pivot e origem corretos para encaixe no Studio.

## Procedimento

1. Defina o tipo de model (arma, comida, pet, cenário, personagem, item de loja).
2. Escolha a paleta de cores do jogo.
3. Modele com partes básicas ou MeshPart importada do Blender.
4. Aplique material e cor consistentes.
5. Configure colisão e ancoragem (Anchored quando apropriado).
6. Posicione no Workspace ou entregue como arquivo separado.

## Verificação

- Modelo carrega no Studio sem erros.
- Poucos triângulos (baixo custo de render).
- Silhueta clara e reconhecível à distância.
- Combina com o estilo visual do jogo.

## Complementares

`viral-game-generator`, `roblox-blender-pipeline`, `perf-render-cost`, `mat-roblox-materials-mapping`
