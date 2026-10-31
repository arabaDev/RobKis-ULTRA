---
name: bpy-script-failure-diagnosis
description: "Diagnóstico de falhas em scripts bpy."
metadata:
  id: SK-20-17
  department: "Blender Python"
  version: "1.0"
  revised: "2026-10-18"
---

# bpy-script-failure-diagnosis

Diagnóstico de falhas em scripts bpy.

**Quando usar:** Erro de contexto, atributo ou operador.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Leia a mensagem de erro completa.
- Verifique a versão do Blender e o modo atual.
- Teste em um trecho pequeno.

**Verificação:** A causa foi identificada e o script roda.

**Complementares (sugeridas por similaridade):** `light-render-diagnosis`, `rec-failure-logging`, `rec-partial-failure`

**Limites e recuperação:** A API muda entre versões do Blender; confirme a versão antes de rodar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
