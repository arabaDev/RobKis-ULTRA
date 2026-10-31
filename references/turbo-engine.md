# turbo-engine

**Quando usar:** em toda tarefa; o ganho vem de cortar desperdício, não de cortar verificação.

## Como
1. **Classifique** (níveis 1–5 do agente). Pedido claro e risco baixo ⇒ execute direto. Sistema complexo ⇒ plano de poucas linhas com etapas independentes.
2. **Skills por busca**: `python scripts/skill_search.py <palavras>`, leia o `SKILL.md` de menos de cinco. Nunca varra o catálogo. Se o índice estiver desatualizado (aviso do script), diga e use `ls .opencode/skills`.
3. **Sem releitura**: guarde o que já leu na sessão; releia só se o arquivo mudou (assinatura/diff). Não pesquise na web o que já está nos arquivos do projeto.
4. **Paralelismo**: leituras e consultas independentes juntas; escritas no mesmo arquivo nunca. Subagente só se a coordenação custar menos que fazer (e se houver suporte real).
5. **MCP/ferramentas**: agrupe operações independentes em lote quando suportado; timeout em chamadas externas; no máximo 2 retentativas e só para falhas temporárias. Nunca repita automaticamente escrita que possa duplicar objeto.
6. **GUI**: mude `UIConfig`/tema e só os componentes afetados; não recrie a interface. **Script**: reutilize módulos, gere só o necessário. **3D**: não reconstrua o que não mudou.
7. **Meça**: `.fastcheck/history.jsonl` registra tempo de cada verificação; para tarefas use `docs/BENCHMARK.md` (T01–T11). Compare medianas só com amostras suficientes.

## Regras
- Não declare ganho sem número medido antes e depois, na mesma tarefa e com o mesmo escopo.
- Tarefa que ficou rápida por omitir funcionalidade conta como falha.
- Cache só vale se os arquivos, dependências e configuração não mudaram; na dúvida, invalide.

**Verificação:** números reais em `docs/BENCHMARK.md` ou "não medido".

**Limites e recuperação:** latência de modelo e de MCP não é controlável daqui; só é medida quando ocorre.
