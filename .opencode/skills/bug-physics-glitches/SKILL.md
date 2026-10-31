---
name: bug-physics-glitches
description: "Glitches de física: tremedeira, voo e travamento."
metadata:
  id: SK-17-09
  department: "Diagnóstico de bugs"
  version: "1.0"
  revised: "2026-10-18"
---

# bug-physics-glitches

Glitches de física: tremedeira, voo e travamento.

**Quando usar:** Objetos se comportam de forma estranha.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Verifique propriedade de rede.
- Verifique massa e constraints.
- Colisões sobrepostas.

**Verificação:** O objeto se move de forma estável.

**Complementares (sugeridas por similaridade):** `perf-physics-cost`, `npc-network-ownership`, `phys-modern-movers`

**Limites e recuperação:** Corrija a causa raiz; nunca remova funcionalidade para o teste passar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
