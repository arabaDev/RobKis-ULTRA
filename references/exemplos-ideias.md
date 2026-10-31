# exemplos-ideias — barra de qualidade do Idea Engine

Três ideias reais geradas pelo método, avaliadas com `python scripts/viral_score.py references/exemplos-ideias.json`. Servem de **calibragem**: é assim que um dossiê bom se parece, e é assim que uma nota honesta se comporta (ninguém tirou 9 em tudo).

Resultado do script (26/10/2026):
| # | ideia | nota | veredito | por quê |
|---|---|---|---|---|
| 1 | Turno Estranho | 7,48 | AJUSTAR | entende-se em 1 s e é ótima em dupla; retenção depende de pipeline de anomalias |
| 2 | Jardim Faminto | 7,46 | AJUSTAR | retenção forte nas 3 janelas; noites exigem IA e balanceamento |
| 3 | Corda Curta | 6,00 (bruta 7,08) | AJUSTAR (portão falhou) | clipe perfeito, mas não tem motivo forte para a semana 2–4 |
Leitura: nenhuma está pronta para PROTOTIPAR ainda. O próximo passo é atacar o ponto fraco de cada uma (ex.: Turno Estranho → editor moderado de anomalias para conteúdo infinito; Corda Curta → temporada de torres com cordas desbloqueáveis e ranking de duplas) e reavaliar.

## Dossiê completo (modelo): Jardim Faminto
Frase de 5 s: Plante monstros de dia e segure eles à noite com seus amigos.
Público primário: casual em grupo que gosta de susto leve · Emoção dominante: tensão engraçada · Padrões: `crescimento-tempo-real` + `sobrevivencia-coop-noites`
Primeiros 60 s: 0–10 s nasce no próprio canteiro com uma semente na mão → 10–30 s planta, a semente brota na hora e o brotinho morde o pé (som + número de dano cômico) → 30–60 s ganha uma cerca e descobre que bicho cercado produz frutos raros.
Loop central (20 s): regar/alimentar → planta cresce com feedback visual → colher fruto → comprar semente melhor.
Meta de sessão: sobreviver à noite (5 min) sem nenhum monstro escapar do jardim.
Retorno: D1 plantas crescem em tempo real e podem virar mutação durante a noite · D2–7 lua cheia no fim de semana (evento agendado) com espécies que só nascem nela · D8–28 bestiário de mutações, jardins cooperativos maiores, classes de jardineiro.
Social: à noite um cerca, outro ilumina, outro alimenta; monstro fugido invade o jardim vizinho (rivalidade leve). Sozinho: noites menores e um ajudante NPC.
Momentos de clipe: 1) a planta gigante arrancando a cerca enquanto todos correm; 2) mutação ultra-rara nascendo na lua cheia.
Thumbnail: jardineiros com regadores fugindo de uma flor enorme com dentes, sob a lua.
Monetização saudável: sementes cosméticas, decoração de jardim, slots de canteiro; NÃO vender "noite sem monstros".
Diferenças estruturais vs referências: 1) o que cresce é a ameaça; 2) a noite cooperativa é consequência do que você plantou; 3) monstros fugidos afetam outros jardins.
MVP (4 dias): canteiro + 3 sementes + crescimento salvo em DataStore + 1 monstro com IA simples + ciclo dia/noite + cerca.
Riscos e incertezas: medo demais para os mais novos (calibrar o visual cartoon); IA de muitas criaturas no servidor (limitar por jogador); economia de frutos (sumidouros).
Validação: funil de onboarding até "primeira mordida" e "primeira colheita"; bounce de 60 s; return rate de sessões curtas; % de sessões com amigo à noite.
