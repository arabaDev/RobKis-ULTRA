---
name: inv-crafting
description: "Sistema de criação com receitas."
metadata:
  id: SK-13-11
  department: "Sistemas de inventário"
  version: "1.0"
  revised: "2026-10-18"
---

# inv-crafting

Sistema de criação com receitas.

**Quando usar:** Combinar itens para criar outros.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Receitas em config: entradas e saídas.
- Servidor consome e entrega atomicamente.
- Valide espaço antes.

**Verificação:** Falha no meio não consome ingredientes sem entregar.

**Complementares (sugeridas por similaridade):** `arq-error-boundaries`, `rk-toolbox-first`, `inv-data-model`

**Limites e recuperação:** Toda ação de inventário é decidida no servidor. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
