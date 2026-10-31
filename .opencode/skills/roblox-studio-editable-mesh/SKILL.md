---
name: roblox-studio-editable-mesh
description: "Construir e editar geometria de malha diretamente no Roblox Studio via EditableMesh/EditableImage (sem round-trip pelo Blender). Use quando o usuário pedir um modelo 3D gerado por script, uma variação procedural de uma malha, ou quando o pipeline Blender->export->import for desnecessário para a forma pedida."
metadata:
  id: SK-21-90
  department: "Modelagem procedural"
  version: "1.0"
  revised: 2026-10-24
---

# Modelagem Direto no Roblox Studio (EditableMesh)

## Quando usar isto em vez de Blender

| Situação | Caminho |
|---|---|
| Forma geométrica simples/paramétrica (caixa com chanfro, cano, grade, escada, terreno de baixo-poly, variações de um mesmo objeto) | **EditableMesh direto no Studio** — mais rápido, sem exportar/importar, iterável em runtime |
| Modelo orgânico, esculpido, com topologia complexa, rigging de personagem, UV manual detalhado | **Blender** (`bpy-*`, `proc-*`) — ainda é a ferramenta certa |
| Gerar N variações da mesma peça modular em lote (ex.: 40 tipos de rocha) | EditableMesh com uma função parametrizada, chamada em loop |

Quando o usuário disser só "faz um modelo" sem especificar, pergunte se é algo paramétrico/geométrico (fica no Studio) ou orgânico/detalhado (vai pro Blender) — não assuma.

## A API, em resumo

`EditableMesh` e `EditableImage` deixam criar/editar vértices, triângulos, UVs e texturas via script, sem precisar de um arquivo `.fbx`/`.obj` importado. Pontos-chave:

- Criação: `AssetService:CreateEditableMeshAsync(contentId)` para editar um mesh existente, ou `AssetService:CreateEditableMesh()` para começar do zero.
- Vértices: `mesh:AddVertex(Vector3)` retorna um `id` de vértice.
- Faces: `mesh:AddTriangle(v1id, v2id, v3id)` monta a face a partir de 3 ids de vértice.
- Normais/UVs: `mesh:AddNormal(Vector3)` / `mesh:AddUV(Vector2)` e depois `mesh:SetFaceNormals`/`SetFaceUVs` associam aos triângulos.
- Pra ver o resultado em `workspace`, aplique o mesh editado a um `EditableMeshAsset`/`MeshPart` via `AssetService:CreateMeshPartAsync` (ou atualize um `MeshPart.MeshContent` existente), dependendo da versão da API disponível no seu Studio — **confira a assinatura exata na documentação do Studio instalado**, porque esta é uma API que ainda evolui entre versões.
- `EditableImage` segue o mesmo princípio pra textura: `image:WritePixels(position, size, buffer)` pra pintar procedural (ex.: um ruído, um gradiente, um padrão de rocha) sem precisar de um arquivo de imagem importado.
- Contexto de execução: editar mesh costuma exigir rodar num **Script/Plugin com permissão de edição de asset** (nem todo contexto de `LocalScript` de jogador tem essa permissão) — ao gerar pra um jogo em produção, gere em **Script de servidor no momento de build/publish**, não em tempo real pro cliente, a menos que o objetivo explícito seja geometria procedural em runtime (ex.: terreno destrutível).

## Padrão: gerador paramétrico

```lua
--!strict
local AssetService = game:GetService("AssetService")

type BoxParams = { width: number, height: number, depth: number, bevel: number? }

local function buildBeveledBox(params: BoxParams): EditableMesh
	local mesh = AssetService:CreateEditableMesh()
	local w, h, d = params.width / 2, params.height / 2, params.depth / 2

	-- 8 vértices da caixa (sem chanfro ainda — chanfro real exigiria inserir
	-- vértices extras nas arestas; aqui mantemos simples de propósito)
	local positions = {
		Vector3.new(-w, -h, -d), Vector3.new(w, -h, -d),
		Vector3.new(w, h, -d), Vector3.new(-w, h, -d),
		Vector3.new(-w, -h, d), Vector3.new(w, -h, d),
		Vector3.new(w, h, d), Vector3.new(-w, h, d),
	}
	local ids = {}
	for i, pos in positions do
		ids[i] = mesh:AddVertex(pos)
	end

	-- 12 triângulos (2 por face, 6 faces) — winding order consistente (CCW visto de fora)
	local faces = {
		{ 1, 2, 3 }, { 1, 3, 4 }, -- frente
		{ 5, 8, 7 }, { 5, 7, 6 }, -- trás
		{ 1, 4, 8 }, { 1, 8, 5 }, -- esquerda
		{ 2, 6, 7 }, { 2, 7, 3 }, -- direita
		{ 4, 3, 7 }, { 4, 7, 8 }, -- topo
		{ 1, 5, 6 }, { 1, 6, 2 }, -- fundo
	}
	for _, f in faces do
		mesh:AddTriangle(ids[f[1]], ids[f[2]], ids[f[3]])
	end

	return mesh
end
```

Esse `buildBeveledBox` é o padrão pra generalizar: troque `BoxParams` por `BarrelParams`, `StairParams`, `RockVariantParams`, mantendo a mesma forma — **parâmetros tipados de entrada, loop de vértices, loop de triângulos, retorna o mesh**. Pra gerar variações em lote, chame a função N vezes com `math.random`/`seed` nos parâmetros de dimensão.

## Checklist de qualidade (antes de considerar pronto)

- Winding order consistente em toda face (senão a face aparece invertida/invisível de um lado).
- Normais corretas (`mesh:AddNormal` + `SetFaceNormals`), ou sombreamento vai ficar errado mesmo com geometria certa.
- Orçamento de triângulos verificado contra a distância de câmera esperada (ver `bench-gameplay-metrics` / `proc-architecture-generator` pra referência de budget).
- Colisão: gerar um `MeshPart` simplificado separado para `CollisionFbx`/`Shape` em vez de usar a malha visual detalhada como hitbox.
- Testar a geração em lote (mínimo e máximo dos parâmetros) antes de aceitar como "pronto" — um gerador paramétrico quebra silenciosamente em valores extremos (ex.: `width = 0`) se não for validado.

**Quando usar:** Pedido de modelo 3D gerado por script sem precisar abrir o Blender, ou geração procedural em lote de variações de uma mesma peça.

**Regras**
- Se a forma pedida for orgânica/detalhada, delegue pro pipeline Blender (`bpy-*`) em vez de forçar no EditableMesh.
- Sempre valide winding order e normais antes de considerar concluído.
- Gere no contexto certo (Script de build/servidor, não cliente, salvo pedido explícito de geometria em runtime).

**Verificação:** O mesh aparece corretamente de todos os ângulos no Studio (sem faces invertidas), a contagem de triângulos bate com o orçamento combinado, e a geração em lote não quebra nos parâmetros extremos testados.

**Complementares:** `proc-architecture-generator`, `bpy-bmesh-modeling`, `bench-gameplay-metrics`, `roblox-performance`.
