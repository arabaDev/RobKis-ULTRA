---
name: flow-datastore-feature
description: "Fluxo de persistência: esquema, escrita segura, falhas, migração e recuperação."
metadata:
  id: SK-44-09
  department: "Fluxos compostos"
  version: "1.0"
  revised: "2026-10-18"
---

# flow-datastore-feature

Fluxo de persistência: esquema, escrita segura, falhas, migração e recuperação.

**Quando usar:** Qualquer dado novo salvo.

**Procedimento**
1. Defina o esquema com `data-schema-versioning`.
2. Escreva com `data-updateasync-pattern`.
3. Trate falhas com `data-retry-backoff`.
4. Evite escrita dupla com `data-session-locking`.
5. Salve com `data-autosave-bindtoclose`.
6. Respeite `data-budget-limits`.
7. Teste no Studio com `data-studio-api-access`.
8. Simule falhas com `test-datastore-offline`.
9. Planeje `data-migration`.
10. Prepare `data-corruption-recovery`.
11. Valide com `regr-data-compat`.

**Regras do fluxo**
- Nunca teste em dados reais.
- Nunca sobrescreva dados bons com dados vazios.

**Verificação:** Falha de leitura não apaga dados e dados antigos carregam corretamente.

**Skills complementares:** `data-schema-versioning`, `data-updateasync-pattern`, `data-retry-backoff`, `data-session-locking`, `data-autosave-bindtoclose`, `data-budget-limits`, `data-studio-api-access`, `test-datastore-offline`, `data-migration`, `data-corruption-recovery`, `regr-data-compat`

**Limites e recuperação:** Este fluxo só ordena skills; cada etapa deve ser verificada pela skill correspondente, e o estado real de cada etapa deve ser reportado. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
