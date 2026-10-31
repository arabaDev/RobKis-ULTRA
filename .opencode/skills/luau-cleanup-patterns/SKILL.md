---
name: luau-cleanup-patterns
description: "Padrão de limpeza de conexões e instâncias (Maid ou Janitor próprio)."
metadata:
  id: SK-02-15
  department: "Programação Luau"
  version: "1.0"
  revised: "2026-10-18"
---

# luau-cleanup-patterns

Padrão de limpeza de conexões e instâncias (Maid ou Janitor próprio).

**Quando usar:** Objetos com várias conexões, tweens e instâncias destruídos juntos.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Um objeto de limpeza guarda conexões, instâncias, tweens e funções.
- Cleanup desconecta, destrói e cancela tudo, uma única vez.
- Chame Cleanup ao destruir o dono (Destroying, PlayerRemoving ou fim da partida).

**Verificação:** Após Cleanup, a contagem de conexões e instâncias volta ao valor inicial.

**Complementares (sugeridas por similaridade):** `perf-debris-cleanup`, `anim-cleanup-tracks`, `tool-respawn-cleanup`

**Limites e recuperação:** Confirme APIs e sintaxe na documentação oficial atual antes de usar recursos novos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
