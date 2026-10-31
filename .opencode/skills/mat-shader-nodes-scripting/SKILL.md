---
name: mat-shader-nodes-scripting
description: "Criar e ligar nós de shader por script."
metadata:
  id: SK-23-16
  department: "Materiais e texturas"
  version: "1.0"
  revised: "2026-10-18"
---

# mat-shader-nodes-scripting

Criar e ligar nós de shader por script.

**Quando usar:** Gerar materiais em lote.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- nodes.new com o tipo do nó e links.new para ligar.
- Procure o nó por nome ou tipo, não por posição.
- Reporte os nós e links criados.

**Verificação:** O material tem os nós e ligações esperados.

**Complementares (sugeridas por similaridade):** `bpy-geometry-nodes-scripting`, `proc-geometry-nodes-intro`, `bpy-material-editing`

**Limites e recuperação:** Confirme os limites de textura atuais do Roblox. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
