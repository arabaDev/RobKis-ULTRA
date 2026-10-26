# RobKis ULTRA

![Modelo](https://img.shields.io/badge/modelo-Claude%20Opus%205.5-d97757) ![Roblox](https://img.shields.io/badge/Roblox-Studio%20%2B%20Luau-00a2ff)

Agente de IA para desenvolvimento **Roblox**: Luau, Roblox Studio, Blender, GUIs, builds, tycoons e segurança cliente-servidor. Ele decide com motivo, respeita o que você escolher e só afirma o que foi verificado.

Feito para rodar no **Claude Opus 5.5** (`claude-opus-5-5`). O agente inteiro é um único arquivo: [`ultra.md`](ultra.md).

---

## Instalação

### Claude Code
Copie `ultra.md` para `.claude/agents/` do seu projeto (ou para `~/.claude/agents/` para usar em todos). O modelo já vem definido no arquivo (`model: claude-opus-5-5`).

### OpenCode
Copie `ultra.md` para `.opencode/agents/` e troque a linha do modelo para o formato do OpenCode:
```yaml
model: anthropic/claude-opus-5-5
```

### Claude.ai / Claude Desktop
Crie um Projeto, cole o conteúdo de `ultra.md` (sem o bloco `---` do topo) nas instruções do projeto e escolha **Opus 5.5** no seletor de modelo.

---

## Como usar

Comece a mensagem com `/ultra` (qualquer capitalização ou acento vale):

```
/ultra criar um tycoon de fazenda com loja e inventário
/ULTRA refazer a HUD em estilo terror, mobile primeiro
/ultra corrigir o bug da compra duplicada
```

Só `/ultra`, sem pedido, responde: *"RobKis ULTRA ativo. O que criar ou corrigir?"*

## O que ele faz

- **Decide antes de agir:** modo autônomo (padrão), personalizado ou misto; gênero, estilo, complexidade de 1 a 5 e o fluxo mais curto para cada caso. O que você escolher nunca é trocado.
- **Luau seguro:** servidor como autoridade, validação de todo Remote (tipo, faixa, posse, distância, cooldown), DataStore com session lock e retry, compras idempotentes.
- **GUIs com cara de designer humano:** brief de identidade, hierarquia de HUD, checklist anti-"cara de IA", composição própria para celular, 13 estilos de partida.
- **Builds e mapas:** brief de cena, realismo / surrealismo / estilização, composição com ponto focal, loop visual em 3 passes com sua aprovação e orçamento de desempenho mobile.
- **Tycoon, simulador e fazenda:** loop de produção, curva de custo, multiplicadores, rebirth e produção por timestamp.
- **Assets:** procura na Toolbox antes de modelar e faz scan de segurança de todo script inserido.
- **Honestidade de estado:** cada entrega diz o que foi implementado, verificado, testado ou validado no Studio, e o que não foi.

## Roblox Studio e Blender (opcional)

Com os servidores MCP do Roblox Studio e do Blender conectados, o agente trabalha direto no Studio e no Blender. Sem eles, entrega código `.luau` pronto para colar e scripts `bpy` prontos para rodar, e nunca finge que testou.

## Limitações

- Sem MCP do Studio conectado, nada é testado dentro do Roblox Studio; o agente avisa quando for o caso.
- Nomes de jogos citados como referência pertencem aos seus donos; o agente adapta padrões de design, nunca copia layout, arte ou código.
- 
