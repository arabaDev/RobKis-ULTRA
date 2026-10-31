---
name: tool-grip-positioning
description: "Ajuste de posição e rotação da ferramenta na mão."
metadata:
  id: SK-05-03
  department: "Ferramentas e armas"
  version: "1.0"
  revised: "2026-10-18"
---

# tool-grip-positioning

Ajuste de posição e rotação da ferramenta na mão.

**Quando usar:** Quando o modelo aparece torto ou deslocado.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Ajuste Tool.Grip (CFrame) ou GripPos e as direções de grip.
- Faça o ajuste no modelo e confirme em R6 e R15 se ambos importam.
- Pivô correto no Blender evita ajustes por tentativa.

**Verificação:** Posição conferida com o personagem em pose neutra.

**Complementares (sugeridas por similaridade):** `tool-structure`, `arq-state-management`, `studio-plugin-development`

**Limites e recuperação:** Confirme se o jogo usa R6, R15 ou rigs próprios antes de ajustar empunhadura. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
