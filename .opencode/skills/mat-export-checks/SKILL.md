---
name: mat-export-checks
description: "Verificar materiais antes da exportação."
metadata:
  id: SK-23-12
  department: "Materiais e texturas"
  version: "1.0"
  revised: "2026-10-18"
---

# mat-export-checks

Verificar materiais antes da exportação.

**Quando usar:** Fim da etapa de materiais.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Todos os slots preenchidos.
- Texturas empacotadas ou caminhos válidos.
- Nomes coerentes.

**Verificação:** A exportação traz os materiais no destino.

**Complementares (sugeridas por similaridade):** `uv-export-validation`, `anim3d-bake-export`, `sec-ownership-checks`

**Limites e recuperação:** Confirme os limites de textura atuais do Roblox. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
