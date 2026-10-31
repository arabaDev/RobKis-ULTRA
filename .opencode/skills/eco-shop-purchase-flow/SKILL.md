---
name: eco-shop-purchase-flow
description: "Fluxo de compra dentro do jogo no servidor."
metadata:
  id: SK-14-02
  department: "Economia e lojas"
  version: "1.0"
  revised: "2026-10-18"
---

# eco-shop-purchase-flow

Fluxo de compra dentro do jogo no servidor.

**Quando usar:** Lojas de itens e melhorias.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Verificar saldo, remover moeda e entregar item em uma operação.
- Falha reverte tudo.
- Resultado enviado ao cliente.

**Verificação:** Falha na entrega devolve a moeda.

**Complementares (sugeridas por similaridade):** `ui-shop-screens`, `topo-edge-flow`, `anim3d-validation-in-studio`

**Limites e recuperação:** Políticas de monetização da plataforma mudam; confirme a política atual. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
