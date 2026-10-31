---
name: sec-sanitize-text
description: "Filtragem e limite de texto digitado por jogadores."
metadata:
  id: SK-08-08
  department: "Segurança cliente-servidor"
  version: "1.0"
  revised: "2026-10-18"
---

# sec-sanitize-text

Filtragem e limite de texto digitado por jogadores.

**Quando usar:** Nomes, mensagens e qualquer texto exibido a outros.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Filtre texto de usuário com TextService:FilterStringAsync ou use o chat padrão.
- Limite tamanho e caracteres.
- Trate falha do filtro como rejeição.

**Verificação:** Texto não filtrado nunca aparece para outros jogadores.

**Complementares (sugeridas por similaridade):** `doc-diagrams-text`, `ui-text-handling`, `bug-read-stack`

**Limites e recuperação:** Nenhuma defesa é absoluta; combine camadas e registre tentativas suspeitas. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
