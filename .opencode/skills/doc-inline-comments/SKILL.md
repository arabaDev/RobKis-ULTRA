---
name: doc-inline-comments
description: "Comentários úteis no código."
metadata:
  id: SK-33-09
  department: "Documentação técnica"
  version: "1.0"
  revised: "2026-10-18"
---

# doc-inline-comments

Comentários úteis no código.

**Quando usar:** Lógica não óbvia.

**Regras**
- Explique o porquê.
- Evite ecoar o código.
- Remova comentários obsoletos.

**Verificação:** Os comentários continuam verdadeiros.

**Complementares (sugeridas por similaridade):** `arq-design-patterns-luau`, `sec-script-visibility`, `studio-play-modes`

**Limites e recuperação:** Documente só o que é verdade no código atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
