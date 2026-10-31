---
name: ai-boss-patterns
description: "Padrões de chefe com fases e ataques telegrafados."
metadata:
  id: SK-12-12
  department: "Inteligência artificial para jogos"
  version: "1.0"
  revised: "2026-10-18"
---

# ai-boss-patterns

Padrões de chefe com fases e ataques telegrafados.

**Quando usar:** Lutas de chefe.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Fases por faixa de vida em config.
- Telegrafe o ataque antes de causar dano.
- Dano e estado no servidor.

**Verificação:** Todas as fases e transições testadas.

**Complementares (sugeridas por similaridade):** `arq-design-patterns-luau`, `arq-extensibility-patterns`, `luau-modulescript-patterns`

**Limites e recuperação:** Meça o custo de CPU da IA antes de aumentar a complexidade. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
