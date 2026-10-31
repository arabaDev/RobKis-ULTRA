#!/usr/bin/env python3
"""Verificador estático do GUI Engine (NÃO é um compilador Luau).

Confere em todos os .luau de gui-engine/src:
  - cabeçalho --!strict e comentário de cabeçalho (local/tipo/função)
  - balanceamento function/if/do/repeat <-> end/until (com lexer que ignora strings e comentários)
  - balanceamento de (), [], {}
  - if-expressões (não contadas como bloco) apenas reportadas
  - ModuleScripts terminam com `return`
  - require(...) resolve para um arquivo existente na árvore do Roblox simulada
  - Registry:Create("X") aponta para componente existente; UIConfig.Layout e Menu consistentes
  - Enum.Font.X dentro de uma lista de fontes válidas

Uso: python gui-engine/tools/check_luau.py        (sai com 1 se houver erro)
"""
from __future__ import annotations
import json, os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, "src")
VALID_FONTS = {
    "Legacy", "Arial", "ArialBold", "SourceSans", "SourceSansBold", "SourceSansSemibold", "SourceSansLight",
    "SourceSansItalic", "Bodoni", "Garamond", "Cartoon", "Code", "Highway", "SciFi", "Arcade", "Fantasy",
    "Antique", "Gotham", "GothamMedium", "GothamBold", "GothamBlack", "AmaticSC", "Bangers", "Creepster",
    "DenkOne", "Fondamento", "FredokaOne", "GrenzeGotisch", "IndieFlower", "JosefinSans", "Jura", "Kalam",
    "LuckiestGuy", "Merriweather", "Michroma", "Nunito", "Oswald", "PatrickHand", "PermanentMarker",
    "Roboto", "RobotoCondensed", "RobotoMono", "Sarpanch", "SpecialElite", "TitilliumWeb", "Ubuntu",
    "BuilderSans", "BuilderSansMedium", "BuilderSansBold", "BuilderSansExtraBold",
}

def lex(code, keep=False):
    """Remove comentários e conteúdo de strings, preservando quebras de linha."""
    out, i, n = [], 0, len(code)
    while i < n:
        c = code[i]
        if code.startswith("--", i):
            m = re.match(r"--\[(=*)\[", code[i:])
            if m:
                close = "]" + m.group(1) + "]"
                j = code.find(close, i)
                j = n if j < 0 else j + len(close)
            else:
                j = code.find("\n", i)
                j = n if j < 0 else j
            out.append("\n" * code[i:j].count("\n"))
            i = j
        elif c == "[" and re.match(r"\[=*\[", code[i:]):
            m = re.match(r"\[(=*)\[", code[i:])
            close = "]" + m.group(1) + "]"
            j = code.find(close, i)
            j = n if j < 0 else j + len(close)
            out.append('""' + "\n" * code[i:j].count("\n"))
            i = j
        elif c in "\"'`":
            j = i + 1
            while j < n and code[j] != c:
                j += 2 if code[j] == "\\" else 1
            out.append(code[i:j + 1] if keep else '""')
            i = j + 1
        else:
            out.append(c)
            i += 1
    return "".join(out)

EXPR_PREV = re.compile(r"(=|\(|,|\{|\breturn|\band|\bor|\bnot|\+|-|\.\.|:|\*|/|<|>)\s*$")

def check_blocks(clean):
    errors, info = [], {"if_expressions": 0}
    stack = []
    for m in re.finditer(r"\b(function|if|do|repeat|end|until)\b", clean):
        kw, line = m.group(1), clean.count("\n", 0, m.start()) + 1
        if kw == "if":
            if EXPR_PREV.search(clean[max(0, m.start() - 12):m.start()]):
                info["if_expressions"] += 1
                continue
            stack.append(("if", line))
        elif kw in ("function", "do"):
            stack.append((kw, line))
        elif kw == "repeat":
            stack.append(("repeat", line))
        elif kw == "until":
            if not stack or stack[-1][0] != "repeat":
                errors.append(f"linha {line}: 'until' sem 'repeat'")
            else:
                stack.pop()
        else:  # end
            if not stack or stack[-1][0] == "repeat":
                errors.append(f"linha {line}: 'end' sem bloco aberto")
            else:
                stack.pop()
    for kw, line in stack:
        errors.append(f"linha {line}: '{kw}' sem fechamento")
    pairs, st = {")": "(", "]": "[", "}": "{"}, []
    for m in re.finditer(r"[()\[\]{}]", clean):
        ch, line = m.group(0), clean.count("\n", 0, m.start()) + 1
        if ch in "([{":
            st.append((ch, line))
        elif not st or st[-1][0] != pairs[ch]:
            errors.append(f"linha {line}: '{ch}' inesperado")
        else:
            st.pop()
    for ch, line in st:
        errors.append(f"linha {line}: '{ch}' sem fechamento")
    return errors, info

