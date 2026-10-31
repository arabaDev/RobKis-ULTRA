---
name: proc-architecture-generator
description: "Gerar construções simples (casas, torres) a partir de largura, altura e andares."
metadata:
  id: SK-21-08
  department: "Modelagem procedural"
  version: "1.0"
  revised: "2026-10-18"
---

# proc-architecture-generator

Gerar construções simples (casas, torres) a partir de largura, altura e andares.

**Quando usar:** Casas e torres.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Parâmetros: largura, profundidade, altura de andar e número de andares.
- Repita módulos de parede e piso em grade fixa.
- Gere colisão simplificada junto da malha.
- Valide a escala contra a altura do personagem.

**Verificação:** A construção gerada tem as dimensões pedidas e passa na altura do personagem.

**Complementares (sugeridas por similaridade):** `proc-weapon-generator`, `review-architecture`, `proc-modular-building-kits`

**Limites e recuperação:** Geração procedural precisa de validação de dimensões e contagens. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
