---
name: tool-structure
description: "Estrutura de uma Tool: Handle, RequiresHandle, Grip e partes."
metadata:
  id: SK-05-01
  department: "Ferramentas e armas"
  version: "1.0"
  revised: "2026-10-18"
---

# tool-structure

Estrutura de uma Tool: Handle, RequiresHandle, Grip e partes.

**Quando usar:** Ao criar qualquer ferramenta ou arma.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Handle é a parte segurada; RequiresHandle controla se é obrigatório.
- Grip e GripPos definem a posição na mão.
- Mantenha o modelo soldado com WeldConstraint ou Motor6D.

**Verificação:** A Tool equipa sem cair e na posição correta.

**Complementares (sugeridas por similaridade):** `arq-folder-structure`, `doc-readme-structure`, `tool-server-validation`

**Limites e recuperação:** Confirme se o jogo usa R6, R15 ou rigs próprios antes de ajustar empunhadura. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
