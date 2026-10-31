---
name: bug-datastore-failures
description: "Diagnóstico de falhas de DataStore."
metadata:
  id: SK-17-08
  department: "Diagnóstico de bugs"
  version: "1.0"
  revised: "2026-10-18"
---

# bug-datastore-failures

Diagnóstico de falhas de DataStore.

**Quando usar:** Erros de salvar ou carregar.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Leia o código de erro do pcall.
- Verifique acesso a APIs no Studio.
- Confira limites e orçamento.

**Verificação:** A falha é reproduzida ou explicada.

**Complementares (sugeridas por similaridade):** `secan-datastore-abuse`, `test-datastore-offline`, `inv-persistence`

**Limites e recuperação:** Corrija a causa raiz; nunca remova funcionalidade para o teste passar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
