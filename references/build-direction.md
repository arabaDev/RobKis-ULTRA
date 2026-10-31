# build-direction

Complementa `rk-visual-direction` (princípios gerais), `proc-*` (geração), `light-*` (iluminação) e `blender-*`. Esta skill decide **o que construir e como deve parecer**; as outras executam.

**Quando usar:** cenários, edifícios, ilhas, vilas, interiores, props e mapas.

## 1. Brief de cena (antes de qualquer Part)
Gênero e função no gameplay (onde o jogador anda, luta, compra), uma palavra de atmosfera, ponto focal, silhueta dominante, paleta de 3–5 cores, escala de referência (o avatar tem ~5,5 studs). Use `python scripts/decide.py` para estilo e abordagem; imagens do usuário valem mais que a heurística.

## 2. Abordagem
- **Realismo:** proporções coerentes, materiais convincentes, iluminação planejada (fontes locais, ambiente baixo no interior), detalhe de superfície. Não é "mais polígonos".
- **Surrealismo:** regra impossível mas consistente (escala monumental, gravidade, repetição), poucas ideias fortes, não efeitos em excesso.
- **Estilização:** silhuetas marcantes, formas simplificadas de propósito, paleta limitada. Pode combinar as três.

## 3. Composição
Ponto focal visível de longe (torre, árvore, arco); ritmo por repetição com variação (altura, giro, escala); primeiro/médio/fundo com névoa ou cor para profundidade; caminhos que levam o olhar e o jogador; vazio intencional. Nada colocado "aleatório": cada detalhe complementa a estrutura (beiral sobre varanda, pilar sob viga).

## 4. Técnica certa para cada coisa
Parts/union: formas básicas e modular rápido. MeshPart (Blender): orgânicos, props repetidos, arquitetura com perfil complexo. Kits modulares: edifícios em série. Procedural (`proc-*`): vegetação, rochas, ruas, com semente fixa. Materiais/texturas: 2–3 por cena, escala de textura coerente. Luz: 1 fonte principal + locais; `light-mobile-lighting` para celular. Orçamento de triângulos e instâncias antes de detalhar; reuse mesh.

## 5. Matriz de estilos (ponto de partida, o usuário substitui quando quiser)
| Estilo | Formas | Materiais/paleta | Luz |
|---|---|---|---|
| Roblox clássico | blocos, studs, cilindros | plástico/metal liso, cores primárias | céu aberto, sombra simples |
| Low-poly | facetas, poucos planos | cores chapadas, sem textura | suave, sombra direcional |
| Realista / Semirrealista | proporção real, chanfros | madeira, concreto, metal com desgaste | contraste, fontes locais |
| Medieval / Fantasia | pedra, vigas, torres, arcos | pedra + madeira + acento mágico | quente, névoa |
| Anime | silhueta forte, céu dramático | cores saturadas, contornos | rim light, céu pintado |
| Japonês tradicional | beirais largos, madeira escura, torii, bonsai | vermelho-escuro, madeira, verde-musgo | névoa, luz baixa |
| Moderno / Futurista | planos limpos, vidro, curvas | branco, cinza, acento neon pontual | fria, reflexo |
| Industrial / Urbano | vigas, tubos, ruas, fios | concreto, aço, ferrugem | sódio, poças |
| Fazenda / Tycoon | máquinas legíveis, placas de nível | madeira + metal + cor saturada | clara, quente |
| Terror | espaço apertado, assimetria, vazio | madeira velha, tons dessaturados | ambiente quase escuro, poças quentes |
| Natureza | formas orgânicas, variação | verdes variados, rocha | luz filtrada |
| Pós-apocalíptico | ruína, improviso | ferrugem, poeira | pôr do sol sujo |
| Cartoon / Minimalista | volumes grandes, poucos detalhes | paleta curta | luz uniforme |
| Surrealista / Híbrido | uma regra impossível | contraste de escala | dramática |

## 6. Referências
Biblioteca em `references/visual-library.md` (origem e licença registradas). Princípios, nunca cópia de mapas, modelos ou código proprietário. Ao receber imagem nova: registre origem, extraia princípios e parâmetros, adicione à biblioteca.

## 7. Fechamento
Compare com o brief (foco, silhueta, paleta, escala). Instâncias e triângulos dentro do orçamento. `fastcheck.py`. Visual só conta como validado com screenshot/Studio; sem isso, "não validado visualmente".

**Limites e recuperação:** sem Studio/MCP você entrega scripts e instruções, não uma cena verificada. Se o resultado parecer protótipo, volte ao brief (foco e paleta) antes de acrescentar detalhe.
