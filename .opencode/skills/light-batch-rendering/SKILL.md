---
name: light-batch-rendering
description: "Renderização em lote por script."
metadata:
  id: SK-30-16
  department: "Iluminação e renderização"
  version: "1.0"
  revised: "2026-10-18"
---

# light-batch-rendering

Renderização em lote por script.

**Quando usar:** Muitos assets ou ângulos.

**Requer:** Blender disponível, Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Percorra os objetos controlando a visibilidade.
- Defina render.filepath e renderize com write_still.
- Registre falhas por item.

**Verificação:** Todos os arquivos esperados existem com tamanho maior que zero.

**Complementares (sugeridas por similaridade):** `bpy-batch-generation`, `exp-naming-batch`, `uv-smart-project-script`

**Limites e recuperação:** Confirme identificadores de motor de render na versão do Blender em uso. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
