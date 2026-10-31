---
name: arq-state-management
description: "Mantém uma única fonte de verdade para o estado do jogo."
metadata:
  id: SK-01-06
  department: "Arquitetura de software"
  version: "1.0"
  revised: "2026-10-18"
---

# arq-state-management

Mantém uma única fonte de verdade para o estado do jogo.

**Quando usar:** Quando o mesmo dado aparece no servidor, no cliente e na UI.

**Regras**
- Servidor guarda o estado real e o cliente uma cópia de leitura.
- Replique só o que o cliente precisa ver, por atributos ou Remotes.
- Atualizações passam por funções únicas, não por escrita direta em tabelas.

**Verificação:** Duas telas mostrando o mesmo dado não divergem após reconexão.

**Complementares (sugeridas por similaridade):** `ui-state-management`, `rec-state-rollback`, `net-session-management`

**Limites e recuperação:** Decisões dependem do jogo real; confirme a estrutura existente antes de impor padrões. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
