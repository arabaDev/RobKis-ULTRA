---
name: data-gdpr-userids
description: "Registro de UserIds e remoção de dados de usuário."
metadata:
  id: SK-15-12
  department: "DataStore e persistência"
  version: "1.0"
  revised: "2026-10-18"
---

# data-gdpr-userids

Registro de UserIds e remoção de dados de usuário.

**Quando usar:** Requisitos de privacidade.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Associe UserIds ao salvar com DataStoreSetOptions.
- RemoveAsync quando solicitado.
- Evite dados pessoais desnecessários.

**Verificação:** Dados removidos não retornam em nova leitura.

**Complementares (sugeridas por similaridade):** `secan-privacy-pii`, `dep-removal-safety`, `npc-spawn-despawn`

**Limites e recuperação:** Limites e orçamentos mudam; confirme na documentação atual e nunca teste em dados reais. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
