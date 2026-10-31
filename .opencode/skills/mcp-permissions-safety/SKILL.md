---
name: mcp-permissions-safety
description: "Permissões e segurança em chamadas MCP."
metadata:
  id: SK-19-09
  department: "Integração e MCP"
  version: "1.0"
  revised: "2026-10-18"
---

# mcp-permissions-safety

Permissões e segurança em chamadas MCP.

**Quando usar:** Ações que alteram ou apagam.

**Requer:** MCP conectado. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Operações destrutivas exigem autorização.
- Não exponha segredos em chamadas.
- Prefira leitura quando possível.

**Verificação:** Nenhuma ação destrutiva ocorreu sem autorização.

**Complementares (sugeridas por similaridade):** `anim-ownership-permissions`, `dep-removal-safety`, `orch-parallel-safety`

**Limites e recuperação:** Nunca simule uma ferramenta; use só o que está realmente conectado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
