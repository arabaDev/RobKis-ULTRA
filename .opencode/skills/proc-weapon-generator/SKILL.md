---
name: proc-weapon-generator
description: "Gerador de armas com partes combináveis."
metadata:
  id: SK-21-07
  department: "Modelagem procedural"
  version: "1.0"
  revised: "2026-10-18"
---

# proc-weapon-generator

Gerador de armas com partes combináveis.

**Quando usar:** Muitas armas com visual diferente.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Partes: lâmina, guarda e cabo.
- Dimensões coerentes.
- Pivô na empunhadura.

**Verificação:** Cada variação mantém proporção e pivô.

**Complementares (sugeridas por similaridade):** `proc-architecture-generator`, `tool-rarity-stats`, `phys-anchoring-strategy`

**Limites e recuperação:** Geração procedural precisa de validação de dimensões e contagens. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
