---
name: arq-event-driven-design
description: "Prefere eventos e sinais a polling em loops."
metadata:
  id: SK-01-05
  department: "Arquitetura de software"
  version: "1.0"
  revised: "2026-10-18"
---

# arq-event-driven-design

Prefere eventos e sinais a polling em loops.

**Quando usar:** Quando existe while true do checando estado.

**Regras**
- Use sinais (Changed, GetAttributeChangedSignal, BindableEvent ou módulo Signal).
- Polling só quando não há evento, com intervalo fixo e task.wait.
- Todo Connect tem dono e Disconnect no fim do ciclo de vida.

**Verificação:** Nenhum loop vazio consumindo CPU e contagem de conexões estável ao longo do tempo.

**Complementares (sugeridas por similaridade):** `arq-config-driven-design`, `net-remote-event-design`, `bug-event-leaks`

**Limites e recuperação:** Decisões dependem do jogo real; confirme a estrutura existente antes de impor padrões. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
