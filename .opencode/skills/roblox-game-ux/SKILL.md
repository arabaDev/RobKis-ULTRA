---
name: roblox-game-ux
description: "Design and critique Roblox game UX, HUDs, menus, onboarding, mobile controls, and progression surfaces. Use when making a Roblox experience feel clear, fast, touch-friendly, and retention-aware."
metadata:
  id: SK-46-01
  department: "Núcleo Roblox"
  version: 
  revised: 2026-10-20
---

# Roblox Game UX

## UX Principles

- Put the player into the core action within 10-30 seconds.
- Teach by doing, with objective markers and contextual prompts instead of instruction walls.
- Keep the first screen focused on play, not menus or exposition.
- Make rewards loud enough to understand but short enough to keep momentum.
- Design for phone screens first, then expand to desktop and tablet.

## Mobile-First Controls

- Use large touch targets and generous spacing.
- Avoid controls that require precision dragging unless the whole game is built around it.
- Add auto-targeting, aim assist, snapping, or simplified actions where useful.
- Keep critical buttons away from screen edges and system gesture zones.
- Make HUD text readable on small screens and keep important information out of thumb-heavy areas.

## HUD And Menus

- Surface current objective, currency, progress, health/energy, and next reward.
- Keep deep menus optional during the first session.
- Use clear iconography and consistent button placement.
- Make progress bars and collection meters visible during the loop.
- Avoid popups that interrupt core action, especially in the first five minutes.

## Onboarding Flow

Recommended first-session order:

1. Spawn facing the first interactable or objective.
2. Prompt one action.
3. Give immediate feedback and reward.
4. Show the next short goal.
5. Reveal social or progression context after the player has already acted.

## UX Review Output

When reviewing a Roblox UX, report:

- First-action time.
- Friction points before gameplay.
- Mobile-control risks.
- Missing progression signals.
- Social visibility gaps.
- Monetization interruptions.
- Priority fixes ranked by retention impact.

## Direção Visual: pergunte antes de desenhar

Nunca escolha um estilo visual sozinho e nunca aplique um padrão fixo por padrão. Antes de começar qualquer `design.md`, pergunte ao usuário a direção de estilo. Duas formas válidas de resposta:

- **Referência nomeada**: um jogo Roblox conhecido pelo visual que ele quer (ex.: Brookhaven — clean, residencial, cores pastel, ícones arredondados; Prison Life — robusto, militar/institucional, paleta escura com acentos de aviso; Adopt Me — colorido, arredondado, "fofo"; Mad City — HUD denso estilo GTA). Se o usuário nomear um jogo que você não conhece em detalhe, descreva o que supõe sobre ele em uma linha e peça confirmação antes de seguir.
- **Imagem de referência**: um print ou foto da UI desejada, enviado na conversa. Quando o usuário mandar uma imagem, ela é a fonte da verdade — leia a seção "Lendo uma imagem de referência" abaixo antes de escrever o `design.md`.

Se o usuário não tiver preferência, apresente 2–3 direções curtas (uma frase cada) e deixe ele escolher — não decida por ele. Registre a direção escolhida no topo do `design.md` (seção "Estilo") antes de detalhar layout.

## Lendo uma imagem de referência

Quando houver uma imagem de referência (upload do usuário ou screenshot de um jogo citado), extraia um **token de estilo** antes de desenhar qualquer tela, e documente-o em `design/DESIGN.md`:

