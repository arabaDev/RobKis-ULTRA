---
name: topo-merge-doubles
description: "Mesclar vértices duplicados com bmesh.ops.remove_doubles sem alterar a forma."
metadata:
  id: SK-22-06
  department: "Topologia e geometria"
  version: "1.0"
  revised: "2026-10-18"
---

# topo-merge-doubles

Mesclar vértices duplicados com bmesh.ops.remove_doubles sem alterar a forma.

**Quando usar:** Malhas importadas ou geradas.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- bmesh.ops.remove_doubles com distância pequena.
- Cuidado com detalhes finos.
- Confirmar contagem.

**Verificação:** A contagem de vértices diminuiu sem alterar a forma.

**Complementares (sugeridas por similaridade):** `vcs-merge-conflicts`, `topo-decimation-safely`, `bpy-bmesh-modeling`

**Limites e recuperação:** Meça contagens reais; não estime triângulos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
