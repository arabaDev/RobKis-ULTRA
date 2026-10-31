---
name: bpy-headless-run
description: "Executar Blender em modo background."
metadata:
  id: SK-20-06
  department: "Blender Python"
  version: "1.0"
  revised: "2026-10-18"
---

# bpy-headless-run

Executar Blender em modo background.

**Quando usar:** Automatizar sem abrir a interface.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- blender --background --python script.py.
- Caminhos absolutos.
- Código de saída e logs.

**Verificação:** O script roda sem a interface.

**Complementares (sugeridas por similaridade):** `test-bpy-headless`, `combat-lag-compensation`, `studio-play-modes`

**Limites e recuperação:** A API muda entre versões do Blender; confirme a versão antes de rodar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
