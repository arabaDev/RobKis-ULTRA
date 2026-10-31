---
name: debugging-testing
description: "Fluxo de depuração e testes para Luau, bpy e integração. Use quando houver erro, comportamento inesperado ou antes de declarar algo concluído."
metadata:
  id: SK-46-01
  department: "Núcleo Roblox"
  version: 1.0
  revised: 2026-10-18
---
# Debugging & Testing

## Depurar

1. Mensagem completa (tipo, script, linha, stack). 2. Reproduzir com entrada mínima. 3. Causa provável (onde o estado ficou inválido). 4. Correção mínima. 5. Re-testar + regressão. Se falhar 2x, mude a abordagem.

Classifique: sintaxe · execução · lógica · replicação · dependência · configuração · ferramenta · desempenho.

## Ferramentas

- Output/Logs do Studio, `warn`/`print` temporários (remova depois), `Debugger` e breakpoints do Studio.
- Estático: `luau-analyze`/`selene`/`stylua` **se instalados** (verifique antes de citar).
- Multiplayer: Studio → Test → Local Server com 2+ jogadores; alterne cliente/servidor ao conferir `workspace`.
- bpy: rodar `blender --background --python script.py` e checar arquivo/contagens.

## Teste mínimo por tipo de entrega

Script isolado → sintaxe + caso feliz + 1 caso de borda. Sistema com Remote → também input inválido e spam. Asset → arquivo existe, escala, triângulos, importou. Sempre registre o que **não** foi possível testar.

**Verificação:** O teste que falhou passa de novo e os testes vizinhos continuam passando.
