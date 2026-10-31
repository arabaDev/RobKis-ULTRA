---
name: inv-persistence
description: "Persistência do inventário com versão do esquema."
metadata:
  id: SK-13-08
  department: "Sistemas de inventário"
  version: "1.0"
  revised: "2026-10-18"
---

# inv-persistence

Persistência do inventário com versão do esquema.

**Quando usar:** Salvar e carregar inventários.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Salve IDs e quantidades, com campo de versão.
- Valide e migre ao carregar.
- Use o padrão de salvamento seguro de DataStore.

**Verificação:** Carregar dados antigos e novos funciona.

**Complementares (sugeridas por similaridade):** `bug-datastore-failures`, `data-schema-versioning`, `inv-capacity-limits`

**Limites e recuperação:** Toda ação de inventário é decidida no servidor. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
