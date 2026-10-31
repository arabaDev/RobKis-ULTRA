# Catálogo de padrões virais (gerado de references/viral_patterns.json)

> Saturação e referências são OBSERVAÇÕES/ESTIMATIVAS da pesquisa de out/2026, não dados oficiais. Revalide com pesquisa atual antes de decidir (references/trend-research.md). Jogos citados são referência de PADRÃO, nunca molde de cópia.

| id | padrão | verbos | saturação (out/2026, estimativa) | sinais do algoritmo |
|---|---|---|---|---|
| `roubo-de-posse` | Posse vulnerável (roubar e defender) | roubar, defender, colecionar | alta | play_days, playtime, co_play |
| `crescimento-tempo-real` | Crescimento em tempo real (compromisso com o relógio) | plantar, esperar, colher | alta | play_days, qualified_sessions |
| `estoque-global` | Relógio de estoque global (escassez sincronizada) | esperar, disputar, comprar | media | playtime, play_days |
| `mais-um-por-x` | +1 por ação (crescimento numérico explosivo) | acumular, correr, renascer | alta | play_through, first_play_bounce, playtime |
| `rng-rolagem` | Rolagem de raridade (RNG com anúncio) | rolar, colecionar, exibir | media | playtime, play_days |
| `sobrevivencia-coop-noites` | Sobrevivência cooperativa por noites | sobreviver, coletar, proteger | media | co_play, playtime, play_days |
| `assimetrico-1vN` | Assimétrico 1 contra muitos | fugir, caçar, cooperar | media | co_play, qualified_sessions, playtime |
| `anomalia` | Caça à anomalia (algo está errado) | observar, decidir, repetir | media | play_through, first_play_bounce, co_play |
| `horror-sensorial` | Horror por regra sensorial (não faça barulho) | silenciar, esconder, atravessar | baixa | co_play, play_through, playtime |
| `desfile-julgamento` | Criar e ser julgado (desfile/votação) | criar, apresentar, votar | media | co_play, qualified_sessions, play_days |
| `caos-fisica` | Caos de física (ragdoll e destruição) | lançar, cair, destruir | media | play_through, first_play_bounce, co_play |
| `battlegrounds` | Arena de golpes (battlegrounds) | combinar, esquivar, dominar | alta | playtime, play_days, co_play |
| `duelo-reflexo` | Duelo de reflexo (uma mecânica só) | rebater, reagir, sobreviver | media | play_through, playtime, play_days |
| `torre-publica` | Escalada pública com pressão social | escalar, comparar, recomeçar | media | play_through, playtime |
| `emprego-caotico` | Trabalho caótico (simulador de serviço com pressão) | atender, consertar, expandir | media | co_play, playtime, play_days |
| `cuidado-tensao` | Cuidado com tensão não resolvida | cuidar, evoluir, trocar | media | play_days, co_play, spend_days |
| `coleta-rng-ambiente` | Coleta com sorte no ambiente (pescar/cavar/caçar) | pescar, catalogar, explorar | alta | playtime, play_days |
| `desastre-rodadas` | Desastres aleatórios por rodada | sobreviver, improvisar, rir | media | play_through, co_play, playtime |
| `deducao-social` | Dedução social (papéis ocultos) | desconfiar, blefar, acusar | media | co_play, qualified_sessions |
| `jornada-veiculo` | Jornada longa com veículo | viajar, consertar, saquear | media | co_play, playtime |
| `tycoon-base` | Tycoon de base (construir e automatizar) | construir, automatizar, expandir | alta | playtime, play_days, spend_days |
| `fusao-evolucao` | Fundir para evoluir (merge) | combinar, descobrir, organizar | baixa | playtime, play_through |
| `crescer-absorver` | Crescer absorvendo o mundo | absorver, crescer, dominar | baixa | play_through, first_play_bounce, playtime |
| `defesa-unidades` | Defesa com coleção de unidades | posicionar, colecionar, evoluir | alta | playtime, play_days, spend_days |
| `roleplay-social` | Sandbox social de roleplay | morar, encenar, socializar | alta | co_play, play_days |

## Posse vulnerável (roubar e defender) (`roubo-de-posse`)

