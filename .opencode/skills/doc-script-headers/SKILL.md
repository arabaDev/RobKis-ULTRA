---
name: doc-script-headers
description: "Cabeçalho padrão no topo de cada script: local, tipo, função e dependências."
metadata:
  id: SK-33-01
  department: "Documentação técnica"
  version: "1.0"
  revised: "2026-10-18"
---

# doc-script-headers

Cabeçalho padrão no topo de cada script: local, tipo, função e dependências.

**Quando usar:** Todo script novo.

**Regras**
- Primeira linha de comentário com o local no Explorer e o tipo (Server, Local, Module).
- Uma frase sobre a função do script.
- Liste as dependências principais.
- Atualize ao mudar a responsabilidade do script.

**Verificação:** Todo script novo tem cabeçalho com local, tipo e função.

**Complementares (sugeridas por similaridade):** `uv-smart-project-script`, `bpy-script-failure-diagnosis`, `perf-script-profiling`

**Limites e recuperação:** Documente só o que é verdade no código atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
