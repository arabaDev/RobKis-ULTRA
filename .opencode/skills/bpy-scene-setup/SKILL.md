---
name: bpy-scene-setup
description: "Preparar a cena do Blender: unidades, coleções e limpeza segura."
metadata:
  id: SK-20-01
  department: "Blender Python"
  version: "1.0"
  revised: "2026-10-18"
---

# bpy-scene-setup

Preparar a cena do Blender: unidades, coleções e limpeza segura.

**Quando usar:** Início de qualquer script de asset.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Defina unit_settings coerentes com a convenção do projeto.
- Crie coleção própria.
- Não apague a cena do usuário.

**Verificação:** A cena inicial tem o estado esperado.

**Complementares (sugeridas por similaridade):** `pipe-collision-setup`, `light-hdri-setup`, `light-camera-setup`

**Limites e recuperação:** A API muda entre versões do Blender; confirme a versão antes de rodar. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
