---
name: rec-corrupted-file-recovery
description: "Recuperar arquivos corrompidos por backups e versões, sem sobrescrever o original."
metadata:
  id: SK-38-08
  department: "Recuperação de falhas"
  version: "1.0"
  revised: "2026-10-18"
---

# rec-corrupted-file-recovery

Recuperar arquivos corrompidos por backups e versões, sem sobrescrever o original.

**Quando usar:** Arquivo não abre.

**Regras**
- Procure backups ou versões.
- Não sobrescreva o original.
- Valide o recuperado.

**Verificação:** O arquivo recuperado abre.

**Complementares (sugeridas por similaridade):** `data-corruption-recovery`, `vcs-roblox-file-formats`, `vcs-rollback-recovery`

**Limites e recuperação:** Tentativas sempre limitadas; nunca em loop. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
