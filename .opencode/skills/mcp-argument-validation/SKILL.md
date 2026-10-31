---
name: mcp-argument-validation
description: "Validar argumentos antes de chamar ferramentas."
metadata:
  id: SK-19-14
  department: "Integração e MCP"
  version: "1.0"
  revised: "2026-10-18"
---

# mcp-argument-validation

Validar argumentos antes de chamar ferramentas.

**Quando usar:** Chamadas que falham por entrada inválida.

**Requer:** MCP conectado. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Confira tipos e campos obrigatórios.
- Confira se caminhos e nomes existem.
- Confira se os valores estão na faixa.

**Verificação:** Nenhuma chamada falha por argumento previsível.

**Complementares (sugeridas por similaridade):** `uv-export-validation`, `sec-remote-input-validation`, `anim3d-validation-in-studio`

**Limites e recuperação:** Nunca simule uma ferramenta; use só o que está realmente conectado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
