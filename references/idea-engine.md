# idea-engine — ROViral Idea Engine (inventar ideias virais que não sejam clichê)

**Quando usar:** sempre que o pedido envolver ideia de jogo, conceito novo, "me dá ideias", "qual jogo eu faço", ou reconstrução de um jogo que precisa de um conceito melhor. Base teórica: `viral-science.md`.

## Princípios
1. **Ideia é hipótese, não promessa.** Nunca diga que algo "vai viralizar". Diga por que tem potencial e o que precisa ser verdade.
2. **Divergir antes de convergir.** Gere muitas sementes, descarte a maioria, aprofunde poucas.
3. **Estrutura > tema.** Trocar o cenário de um hit não é ideia nova. Inove no verbo, na ameaça, na perda, na relação entre jogadores ou no tempo.
4. **Pequeno e afiado vence grande e genérico.** Prefira uma mecânica central excelente que cabe num MVP a um mundo enorme.
5. **Sem cópia.** Jogos citados são referência de padrão, nunca de nomes, arte, texto ou números (ver `viral-game-inspector`).

## O método em 10 passos

1. **Oportunidade.** O que o público quer e não está recebendo bem? Fontes: reclamações recorrentes em jogos do gênero, padrões em alta com pouca variação, público mal servido (ex.: horror coop para quem tem medo demais; competitivo para mobile). Se houver acesso à web, faça a pesquisa de `trend-research.md`; sem web, diga que as tendências são do conhecimento do agente e podem estar velhas.
2. **Sementes.** Rode `python scripts/idea_forge.py -n 8` (e `--max-saturacao media` para fugir do óbvio). Cada semente combina dois padrões estruturais, um tema, um operador de twist, um multiplicador social e um gancho de retorno, sem repetir nada dentro do lote. Some 2–4 sementes próprias usando os **operadores** abaixo.
3. **Combinações incomuns.** Para cada semente boa, pergunte: "e se a ameaça fosse outro jogador?", "e se o tempo real importasse?", "e se precisasse de dois?", "e se a perda fosse visível e recuperável?".
4. **Mecânica central.** Escreva o verbo principal e o que o torna especial em uma linha. Se o verbo é "coletar" ou "clicar" sem nada mais, ainda não há ideia.
5. **Uma partida.** Descreva os primeiros 60 s e uma sessão de 15 min, segundo a segundo nos primeiros 60.
6. **Diversão.** Nomeie a emoção dominante (tensão, risada, poder, descoberta, ostentação, pertencimento) e de onde ela vem.
7. **Momentos memoráveis.** Escreva 2 momentos de clipe concretos.
8. **Retorno.** Gancho para D1, para D2–7 e para D8–28 (um por janela, concretos).
9. **Custo.** MVP em dias, sistemas necessários, riscos técnicos (física, IA, rede, conteúdo infinito).
10. **Selecionar e lapidar.** Avalie com `viral-scorecard.md` + `python scripts/viral_score.py`; aplique os "testes de fogo"; desenvolva a melhor (ou as melhores, se o usuário pediu várias).

## Operadores de invenção (use pelo menos 2 por ideia)
Inverter papel · Mudar escala · Acoplar jogadores · Transplantar loop de outro gênero · Regra única absurda · Contraste de tom (fofo + assustador) · Mundo que lembra · Tempo real · Perda visível e recuperável · Conteúdo criado por jogador · Papel oculto · Física como mecânica · Progresso coletivo · Restringir um sentido · Base em movimento · Consequência permanente.
A lista completa com exemplos vive em `references/viral_patterns.json` (campo `operadores_twist`) e no catálogo `viral-patterns.md`.

## Testes de fogo (eliminatórios)
- **Teste da criança:** uma criança de 9 anos repete a ideia depois de ouvir uma vez?
- **Teste da thumbnail:** dá para mostrar a ação central numa imagem, sem texto?
- **Teste dos 60 s:** a coisa divertida acontece antes de 1 min?
- **Teste do amigo:** "entra aqui comigo" faz sentido? O que muda com o amigo?
- **Teste do clipe:** existe um vídeo de 15 s que se explica sozinho?
- **Teste do dia 8:** o que um jogador faz na terceira semana que não fazia na primeira hora?
- **Teste do reskin:** liste 3 diferenças estruturais em relação ao jogo mais parecido. Se não houver, descarte ou mude.
- **Teste do servidor vazio:** é jogável com 1 a 3 pessoas?
- **Teste do escopo:** um MVP jogável sai em poucos dias de trabalho?

## Anti-clichês (proibido como ideia, a menos que o usuário peça E haja twist estrutural)
"Simulador de clicar com pets e rebirth" puro · "Tycoon de X" só trocando o tema · "Obby de X" sem regra nova · "Battlegrounds com personagens de anime" (risco de IP) · "Steal a ___" trocando só o objeto roubado · qualquer ideia cuja graça seja só o nome de meme · qualquer ideia que precise de giveaway no título.

## Quando o usuário pede VÁRIAS ideias
- Cada ideia com **padrão principal diferente, público diferente ou emoção dominante diferente** (pelo menos 2 dos 3 diferentes entre quaisquer duas ideias).
- Inclua pelo menos 1 ideia **segura** (padrão comprovado + twist forte), 1 **ousada** (padrão pouco saturado) e 1 **barata** (MVP mínimo).
- `viral_score.py` acusa ideias parecidas demais: troque, não justifique.
- Apresente um ranking com a recomendação e o porquê.

## Quando o usuário pede UMA ideia
Gere 6–10 sementes em silêncio, escolha a melhor pela rubrica e entregue só ela, desenvolvida no formato de dossiê. Cite em uma linha as 2 alternativas que quase venceram.

## Formato de entrega: Dossiê da ideia
```
## <Nome curto (até 3 palavras)>
Frase de 5 s: <até 15 palavras>
Público primário: <arquétipo> · Emoção dominante: <...> · Padrões: <id principal> + <id secundário>
Primeiros 60 s: <0–10 s / 10–30 s / 30–60 s>
Loop central (10–30 s): <ação → feedback → recompensa>
Meta de sessão: <...>
Retorno: D1 <...> · D2–7 <...> · D8–28 <...>
Social: <o que muda com amigos; como funciona sozinho>
Momentos de clipe: 1) <...> 2) <...>
Thumbnail: <descrição da imagem honesta>
Monetização saudável: <2–4 itens; o que NÃO vender>
Diferenças estruturais vs <referência>: 1) 2) 3)
MVP (<N> dias): <sistemas mínimos, em ordem>
Riscos e incertezas: <técnicos, de design, de mercado>
Notas (0–10, rótulo de evidência): originalidade · diversão imediata · compreensão · compartilhamento · retenção · diferenciação · viabilidade · expansão · público
Veredito: PROTOTIPAR | AJUSTAR | DESCARTAR (nota do viral_score.py)
Como validar: <métricas e limites do protótipo — ver viral-validation.md>
```

**Exemplo calibrado:** `references/exemplos-ideias.md` (dossiê modelo + 3 ideias avaliadas sem inflar notas). Use como barra mínima de qualidade.

**Verificação:** dossiê completo; portões do `viral_score.py` sem falha (ou falha explicada); nenhuma nota "verificada" sem fonte.

**Limites:** o forge gera combinações, não julgamento. O julgamento é seu, e a confirmação vem só do protótipo com jogadores reais.
