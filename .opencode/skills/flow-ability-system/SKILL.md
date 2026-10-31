---
name: flow-ability-system
description: "Fluxo de habilidades: dados, validação, efeitos, UI e balanceamento."
metadata:
  id: SK-44-07
  department: "Fluxos compostos"
  version: "1.0"
  revised: "2026-10-18"
---

# flow-ability-system

Fluxo de habilidades: dados, validação, efeitos, UI e balanceamento.

**Quando usar:** Habilidades com cooldown e custo.

**Procedimento**
1. Defina o sistema com `game-ability-system`.
2. Coloque números em config com `arq-config-driven-design`.
3. Valide pedidos com `sec-remote-input-validation`.
4. Controle recarga com `combat-cooldowns`.
5. Aplique estados com `combat-status-effects`.
6. Efeitos no cliente com `fx-client-side-effects`.
7. Indicadores com `ui-ability-indicators`.
8. Sincronize com `anim-markers-events`.
9. Teste com `test-multiplayer-local-server`.
10. Balanceie com `combat-balancing-method`.

**Regras do fluxo**
- Adicionar uma habilidade nova deve exigir só dados e um módulo de efeito.

**Verificação:** Uma habilidade de teste nova funciona sem editar o sistema base.

**Skills complementares:** `game-ability-system`, `arq-config-driven-design`, `sec-remote-input-validation`, `combat-cooldowns`, `combat-status-effects`, `fx-client-side-effects`, `ui-ability-indicators`, `anim-markers-events`, `test-multiplayer-local-server`, `combat-balancing-method`

**Limites e recuperação:** Este fluxo só ordena skills; cada etapa deve ser verificada pela skill correspondente, e o estado real de cada etapa deve ser reportado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
