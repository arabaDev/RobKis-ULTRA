---
name: bpy-safe-execution
description: "Execução segura de scripts no Blender."
metadata:
  id: SK-20-15
  department: "Blender Python"
  version: "1.0"
  revised: "2026-10-18"
---

# bpy-safe-execution

Execução segura de scripts no Blender.

**Quando usar:** Scripts que alteram ou apagam dados.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Salve uma cópia do .blend antes de rodar.
- Trabalhe numa coleção própria.
- Nunca apague dados que o script não criou.

**Verificação:** O arquivo original está intacto após o teste.

**Complementares (sugeridas por similaridade):** `inv-trading-safe`, `rec-safe-abort`, `ui-safe-areas`

**Limites e recuperação:** A API muda entre versões do Blender; confirme a versão antes de rodar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
