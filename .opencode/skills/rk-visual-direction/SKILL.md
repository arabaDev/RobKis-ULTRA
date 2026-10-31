---
name: rk-visual-direction
description: "Direção visual anti-genérico. Paleta, materiais, iluminação com intenção antes de construir."
metadata:
  id: SK-45-05
  department: "Protocolo do agente RobKis"
  version: "1.0"
  revised: "2026-10-18"
---

# rk-visual-direction

Antes de construir qualquer ambiente, definir a direção visual. Sem decisão explícita, o resultado é genérico.

**Quando usar:** Início de qualquer projeto de mapa, zona ou asset visual novo.

## Padrões proibidos por padrão

Estes padrões só entram com pedido explícito do usuário:

| Padrão | Problema |
|---|---|
| Neon em tudo | Sem hierarquia visual, cansa o olho |
| Cyberpunk automático | Sem contexto, é clichê |
| Bloom Intensity > 0.3 | Lava a cena, esconde geometria |
| Gradiente roxo/azul genérico | Identidade zero |
| Floating islands sem função | Clichê de "mundo mágico" sem peso |
| Tudo brilhando | Remove percepção de material |

## Checklist antes de começar

**1. Escolher o estilo e manter:**
- `low-poly stylized` — formas limpas, cores planas ou levemente graduadas, sem normal maps complexos.
- `cartoon` — contornos, cores vibrantes mas controladas, proporções exageradas.
-  — PBR materials, iluminação direcional, detalhes médios.
- `gritty realistic` — texturas de desgaste, paleta dessaturada, Roughness alta.

**2. Definir paleta de 3 a 5 cores:**
- Uma cor dominante (60% do espaço visual).
- Uma cor de suporte (30%).
- Uma cor de destaque/contraste (10%).
- Máximo 2 cores adicionais para detalhes.

**3. Material base por superfície:**

| Superfície | Material preferido |
|---|---|
| Chão natural | Grass, Ground, Cobblestone, Sand |
| Pedra | Rock, Slate, Concrete |
| Madeira | Wood, WoodPlanks |
| Metal | Metal, CorrodedMetal, DiamondPlate |
| Interior | SmoothPlastic, Neon (só fontes de luz reais) |

**4. Iluminação base:**
- `Technology`: Future (mais controle, melhor para PC) ou ShadowMap (melhor para mobile).
- Ambient: não mais que (80, 80, 80) — ambiente muito claro mata as sombras.
- OutdoorAmbient: entre (60, 60, 80) e (120, 100, 80) dependendo do clima.
- Um sol direcional (ClockTime entre 8 e 16 para iluminação natural).
- Atmosphere: começar com Density 0.3, Offset 0.25 e ajustar no Passe 3.

**5. Variar sem saturar:**
- Altura: nenhuma zona completamente plana.
- Densidade: áreas mais cheias perto de pontos de interesse, mais abertas nos caminhos.
- Escala: misturar objetos grandes (âncoras visuais) com médios e pequenos (detalhe).
- Cor de objetos dentro da paleta, com variação de Luminance (não de Hue).

## Verificação

- Paleta definida antes de colocar o primeiro prop.
- Nenhum material violando a lista acima sem justificativa.
- Screenshot em preto-e-branco: ainda tem leitura espacial clara? (se não, voltar ao Passe 1 do `rk-visual-loop`).

**Skills complementares:** `rk-visual-loop`, `light-technology-modes`, `light-atmosphere-sky`, `light-post-processing`, `mat-roblox-materials-mapping`, `mat-stylized-palettes`
