---
name: pipe-geometry-limits
description: "Limites de geometria e tamanho para importação no Roblox."
metadata:
  id: SK-28-13
  department: "Integração Blender–Roblox"
  version: "1.0"
  revised: "2026-10-18"
---

# pipe-geometry-limits

Limites de geometria e tamanho para importação no Roblox.

**Quando usar:** Importação falha ou avisa sobre tamanho.

**Requer:** Blender disponível, Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Confirme os limites atuais de triângulos e dimensões na documentação.
- Divida malhas grandes em partes.
- Reduza antes de exportar.

**Verificação:** A malha importa sem aviso de limite.

**Complementares (sugeridas por similaridade):** `data-budget-limits`, `orch-concurrency-limits`, `fx-performance-limits`

**Limites e recuperação:** Sem importação automática, entregue o passo a passo manual e marque como pendente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
