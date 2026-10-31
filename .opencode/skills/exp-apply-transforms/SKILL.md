---
name: exp-apply-transforms
description: "Aplicar transformações antes de exportar."
metadata:
  id: SK-27-04
  department: "Exportação de assets"
  version: "1.0"
  revised: "2026-10-18"
---

# exp-apply-transforms

Aplicar transformações antes de exportar.

**Quando usar:** Sempre.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- transform_apply para escala e rotação.
- Posição conforme o pivô desejado.
- Verificar dimensões.

**Verificação:** Escala 1 e rotação zero.

**Complementares (sugeridas por similaridade):** `rig-apply-scale`, `rk-game-scaffold`, `topo-scale-origin`

**Limites e recuperação:** Só dê a exportação por concluída com arquivo verificado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
