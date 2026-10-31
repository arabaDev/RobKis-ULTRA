---
name: arq-service-layering
description: "Separa serviços de servidor, controllers de cliente e módulos compartilhados."
metadata:
  id: SK-01-01
  department: "Arquitetura de software"
  version: "1.0"
  revised: "2026-10-18"
---

# arq-service-layering

Separa serviços de servidor, controllers de cliente e módulos compartilhados.

**Quando usar:** Ao criar ou reorganizar a base de um jogo.

**Regras**
- Um serviço por domínio (Inventário, Combate, Dados) com API pública pequena.
- Controllers de cliente cuidam só de input, UI e efeitos e pedem ações ao servidor por Remotes.
- Código comum fica em módulo compartilhado sem dependência de serviço.

**Verificação:** Cada serviço carrega isoladamente, sem require circular.

**Complementares (sugeridas por similaridade):** `dep-service-order`, `net-teleport-service`, `luau-modulescript-patterns`

**Limites e recuperação:** Decisões dependem do jogo real; confirme a estrutura existente antes de impor padrões. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
