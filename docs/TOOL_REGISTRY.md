# Registro de ferramentas

Preencha com dados **observados**. Não registre o que não foi testado.

| Ferramenta | Finalidade | Entrada/Saída | Latência obs. | Limitações/erros | Alternativa |
|---|---|---|---|---|---|
| roblox-studio (MCP) | _não testado_ | | | | `.luau` manual |
| blender (MCP) | _não testado_ | | | | script `bpy` headless |

## Auditoria de MCPs (neste pacote)
No ambiente em que este pacote foi construído **nenhum MCP de Roblox Studio ou Blender estava conectado**, então nenhuma ferramenta foi chamada, medida ou testada. Os dois MCPs do `opencode.jsonc` estão desabilitados. Ao conectá-los, rode a skill `mcp-tool-discovery`, preencha a tabela acima com ferramentas, argumentos, retornos, falhas e latência **observados**, e só então promova skills de MCP no catálogo (`docs/skills_evidence.json`).
