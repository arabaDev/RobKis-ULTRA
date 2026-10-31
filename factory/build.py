#!/usr/bin/env python3
"""Fábrica de skills do RobKis (idempotente).

Fonte da verdade das skills geradas: factory/src/*.txt + factory/departments.json.
  python factory/build.py            gera/atualiza SKILL.md sem destruir edições manuais
  python factory/build.py --check    não escreve; sai com 1 se algo mudaria
  python factory/build.py --adopt    adota arquivos existentes sem lock (primeira execução)
  python factory/build.py --force    sobrescreve inclusive arquivos editados à mão
Edições manuais são detectadas por hash (factory/lock.json) e preservadas; as 11 skills do núcleo
são escritas à mão e não são tocadas pela fábrica.
"""
from __future__ import annotations
import sys as _sys
for _s in (_sys.stdout, _sys.stderr):  # console do Windows (cp1252)
    if hasattr(_s, "reconfigure"):
        _s.reconfigure(encoding="utf-8", errors="replace")  # type: ignore[union-attr]
import argparse, glob, hashlib, json, math, os, re, sys, unicodedata
from collections import Counter

FACT = os.path.dirname(os.path.abspath(__file__)); ROOT = os.path.dirname(FACT)
SK = os.path.join(ROOT, ".opencode", "skills")
LOCK = os.path.join(FACT, "lock.json")
VERSION, REVISED = "1.0", "2026-10-18"
GEN = ("Fora do escopo, delegue ao departamento certo. Se a verificação falhar, corrija a causa e repita; "
       "após duas falhas iguais, mude de abordagem. Marque como NÃO TESTADO o que não puder validar no ambiente.")
NAME_RE = re.compile(r"[a-z0-9]+(-[a-z0-9]+)*")
REF_RE = re.compile(r"`([a-z0-9]+(?:-[a-z0-9]+)+)`")

def norm(s): return unicodedata.normalize("NFKD", s.lower()).encode("ascii", "ignore").decode()
def toks(s): return [t for t in re.split(r"[^a-z0-9]+", norm(s)) if len(t) > 2]
def sha(t): return hashlib.sha256(t.encode("utf-8")).hexdigest()

def parse_sources():
    skills, cur, src_errs = [], None, []
    for f in sorted(glob.glob(os.path.join(FACT, "src", "*.txt"))):
        fn = os.path.basename(f)
        for lineno, line in enumerate(open(f, encoding="utf-8-sig"), start=1):
            line = line.rstrip("\n")
            if not line.strip(): continue
            if line.startswith("# "): cur = line[2:].strip(); continue
            if line.startswith("## "): skills.append({"name": line[3:].strip(), "dept": cur, "src": fn}); continue
            k, sep, v = line.partition(": ")
            if not sep:
                src_errs.append(f"{fn}:{lineno}: linha não reconhecida (sem '<chave>: <valor>'): {line!r}")
                continue
            if k not in ("d", "w", "r", "v", "s"):
                src_errs.append(f"{fn}:{lineno}: chave desconhecida '{k}' (use d/w/r/v/s)")
                continue
            if not skills:
                src_errs.append(f"{fn}:{lineno}: campo '{k}' antes de qualquer '## nome-da-skill'")
                continue
            skills[-1][k] = v.strip()
    if src_errs:
        print("\n".join(src_errs)); sys.exit(1)
    return skills

def related_map(skills):
    docs = {s["name"]: Counter(toks(s["name"].split("-", 1)[1]) * 3 + toks(s["d"]) + toks(s["w"])) for s in skills}
    df = Counter(t for c in docs.values() for t in c)
    n = len(docs); out = {}
    for s in skills:
        if s["dept"] == "flow": continue
        mine, scored = docs[s["name"]], []
        for o in skills:
            if o["name"] == s["name"] or o["dept"] == "flow": continue
            sc = sum(math.log(n / df[t]) * min(mine[t], docs[o["name"]][t]) for t in mine if t in docs[o["name"]])
            if sc > 0: scored.append((-sc, o["name"]))
        scored.sort(); out[s["name"]] = [nm for _, nm in scored[:3]]
    return out

REQ_LABEL = {"roblox-studio": "Roblox Studio aberto", "blender": "Blender disponível",
             "mcp": "MCP conectado", "git": "repositório git"}