- **Estrutura:** Cada jogador tem uma base com colecionáveis que geram renda; outros podem invadir, pegar um item e carregá-lo até a própria base; a base tem trava temporária e defesas.
- **Por que funciona:** Perda é sentida mais forte que ganho: a ameaça de ser roubado cria tensão constante; a vingança gera retorno e conversa entre amigos.
- **Momento de clipe:** Fuga desesperada carregando o item mais raro com o servidor inteiro atrás.
- **Gancho de retorno:** Renda acumulada e risco de perder o que é seu enquanto está fora (ou proteção offline comprável com cuidado).
- **Monetização saudável:** Cosméticos de base, slots extras, aceleradores de renda; nunca vender só 'imunidade total' que mata a tensão do jogo.
- **Riscos:** frustração de novatos roubados; toxicidade; monetização predatória penalizada pelo algoritmo 2026
- **Referências de padrão (não copiar):** Steal a Brainrot, Steal an Egg
- **Twists possíveis:** só dá para roubar em dupla (um distrai, outro carrega) · o item roubado muda de forma/raridade no caminho · roubar deixa rastro visível que o dono pode seguir · a base é móvel (veículo/animal)

## Crescimento em tempo real (compromisso com o relógio) (`crescimento-tempo-real`)

- **Estrutura:** Coisas plantadas/chocadas/construídas progridem em tempo real, inclusive com o jogador offline; colher no momento certo rende mais; mutações raras por eventos.
- **Por que funciona:** Cria 'consulta' periódica: o jogador volta porque algo dele está pronto. Baixo estresse, progresso garantido, bom para público casual.
- **Momento de clipe:** Mutação ultra-rara aparecendo durante um evento de clima.
- **Gancho de retorno:** Colheita pronta, evento de clima agendado, item raro amadurecendo.
- **Monetização saudável:** Aceleradores pontuais, cosméticos de jardim, slots; preço de pular espera moderado.
- **Riscos:** sessões curtas demais; economia inflaciona sem sumidouros
- **Referências de padrão (não copiar):** Grow a Garden
- **Twists possíveis:** o que cresce é perigoso e precisa ser contido · crescimento depende do que os vizinhos plantam · o jardim cresce dentro de uma criatura gigante · colher cedo/tarde muda a espécie

## Relógio de estoque global (escassez sincronizada) (`estoque-global`)

- **Estrutura:** Loja do servidor reabastece a cada N minutos com chance de item raro; todos veem o mesmo estoque e o mesmo cronômetro.
- **Por que funciona:** Escassez + cronômetro visível = antecipação compartilhada; anúncios de item raro geram picos de conversa.
- **Momento de clipe:** Contagem regressiva e o item lendário aparece no estoque.
- **Gancho de retorno:** Próximo reabastecimento; eventos de estoque especial anunciados com antecedência (experience events).
- **Monetização saudável:** Notificação de estoque, cosméticos; evitar vender reroll ilimitado.
- **Riscos:** vira só espera passiva; FOMO excessivo para público infantil
- **Referências de padrão (não copiar):** Grow a Garden, simuladores de coleção
- **Twists possíveis:** o estoque é um mercador que viaja entre servidores · jogadores votam no que entra no próximo estoque · o estoque é ganho em um minigame, não comprado

## +1 por ação (crescimento numérico explosivo) (`mais-um-por-x`)

- **Estrutura:** Um atributo cresce +1 a cada segundo/passo/abate/pulo; obstáculos escalam; rebirth multiplica; números enormes.
- **Por que funciona:** Entendimento instantâneo pelo título, progresso visível a cada segundo, sensação de 'só mais um pouco'.
- **Momento de clipe:** Personagem absurdamente rápido/grande atravessando o mapa em 1 segundo.
- **Gancho de retorno:** Recorde pessoal, próximo mundo desbloqueado, rebirth.
- **Monetização saudável:** Multiplicadores x2, auto-coleta, trilhas visuais.
- **Riscos:** profundidade rasa derruba play days 8–28; formato muito clonado = penalidade de 'jogo não único'
- **Referências de padrão (não copiar):** +1 Speed Keyboard Escape, +1 Upgrade Per Kill
- **Twists possíveis:** o +1 vale para TODOS no servidor (cooperação forçada) · cada +1 também aumenta um perigo · você escolhe em qual atributo o +1 cai e isso define a build · o +1 é roubável

## Rolagem de raridade (RNG com anúncio) (`rng-rolagem`)

