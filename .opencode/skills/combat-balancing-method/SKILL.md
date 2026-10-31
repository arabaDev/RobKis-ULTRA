---
name: combat-balancing-method
description: "Método de balanceamento de armas e habilidades por dados."
metadata:
  id: SK-04-19
  department: "Sistemas de combate"
  version: "1.0"
  revised: "2026-10-18"
---

# combat-balancing-method

Método de balanceamento de armas e habilidades por dados.

**Quando usar:** Quando uma arma domina ou nunca é usada.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Defina métricas como dano por segundo, alcance e tempo para abater.
- Compare itens na mesma tabela.
- Mude um parâmetro por vez e reteste.

**Verificação:** As armas do mesmo nível ficam em uma faixa de DPS definida.

**Complementares (sugeridas por similaridade):** `perf-benchmark-method`, `bench-timing-method`, `arq-config-driven-design`

**Limites e recuperação:** Valores de balanceamento são ponto de partida; ajuste por teste de jogo. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
