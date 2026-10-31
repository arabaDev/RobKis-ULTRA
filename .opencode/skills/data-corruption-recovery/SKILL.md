---
name: data-corruption-recovery
description: "Recuperação de dados corrompidos com versões."
metadata:
  id: SK-15-11
  department: "DataStore e persistência"
  version: "1.0"
  revised: "2026-10-18"
---

# data-corruption-recovery

Recuperação de dados corrompidos com versões.

**Quando usar:** Perda ou corrupção de dados.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- ListVersionsAsync e GetVersionAsync para voltar a uma versão anterior.
- Backup periódico.
- Valide antes de restaurar.

**Verificação:** Uma versão anterior foi restaurada em um jogador de teste.

**Complementares (sugeridas por similaridade):** `rec-corrupted-file-recovery`, `vcs-rollback-recovery`, `anim3d-attack-animations`

**Limites e recuperação:** Limites e orçamentos mudam; confirme na documentação atual e nunca teste em dados reais. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