- **Estrutura:** O jogador rola por auras/itens com raridades 1 em N; sorte melhora com tempo/itens; raridades altas são anunciadas para o servidor.
- **Por que funciona:** Reforço variável, ostentação social e sessões AFK longas; o anúncio global vira momento coletivo.
- **Momento de clipe:** Cutscene da raridade 1 em 1.000.000 com o servidor inteiro reagindo.
- **Gancho de retorno:** Coleção incompleta, eventos de sorte agendados.
- **Monetização saudável:** Cosméticos de exibição, poções de sorte com transparência de chances.
- **Riscos:** mecânica parecida com aposta: mostre as chances, nada de compra direta de rolagem paga; pouca agência
- **Referências de padrão (não copiar):** Sol's RNG
- **Twists possíveis:** a raridade rolada é um poder jogável, não só visual · rolar consome algo do mundo compartilhado · rolagens combinam entre amigos

## Sobrevivência cooperativa por noites (`sobrevivencia-coop-noites`)

- **Estrutura:** Grupo pequeno sobrevive N noites; de dia coleta/constrói, à noite uma ameaça ataca; fogueira/base evolui; resgates e classes.
- **Por que funciona:** Medo compartilhado + papéis no grupo; cada noite é uma meta curta dentro de uma meta longa; histórias emergentes.
- **Momento de clipe:** Amigo sendo arrastado para a escuridão enquanto o resto corre para a fogueira.
- **Gancho de retorno:** Recorde de noites, classes desbloqueáveis, novos biomas.
- **Monetização saudável:** Classes cosméticas/alternativas equilibradas, cosméticos, servidores privados.
- **Riscos:** solo vazio; escopo de IA e conteúdo grande
- **Referências de padrão (não copiar):** 99 Nights in the Forest
- **Twists possíveis:** a ameaça é um dos jogadores a partir da noite 5 · o grupo está em um navio/trem em movimento · dia e noite trocam: o perigo é a luz · cada noite um jogador perde um sentido (visão, som)

## Assimétrico 1 contra muitos (`assimetrico-1vN`)

- **Estrutura:** Um jogador é a ameaça (assassino/monstro), os outros cumprem objetivos e fogem; rodadas curtas; papéis rotacionam.
- **Por que funciona:** Papéis diferentes = duas experiências no mesmo jogo; rodadas curtas; ótimo para clipes e com amigos.
- **Momento de clipe:** Fuga no último segundo pela saída.
- **Gancho de retorno:** Desbloquear novos monstros/sobreviventes, ranking.
- **Monetização saudável:** Skins, emotes, passe de temporada cosmético.
- **Riscos:** balanceamento difícil; fila/servidores vazios
- **Referências de padrão (não copiar):** Forsaken, Flee the Facility
- **Twists possíveis:** o caçador fica mais fraco a cada objetivo cumprido · sobreviventes podem virar caçadores · o mapa é construído pelos sobreviventes antes da rodada

## Caça à anomalia (algo está errado) (`anomalia`)

- **Estrutura:** O jogador repete um ambiente/rotina e precisa notar o que mudou; acertar avança, errar volta; tom de humor ou terror leve.
- **Por que funciona:** Regra entendida em segundos, tensão de atenção, ótimo para assistir (o público grita 'ali!').
- **Momento de clipe:** Anomalia absurda percebida tarde demais.
- **Gancho de retorno:** Novas anomalias semanais, finais alternativos.
- **Monetização saudável:** Dicas, cosméticos, pacotes de cenários.
- **Riscos:** conteúdo finito (precisa de pipeline de anomalias); rejogabilidade depende de atualização
- **Referências de padrão (não copiar):** Airport Security (Anomaly), Something is Wrong With My Dog
- **Twists possíveis:** anomalias criadas por outros jogadores · modo cooperativo: cada um vê metade da sala · a anomalia é um jogador disfarçado

## Horror por regra sensorial (não faça barulho) (`horror-sensorial`)

- **Estrutura:** Uma regra simples governa a ameaça (barulho, olhar, luz, água); o jogador ajusta o próprio comportamento; grupo se sabota sem querer.
- **Por que funciona:** Uma regra clara gera infinitas situações; erros dos amigos viram comédia de terror.
- **Momento de clipe:** Alguém espirra/pisa na água e todos são pegos.
- **Gancho de retorno:** Novas fases, ameaças com regras novas.
- **Monetização saudável:** Cosméticos, revive com limite, servidores privados.
- **Riscos:** chat de voz/áudio precisa ser bem feito; conteúdo de fase
- **Referências de padrão (não copiar):** DONT SPLASH, HUSH
- **Twists possíveis:** a regra muda a cada sala e só um jogador sabe qual é · a ameaça reage ao chat de texto · o barulho também é a sua arma

