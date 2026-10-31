---
name: arq-error-boundaries
description: "Isola falhas para um sistema não derrubar os outros."
metadata:
  id: SK-01-10
  department: "Arquitetura de software"
  version: "1.0"
  revised: "2026-10-18"
---

# arq-error-boundaries

Isola falhas para um sistema não derrubar os outros.

**Quando usar:** No bootstrap de serviços e em handlers de eventos.

**Regras**
- Inicie cada serviço sob pcall e registre qual falhou.
- Handlers de Remote protegem a lógica crítica e não deixam estado pela metade.
- Falha de sistema opcional desliga só o recurso e deixa aviso no log.

**Verificação:** Forçar erro em um serviço de teste não impede os demais de iniciar.

**Complementares (sugeridas por similaridade):** `bpy-error-handling-verify`, `luau-error-handling`, `mcp-error-triage`

**Limites e recuperação:** Decisões dependem do jogo real; confirme a estrutura existente antes de impor padrões. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
