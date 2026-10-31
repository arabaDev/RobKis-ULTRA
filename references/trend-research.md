# trend-research — pesquisa de mercado Roblox e teardown de jogos virais

**Quando usar:** antes de gerar ideias para um gênero/nicho, quando o usuário cita um jogo, ou quando uma decisão depende do que está em alta agora.

## Regra de ouro
Nunca invente número de jogadores, visitas, receita, tendência ou informação de concorrente. Todo dado vem com **fonte + data**. Sem acesso à web: diga isso, use só conhecimento geral rotulado como "possivelmente desatualizado" e peça ao usuário prints/links se a decisão depender disso.

## 1. Onde pesquisar (em ordem de confiança)
1. **Oficial Roblox:** Creator Docs (discovery, analytics), DevForum (anúncios de staff), Newsroom, página do jogo (descrição, data de criação/atualização, likes, visitas, jogando agora).
2. **Rastreadores de métricas públicas:** sites que acompanham jogadores ao vivo e crescimento (ex.: RoWatcher, Rotrends, RBLXSTAT). Úteis para tendência; confira a data do dado.
3. **Imprensa e análises:** bom para contexto, fraco para número exato.
4. **Comunidade:** comentários, Reddit, Discord, vídeos de criadores de conteúdo — ótimos para **reclamações recorrentes** e para entender o "momento de clipe".

## 2. Pesquisa de nicho (Modo gênero)
Colete para os 5–10 jogos de maior crescimento do nicho:
- padrão estrutural (use os ids de `viral-patterns.md`), verbo central, público;
- formato do título/thumbnail (a "linguagem" da trend);
- idade do jogo e ritmo de updates;
- reclamações recorrentes (o que o público quer e não recebe);
- o que se repete em todos (= saturado) e o que ninguém faz (= espaço).
Saída: **mapa de saturação** (padrão × quantidade de jogos parecidos × qualidade média) e **3 lacunas** concretas.

## 3. Teardown de um jogo (Modo jogo específico)
Desmonte em termos de PADRÃO, nunca de conteúdo:
| Camada | Pergunta |
|---|---|
| Promessa | O que a thumbnail/título prometem em 1 s? |
| 60 s | O que acontece nos primeiros 60 s? Onde está a primeira recompensa? |
| Loop | Ação → feedback → recompensa, em quantos segundos? |
| Escalada | O que cresce? Como o jogador percebe? |
| Tensão | O que fica pendente quando o jogador sai? |
| Social | O que muda com amigos? Há conflito, cooperação, palco? |
| Clipe | Qual é o vídeo de 15 s típico desse jogo? |
| Longo prazo | O que existe na semana 3? Ritmo de updates/eventos? |
| Monetização | O que vende? Algo quebra a tensão central? |
| Técnico | Mobile? Desempenho? Física/IA pesadas? |
| Fraquezas | Reclamações recorrentes; o que uma versão nova resolveria? |
Feche SEMPRE com a lista **"O que muda"** (mínimo 3 mudanças estruturais + tema, nomes e arte próprios) antes de passar para o `idea-engine` ou para a especificação.

## 4. Limites de originalidade (não negociáveis)
Liberado: gênero, padrão de mecânica, estrutura de loop, tipo de monetização, princípios de estilo.
Proibido: nomes próprios, textos de UI, personagens, arte, modelos, mapas, sons, números exatos de progressão, marca ou IP de terceiros (incluindo personagens de anime/filme). Pedido de cópia exata: uma linha explicando o limite e siga com a versão adaptada.

## 5. Registro
Guarde a pesquisa em `.roviral/pesquisa/<data>-<nicho>.md` com fontes e datas, para não repetir a mesma busca na sessão seguinte. Pesquisa com mais de ~30 dias: revalide antes de decidir.

**Verificação:** todo número tem fonte e data; teardown termina com "O que muda"; mapa de saturação + 3 lacunas no modo nicho.