## Criar e ser julgado (desfile/votação) (`desfile-julgamento`)

- **Estrutura:** Tema anunciado, tempo curto para criar (roupa, prato, casa, dança), todos votam, pódio.
- **Por que funciona:** Expressão de identidade + julgamento social; cada rodada gera conversa; forte em público que gosta de avatar.
- **Momento de clipe:** Criação ridícula que vence por votação irônica.
- **Gancho de retorno:** Itens novos semanais, temas de evento.
- **Monetização saudável:** Itens cosméticos, VIP de roupas, nunca comprar votos.
- **Riscos:** votação injusta/troll; moderação de conteúdo
- **Referências de padrão (não copiar):** Dress to Impress
- **Twists possíveis:** você cria para OUTRO jogador usar · o júri é um NPC com gosto que muda e precisa ser lido · criar com peças de física que precisam ficar em pé

## Caos de física (ragdoll e destruição) (`caos-fisica`)

- **Estrutura:** Corpos ragdoll, lançamentos, explosões; o próprio caos é a recompensa; medidores de dano/distância.
- **Por que funciona:** Comédia física é universal e clipável; zero explicação necessária.
- **Momento de clipe:** Amigo arremessado do outro lado do mapa em câmera lenta.
- **Gancho de retorno:** Recordes, mapas/ferramentas novas.
- **Monetização saudável:** Ferramentas cosméticas, efeitos, mapas.
- **Riscos:** custo de física/servidor; pouca progressão = baixo D8–28
- **Referências de padrão (não copiar):** Ragdoll engines, What If Disasters
- **Twists possíveis:** ragdoll como mecânica de puzzle cooperativo · você é o projétil e precisa acertar alvos · o caos alimenta uma economia (dano vira moeda)

## Arena de golpes (battlegrounds) (`battlegrounds`)

- **Estrutura:** PvP livre com movesets de personagens, combos, ultimate; arena compartilhada.
- **Por que funciona:** Domínio de habilidade + espetáculo visual; tradição de criador de conteúdo de combate.
- **Momento de clipe:** Combo perfeito virando a luta com 1 de vida.
- **Gancho de retorno:** Novos personagens, ranking, maestria.
- **Monetização saudável:** Skins de golpes, emotes, personagens desbloqueáveis também jogando.
- **Riscos:** saturação muito alta; netcode/hitbox exigentes; IP: nunca usar personagens de anime reais
- **Referências de padrão (não copiar):** The Strongest Battlegrounds, Jujutsu Shenanigans
- **Twists possíveis:** golpes são criados pelo jogador combinando elementos · o mapa muda conforme os golpes destroem · luta em duplas com golpes combinados

## Duelo de reflexo (uma mecânica só) (`duelo-reflexo`)

- **Estrutura:** Um único verbo de habilidade (rebater, desviar, mirar) em rodadas rápidas de eliminação.
- **Por que funciona:** Domina-se em segundos, aprofunda por anos; tensão crescente; clipável.
- **Momento de clipe:** Troca de rebatidas em velocidade absurda no final.
- **Gancho de retorno:** Ranking, habilidades alternativas, temporadas.
- **Monetização saudável:** Cosméticos de efeito, habilidades equilibradas.
- **Riscos:** latência; novato sem chance
- **Referências de padrão (não copiar):** Blade Ball
- **Twists possíveis:** a bola é um animal com vontade própria · duelo cooperativo contra o mapa · rebater muda a gravidade da arena

## Escalada pública com pressão social (`torre-publica`)

- **Estrutura:** Todos sobem o mesmo percurso ao mesmo tempo; o progresso de cada um é visível; tempo/rodada reinicia.
- **Por que funciona:** Ver o outro avançar gera pressão e humor na queda; partidas sempre diferentes se o percurso é gerado.
- **Momento de clipe:** Queda do topo até o início.
- **Gancho de retorno:** Percurso novo a cada rodada, recordes.
- **Monetização saudável:** Cosméticos, efeitos de vitória, sem pular fase paga em modo competitivo.
- **Riscos:** frustração; monotonia sem variação
- **Referências de padrão (não copiar):** Tower of Hell
- **Twists possíveis:** jogadores à frente podem sabotar os de trás · a torre é construída pelos que caíram · corda que une dupla

