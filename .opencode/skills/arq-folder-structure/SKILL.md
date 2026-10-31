---
name: arq-folder-structure
description: "Estrutura de pastas e nomes consistentes para o projeto Roblox."
metadata:
  id: SK-01-07
  department: "Arquitetura de software"
  version: "1.0"
  revised: "2026-10-18"
---

# arq-folder-structure

Estrutura de pastas e nomes consistentes para o projeto Roblox.

**Quando usar:** No início do projeto ou ao limpar um lugar bagunçado.

**Regras**
- Pastas por função: Shared, Remotes, Services, Controllers, Assets.
- Se usar sincronização de arquivos (Rojo), respeite os sufixos .server e .client.
- Escolha uma convenção de nomes e registre no AGENTS.md.

**Verificação:** Qualquer script é achado pelo nome da pasta sem busca ampla.

**Complementares (sugeridas por similaridade):** `doc-readme-structure`, `tool-structure`, `rk-game-scaffold`

**Limites e recuperação:** Decisões dependem do jogo real; confirme a estrutura existente antes de impor padrões. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
