---
name: topo-retopology
description: "Retopologia de malhas de alta resolução."
metadata:
  id: SK-22-14
  department: "Topologia e geometria"
  version: "1.0"
  revised: "2026-10-18"
---

# topo-retopology

Retopologia de malhas de alta resolução.

**Quando usar:** Esculturas ou scans a transformar em malha de jogo.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Crie uma nova malha em quads sobre a original.
- Mais densidade onde há detalhe e deformação.
- Faça o bake dos detalhes da alta para a baixa.

**Verificação:** A contagem está no orçamento e a silhueta é mantida.

**Complementares (sugeridas por similaridade):** `mat-baking`, `mat-texture-resolution`, `mcp-redundant-call-prevention`

**Limites e recuperação:** Meça contagens reais; não estime triângulos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
