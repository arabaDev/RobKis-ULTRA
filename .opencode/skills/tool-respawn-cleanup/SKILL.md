---
name: tool-respawn-cleanup
description: "Limpeza de ferramentas e efeitos na morte e no respawn."
metadata:
  id: SK-05-12
  department: "Ferramentas e armas"
  version: "1.0"
  revised: "2026-10-18"
---

# tool-respawn-cleanup

Limpeza de ferramentas e efeitos na morte e no respawn.

**Quando usar:** Quando objetos ficam presos após a morte.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Desconecte eventos e pare tracks ao morrer.
- Decida se a Tool volta pelo StarterGear ou pelo Backpack.
- Remova projéteis e efeitos ligados ao dono.

**Verificação:** Morrer e renascer vários vezes não acumula objetos.

**Complementares (sugeridas por similaridade):** `perf-debris-cleanup`, `luau-cleanup-patterns`, `game-respawn-handling`

**Limites e recuperação:** Confirme se o jogo usa R6, R15 ou rigs próprios antes de ajustar empunhadura. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
