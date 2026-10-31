# Biblioteca visual (princípios extraídos de referências)

**Origem:** 7 capturas de tela enviadas pelo usuário em 2026-10-25 (arquivos `127500`–`127506`, aqui numeradas 1–7 na ordem recebida). São imagens de terceiros, **licença desconhecida**: servem apenas de estudo de princípios; não copiar layout, modelo, textura nem código. Paletas abaixo são **estimadas a olho**, não medidas.

Como adicionar uma referência: copie o bloco, registre origem e licença, extraia princípios (não pixels), classifique por gênero/estilo/complexidade/finalidade.

---

## R1 · Roblox clássico (baseplate)
- **Gênero/estilo:** obby/teste, Roblox clássico. **Complexidade:** mínima. **Finalidade:** referência do que é "protótipo".
- **Vê-se:** baseplate com studs, formas primitivas cinza (laje com decalque de estrela, cilindros com cruz), céu de nuvens, avatar padrão.
- **Princípios:** linguagem de blocos e studs é um estilo legítimo quando intencional; o que a torna "protótipo" é a falta de ponto focal, de paleta e de escala.
- **Parâmetros:** cinza neutro + um verde de base; um decalque forte no plano como foco.
- **Usar em:** estilo Roblox clássico, obby. **Evitar em:** projetos que pedem acabamento profissional.

## R2 · Terror com lobby (interior em cabana)
- **Gênero/estilo:** terror multiplayer (o usuário citou Forsaken como categoria), semirrealista. **Complexidade:** média.
- **Vê-se:** cabana de toras, escada com corrimão, lareira de pedra, móveis, ambiente quase escuro com poças de luz quente (lâmpadas e lareira). HUD: coluna vertical de ícones monocromáticos com aparência de carimbo gasto à esquerda, contador de dinheiro pequeno, estado central em serifa ("aguardando jogadores" + tempo).
- **Princípios:** luz de ambiente baixa + 3–5 fontes locais quentes criam profundidade e foco; mobília agrupada em ilhas de luz deixa vazio escuro entre elas; HUD mínima e de uma só cor deixa o clima intacto; fonte serifada gasta reforça identidade.
- **Parâmetros:** fundo ≈ #0E0B0A, madeira ≈ #3A2E26, luz ≈ #E8B86A; ícones brancos-gelo sobre preto; texto serifado.
- **Usar em:** terror, lobby, sobrevivência noturna. Preset de GUI `Horror`; skill `light-horror-mood`.

## R3 · Tycoon agrícola (cena de produção)
- **Gênero/estilo:** tycoon/fazenda, cartoon voxel. **Complexidade:** alta (render conceitual, não um mapa do Roblox).
- **Vê-se:** linha de produção em esteira curva (solo → muda → flor → colheita), máquinas com tamanhos crescentes, placas de madeira com "LEVEL n", tubos de cobre e vidro, luzes coloridas, caixa de ganhos. HUD nos cantos: barra de vida, dinheiro com "+", nível, inventário (esquerda), placar (direita), botões de troféu/loja/ajustes (direita).
- **Princípios:** o fluxo de produção é legível como um caminho único; cada etapa tem identidade própria (forma + cor) e placa de nível; madeira + metal + um acento saturado por máquina; o HUD fica nas bordas e o cenário é o herói.
- **Parâmetros:** verde-grama saturado, madeira quente, metal azul-acinzentado, acentos arco-íris pontuais.
- **Usar em:** tycoon, fazenda, simulador. GUI `Farm`/`Tycoon`; skill `references/tycoon-sim-systems.md`.

