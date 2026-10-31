---
name: secan-datastore-abuse
description: "Auditoria de abuso e falhas em DataStore."
metadata:
  id: SK-39-04
  department: "Análise de segurança"
  version: "1.0"
  revised: "2026-10-18"
---

# secan-datastore-abuse

Auditoria de abuso e falhas em DataStore.

**Quando usar:** Salvamento de dados.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Dados vindos do cliente.
- Sobrescrita por dados vazios.
- Orçamento de requisições.

**Verificação:** Salvamento resistente a falhas.

**Complementares (sugeridas por similaridade):** `secan-rate-abuse`, `test-datastore-offline`, `bug-datastore-failures`

**Limites e recuperação:** Auditoria só no seu próprio jogo; reporte o que não foi revisado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
