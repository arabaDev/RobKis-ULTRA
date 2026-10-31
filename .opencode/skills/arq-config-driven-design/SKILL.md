---
name: arq-config-driven-design
description: "Move números e dados de balanceamento para módulos de configuração."
metadata:
  id: SK-01-04
  department: "Arquitetura de software"
  version: "1.0"
  revised: "2026-10-18"
---

# arq-config-driven-design

Move números e dados de balanceamento para módulos de configuração.

**Quando usar:** Armas, habilidades, preços, tempos e níveis.

**Regras**
- Dados em tabelas de config tipadas e lógica em código.
- Um ID por entrada; o código busca pelo ID.
- Config é congelada com table.freeze depois de carregada.

**Verificação:** Mudar um valor de balanceamento não exige editar lógica.

**Complementares (sugeridas por similaridade):** `arq-event-driven-design`, `combat-balancing-method`, `tool-rarity-stats`

**Limites e recuperação:** Decisões dependem do jogo real; confirme a estrutura existente antes de impor padrões. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
