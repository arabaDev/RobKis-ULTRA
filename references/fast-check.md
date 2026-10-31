# fast-check

**Quando usar:** depois de qualquer alteração de arquivo (nível 1) e antes de declarar algo concluído (nível pelo risco).

## Níveis (`python scripts/fastcheck.py`)
| Nível | Comando | Cobre | Tempo |
|---|---|---|---|
| 1 Instant | `fastcheck.py` | só arquivos alterados desde a última passagem limpa: sintaxe Python, blocos/parênteses Luau, JSON, frontmatter de SKILL.md, mojibake, segredos, padrões de risco (`loadstring`, `require(<id>)`) | < 1 s típico, orçamento 10 s (relógio monotônico) |
| 2 Targeted | `--level 2` | nível 1 + verificadores dos módulos tocados (`gui-engine/tools/check_luau.py` e autoteste, `factory/build.py --check`) | poucos s |
| 3 Deep | `--level 3` | tudo, sem cache e sem orçamento; ruff/mypy/pytest só se já instalados (nada é instalado) | pode passar de 10 s |

Use nível 3 em: mudança de arquitetura, multiplayer, segurança, integração, entrega final.

## Regras
- O relatório imprime sempre o que **não** foi executado. Repita ao usuário; nunca chame de "verificação completa" um nível 1 ou 2.
- Orçamento estourado ⇒ "INCOMPLETO": liste o que ficou de fora. Não aumente o orçamento para esconder lentidão no nível 1.
- Erro: origem provável → confirme com evidência → menor correção → rode de novo o nível relevante → regressão. Máximo 2 tentativas por estratégia, depois mude de abordagem ou reporte causa provável. Nunca remova teste para passar.
- Cache em `.fastcheck/` (assinatura tamanho+mtime); só arquivos que passaram saem da lista de "alterados". `--no-cache` força tudo.
- Python: compilar não prova funcionamento; rode testes do módulo quando existirem. Luau: o verificador é estrutural; só o Studio/`luau-analyze` confirma APIs e tipos.

**Verificação:** a saída termina com `OK` ou lista os erros com arquivo:linha.

**Limites e recuperação:** não executa Luau nem o Roblox Studio. Sem ruff/mypy/pytest instalados, o nível 3 registra "não instalado" em vez de instalar.
