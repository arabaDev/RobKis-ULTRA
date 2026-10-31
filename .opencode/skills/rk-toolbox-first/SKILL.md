---
name: rk-toolbox-first
description: "Busca na Toolbox antes de criar qualquer asset. Economiza tempo e mantém consistência visual."
metadata:
  id: SK-45-01
  department: "Protocolo do agente RobKis"
  version: "1.0"
  revised: "2026-10-18"
---

# rk-toolbox-first

Buscar na Toolbox é sempre o primeiro passo antes de criar qualquer asset do zero.

**Quando usar:** Qualquer pedido de modelo, prop, efeito, animação ou script de sistema.

**Protocolo (via MCP)**
1. `search_asset` com 2–3 variações de termos (ex: "wooden sword", "fantasy sword", "rpg weapon").
2. Para cada candidato: `get_asset_details` → avaliar poly count, estilo, data de criação, reputação do criador.
3. Critérios de aprovação: estilo compatível com o projeto, poly count dentro do budget, sem scripts suspeitos no preview.
4. Se aprovado: inserir via `insert_asset`, registrar assetId em `AGENTS.md` na seção "Assets usados".
5. Se nenhum candidato serve: uma linha explicando por quê → criar do zero (Blender ou Parts).

**Critérios de rejeição de Toolbox:**
- Asset pago não autorizado nesta sessão.
- Criador com menos de 5 assets publicados e sem reputação verificável.
- Poly count acima do budget da cena sem LOD disponível.
- Scripts internos que disparam flags (ver `rk-asset-security-scan`).
- Estilo visual incompatível sem possibilidade de adaptação rápida.

**Sem MCP:**
Informe o assetId que o usuário deve buscar manualmente na Toolbox, com termos de busca e critérios de avaliação. Nunca pule a etapa.

**Skills complementares:** `rk-asset-security-scan`, `3d-game-assets`, `pipe-bulk-import`, `dep-asset-ids-tracking`

**Verificação:** Todo asset inserido tem assetId registrado e scan de segurança concluído.
