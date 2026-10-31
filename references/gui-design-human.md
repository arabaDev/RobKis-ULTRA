# gui-design-human

Complementa `rk-visual-direction` (mundo 3D) e `roblox-game-ux` (fluxo/UX) para a **camada de interface**. Código: `references/gui-engine.md`. Esta skill decide **o que** desenhar; o engine implementa.

**Quando usar:** antes de criar ou refazer HUD, menu, inventário, loja, missões ou tela de seleção.

## 1. Brief de identidade (3 linhas, antes de qualquer código)
Gênero e ritmo (combate rápido? coleta calma?), ambientação e público, 1 palavra de personalidade ("rústico", "elétrico", "claustrofóbico"). Escolha um dos 9 estilos do engine como partida (Anime Adventure, Western Survival, Simulator, RPG Fantasy, Military Tactical, Sci-Fi, Horror, Minimalista, Custom) e ajuste via `UIConfig.ThemeOverrides`. Se o usuário mandou imagem: extraia tokens (paleta de 3–5 cores, tipografia, proporção de cantos, densidade), não o layout.

## 2. Hierarquia e HUD
- Informação de consulta frequente (vida, energia, habilidades, munição, objetivo atual) fica nas bordas, pequena, sempre no mesmo lugar. Informação rara vira painel contextual ou some até ser necessária.
- O centro da tela é do jogo. Sem cartões flutuantes sobre o personagem. Nunca mais de ~20% da área ocupada em combate.
- Um único elemento "primário" por tela (o botão/valor que importa), com cor de destaque usada com parcimônia (regra 60/30/10).
- Escolha só os componentes necessários: um jogo de sobrevivência quer inventário e recursos; um obby quase não quer HUD.

## 3. Tipografia, espaço, ícones
- Máximo 2 fontes; peso e tamanho criam a hierarquia (título ≠ corpo ≠ legenda), não tamanho gigante.
- Espaçamento segue um passo (4/8/12), alinhamentos reais; evite simetria forçada quando a composição pedir peso de um lado.
- Ícones de um só estilo e traço. Emoji nunca substitui ícone; sem asset, use letra/forma simples e registre a pendência.
- Contraste: texto sobre cor usa `UIUtils.contrastColor`; teste os 9 estilos.

## 4. Checklist anti-genérico (pare se 3 respostas forem "sim")
Cantos arredondados em tudo? Gradiente em tudo? Neon sem motivo de gênero? Mesmo botão verde em todas as telas? Todos os cartões idênticos? Sombra/borda decorativa? Título enorme sem hierarquia? Efeito de vidro sem função? Layout de site administrativo? Animação contínua? Esses recursos são aceitos quando o gênero pede (ex.: Simulator tolera gradiente suave); nunca por padrão.

## 5. Mobile é outra composição
Não encolha o desktop. Reposicione: menu fora da zona do joystick/pulo, alvos de toque ≥ 44 px, menos informação simultânea, painéis quase em tela cheia. Teste no Device Emulator.

## 6. Referências por categoria (princípios, não cópia)
Combate/progressão (estilo Blox Fruits): atalhos de habilidade com recarga legível, missão atual sempre visível. Sobrevivência (estilo Dead Rails): recursos e inventário contextuais, texto de ambiente. Simulator: loja, multiplicadores, tutorial curto. Terror: HUD mínima, fontes de desgaste, silêncio visual. Nunca copiar layout exclusivo, marca ou arte.

**Verificação:** brief escrito; checklist anti-genérico respondido; HUD com cenário visível em screenshot/Device Emulator; `python scripts/fastcheck.py` limpo.

**Limites e recuperação:** julgamento visual exige olhar (screenshot via MCP ou usuário); sem isso marque "visual NÃO validado". Duas rejeições do usuário no mesmo ponto: mude de direção, não ajuste fino.
