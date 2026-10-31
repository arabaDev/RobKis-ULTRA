---
name: ui-shop-screens
description: "Telas de loja com compra confirmada pelo servidor."
metadata:
  id: SK-09-10
  department: "Interfaces e GUIs"
  version: "1.0"
  revised: "2026-10-18"
---

# ui-shop-screens

Telas de loja com compra confirmada pelo servidor.

**Quando usar:** Lojas de itens ou moeda.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Clique envia pedido; o servidor valida preço e saldo.
- Mostre estado pendente e resultado.
- Nunca calcule preço no cliente.

**Verificação:** Alterar o preço no cliente não muda a cobrança.

**Complementares (sugeridas por similaridade):** `eco-shop-purchase-flow`, `net-latency-prediction`, `secan-economy-exploit-audit`

**Limites e recuperação:** Valide em pelo menos um celular e um desktop antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
