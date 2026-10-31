---
name: arq-module-dependencies
description: "Mantém dependências entre módulos explícitas e sem ciclos."
metadata:
  id: SK-01-03
  department: "Arquitetura de software"
  version: "1.0"
  revised: "2026-10-18"
---

# arq-module-dependencies

Mantém dependências entre módulos explícitas e sem ciclos.

**Quando usar:** Quando módulos se importam entre si ou o require trava.

**Regras**
- Dependência entra por require no topo ou por parâmetro, nunca por global.
- Ciclo se resolve extraindo a parte comum para um terceiro módulo.
- Código de cliente nunca referencia módulo que só existe no servidor.

**Verificação:** Busca por require mostra grafo sem ciclos.

**Complementares (sugeridas por similaridade):** `dep-plugin-dependencies`, `dep-circular-detection`, `dep-require-graph`

**Limites e recuperação:** Decisões dependem do jogo real; confirme a estrutura existente antes de impor padrões. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
