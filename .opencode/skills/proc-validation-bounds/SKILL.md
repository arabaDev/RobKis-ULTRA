---
name: proc-validation-bounds
description: "Validação de dimensões e limites dos assets gerados."
metadata:
  id: SK-21-12
  department: "Modelagem procedural"
  version: "1.0"
  revised: "2026-10-18"
---

# proc-validation-bounds

Validação de dimensões e limites dos assets gerados.

**Quando usar:** Depois de gerar.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Comparar dimensões com o esperado.
- Checar origem.
- Contagem de triângulos.

**Verificação:** Relatório de dimensões e contagens.

**Complementares (sugeridas por similaridade):** `sec-remote-input-validation`, `tool-server-validation`, `topo-mesh-validation`

**Limites e recuperação:** Geração procedural precisa de validação de dimensões e contagens. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
