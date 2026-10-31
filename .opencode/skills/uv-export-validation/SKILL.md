---
name: uv-export-validation
description: "Validar UV antes da exportação."
metadata:
  id: SK-24-12
  department: "UV mapping"
  version: "1.0"
  revised: "2026-10-18"
---

# uv-export-validation

Validar UV antes da exportação.

**Quando usar:** Fim da etapa de UV.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Todos os objetos com UV.
- Sem ilhas fora do espaço.
- Sem faces sem UV.

**Verificação:** Relatório de UV por objeto.

**Complementares (sugeridas por similaridade):** `mat-export-checks`, `anim3d-validation-in-studio`, `mcp-argument-validation`

**Limites e recuperação:** Valide visualmente com um padrão de teste antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
