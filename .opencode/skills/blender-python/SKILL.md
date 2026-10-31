---
name: blender-python
description: "Automação do Blender com Python/bpy — scripts idempotentes, execução headless e exportação verificada. Use ao gerar, modificar ou exportar objetos via script."
metadata:
  id: SK-46-01
  department: "Núcleo Roblox"
  version: 1.0
  revised: 2026-10-18
---
# Blender Python (bpy)

Rodar: `blender --background --python script.py`. Confirme a versão (`bpy.app.version_string`); a API muda entre releases.

## Esqueleto

```python
import bpy, os

OUT = "/caminho/absoluto/saida"
os.makedirs(OUT, exist_ok=True)

def clear_collection(name):
    col = bpy.data.collections.get(name)
    if col:
        for o in list(col.objects):
            bpy.data.objects.remove(o, do_unlink=True)
    else:
        col = bpy.data.collections.new(name)
        bpy.context.scene.collection.children.link(col)
    return col

def add_box(col, name, size):
    bpy.ops.mesh.primitive_cube_add(size=1)
    o = bpy.context.active_object
    o.name = name
    o.scale = size
    bpy.ops.object.transform_apply(location=False, rotation=True, scale=True)
    for c in o.users_collection: c.objects.unlink(o)
    col.objects.link(o)
    return o

def export_glb(objs, path):
    bpy.ops.object.select_all(action="DESELECT")
    for o in objs: o.select_set(True)
    bpy.context.view_layer.objects.active = objs[0]
    bpy.ops.export_scene.gltf(filepath=path, export_format="GLB", use_selection=True)
    assert os.path.getsize(path) > 0, "exportação vazia"
```

## Regras

- Idempotente: limpe/recrie a sua coleção; não apague a cena do usuário.
- Referencie por nome; trate `bpy.data.objects.get(...)` = `None`.
- Operadores `bpy.ops` dependem de modo/seleção/contexto — prefira `bpy.data` e `bmesh` quando possível; entre em Object Mode antes de operar.
- Caminhos absolutos; verifique arquivo e contagens (`len(obj.data.vertices)`, triângulos) depois e reporte.
- Dizer "gerei o script" ≠ "executei o script".

**Verificação:** O script rodou de verdade e o arquivo e as contagens foram conferidos.
