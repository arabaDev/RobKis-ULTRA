---
name: rig-apply-scale
description: "Aplicar escala e rotação no armature e na malha antes de exportar."
metadata:
  id: SK-25-11
  department: "Rigging e esqueletos"
  version: "1.0"
  revised: "2026-10-18"
---

# rig-apply-scale

Aplicar escala e rotação no armature e na malha antes de exportar.

**Quando usar:** Antes de exportar.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Aplique escala e rotação na malha e no armature (Ctrl+A).
- Refaça ou confira os pesos depois.
- Confirme escala 1 e rotação zero nos dois.
- Teste uma pose para ver se a deformação continua igual.

**Verificação:** Escala 1, rotação zero e pose de teste deformando como antes.

**Complementares (sugeridas por similaridade):** `topo-scale-origin`, `exp-apply-transforms`, `exp-scale-units`

**Limites e recuperação:** Confirme requisitos atuais do importador de rigs do Roblox. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
