---
name: flow-combat-system
description: "Fluxo de combate completo: dano, hitbox, estados, latência e balanceamento."
metadata:
  id: SK-44-05
  department: "Fluxos compostos"
  version: "1.0"
  revised: "2026-10-18"
---

# flow-combat-system

Fluxo de combate completo: dano, hitbox, estados, latência e balanceamento.

**Quando usar:** Sistema de combate novo ou refeito.

**Procedimento**
1. Defina autoridade com `arq-client-server-boundary`.
2. Centralize o dano com `combat-damage-pipeline`.
3. Escolha a detecção com `combat-hitbox-overlap` ou `combat-hitbox-raycast`.
4. Controle o ritmo com `combat-cooldowns`.
5. Evite dano duplo com `combat-hit-dedup`.
6. Adicione estados com `combat-status-effects` e `combat-knockback`.
7. Credite abates com `combat-kill-credit`.
8. Sincronize visual com `combat-animation-sync`.
9. Proteja os Remotes com `sec-rate-limit-implementation`.
10. Teste com `test-multiplayer-local-server` e `combat-latency-testing`.
11. Ajuste números com `combat-balancing-method`.

**Regras do fluxo**
- Todo dano passa pelo mesmo pipeline.
- Teste com ping alto antes de balancear.

**Verificação:** Sem dano duplicado nem dano sem validação em testes com vários clientes.

**Skills complementares:** `arq-client-server-boundary`, `combat-damage-pipeline`, `combat-hitbox-overlap`, `combat-hitbox-raycast`, `combat-cooldowns`, `combat-hit-dedup`, `combat-status-effects`, `combat-knockback`, `combat-kill-credit`, `combat-animation-sync`, `sec-rate-limit-implementation`, `test-multiplayer-local-server`, `combat-latency-testing`, `combat-balancing-method`

**Limites e recuperação:** Este fluxo só ordena skills; cada etapa deve ser verificada pela skill correspondente, e o estado real de cada etapa deve ser reportado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
