---
name: doc-diagrams-text
description: "Diagramas em texto, como Mermaid."
metadata:
  id: SK-33-06
  department: "Documentação técnica"
  version: "1.0"
  revised: "2026-10-18"
---

# doc-diagrams-text

Diagramas em texto, como Mermaid.

**Quando usar:** Explicar fluxos.

**Regras**
- Diagramas simples.
- Mantidos junto ao código.
- Atualizados com mudanças.

**Verificação:** O diagrama renderiza.

**Complementares (sugeridas por similaridade):** `sec-sanitize-text`, `ui-text-handling`, `dep-plugin-dependencies`

**Limites e recuperação:** Documente só o que é verdade no código atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
