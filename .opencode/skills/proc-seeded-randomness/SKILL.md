---
name: proc-seeded-randomness
description: "Aleatoriedade com semente para geração reproduzível."
metadata:
  id: SK-21-02
  department: "Modelagem procedural"
  version: "1.0"
  revised: "2026-10-18"
---

# proc-seeded-randomness

Aleatoriedade com semente para geração reproduzível.

**Quando usar:** Variação de assets e mapas.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- random.Random(semente) em Python.
- Registrar a semente.
- Mesma semente, mesmo resultado.

**Verificação:** A mesma semente reproduz o asset.

**Complementares (sugeridas por similaridade):** `rk-math-rng`, `test-determinism`, `test-bpy-headless`

**Limites e recuperação:** Geração procedural precisa de validação de dimensões e contagens. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
