---
name: luau-semantics-pitfalls
description: "Armadilhas de semântica do Luau: índices, nil e valores falsos."
metadata:
  id: SK-02-16
  department: "Programação Luau"
  version: "1.0"
  revised: "2026-10-18"
---

# luau-semantics-pitfalls

Armadilhas de semântica do Luau: índices, nil e valores falsos.

**Quando usar:** Bugs sutis em código de quem vem de outra linguagem.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Arrays começam em 1 e o operador # conta a sequência.
- Só nil e false são falsos; 0 e string vazia são verdadeiros.
- Diferença se escreve ~= e divisão inteira se escreve //.

**Verificação:** Os casos de borda de índice 0, nil e false estão cobertos por teste.

**Complementares (sugeridas por similaridade):** `phys-touched-pitfalls`, `luau-linting-formatting`, `secan-permissions-audit`

**Limites e recuperação:** Confirme APIs e sintaxe na documentação oficial atual antes de usar recursos novos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
