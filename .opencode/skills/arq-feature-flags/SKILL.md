---
name: arq-feature-flags
description: "Liga e desliga funcionalidades por configuração."
metadata:
  id: SK-01-11
  department: "Arquitetura de software"
  version: "1.0"
  revised: "2026-10-18"
---

# arq-feature-flags

Liga e desliga funcionalidades por configuração.

**Quando usar:** Ao integrar recursos incompletos ou testar variações.

**Regras**
- Flags em módulo de config ou em atributos.
- Código novo entra desligado até estar verificado.
- Remova a flag e o código morto depois que estabilizar.

**Verificação:** Com a flag desligada o comportamento anterior é idêntico.

**Complementares (sugeridas por similaridade):** `secan-rate-abuse`, `light-eevee-cycles-settings`, `review-regressions`

**Limites e recuperação:** Decisões dependem do jogo real; confirme a estrutura existente antes de impor padrões. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