## R4 · Ilha estilo aventura marítima (cidade com torre)
- **Gênero/estilo:** aventura/anime-marítimo (o usuário citou Blox Fruits como categoria), estilização limpa. **Complexidade:** média-alta.
- **Vê-se:** torre branca central com cúpula verde e janelas em arco, casas de telhado azul e vermelho, fontes em camadas com cachoeiras, água azul clara com espuma, céu de nuvens.
- **Princípios:** um marco central domina a silhueta e orienta o jogador; paleta contida (branco, azul, terracota, verde de acento); a água une os elementos; repetição de casas pequenas com variação de telhado cria cidade sem ruído; fontes em escala monumental dão assinatura.
- **Parâmetros:** branco ≈ #EEF1F5, azul ≈ #3FA9E6, terracota ≈ #C9694A, verde ≈ #2F6B4A.
- **Usar em:** ilhas/cidades de aventura, hubs. Estilo de build `Anime` ou `Fantasia`; GUI `AnimeAdventure`.

## R5 · Vila ninja (hub: casas e cristal)
- **Gênero/estilo:** ninja/japonês tradicional estilizado. **Complexidade:** alta.
- **Vê-se:** casa de dois andares com beirais largos em madeira avermelhada escura, varandas, treliça preta no telhado, prédio octogonal de telhado dourado, árvores torcidas em forma de bonsai com copas cúbicas texturizadas, agulhas/obeliscos cinza ao fundo, cristal azul brilhante como ponto focal, névoa lavanda no céu.
- **Princípios:** vermelho-escuro + musgo + cinza-lavanda forma uma paleta única; o cristal azul (única cor fria saturada) é o ponto focal; beirais largos e varandas dão a assinatura japonesa; repetição de árvores contorcidas cria ritmo; névoa dá profundidade.
- **HUD (mobile):** três botões de habilidade em quadrados semitransparentes na base, só texto, e **texto quebrando no meio da palavra** ("Substituiçã/o"). Lição: ícone + legenda curta, `TextScaled` com `UITextSizeConstraint`, largura mínima; nunca depender de quebra de linha em botão estreito.
- **Parâmetros:** madeira ≈ #6B2A2A, telhado ≈ #C9A24A, musgo ≈ #5F6B4A, céu ≈ #C8BFD8, cristal ≈ #2F7BFF.
- **Usar em:** ninja, japonês tradicional, hubs de vila. GUI `AnimeAdventure` com paleta própria.

## R6 · Arco de pedra e corredor de árvores
- **Vê-se:** arco de pedra com blocos empilhados no eixo do caminho, árvores torcidas dos dois lados, cerca de treliça verde, agulhas de pedra inclinadas, chão em grama escura.
- **Princípios:** **eixo central com portal** conduz o jogador; simetria parcial (árvores diferentes de cada lado); elementos inclinados (agulhas) quebram a verticalidade; cerca de treliça delimita a área jogável sem parede maciça.
- **Falha a evitar:** árvores e agulhas idênticas repetidas em excesso formam parede de ruído e escondem o jogador; varie altura, giro e densidade.
- **Usar em:** entradas, corredores, arenas.

## R7 · Arena circular e campo de treino (visão aérea)
- **Vê-se:** arena circular de muro vermelho com janelas, campo central com painel de técnicas e folhagem dourada no chão, vila ao fundo, cristal azul, cabos entre estruturas, floresta densa em torno.
- **Princípios:** a arena é o marco circular do mapa (forma distinta contra o orgânico); anel vermelho une a paleta do hub; a densidade de floresta cria "paredes" naturais; o terreno em placas poligonais planas é a base barata do cenário.
- **Falha a evitar:** densidade uniforme de árvores em toda parte; falta zona de respiro entre marcos. Reserve vazio.
- **Usar em:** mapas de combate com arena e hub.

---

## Síntese por gênero
| Gênero | Foco | Paleta | Luz | HUD |
|---|---|---|---|---|
| Terror | poças de luz no escuro | madeira escura + quente pontual | ambiente baixo, locais | mínima, monocromática, serifa |
| Tycoon/Fazenda | linha de produção legível | saturada, madeira+metal | clara | cantos, placas de nível |
| Aventura marítima | torre/marco central | branco+azul+terracota | clara, céu aberto | habilidades, missão atual |
| Ninja | cristal ou arena | vermelho-escuro+musgo+lavanda | névoa, baixa | 3–4 habilidades com ícone |
| Clássico | decalque/forma primária | primárias | aberta | simples |
