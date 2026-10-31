---
name: luau-attributes-tags
description: "Atributos e CollectionService para dados e comportamento por objeto."
metadata:
  id: SK-02-11
  department: "Programação Luau"
  version: "1.0"
  revised: "2026-10-18"
---

# luau-attributes-tags

Atributos e CollectionService para dados e comportamento por objeto.

**Quando usar:** Configurar instâncias sem criar muitos ValueObjects.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- SetAttribute, GetAttribute e GetAttributeChangedSignal; nomes não podem começar com RBX.
- Tags com CollectionService: AddTag, GetTagged e GetInstanceAddedSignal.
- Processe os já existentes com GetTagged e os novos com o sinal.

**Verificação:** Objetos existentes e criados depois recebem o comportamento.

**Complementares (sugeridas por similaridade):** `net-attributes-replication`, `arq-component-based-design`, `vcs-release-tags`

**Limites e recuperação:** Confirme APIs e sintaxe na documentação oficial atual antes de usar recursos novos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
