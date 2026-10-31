---
name: flow-inventory-system
description: "Fluxo de inventário: dados, ações no servidor, UI, persistência e anti-duplicação."
metadata:
  id: SK-44-04
  department: "Fluxos compostos"
  version: "1.0"
  revised: "2026-10-18"
---

# flow-inventory-system

Fluxo de inventário: dados, ações no servidor, UI, persistência e anti-duplicação.

**Quando usar:** Inventário, equipamentos ou itens em um jogo.

**Procedimento**
1. Modele os dados com `inv-data-model` e `inv-item-registry`.
2. Defina empilhamento com `inv-stacking-rules`.
3. Implemente ações no servidor com `inv-server-actions` e `sec-ownership-checks`.
4. Persista com `inv-persistence` e `data-schema-versioning`.
5. Sincronize a UI com `inv-ui-sync` e `ui-inventory-grids`.
6. Adicione equipamento com `inv-equip-system`.
7. Proteja trocas com `inv-trading-safe` e `sec-dupe-prevention`.
8. Teste falhas com `test-datastore-offline`.
9. Confirme dados antigos com `regr-data-compat`.

**Regras do fluxo**
- Itens são IDs e quantidades, nunca instâncias salvas.
- Toda mudança passa pelas ações do servidor.

**Verificação:** Salvar, sair, entrar e trocar itens não duplica nem perde nada em teste.

**Skills complementares:** `inv-data-model`, `inv-item-registry`, `inv-stacking-rules`, `inv-server-actions`, `sec-ownership-checks`, `inv-persistence`, `data-schema-versioning`, `inv-ui-sync`, `ui-inventory-grids`, `inv-equip-system`, `inv-trading-safe`, `sec-dupe-prevention`, `test-datastore-offline`, `regr-data-compat`

**Limites e recuperação:** Este fluxo só ordena skills; cada etapa deve ser verificada pela skill correspondente, e o estado real de cada etapa deve ser reportado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