| Token | O que observar na imagem | Exemplo de saída |
|---|---|---|
| Paleta | 3–5 cores dominantes, em hex, com o papel de cada uma (fundo, superfície, texto, acento, perigo) | `fundo #1C1D21`, `superfície #26272C`, `acento #E8B23D` |
| Raio de canto | Cantos retos, levemente arredondados (~6-8px) ou bem arredondados (~16-20px)? É consistente em todos os elementos? | `UICorner 10px em cards, 999px (pill) em botões` |
| Contorno/stroke | Os painéis têm borda visível? Grossura e cor? | `UIStroke 2px, cor mais escura que o fundo do painel` |
| Sombra/profundidade | Sombra sutil, sombra "cartoon" grossa (ex.: Brookhaven/Adopt Me), ou chapado sem sombra (ex.: Prison Life)? | `drop shadow 4px offset-y, 25% opacidade` |
| Tipografia | Peso do texto (bold em títulos, regular no corpo?), tamanho relativo entre título/corpo/legenda | `título bold 24px, corpo medium 16px` |
| Ícones | Flat, outline, ou com profundia 3D/render? Mono-cromáticos ou coloridos? | `ícones flat coloridos, 32px, fundo circular` |
| Espaçamento | Denso (HUD cheio) ou generoso (poucos elementos, muita respiração)? Grid de 4px ou 8px? | `grid de 8px, padding interno 16px` |
| Estado de botão | Como o hover/press é sugerido (escurece, sobe, aumenta brilho)? | `press: escala 0.95 + escurece 10%` |

Esse token vira a seção "Estilo" do `design/DESIGN.md` e toda UI construída depois referencia esses valores — nunca números soltos inventados por conveniência.

## Fugindo da cara de "feito por IA"

Um GUI "com cara de IA" normalmente tem estes sintomas — evite por padrão, mesmo sem imagem de referência:

| Sintoma genérico | Em vez disso |
|---|---|
| Fundo cinza chapado (`#2E2E2E`) ou preto puro (`#000000`) em tudo | Use 1 cor de fundo e 1 de superfície, levemente diferentes entre si, puxando pra um tom (nunca cinza neutro puro) |
| Gradiente roxo→azul neon com glow em todo botão | Reserve cor saturada/gradiente pra 1 ação primária por tela; o resto é sólido |
| Mesmo raio de canto em every elemento, aleatório (ex.: 7px, 11px, 9px) | Sistema de 2–3 raios fixos (ex.: 8 / 14 / 999 pill) usados com intenção |
| Zero sombra ou sombra idêntica em tudo | Hierarquia de elevação: elementos “acima” (modais, tooltips) têm sombra mais forte que elementos de fundo |
| Ícones genéricos todos do mesmo pacote, sem relação com o tema do jogo | Combine o estilo do ícone com a referência escolhida (outline fino pro Prison Life, preenchido/arredondado pro Brookhaven) |
| Texto sem hierarquia (tudo o mesmo peso/tamanho) | Pelo menos 3 níveis: título, corpo, legenda — peso e tamanho diferentes |
| Botões sem feedback de toque (clica e nada muda visualmente) | Sempre ter estado pressed (escala ou escurecimento) via `TweenService`, não só `MouseButton1Click` |

## Design The UI Before It Is Built

For any non-trivial UI surface, produce and get approval on a **UI design artifact** before `roblox-ui-implementation` builds it. This is the visual contract; it prevents Claude from improvising layout, states, and mobile behavior mid-build. Roblox UI is built in Studio, so the artifact is a markdown design brief (optionally with reference images/screenshots), not an HTML mockup.

Create it under `design/features/<feature-slug>/design.md` (global patterns live in `design/DESIGN.md`; see `docs/agents/design.md`). The brief must cover:

- User goal and which surface/flow this is (HUD, shop, reward, menu…).
- Layout and responsive behavior across **mobile, tablet, and desktop**, including safe areas and thumb zones.
- Every relevant state: **default, empty, loading, error, and permission/locked**.
- Interactions and copy rules.
- A `Status:` line — `draft` until the user approves, then `approved`.

Iterate with the user until they approve, then set `Status: approved`. A UI slice cannot become  (in `roblox-to-issues` / `roblox-triage`) until this artifact is approved.

## Next

Once the design brief is approved, hand it to `roblox-ui-implementation` to build. If the UI is part of a larger feature, slice it with `roblox-to-issues`. Verify the built result with `roblox-mobile-playtest` and `roblox-playtest-qa`.
