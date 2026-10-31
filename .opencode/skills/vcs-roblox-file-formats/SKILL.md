---
name: vcs-roblox-file-formats
description: "Formatos .rbxl, .rbxlx e sincronização por arquivos."
metadata:
  id: SK-31-05
  department: "Controle de versão e recuperação"
  version: "1.0"
  revised: "2026-10-18"
---

# vcs-roblox-file-formats

Formatos .rbxl, .rbxlx e sincronização por arquivos.

**Quando usar:** Decidir como versionar o lugar.

**Requer:** repositório git. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Arquivos binários não mesclam bem.
- Sincronização por arquivos permite versionar scripts.
- Escolha uma abordagem para o projeto.

**Verificação:** O método escolhido foi documentado.

**Complementares (sugeridas por similaridade):** `rec-corrupted-file-recovery`, `studio-script-workflow`, `exp-validate-file`

**Limites e recuperação:** Operações destrutivas exigem autorização; faça backup antes. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
