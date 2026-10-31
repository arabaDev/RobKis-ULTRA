---
name: ui-text-handling
description: "Texto: RichText, TextScaled, TextWrapped e restrições de tamanho."
metadata:
  id: SK-09-05
  department: "Interfaces e GUIs"
  version: "1.0"
  revised: "2026-10-18"
---

# ui-text-handling

Texto: RichText, TextScaled, TextWrapped e restrições de tamanho.

**Quando usar:** Textos que variam em tamanho ou idioma.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- UITextSizeConstraint limita TextScaled.
- RichText para ênfase; escape de conteúdo de usuário.
- Teste com textos longos e com acentos.

**Verificação:** Texto longo não estoura o contêiner.

**Complementares (sugeridas por similaridade):** `doc-diagrams-text`, `sec-sanitize-text`, `luau-string-handling`

**Limites e recuperação:** Valide em pelo menos um celular e um desktop antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
