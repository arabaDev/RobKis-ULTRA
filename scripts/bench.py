#!/usr/bin/env python3
"""Registra e reporta execuções de benchmark (ver docs/BENCHMARK.md).

Uso:
    python scripts/bench.py add --version v1 --task T01 --seconds 95 \\
        --success 1 --errors 0 --quality 4 --manual 0
    python scripts/bench.py report
    python scripts/bench.py report --version v1
    python scripts/bench.py report --task T01

Dados ficam em docs/bench_runs.csv (uma linha por execução, append-only — uma
run anterior nunca é sobrescrita por engano).
"""
from __future__ import annotations
import argparse
import csv
import os
import sys
from collections import defaultdict
from datetime import datetime, timezone

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CSV_PATH = os.path.join(ROOT, "docs", "bench_runs.csv")
FIELDS = ["timestamp", "version", "task", "seconds", "success", "errors",
          "regressions", "tokens", "cost", "quality", "manual"]


def _row(args) -> dict:
    return {
        "timestamp": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "version": args.version,
        "task": args.task,
        "seconds": args.seconds,
        "success": args.success,
        "errors": args.errors,
        "regressions": args.regressions,
        "tokens": args.tokens if args.tokens is not None else "",
        "cost": args.cost if args.cost is not None else "",
        "quality": args.quality,
        "manual": args.manual,
    }


def cmd_add(args) -> int:
    new_file = not os.path.isfile(CSV_PATH)
    os.makedirs(os.path.dirname(CSV_PATH), exist_ok=True)
    with open(CSV_PATH, "a", encoding="utf-8", newline="") as f:
        w = csv.DictWriter(f, fieldnames=FIELDS)
        if new_file:
            w.writeheader()
        w.writerow(_row(args))
    print(f"registrado: {args.version}/{args.task} ({args.seconds}s, "
          f"sucesso={args.success}, erros={args.errors}, qualidade={args.quality})")
    return 0


def _read_rows():
    if not os.path.isfile(CSV_PATH):
        return []
    with open(CSV_PATH, encoding="utf-8", newline="") as f:
        return list(csv.DictReader(f))


def _to_num(v, cast=float):
    try:
        return cast(v)
    except (TypeError, ValueError):
        return None


def cmd_report(args) -> int:
    rows = _read_rows()
    if args.version:
        rows = [r for r in rows if r["version"] == args.version]
    if args.task:
        rows = [r for r in rows if r["task"] == args.task]
    if not rows:
        print("nenhuma execução registrada ainda (ou filtro não bateu com nada)."
              " Use 'bench.py add' primeiro.")
        return 1

    by_version = defaultdict(list)
    for r in rows:
        by_version[r["version"]].append(r)

    for version in sorted(by_version):
        vrows = by_version[version]
        n = len(vrows)
        seconds = [x for x in (_to_num(r["seconds"]) for r in vrows) if x is not None]
        success = [x for x in (_to_num(r["success"], int) for r in vrows) if x is not None]
        errors = [x for x in (_to_num(r["errors"], int) for r in vrows) if x is not None]
        quality = [x for x in (_to_num(r["quality"], int) for r in vrows) if x is not None]
        manual = [x for x in (_to_num(r["manual"], int) for r in vrows) if x is not None]
        print(f"== {version} ({n} execuções) ==")
        if seconds:
            print(f"  tempo médio: {sum(seconds)/len(seconds):.1f}s "
                  f"(min {min(seconds):.1f}s, max {max(seconds):.1f}s)")
        if success:
            print(f"  taxa de sucesso: {sum(success)}/{len(success)} "
                  f"({100*sum(success)/len(success):.0f}%)")
        if errors:
            print(f"  erros médios pós-teste: {sum(errors)/len(errors):.2f}")
        if quality:
            print(f"  qualidade média (1-5): {sum(quality)/len(quality):.1f}")
        if manual:
            print(f"  intervenções manuais: {sum(manual)}/{len(manual)} execuções precisaram")
        print()
    return 0


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__,
                                  formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)

    add = sub.add_parser("add", help="registra uma execução")
    add.add_argument("--version", required=True)
    add.add_argument("--task", required=True)
    add.add_argument("--seconds", type=float, required=True)
    add.add_argument("--success", type=int, choices=[0, 1], required=True)
    add.add_argument("--errors", type=int, required=True)
    add.add_argument("--regressions", type=int, default=0)
    add.add_argument("--tokens", type=int, default=None)
    add.add_argument("--cost", type=float, default=None)
    add.add_argument("--quality", type=int, choices=[1, 2, 3, 4, 5], required=True)
    add.add_argument("--manual", type=int, choices=[0, 1], required=True)
    add.set_defaults(func=cmd_add)

    rep = sub.add_parser("report", help="resume as execuções registradas")
    rep.add_argument("--version", default=None)
    rep.add_argument("--task", default=None)
    rep.set_defaults(func=cmd_report)

    args = ap.parse_args()
    return args.func(args)


if __name__ == "__main__":
    for _s in (sys.stdout, sys.stderr):  # console do Windows (cp1252) não quebra com acentos/símbolos
        if hasattr(_s, "reconfigure"):
            _s.reconfigure(encoding="utf-8", errors="replace")  # type: ignore[union-attr]
    sys.exit(main())
