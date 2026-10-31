---
name: eco-developer-products
description: "Developer Products: compras repetíveis com Robux."
metadata:
  id: SK-14-05
  department: "Economia e lojas"
  version: "1.0"
  revised: "2026-10-18"
---

# eco-developer-products

Developer Products: compras repetíveis com Robux.

**Quando usar:** Moeda do jogo, reposições e boosts.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- PromptProductPurchase no cliente e ProcessReceipt no servidor.
- Entregue só no servidor.
- Idempotência por ID do recibo.

**Verificação:** Repetir o recibo não repete a entrega.

**Complementares (sugeridas por similaridade):** `sec-receipt-processing`, `eco-gamepasses`, `ui-shop-screens`

**Limites e recuperação:** Políticas de monetização da plataforma mudam; confirme a política atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
