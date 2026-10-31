---
name: studio-explorer-properties
description: "Navegar Explorer e Properties e escolher entre propriedade e atributo."
metadata:
  id: SK-03-01
  department: "Roblox Studio"
  version: "1.0"
  revised: "2026-10-18"
---

# studio-explorer-properties

Navegar Explorer e Properties e escolher entre propriedade e atributo.

**Quando usar:** Ao inspecionar ou configurar objetos no Studio.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Propriedades são da classe; atributos são dados personalizados da instância.
- Confira Parent, Anchored, CanCollide e Archivable antes de depurar.
- Renomeie com nomes estáveis, pois scripts dependem deles.

**Verificação:** A hierarquia real coincide com a que o script espera.

**Complementares (sugeridas por similaridade):** `phys-custom-properties`, `phys-collision-groups`, `mcp-roblox-studio-usage`

**Limites e recuperação:** Ações no Studio exigem o Studio aberto; sem MCP, entregue passos manuais exatos. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
