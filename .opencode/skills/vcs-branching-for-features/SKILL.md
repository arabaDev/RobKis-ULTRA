---
name: vcs-branching-for-features
description: "Ramos Git por funcionalidade, integrados em passos pequenos."
metadata:
  id: SK-31-03
  department: "Controle de versão e recuperação"
  version: "1.0"
  revised: "2026-10-18"
---

# vcs-branching-for-features

Ramos Git por funcionalidade, integrados em passos pequenos.

**Quando usar:** Trabalho em paralelo.

**Requer:** repositório git. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Um ramo por tarefa.
- Integre em passos pequenos.
- Remova ramos antigos.

**Verificação:** Cada ramo tem objetivo claro.

**Complementares (sugeridas por similaridade):** `compat-deprecated-apis`, `arq-refactor-safely`, `bench-reporting`

**Limites e recuperação:** Operações destrutivas exigem autorização; faça backup antes. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
