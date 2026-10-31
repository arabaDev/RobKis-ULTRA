---
name: luau-generalized-iteration
description: "Iteração com for k, v in tabela, pairs e ipairs sem armadilhas."
metadata:
  id: SK-02-08
  department: "Programação Luau"
  version: "1.0"
  revised: "2026-10-18"
---

# luau-generalized-iteration

Iteração com for k, v in tabela, pairs e ipairs sem armadilhas.

**Quando usar:** Ao percorrer ou modificar tabelas.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- ipairs para sequências e pairs quando a ordem não importa.
- Atribuir ou limpar chaves existentes durante a iteração é seguro; adicionar chaves novas não.
- Para remover itens de lista, percorra de trás para frente.

**Verificação:** Percorrer e remover não pula nem repete elementos.

**Complementares (sugeridas por similaridade):** `pipe-roundtrip-iteration`, `rk-visual-loop`, `bench-reporting`

**Limites e recuperação:** Confirme APIs e sintaxe na documentação oficial atual antes de usar recursos novos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
