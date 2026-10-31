---
name: regr-diff-impact
description: "Impacto da diferença de código."
metadata:
  id: SK-36-03
  department: "Testes de regressão"
  version: "1.0"
  revised: "2026-10-18"
---

# regr-diff-impact

Impacto da diferença de código.

**Quando usar:** Revisar uma mudança.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Liste arquivos alterados.
- Busque usos dos símbolos mudados.
- Teste os vizinhos.

**Verificação:** Os vizinhos foram testados.

**Complementares (sugeridas por similaridade):** `dep-impact-analysis`, `pipe-source-vs-destination-diff`, `regr-bisect`

**Limites e recuperação:** Compare sempre com um baseline registrado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
