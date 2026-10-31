---
name: sec-receipt-processing
description: "ProcessReceipt idempotente para Developer Products."
metadata:
  id: SK-08-05
  department: "Segurança cliente-servidor"
  version: "1.0"
  revised: "2026-10-18"
---

# sec-receipt-processing

ProcessReceipt idempotente para Developer Products.

**Quando usar:** Qualquer compra com Robux.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Conceda o item e registre o ID do recibo antes de retornar PurchaseGranted.
- Se falhar, retorne NotProcessedYet para nova tentativa.
- Defina o callback uma única vez e no servidor.

**Verificação:** Processar o mesmo recibo duas vezes concede uma vez só.

**Complementares (sugeridas por similaridade):** `eco-developer-products`, `light-post-processing`, `ui-shop-screens`

**Limites e recuperação:** Nenhuma defesa é absoluta; combine camadas e registre tentativas suspeitas. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
