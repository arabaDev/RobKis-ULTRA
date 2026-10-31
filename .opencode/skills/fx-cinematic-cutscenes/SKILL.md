---
name: fx-cinematic-cutscenes
description: "Cutscenes com câmera Scriptable e tweens."
metadata:
  id: SK-29-15
  department: "Áudio e efeitos"
  version: "1.0"
  revised: "2026-10-18"
---

# fx-cinematic-cutscenes

Cutscenes com câmera Scriptable e tweens.

**Quando usar:** Introduções e eventos de história.

**Requer:** Roblox Studio aberto. Sem isso, pare e diga isso antes de prosseguir.

**Regras**
- Use Camera.CameraType Scriptable e restaure ao fim.
- Faça tween do CFrame ao longo de pontos.
- Permita pular e devolva o controle ao jogador.

**Verificação:** O jogador recupera câmera e controle ao terminar ou pular.

**Complementares (sugeridas por similaridade):** `fx-tween-vfx`, `luau-cleanup-patterns`, `move-lock-on-camera`

**Limites e recuperação:** Teste o custo de efeitos em dispositivo móvel. Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.
