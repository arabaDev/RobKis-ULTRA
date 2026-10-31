---
name: uv-stretch-checking
description: "Detectar e corrigir esticamento de UV com textura de teste xadrez."
metadata:
  id: SK-24-08
  department: "UV mapping"
  version: "1.0"
  revised: "2026-10-18"
---

# uv-stretch-checking

Detectar e corrigir esticamento de UV com textura de teste xadrez.

**Quando usar:** Textura distorcida.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Aplique uma textura xadrez e procure quadrados deformados.
- Esticamento aparece onde faltam costuras ou há ilhas muito comprimidas.
- Adicione costuras ou relaxe as ilhas e reaplique o xadrez.
- Reverifique depois de qualquer escala ou edição da malha.

**Verificação:** O xadrez mostra quadrados de proporção uniforme em toda a superfície visível.

**Complementares (sugeridas por similaridade):** `topo-non-manifold`, `orch-subtask-splitting`, `test-performance-smoke`

**Limites e recuperação:** Valide visualmente com um padrão de teste antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