## Trabalho caótico (simulador de serviço com pressão) (`emprego-caotico`)

- **Estrutura:** Atender clientes/consertar coisas sob tempo; pedidos absurdos; cooperação em equipe; melhorias do negócio.
- **Por que funciona:** Familiar (todo mundo entende 'loja'), caos cooperativo, progressão de negócio.
- **Momento de clipe:** Cliente absurdo e a equipe em pânico.
- **Gancho de retorno:** Negócio evolui, clientes raros, eventos.
- **Monetização saudável:** Decoração, funcionários NPC, cosméticos.
- **Riscos:** repetitivo sem variedade de pedidos
- **Referências de padrão (não copiar):** Fix My Phone!, Sell Lemons
- **Twists possíveis:** os clientes são monstros com regras · o negócio fica em movimento (trem, nave) · um jogador é cliente secreto que avalia

## Cuidado com tensão não resolvida (`cuidado-tensao`)

- **Estrutura:** Criaturas/pessoas com necessidades que pedem atenção; crescem e evoluem com cuidado; troca social.
- **Por que funciona:** Vínculo afetivo + tarefa sempre pendente puxa retorno; troca gera economia social.
- **Momento de clipe:** Evolução rara revelada.
- **Gancho de retorno:** Necessidades pendentes, evolução próxima, eventos sazonais.
- **Monetização saudável:** Ovos/itens cosméticos com chances visíveis, casas, acessórios.
- **Riscos:** golpes em trocas; economia de raridade
- **Referências de padrão (não copiar):** Adopt Me!
- **Twists possíveis:** a criatura reflete o comportamento do dono · cuidar em equipe (criatura gigante coletiva) · a criatura cuida de você em perigo

## Coleta com sorte no ambiente (pescar/cavar/caçar) (`coleta-rng-ambiente`)

- **Estrutura:** Ação simples de coleta com minigame curto; raridades, mutações, bestiário; locais novos.
- **Por que funciona:** Relaxante + loteria + coleção; bom para AFK social.
- **Momento de clipe:** Captura de algo gigantesco/impossível.
- **Gancho de retorno:** Bestiário incompleto, eventos de clima, locais.
- **Monetização saudável:** Varas/ferramentas cosméticas, sorte temporária transparente.
- **Riscos:** gênero muito clonado; economia inflaciona
- **Referências de padrão (não copiar):** Fisch, Fish It!
- **Twists possíveis:** o que você pesca te puxa para outro mundo · pesca cooperativa de criaturas colossais · o bestiário é escrito pelos jogadores

## Desastres aleatórios por rodada (`desastre-rodadas`)

- **Estrutura:** Rodadas curtas com um evento aleatório (tornado, lava, meteoro); sobreviver é o objetivo.
- **Por que funciona:** Imprevisível e social; cada rodada é história nova.
- **Momento de clipe:** Desastre combinado inesperado.
- **Gancho de retorno:** Desastres novos, conquistas.
- **Monetização saudável:** Cosméticos, votar no próximo desastre (grátis com limite).
- **Riscos:** progressão rasa
- **Referências de padrão (não copiar):** Natural Disaster Survival, What If Disasters
- **Twists possíveis:** jogadores eliminados controlam o desastre · o mapa lembra os desastres anteriores · construir abrigo antes da rodada

## Dedução social (papéis ocultos) (`deducao-social`)

- **Estrutura:** Papéis secretos (assassino, xerife, inocente); rodadas curtas; blefe.
- **Por que funciona:** Interação humana é o conteúdo; ótimo com amigos e para vídeo.
- **Momento de clipe:** Blefe perfeito revelado no final.
- **Gancho de retorno:** Cosméticos, papéis novos.
- **Monetização saudável:** Skins de arma/efeito, papéis cosméticos.
- **Riscos:** precisa de servidor cheio; chat tóxico
- **Referências de padrão (não copiar):** Murder Mystery 2
- **Twists possíveis:** papéis trocam no meio · o traidor é um NPC que imita jogadores · dedução sem chat, só gestos

