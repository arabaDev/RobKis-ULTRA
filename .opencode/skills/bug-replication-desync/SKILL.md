---
name: bug-replication-desync
description: "Diferenças entre servidor e cliente."
metadata:
  id: SK-17-05
  department: "Diagnóstico de bugs"
  version: "1.0"
  revised: "2026-10-18"
---

# bug-replication-desync

Diferenças entre servidor e cliente.

**Quando usar:** Algo muda em um lado e não no outro.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Confirme em qual lado a alteração ocorreu.
- Alterações do cliente não replicam.
- Use Remotes ou atributos.

**Verificação:** Ambos os lados mostram o mesmo estado.

**Complementares (sugeridas por similaridade):** `net-replication-model`, `net-streaming-replication`, `net-attributes-replication`

**Limites e recuperação:** Corrija a causa raiz; nunca remova funcionalidade para o teste passar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
