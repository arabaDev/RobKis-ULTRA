---
name: dep-version-pinning
description: "Fixar versões exatas de ferramentas e bibliotecas para builds reproduzíveis."
metadata:
  id: SK-34-05
  department: "Análise de dependências"
  version: "1.0"
  revised: "2026-10-18"
---

# dep-version-pinning

Fixar versões exatas de ferramentas e bibliotecas para builds reproduzíveis.

**Quando usar:** Evitar quebras por atualização.

**Regras**
- Registre a versão exata, não faixas.
- Atualize de propósito, uma dependência por vez.
- Rode os testes depois de cada atualização.
- Anote a versão anterior para poder voltar.

**Verificação:** Todas as dependências têm versão exata registrada e o projeto funciona com ela.

**Complementares (sugeridas por similaridade):** `bpy-version-compat`, `vcs-roblox-version-history`, `dep-package-managers`

**Limites e recuperação:** Confirme com busca real; não presuma dependências. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