## Jornada longa com veículo (`jornada-veiculo`)

- **Estrutura:** Grupo viaja uma longa distância com um veículo que precisa de combustível/reparos; perigos na estrada; saques.
- **Por que funciona:** Meta clara (chegar), progresso espacial visível, histórias de estrada.
- **Momento de clipe:** Veículo quebrando no pior lugar possível.
- **Gancho de retorno:** Distância recorde, veículos e rotas novas.
- **Monetização saudável:** Veículos cosméticos, classes.
- **Riscos:** geração procedural do caminho e streaming
- **Referências de padrão (não copiar):** Dead Rails, A Dusty Trip
- **Twists possíveis:** o veículo é uma criatura viva · a estrada é construída à frente pelo grupo · jornada vertical (elevador, foguete)

## Tycoon de base (construir e automatizar) (`tycoon-base`)

- **Estrutura:** Comprar peças que geram renda automática, expandir a base, rebirth.
- **Por que funciona:** Progresso constante e visível, metas claras.
- **Momento de clipe:** Base gigante final.
- **Gancho de retorno:** Renda offline, próximos andares.
- **Monetização saudável:** Multiplicadores, decoração.
- **Riscos:** fórmula gasta sem twist
- **Referências de padrão (não copiar):** tycoons clássicos
- **Twists possíveis:** bases vizinhas interagem (comércio, sabotagem) · a base precisa ser defendida à noite · a fábrica produz criaturas que fogem

## Fundir para evoluir (merge) (`fusao-evolucao`)

- **Estrutura:** Juntar itens iguais cria nível superior; espaço limitado; descobertas de combinações.
- **Por que funciona:** Curiosidade da próxima forma; satisfação tátil.
- **Momento de clipe:** Descoberta da forma final absurda.
- **Gancho de retorno:** Árvore de descobertas incompleta.
- **Monetização saudável:** Espaço extra, cosméticos.
- **Riscos:** solo demais
- **Referências de padrão (não copiar):** jogos de merge
- **Twists possíveis:** fundir com amigos (itens de dois donos) · fusões criam monstros que atacam o mapa · fusão física em 3D com peso

## Crescer absorvendo o mundo (`crescer-absorver`)

- **Estrutura:** Você absorve objetos menores e cresce; o mundo vai ficando pequeno; escala muda tudo.
- **Por que funciona:** Fantasia de poder com mudança de escala visível e clipável.
- **Momento de clipe:** Engolir o mapa inteiro.
- **Gancho de retorno:** Mundos novos, recordes.
- **Monetização saudável:** Skins, trilhas.
- **Riscos:** física/escala pesada; fim abrupto
- **Referências de padrão (não copiar):** roll the world
- **Twists possíveis:** jogadores grandes viram mapa para os pequenos · crescer te deixa lento e alvo · o que você absorve vira sua habilidade

## Defesa com coleção de unidades (`defesa-unidades`)

- **Estrutura:** Coletar unidades por sorteio/progresso e posicioná-las para defender ondas.
- **Por que funciona:** Estratégia leve + coleção + cooperação.
- **Momento de clipe:** Última onda segurada por uma unidade rara.
- **Gancho de retorno:** Banners/eventos, evolução de unidades.
- **Monetização saudável:** Unidades também obtidas jogando, chances visíveis.
- **Riscos:** IP de anime; dependência de gacha
- **Referências de padrão (não copiar):** Anime Adventures
- **Twists possíveis:** as unidades são outros jogadores · o caminho é desenhado pelo time adversário · defesa em movimento (trem)

## Sandbox social de roleplay (`roleplay-social`)

- **Estrutura:** Cidade/espaço com casas, veículos, empregos de faz-de-conta; o conteúdo são as pessoas.
- **Por que funciona:** Identidade e amizade; zero regra.
- **Momento de clipe:** Encenações e histórias de jogadores.
- **Gancho de retorno:** Amigos, casa própria, itens novos.
- **Monetização saudável:** Casas, veículos, cosméticos.
- **Riscos:** dominado por gigantes estabelecidos; moderação
- **Referências de padrão (não copiar):** Brookhaven RP, Berry Avenue
- **Twists possíveis:** roleplay com regra de jogo leve (eleição, crime, clima) · cenário incomum (cidade submersa, estação espacial) · papéis com objetivos secretos

