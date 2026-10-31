---
name: vcs-rollback-recovery
description: "Reverter e recuperar com segurança."
metadata:
  id: SK-31-09
  department: "Controle de versão e recuperação"
  version: "1.0"
  revised: "2026-10-18"
---

# vcs-rollback-recovery

Reverter e recuperar com segurança.

**Quando usar:** Uma mudança causou problema.

**Requer:** repositório git. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Identifique o ponto bom.
- Reverter em passo isolado.
- Evite apagar histórico.

**Verificação:** O sistema voltou a funcionar.

**Complementares (sugeridas por similaridade):** `rec-state-rollback`, `rec-corrupted-file-recovery`, `data-corruption-recovery`

**Limites e recuperação:** Operações destrutivas exigem autorização; faça backup antes. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
