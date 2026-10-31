---
name: luau-strict-types
description: "Tipagem Luau com --!strict, aliases, opcionais e refinamento."
metadata:
  id: SK-02-01
  department: "Programação Luau"
  version: "1.0"
  revised: "2026-10-18"
---

# luau-strict-types

Tipagem Luau com --!strict, aliases, opcionais e refinamento.

**Quando usar:** Ao escrever ModuleScripts e APIs públicas.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Primeira linha --!strict; type e export type para estruturas.
- Opcional com ?; refine com typeof ou comparação antes de usar.
- Evite any; use o cast :: só quando o analisador não consegue inferir.

**Verificação:** Análise estática sem erros de tipo no módulo.

**Complementares (sugeridas por similaridade):** `luau-gradual-typing`, `bpy-data-vs-ops`, `studio-publishing`

**Limites e recuperação:** Confirme APIs e sintaxe na documentação oficial atual antes de usar recursos novos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
