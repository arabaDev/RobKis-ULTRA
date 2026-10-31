---
name: vcs-backup-before-risk
description: "Backup antes de mudanças arriscadas."
metadata:
  id: SK-31-04
  department: "Controle de versão e recuperação"
  version: "1.0"
  revised: "2026-10-18"
---

# vcs-backup-before-risk

Backup antes de mudanças arriscadas.

**Quando usar:** Refatorações e operações destrutivas.

**Requer:** repositório git. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Copie ou faça commit antes.
- Registre o ponto de volta.
- Confirme que o backup abre.

**Verificação:** É possível voltar ao estado anterior.

**Complementares (sugeridas por similaridade):** `dep-impact-analysis`, `regr-ui-snapshots`, `vcs-commit-hygiene`

**Limites e recuperação:** Operações destrutivas exigem autorização; faça backup antes. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
