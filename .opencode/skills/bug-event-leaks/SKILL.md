---
name: bug-event-leaks
description: "Eventos duplicados e conexões acumuladas."
metadata:
  id: SK-17-06
  department: "Diagnóstico de bugs"
  version: "1.0"
  revised: "2026-10-18"
---

# bug-event-leaks

Eventos duplicados e conexões acumuladas.

**Quando usar:** Efeitos que ocorrem mais de uma vez.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Procure Connect dentro de loops ou handlers.
- Guarde e desconecte.
- Conte conexões se possível.

**Verificação:** A ação dispara uma vez por evento.

**Complementares (sugeridas por similaridade):** `perf-memory-leaks`, `arq-event-driven-design`, `net-remote-event-design`

**Limites e recuperação:** Corrija a causa raiz; nunca remova funcionalidade para o teste passar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
