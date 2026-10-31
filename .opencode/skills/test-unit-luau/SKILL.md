---
name: test-unit-luau
description: "Testes unitários de lógica Luau pura."
metadata:
  id: SK-18-01
  department: "Testes automatizados"
  version: "1.0"
  revised: "2026-10-18"
---

# test-unit-luau

Testes unitários de lógica Luau pura.

**Quando usar:** Módulos sem dependência de instâncias.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Use o framework do projeto se houver (por exemplo TestEZ ou Jest-Lua); senão um harness simples com assert.
- Teste funções puras e casos de borda.
- Mantenha testes rápidos.

**Verificação:** Todos os testes passam e a saída foi reportada.

**Complementares (sugeridas por similaridade):** `arq-design-patterns-luau`, `compat-luau-versions`, `luau-linting-formatting`

**Limites e recuperação:** Diga o que foi executado e o que depende de teste manual no Studio. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
