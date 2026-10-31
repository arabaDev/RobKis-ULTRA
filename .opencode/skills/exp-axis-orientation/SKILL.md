---
name: exp-axis-orientation
description: "Eixos e orientação na exportação."
metadata:
  id: SK-27-05
  department: "Exportação de assets"
  version: "1.0"
  revised: "2026-10-18"
---

# exp-axis-orientation

Eixos e orientação na exportação.

**Quando usar:** Modelo importado girado ou deitado.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Defina axis_forward e axis_up.
- Teste com um objeto assimétrico.
- Registre a convenção.

**Verificação:** A frente do objeto aponta como esperado.

**Complementares (sugeridas por similaridade):** `pipe-collision-setup`, `inv-data-model`, `pipe-source-vs-destination-diff`

**Limites e recuperação:** Só dê a exportação por concluída com arquivo verificado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
