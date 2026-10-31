---
name: roblox-blender-pipeline
description: "Fluxo completo Blender → Roblox Studio — escala, eixos, formato, importação, colisão e validação no jogo. Use quando um asset vai do Blender ao Roblox."
metadata:
  id: SK-46-01
  department: "Núcleo Roblox"
  version: 1.0
  revised: 2026-10-18
---
# Roblox ↔ Blender Pipeline

1. **Requisitos:** função, estilo, dimensões em studs, orçamento de triângulos.
2. **Blender:** modelar, aplicar transformações, pivô correto, nomear, coleção própria.
3. **Escala:** 1 stud ≈ 0,28 m. Fixe uma convenção (ex.: 1 unidade Blender = 1 stud) e documente; valide com um objeto de referência de tamanho conhecido.
4. **Exportar:** FBX ou glTF/GLB (malha + materiais) ou OBJ (só malha), com caminho absoluto; confirme que o arquivo existe e tem tamanho > 0.
5. **Importar:** pelo Importador 3D / Asset Manager do Studio (ou MCP, se existir e estiver conectado). Resulta em `MeshPart`/`Model`.
6. **Configurar no Studio:** `Anchored`, `CanCollide`, `CollisionFidelity`, pivô, hierarquia, material/textura.
7. **Testar no contexto do jogo:** tamanho vs. personagem, orientação, colisão, aparência, desempenho.
8. **Corrigir** o que aparecer (escala e orientação são os erros mais comuns).

Sem ferramenta de import automática, **não finja**: entregue o arquivo, o caminho exato e o passo-a-passo manual, e marque como "depende de ação manual".

**Verificação:** O asset foi visto no Studio com escala, colisão e aparência corretas, ou marcado como importação manual pendente.
