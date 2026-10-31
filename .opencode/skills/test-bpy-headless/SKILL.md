---
name: test-bpy-headless
description: "Testar scripts bpy em modo background."
metadata:
  id: SK-18-11
  department: "Testes automatizados"
  version: "1.0"
  revised: "2026-10-18"
---

# test-bpy-headless

Testar scripts bpy em modo background.

**Quando usar:** Scripts de geração de assets.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Rode com blender --background --python.
- Verifique arquivo gerado e contagens.
- Retorne código de saída diferente de zero em falha.

**Verificação:** O script termina com código zero e o arquivo existe.

**Complementares (sugeridas por similaridade):** `bpy-headless-run`, `bpy-data-vs-ops`, `bpy-error-handling-verify`

**Limites e recuperação:** Diga o que foi executado e o que depende de teste manual no Studio. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
