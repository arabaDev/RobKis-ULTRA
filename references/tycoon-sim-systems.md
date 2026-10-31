# tycoon-sim-systems

Cobre a lacuna de tycoon/simulador/fazenda no catálogo. Combine com `roblox-economy-balancing`, `eco-anti-exploit-economy`, `roblox-datastore-persistence`, `references/gui-engine.md`.

**Quando usar:** loops de produção (dropper, esteira, coletor), coleta e venda, plantio e colheita, pets com multiplicador, rebirth/prestígio.

## Loop e dados
- **Loop central** em uma frase: produz → transporta → coleta → vende → melhora → produz mais. Cada melhoria muda um número visível (ganho/s, capacidade, velocidade) e tem placa de nível legível na própria máquina.
- **Plots:** um dono por plot, atribuído no servidor; só o dono interage (`ProximityPrompt` + checagem de dono no servidor).
- **Dados:** moedas, níveis de máquina, pets e timestamps no servidor; persistência com DataStore (reintento limitado, salvar ao sair e no `BindToClose`). O cliente só exibe.

## Economia
- Custo do nível *n*: `base × crescimento^n` (1,12 a 1,18 típico). Meta: próxima melhoria a cada 20–90 s no início, esticando depois. Calcule o tempo até a próxima melhoria e ajuste a curva, não o palpite.
- Multiplicadores: some bônus do mesmo tipo (pets, passes) e multiplique entre tipos; documente a fórmula em `Config`.
- Rebirth: reseta progresso, concede multiplicador permanente; nunca zere o que foi comprado com Robux.

## Plantas e produção por tempo
- Calcule crescimento por **timestamp** (`os.time()` do plantio) e resolva quando o jogador olha/colhe. Não crie um loop por planta.
- Drops: limite de objetos vivos por plot (pool); remova ao coletar. Esteira com `AssemblyLinearVelocity` ou textura animada, não um script por peça.

## Segurança
Servidor calcula ganhos e preços; compra e colheita têm cooldown e validam posse, distância e saldo; nada de quantidade vinda do cliente. Veja `net-remote-event-design`.

## Legibilidade (referência: cena de tycoon agrícola nas imagens do usuário)
Fluxo da esquerda para a direita em linha clara, máquinas em tamanhos crescentes por nível, madeira + metal + cor saturada pontual, placa de nível, HUD nos cantos (vida, moeda, nível, inventário) com o cenário livre.

**Verificação:** simule 10 min de economia em Luau/Python e confira o tempo entre melhorias; compra duplicada/saldo insuficiente recusados no servidor; `fastcheck.py --level 3`.

**Limites e recuperação:** valores acima são pontos de partida; só playtest define o equilíbrio final. Sem Studio/MCP, entregue o código e marque "não executado".