def build_tree():
    """Simula a árvore do Roblox a partir do sistema de arquivos (regras do Rojo)."""
    tree = {"ReplicatedStorage": {}, "ServerScriptService": {}, "StarterPlayer": {"StarterPlayerScripts": {}}}
    def stem(f):
        for suf in (".server.luau", ".client.luau", ".luau", ".model.json"):
            if f.endswith(suf):
                return f[: -len(suf)]
        return f
    def load(path):
        node = {"__path": path}
        for f in sorted(os.listdir(path)):
            full = os.path.join(path, f)
            if os.path.isdir(full):
                node[f] = load(full)
            elif f.startswith("init."):
                node["__init"] = full
            else:
                node[stem(f)] = {"__path": full}
        return node
    tree["ReplicatedStorage"]["RobKisGUI"] = load(os.path.join(SRC, "ReplicatedStorage", "RobKisGUI"))
    tree["ServerScriptService"]["RobKisServer"] = load(os.path.join(SRC, "ServerScriptService", "RobKisServer"))
    spp = os.path.join(SRC, "StarterPlayer", "StarterPlayerScripts")
    for f in os.listdir(spp):
        tree["StarterPlayer"]["StarterPlayerScripts"][f.split(".")[0]] = {"__path": os.path.join(spp, f)}
    return tree

def file_node(tree, path):
    def walk(node):
        if node.get("__path") == path or node.get("__init") == path:
            return node
        for _k, v in node.items():
            if isinstance(v, dict):
                r = walk(v)
                if r:
                    return r
        return None
    return walk(tree)

def parent_map(tree):
    parents = {}
    def walk(node):
        for _k, v in node.items():
            if isinstance(v, dict):
                parents[id(v)] = node
                walk(v)
    parents[id(tree)] = None
    walk(tree)
    return parents

def resolve_require(expr, locals_, tree, parents, me):
    expr = re.sub(r':WaitForChild\("(\w+)"\)', r".\1", expr).strip()
    for _ in range(6):
        parts = expr.split(".")
        if parts[0] in locals_ and parts[0] != "script":
            expr = ".".join([locals_[parts[0]]] + parts[1:])
    parts = expr.split(".")
    node = None
    for i, p in enumerate(parts):
        if i == 0:
            if p == "script":
                node = me
            elif p in tree:
                node = tree[p]
            else:
                return None
        elif p == "Parent":
            node = parents.get(id(node))
            if node is None:
                return None
        else:
            node = node.get(p)
            if not isinstance(node, dict):
                return None
    return node

