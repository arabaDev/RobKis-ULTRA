# vision — ver e usar imagens (referências, prints, thumbnails)

**Quando usar:** o usuário mandou imagem/print, pediu "nesse estilo", quer crítica de GUI/mapa/thumbnail, ou um estudo de jogo precisa do visual.

## Como ver em cada ambiente
| Ambiente | Imagem anexada na conversa | Imagem em arquivo |
|---|---|---|
| Claude.ai / Desktop | o modelo já vê | — (sem disco do usuário) |
| Claude Code | o modelo já vê | ferramenta **Read** no caminho do arquivo |
| OpenCode | o modelo vê se aceitar imagem | ferramenta **read** (PNG/JPEG/GIF/WebP; redimensiona sozinho até 2000 px) |
Modelo sem visão (alguns modelos locais/compatíveis com OpenAI no OpenCode): a imagem é descartada. No `opencode.json` do modelo, `"modalities": {"input": ["text", "image"], "output": ["text"]}` liga a entrada de imagem quando o modelo suporta. Sem visão de jeito nenhum: use `rv img paleta`/`info` (números reais) e peça uma descrição ao usuário. **Nunca descreva uma imagem que você não abriu.**

## Ferramentas rápidas (`python scripts/rv.py img ...`)
- `preparar <img>`: reduz para ~1568 px no lado maior. Imagem menor = leitura mais rápida e mais barata, sem perder o que importa para design.
- `folha a.png b.png c.png -o refs.png`: várias referências numa só imagem numerada → **uma** leitura em vez de várias.
- `paleta <img> [-k 6]`: cores dominantes em hex, %, papel sugerido e contraste com branco/preto (texto legível pede ≥ 4,5).
- `comparar antes.png depois.png -o diff.png`: % de pixels alterados + mapa em vermelho (regressão visual de GUI/mapa).
- `info`, `baixar <url>`. Thumbnails de um jogo: `python scripts/rv.py jogo <link> --imagens .roviral/img`.

## Imagem de referência → tokens de estilo (antes de construir)
Abra a imagem e extraia, por escrito, em poucas linhas:
1. **Paleta:** 3–5 hex (use `paleta`), qual é fundo, primária, destaque.
2. **Forma:** cantos (retos/arredondados/raio), espessura de borda, densidade (minimalista ↔ cheio).
3. **Material e luz:** plástico liso, madeira, metal, neon; hora do dia; contraste; névoa.
4. **Tipografia (GUI):** peso, caixa alta, serifa/sem serifa, sombra/contorno.
5. **Escala e silhueta (build):** proporção, altura de referência, pontos de referência.
6. **Clima emocional:** 2–3 palavras (ex.: aconchegante, tenso, caótico).
Mapeie para o tema do GUI Engine (`references/gui-engine.md`) ou para a direção de build (`references/build-direction.md`, `rk-visual-direction`). O que o usuário mostrou vence a sua preferência. Inspiração ≠ cópia: não reproduza logos, personagens ou arte de terceiros.

## Crítica de print (GUI, mapa, thumbnail)
- **GUI:** hierarquia (o principal é o maior/mais contrastante?), alinhamento, espaçamento, legibilidade no celular (botões grandes, texto ≥ 4,5 de contraste), excesso de elementos, estados de botão, cara de "gerado rápido" (retângulo cinza + texto branco, gradiente roxo/azul sem motivo).
- **Mapa:** silhueta e pontos de referência, leitura do caminho, variedade de altura, iluminação, áreas vazias, poluição visual, custo provável em mobile.
- **Thumbnail:** teste de 1 segundo (a ação central aparece?), honestidade (mostra o jogo real?), legível em tamanho pequeno, sem promessa de giveaway.
Formato: 3 problemas mais importantes, cada um com a correção concreta, em ordem de impacto.

## Antes/depois
Depois de mudar uma GUI ou mapa, peça/obtenha o print novo e rode `rv img comparar` com o anterior para confirmar que mudou só o que devia.

**Verificação:** cada conclusão visual cita a imagem que foi aberta; tokens de estilo escritos antes do primeiro asset/tela.
