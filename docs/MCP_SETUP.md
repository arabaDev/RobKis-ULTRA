# Setup dos MCPs

Ambos começam **desabilitados** em `opencode.jsonc`. Habilite (`"enabled": true`) só depois de instalar.

## Roblox Studio (`rbx-studio-mcp`)
1. Instale o servidor MCP do Roblox Studio (binário `rbx-studio-mcp`) e o plugin correspondente no Studio.
2. Ajuste o `command` em `opencode.jsonc` para o caminho do binário, se não estiver no PATH.
3. Mantenha o Studio aberto com o plugin ativo.

## Blender (`blender-mcp`)
1. Instale `uv` (para `uvx`).
2. Instale o addon do Blender MCP e ative o servidor/socket dentro do Blender.
3. Mantenha o Blender aberto.

## Conferir
Abra o OpenCode e peça ao RobKis: "liste as ferramentas MCP disponíveis". Registre o resultado e a latência em `docs/TOOL_REGISTRY.md`.
Sem MCP, o RobKis entrega `.luau` pronto para colar e scripts `bpy` para `blender --background --python`.