def render(s, dept, rel):
    dept["num"]; sid = s["_id"]
    head = (f"---\nname: {s['name']}\ndescription: {json.dumps(s['d'], ensure_ascii=False)}\nmetadata:\n  id: {sid}\n"
            f"  department: {json.dumps(dept['name'], ensure_ascii=False)}\n  version: \"{VERSION}\"\n  revised: \"{REVISED}\"\n---\n\n")
    b = f"# {s['name']}\n\n{s['d']}\n\n**Quando usar:** {s['w']}\n\n"
    reqs = dept.get("requires") or []
    if reqs:
        b += "**Requer:** " + ", ".join(REQ_LABEL.get(r, r) for r in reqs) + ". Sem isso, pare e diga isso antes de prosseguir.\n\n"
    fmt = lambda r: f"- {r}" if r.endswith(".") else f"- {r}."
    if "s" in s:
        steps = [x.strip() for x in s["s"].split("|") if x.strip()]
        b += "**Procedimento**\n" + "\n".join(f"{i}. {x}" + ("" if x.endswith(".") else ".") for i, x in enumerate(steps, 1)) + "\n\n"
        if s.get("r"): b += "**Regras do fluxo**\n" + "\n".join(fmt(r.strip()) for r in s["r"].split("|") if r.strip()) + "\n\n"
        names = []
        for x in steps:
            for m in REF_RE.findall(x):
                if m not in names: names.append(m)
        comp = ("**Skills complementares:** " + ", ".join(f"`{m}`" for m in names) + "\n\n") if names else ""
    else:
        b += "**Regras**\n" + "\n".join(fmt(r.strip()) for r in s["r"].split("|") if r.strip()) + "\n\n"
        comp = ("**Complementares (sugeridas por similaridade):** " + ", ".join(f"`{m}`" for m in rel.get(s["name"], [])) + "\n\n") if rel.get(s["name"]) else ""
    b += f"**Verificação:** {s['v']}\n\n" + comp + f"**Limites e recuperação:** {dept['limit']} {GEN}\n"
    return head + b

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--check", action="store_true"); ap.add_argument("--adopt", action="store_true"); ap.add_argument("--force", action="store_true")
    a = ap.parse_args()
    depts = {d["prefix"]: d for d in json.load(open(os.path.join(FACT, "departments.json"), encoding="utf-8-sig"))}
    skills = parse_sources(); errs = []; names = [s["name"] for s in skills]
    core = {d for d in os.listdir(SK) if os.path.isdir(os.path.join(SK, d))} if os.path.isdir(SK) else set()
    seen, counter = set(), Counter()
    for s in skills:
        n = s["name"]
        if s["dept"] not in depts: errs.append(f"{n}: departamento '{s['dept']}' desconhecido"); continue
        for k in ("d", "w", "v") + (("s",) if s["dept"] == "flow" else ("r",)):
            if not s.get(k): errs.append(f"{n}: falta '{k}'")
        if not NAME_RE.fullmatch(n) or len(n) > 64 or not n.startswith(s["dept"] + "-"): errs.append(f"{n}: nome inválido")
        if n in seen: errs.append(f"{n}: duplicado")
        seen.add(n)
        if len(s.get("d", "")) > 130: errs.append(f"{n}: descrição longa")
        if "|" in s.get("d", "") + s.get("w", "") + s.get("v", ""): errs.append(f"{n}: '|' proibido em d/w/v")
        counter[s["dept"]] += 1; s["_id"] = f"SK-{depts[s['dept']]['num']:02d}-{counter[s['dept']]:02d}"
    allnames = set(names) | core
    for s in skills:
        for m in REF_RE.findall(s.get("s", "")):
            if m not in allnames: errs.append(f"{s['name']}: referência a skill inexistente `{m}`")
    if errs: print("\n".join(errs)); sys.exit(1)
    rel = related_map(skills)
    lock = json.load(open(LOCK, encoding="utf-8-sig")) if os.path.isfile(LOCK) else {}
    st = Counter(); changed = False
    for s in skills:
        path = os.path.join(SK, s["name"], "SKILL.md"); content = render(s, depts[s["dept"]], rel); h = sha(content)
        if not os.path.isfile(path): action = "created"
        else:
            cur = open(path, encoding="utf-8").read(); ch = sha(cur)
            if cur == content: action = "unchanged"
            elif a.force or (a.adopt and s["name"] not in lock) or lock.get(s["name"]) == ch: action = "updated"
            elif s["name"] not in lock: action = "skipped-nolock"
            else: action = "skipped-manual"
        st[action] += 1
        if action in ("created", "updated") and not a.check:
            os.makedirs(os.path.dirname(path), exist_ok=True); open(path, "w", encoding="utf-8").write(content)
        if action in ("created", "updated", "unchanged"): lock[s["name"]] = h
        if action in ("created", "updated"): changed = True
        if action.startswith("skipped"): print(f"PULADA ({action}): {s['name']}")
    if not a.check:
        json.dump(dict(sorted(lock.items())), open(LOCK, "w", encoding="utf-8"), indent=0)
    print(f"fábrica: {len(skills)} skills · " + " · ".join(f"{k}={v}" for k, v in sorted(st.items())))
    if a.check and changed: sys.exit(1)

if __name__ == "__main__": main()
