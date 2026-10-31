---
name: luau-table-performance
description: "Uso eficiente de tabelas e da biblioteca table."
metadata:
  id: SK-02-06
  department: "Programação Luau"
  version: "1.0"
  revised: "2026-10-18"
---

# luau-table-performance

Uso eficiente de tabelas e da biblioteca table.

**Quando usar:** Em código quente ou com listas grandes.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- table.create para arrays de tamanho conhecido; table.clear para reutilizar.
- Evite buracos em arrays; o operador # só é confiável em sequências.
- table.find, table.clone, table.freeze e table.move cobrem casos comuns.

**Verificação:** Operações sobre listas grandes medidas com os.clock antes e depois.

**Complementares (sugeridas por similaridade):** `review-performance`, `ai-performance-throttling`, `test-performance-smoke`

**Limites e recuperação:** Confirme APIs e sintaxe na documentação oficial atual antes de usar recursos novos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
