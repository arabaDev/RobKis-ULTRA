---
name: sec-ownership-checks
description: "Confirma posse de itens, tools e objetos antes de agir."
metadata:
  id: SK-08-03
  department: "Segurança cliente-servidor"
  version: "1.0"
  revised: "2026-10-18"
---

# sec-ownership-checks

Confirma posse de itens, tools e objetos antes de agir.

**Quando usar:** Equipar, vender, usar ou destruir algo.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Confira no estado do servidor, nunca no que o cliente afirma.
- Confirme que o objeto pertence ao jogador e está no lugar esperado.
- Rejeite referências a instâncias de outro jogador.

**Verificação:** Pedir uma ação com item alheio não tem efeito.

**Complementares (sugeridas por similaridade):** `mat-export-checks`, `phys-network-ownership`, `sec-distance-sanity-checks`

**Limites e recuperação:** Nenhuma defesa é absoluta; combine camadas e registre tentativas suspeitas. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
