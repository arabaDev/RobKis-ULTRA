---
name: dep-package-managers
description: "Gerenciadores de pacotes só quando o projeto já os usa, com versões fixas."
metadata:
  id: SK-34-04
  department: "Análise de dependências"
  version: "1.0"
  revised: "2026-10-18"
---

# dep-package-managers

Gerenciadores de pacotes só quando o projeto já os usa, com versões fixas.

**Quando usar:** Bibliotecas externas.

**Regras**
- Confirme qual ferramenta o projeto realmente usa antes de sugerir.
- Instale só dependências necessárias e de origem confiável.
- Fixe versões no arquivo de bloqueio.
- Registre a origem e a licença.

**Verificação:** A instalação limpa reproduz as mesmas versões do arquivo de bloqueio.

**Complementares (sugeridas por similaridade):** `dep-version-pinning`, `rec-safe-abort`, `dep-tool-versions`

**Limites e recuperação:** Confirme com busca real; não presuma dependências. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
