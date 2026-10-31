---
name: move-custom-camera
description: "Câmera personalizada em primeira, terceira pessoa e fixa."
metadata:
  id: SK-41-05
  department: "Gameplay e sistemas de movimento"
  version: "1.0"
  revised: "2026-10-18"
---

# move-custom-camera

Câmera personalizada em primeira, terceira pessoa e fixa.

**Quando usar:** Câmeras diferentes do padrão.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Defina Camera.CameraType e CameraSubject.
- Atualize com RenderStepped ou BindToRenderStep.
- Trate a colisão da câmera com o cenário.

**Verificação:** A câmera não atravessa paredes e volta ao padrão quando necessário.

**Complementares (sugeridas por similaridade):** `move-lock-on-camera`, `light-camera-setup`, `fx-screen-shake-camera`

**Limites e recuperação:** Movimento depende de latência e propriedade de rede; teste com mais de um cliente. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
