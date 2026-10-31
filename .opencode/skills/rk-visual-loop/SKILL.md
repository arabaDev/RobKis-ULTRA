---
name: rk-visual-loop
description: "Loop de iteração visual de 3 passes com portões de aprovação. Garante qualidade progressiva."
metadata:
  id: SK-45-04
  department: "Protocolo do agente RobKis"
  version: "1.0"
  revised: "2026-10-18"
---

# rk-visual-loop

Mapas e ambientes são construídos em três passes sequenciais. Cada passe tem um portão de aprovação — o agente **não avança** sem resposta do usuário.

**Quando usar:** Criação ou refactor de qualquer mapa, zona ou ambiente novo.

## Passe 1 — Silhueta

**Objetivo:** Legibilidade espacial. O jogador entende onde está e para onde pode ir?

**Construir:**
- Layout de massa: grandes blocos representando zonas, edifícios, relevos.
- Horizonte legível: pelo menos um ponto de referência alto visível de qualquer posição jogável.
- Caminho principal claro: não precisa ser reto, mas deve ser lido.
- Sem detalhe decorativo ainda.

**Portão 1:** Screenshot ou descrição do layout → **esperar aprovação explícita do usuário**.

Falha → ajustar layout, não avançar para Passe 2.

## Passe 2 — Detalhe

**Objetivo:** O olho encontra coisas interessantes. Não é vazio, não é clutter.

**Construir:**
- Props e objetos secundários: caixas, vegetação, rochas, móveis.
- Variação de altura dentro das zonas: degraus, plataformas baixas, rampas.
- Textura e material corretos por superfície.
- Distribuição orgânica via `math.noise` (não alinhamento em grid).

**Portão 2:** Screenshot → **esperar aprovação**.

Falha → rever distribuição de props ou material do Passe 2, não regredir para Passe 1 (a menos que o usuário peça).

## Passe 3 — Polimento

**Objetivo:** Dá vontade de ficar. Coesão visual e atmosfera.

**Construir:**
- Iluminação final: Technology, Ambient, Outlines, shadows.
- Atmosphere: Density, Offset, Color, Decay calibrados.
- Efeitos de partícula pontuais (< 20 ativos simultâneos).
- Sons ambientes no lugar certo.
- Revisão de budget: medir instâncias e triângulos antes de fechar.

**Portão 3:** Screenshot → **esperar aprovação**.

Falha → desce um nível no Passe 3, não retorna ao Passe 1.

## Regras do loop

- Nunca pular portão. Nunca avançar "porque vai ficar bom".
- Falha em qualquer passe: desce **um nível no passe que falhou**.
- Budget medido no final do Passe 3 (ver `rk-map-budget`).

**Skills complementares:** `rk-map-budget`, `rk-visual-direction`, `light-technology-modes`, `light-atmosphere-sky`, `proc-modular-building-kits`, `perf-mobile-budgets`

**Verificação:** Screenshot aprovado em cada portão antes de avançar.
