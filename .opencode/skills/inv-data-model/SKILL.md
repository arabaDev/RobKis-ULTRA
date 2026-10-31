---
name: inv-data-model
description: "Modelo de dados de inventário: itens, quantidades e slots."
metadata:
  id: SK-13-01
  department: "Sistemas de inventário"
  version: "1.0"
  revised: "2026-10-18"
---

# inv-data-model

Modelo de dados de inventário: itens, quantidades e slots.

**Quando usar:** Qualquer sistema de inventário.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Itens são ID mais quantidade, nunca instâncias salvas.
- Definições em um registro à parte.
- Slots opcionais conforme o jogo.

**Verificação:** O inventário serializa e carrega sem perda.

**Complementares (sugeridas por similaridade):** `net-replication-model`, `regr-data-compat`, `bpy-data-vs-ops`

**Limites e recuperação:** Toda ação de inventário é decidida no servidor. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
