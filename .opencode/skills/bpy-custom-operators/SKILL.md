---
name: bpy-custom-operators
description: "Operadores e painéis simples em um addon."
metadata:
  id: SK-20-11
  department: "Blender Python"
  version: "1.0"
  revised: "2026-10-18"
---

# bpy-custom-operators

Operadores e painéis simples em um addon.

**Quando usar:** Ferramentas reutilizáveis na interface.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- bpy.types.Operator com execute.
- Registrar e desregistrar.
- Idempotente.

**Verificação:** O operador aparece e executa.

**Complementares (sugeridas por similaridade):** `tool-custom-models`, `anim-custom-rigs`, `move-custom-camera`

**Limites e recuperação:** A API muda entre versões do Blender; confirme a versão antes de rodar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
