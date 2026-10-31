---
name: uv-padding-islands
description: "Margem entre ilhas UV."
metadata:
  id: SK-24-04
  department: "UV mapping"
  version: "1.0"
  revised: "2026-10-18"
---

# uv-padding-islands

Margem entre ilhas UV.

**Quando usar:** Evitar sangramento de cor entre ilhas.

**Requer:** Blender disponível. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Margem em pixels conforme a resolução.
- Mais margem para mipmaps.
- Empacote com margem constante.

**Verificação:** Sem manchas nas bordas das ilhas.

**Complementares (sugeridas por similaridade):** `arq-api-contracts`, `arq-module-dependencies`, `net-messaging-memorystore`

**Limites e recuperação:** Valide visualmente com um padrão de teste antes de concluir. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
