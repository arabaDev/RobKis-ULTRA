---
name: test-mock-services
description: "Simulações de DataStore e Marketplace para testes."
metadata:
  id: SK-18-06
  department: "Testes automatizados"
  version: "1.0"
  revised: "2026-10-18"
---

# test-mock-services

Simulações de DataStore e Marketplace para testes.

**Quando usar:** Testar sem dependências externas.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Interface fina que o código usa.
- Implementação falsa para testes.
- Falhas simuladas.

**Verificação:** O código funciona com falha simulada de DataStore.

**Complementares (sugeridas por similaridade):** `data-studio-api-access`, `luau-error-handling`, `test-datastore-offline`

**Limites e recuperação:** Diga o que foi executado e o que depende de teste manual no Studio. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
