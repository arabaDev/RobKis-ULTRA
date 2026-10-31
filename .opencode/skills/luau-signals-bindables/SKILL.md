---
name: luau-signals-bindables
description: "BindableEvent e módulos Signal para comunicação interna."
metadata:
  id: SK-02-10
  department: "Programação Luau"
  version: "1.0"
  revised: "2026-10-18"
---

# luau-signals-bindables

BindableEvent e módulos Signal para comunicação interna.

**Quando usar:** Quando sistemas do mesmo lado precisam se avisar sem acoplamento.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- BindableEvent copia tabelas ao disparar e perde metatables; módulo Signal passa referências.
- Use Once quando só interessa a primeira ocorrência.
- Desconecte conexões de objetos destruídos.

**Verificação:** Disparar o sinal chama cada ouvinte uma vez e sem vazamento após o Destroy.

**Complementares (sugeridas por similaridade):** `arq-extensibility-patterns`, `arq-module-dependencies`, `arq-api-contracts`

**Limites e recuperação:** Confirme APIs e sintaxe na documentação oficial atual antes de usar recursos novos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
