---
name: vcs-commit-hygiene
description: "Commits pequenos, com mensagem clara e sem segredos nem arquivos temporários."
metadata:
  id: SK-31-02
  department: "Controle de versão e recuperação"
  version: "1.0"
  revised: "2026-10-18"
---

# vcs-commit-hygiene

Commits pequenos, com mensagem clara e sem segredos nem arquivos temporários.

**Quando usar:** Antes de salvar mudanças.

**Requer:** repositório git. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Um commit por mudança lógica, para poder reverter isoladamente.
- Mensagem no imperativo que diz o que mudou e por quê.
- Revise o diff antes de commitar para não incluir segredos, builds ou temporários.
- Rode o teste relevante mais rápido antes de commitar.

**Verificação:** O diff em staging lista só os arquivos da mudança e nenhum segredo.

**Complementares (sugeridas por similaridade):** `arq-refactor-safely`, `orch-parallel-safety`, `rec-corrupted-file-recovery`

**Limites e recuperação:** Operações destrutivas exigem autorização; faça backup antes. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
