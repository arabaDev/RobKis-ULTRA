---
name: dep-require-graph
description: "Grafo de requires entre módulos."
metadata:
  id: SK-34-01
  department: "Análise de dependências"
  version: "1.0"
  revised: "2026-10-18"
---

# dep-require-graph

Grafo de requires entre módulos.

**Quando usar:** Entender o acoplamento.

**Regras**
- Busque por require.
- Registre quem depende de quem.
- Identifique módulos centrais.

**Verificação:** Grafo escrito ou listado.

**Complementares (sugeridas por similaridade):** `dep-circular-detection`, `arq-module-dependencies`, `luau-signals-bindables`

**Limites e recuperação:** Confirme com busca real; não presuma dependências. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
