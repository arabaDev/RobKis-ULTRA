---
name: bpy-error-handling-verify
description: "Tratamento de erros e verificação em scripts bpy."
metadata:
  id: SK-20-10
  department: "Blender Python"
  version: "1.0"
  revised: "2026-10-18"
---

# bpy-error-handling-verify

Tratamento de erros e verificação em scripts bpy.

**Quando usar:** Scripts que geram arquivos.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Cheque existência com bpy.data.objects.get.
- try e except em operações arriscadas.
- Verifique arquivo exportado.

**Verificação:** Falha gera mensagem clara e código de saída.

**Complementares (sugeridas por similaridade):** `luau-error-handling`, `mcp-error-triage`, `mcp-untrusted-content-handling`

**Limites e recuperação:** A API muda entre versões do Blender; confirme a versão antes de rodar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
