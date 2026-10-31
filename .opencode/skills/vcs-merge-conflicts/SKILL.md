---
name: vcs-merge-conflicts
description: "Resolução de conflitos de merge."
metadata:
  id: SK-31-07
  department: "Controle de versão e recuperação"
  version: "1.0"
  revised: "2026-10-18"
---

# vcs-merge-conflicts

Resolução de conflitos de merge.

**Quando usar:** Duas pessoas mudaram o mesmo arquivo.

**Requer:** repositório git. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Entenda as duas mudanças.
- Mantenha a intenção de ambas.
- Teste depois.

**Verificação:** Sem marcadores de conflito restantes.

**Complementares (sugeridas por similaridade):** `topo-merge-doubles`, `orch-parallel-safety`, `mcp-write-conflict-prevention`

**Limites e recuperação:** Operações destrutivas exigem autorização; faça backup antes. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
