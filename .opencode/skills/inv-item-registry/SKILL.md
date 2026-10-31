---
name: inv-item-registry
description: "Registro central de definições de itens."
metadata:
  id: SK-13-06
  department: "Sistemas de inventário"
  version: "1.0"
  revised: "2026-10-18"
---

# inv-item-registry

Registro central de definições de itens.

**Quando usar:** Jogos com muitos itens.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- ID estável e único por item.
- Campos obrigatórios validados na inicialização.
- Nunca reutilize um ID removido.

**Verificação:** Todo ID usado no jogo existe no registro.

**Complementares (sugeridas por similaridade):** `bpy-batch-generation`, `rec-partial-failure`, `doc-decision-records`

**Limites e recuperação:** Toda ação de inventário é decidida no servidor. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
