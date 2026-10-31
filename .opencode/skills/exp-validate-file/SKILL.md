---
name: exp-validate-file
description: "Validar o arquivo exportado: existência, tamanho, contagens e reimportação."
metadata:
  id: SK-27-09
  department: "Exportação de assets"
  version: "1.0"
  revised: "2026-10-18"
---

# exp-validate-file

Validar o arquivo exportado: existência, tamanho, contagens e reimportação.

**Quando usar:** Depois de qualquer exportação.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Confirme que o arquivo existe e tem tamanho maior que zero.
- Compare triângulos e objetos exportados com o esperado.
- Reimporte em cena limpa quando possível.
- Registre caminho e tamanho no relatório.

**Verificação:** Caminho, tamanho e contagens do arquivo foram registrados.

**Complementares (sugeridas por similaridade):** `rec-corrupted-file-recovery`, `vcs-roblox-file-formats`, `review-export`

**Limites e recuperação:** Só dê a exportação por concluída com arquivo verificado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