def main():
    errors, warnings, files = [], [], []
    tree = build_tree()
    parents = parent_map(tree)
    components = {k for k, v in tree["ReplicatedStorage"]["RobKisGUI"]["Components"].items() if isinstance(v, dict) and k != "__path"}
    for dp, _, fns in os.walk(SRC):
        for fn in sorted(fns):
            if not fn.endswith(".luau"):
                continue
            path = os.path.join(dp, fn)
            rel = os.path.relpath(path, ROOT)
            files.append(rel)
            text = open(path, encoding="utf-8").read()
            def err(msg, rel=rel): errors.append(f"{rel}: {msg}")
            if not text.startswith("--!strict"):
                err("falta --!strict na primeira linha")
            head = "\n".join(text.splitlines()[:5])
            if "Local:" not in head or "Função:" not in head:
                err("falta cabeçalho (Local/Tipo/Função)")
            clean = lex(text)
            e, info = check_blocks(clean)
            for m in e:
                err(m)
            if info["if_expressions"]:
                warnings.append(f"{rel}: {info['if_expressions']} if-expressão(ões) ignoradas na contagem de blocos")
            is_entry = fn.endswith((".server.luau", ".client.luau"))
            last = [l for l in clean.splitlines() if l.strip()]
            if not is_entry and (not last or not last[-1].startswith("return")):
                err("ModuleScript deve terminar com 'return'")
            me = file_node(tree, path)
            locals_ = {}
            for m in re.finditer(r"^local (\w+)\s*(?::[^=\n]+)?=\s*(.+)$", text, re.M):
                v = m.group(2).strip()
                g = re.match(r'game:GetService\("(\w+)"\)$', v)
                if g:
                    locals_[m.group(1)] = g.group(1)
                elif re.match(r"^(script|[A-Z]\w*)[\w.:\"()]*$", v) and "require" not in v:
                    locals_[m.group(1)] = re.sub(r':WaitForChild\("(\w+)"\)', r".\1", v.rstrip())
            nocomment = lex(text, True)
            for m in re.finditer(r"\brequire\(", nocomment):
                depth, j = 1, m.end()
                while j < len(nocomment) and depth:
                    depth += {"(": 1, ")": -1}.get(nocomment[j], 0)
                    j += 1
                expr = nocomment[m.end():j - 1].strip()
                if expr == "child":
                    continue
                if me is None or resolve_require(expr, locals_, tree, parents, me) is None:
                    err(f"require não resolve: {expr}")
            for m in re.finditer(r'(?:Registry|registry):Create\("(\w+)"', nocomment):
                if m.group(1) not in components:
                    err(f"componente inexistente: {m.group(1)}")
            for m in re.finditer(r"Enum\.Font\.(\w+)", text):
                if m.group(1) not in VALID_FONTS:
                    err(f"Enum.Font.{m.group(1)} desconhecida")
    # consistência de UIConfig
    cfg = open(os.path.join(SRC, "ReplicatedStorage/RobKisGUI/Shared/UIConfig.luau"), encoding="utf-8").read()
    for m in re.finditer(r'Component = "(\w+)"', cfg):
        if m.group(1) not in components:
            errors.append(f"UIConfig.Layout: componente inexistente {m.group(1)}")
    panels = set()
    for name in components:
        t = open(os.path.join(SRC, "ReplicatedStorage/RobKisGUI/Components", name + ".luau"), encoding="utf-8").read()
        for m in re.finditer(r'Panel = config\.Panel or "(\w+)"', t):
            panels.add(m.group(1))
    for m in re.finditer(r'Panel = "(\w+)", Text', cfg):
        if m.group(1) not in panels:
            errors.append(f"UIConfig.Menu: painel sem janela correspondente: {m.group(1)}")
    for name in ("MainHUD", "Hotbar", "ShopPanel"):
        if name not in components:
            errors.append(f"componente obrigatório ausente: {name}")
    required = ["MainHUD","TopBar","CurrencyDisplay","HealthBar","EnergyBar","ExperienceBar","LevelDisplay","InventoryPanel","Hotbar","SkillsPanel","QuestPanel","ShopPanel","CharacterSelection","PetPanel","EquipmentPanel","SettingsPanel","TutorialPanel","NotificationSystem","ConfirmationDialog","LoadingScreen","TooltipSystem","ModalWindow","ProgressBar","ToggleButton","Tabs","SearchField","ItemCard","RarityCard","CooldownIndicator"]
    missing = [c for c in required if c not in components]
    if missing:
        errors.append(f"componentes da especificação ausentes: {missing}")
    print(json.dumps({"arquivos": len(files), "componentes": len(components), "erros": errors, "avisos": warnings}, indent=2, ensure_ascii=False))
    sys.exit(1 if errors else 0)

if __name__ == "__main__":
    for _s in (sys.stdout, sys.stderr):  # console do Windows (cp1252) não quebra com acentos/símbolos
        if hasattr(_s, "reconfigure"):
            _s.reconfigure(encoding="utf-8", errors="replace")  # type: ignore[union-attr]
    main()
