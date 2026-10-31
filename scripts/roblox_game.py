#!/usr/bin/env python3
"""ROViral Jogo: dados REAIS de jogos Roblox pelas APIs públicas (sem chave), para estudo de jogos virais com evidência.

  python scripts/roblox_game.py https://www.roblox.com/games/1234567890/Nome
  python scripts/roblox_game.py 1234567890 9876543210        vários placeIds (compara lado a lado)
  python scripts/roblox_game.py --universo 4567890            por universeId
  python scripts/roblox_game.py <link> --imagens pasta/       baixa ícone e thumbnails (PNG) para o agente VER
  python scripts/roblox_game.py <link> --json

Saída: nome, criador, jogando agora, visitas, favoritos, likes/dislikes (% de aprovação), criação, última atualização,
gênero, máximo por servidor, visitas por dia desde a criação, descrição curta. Tudo vem com data/hora da consulta:
pode ser citado como evidência "verificado" no viral_score (fonte: API pública do Roblox).
Endpoints: apis.roblox.com/universes/v1/places/{id}/universe · games.roblox.com/v1/games · games.roblox.com/v1/games/votes
· thumbnails.roblox.com/v1/games/icons · thumbnails.roblox.com/v1/games/multiget/thumbnails.
Os dados descrevem o jogo, não ensinam a copiá-lo: use para entender padrões (viral-game-inspector).
"""
from __future__ import annotations

import argparse
import datetime as dt
import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from _common import HttpError, http_get, http_json, now_iso, utf8_console  # noqa: E402

API_UNIVERSE = "https://apis.roblox.com/universes/v1/places/{pid}/universe"
API_GAMES = "https://games.roblox.com/v1/games?universeIds={ids}"
API_VOTES = "https://games.roblox.com/v1/games/votes?universeIds={ids}"
API_ICON = "https://thumbnails.roblox.com/v1/games/icons?universeIds={ids}&returnPolicy=PlaceHolder&size=512x512&format=Png&isCircular=false"
API_THUMBS = "https://thumbnails.roblox.com/v1/games/multiget/thumbnails?universeIds={ids}&countPerUniverse=3&defaults=true&size=768x432&format=Png&isCircular=false"


def parse_place_id(s: str) -> int | None:
    m = re.search(r"/games/(\d+)", s) or re.search(r"[?&]placeId=(\d+)", s) or re.fullmatch(r"\s*(\d{3,})\s*", s)
    return int(m.group(1)) if m else None


def _parse_date(s: str | None) -> dt.datetime | None:
    if not s:
        return None
    try:
        return dt.datetime.strptime(s[:19], "%Y-%m-%dT%H:%M:%S")
    except ValueError:
        return None


def build_report(games: dict, votes: dict, today: dt.datetime | None = None) -> list[dict]:
    """Combina as respostas das APIs (testável sem rede)."""
    today = today or dt.datetime.now(dt.timezone.utc).replace(tzinfo=None)
    vmap = {v.get("id"): v for v in votes.get("data", [])}
    out = []
    for g in games.get("data", []):
        uid = g.get("id")
        v = vmap.get(uid, {})
        up, down = v.get("upVotes"), v.get("downVotes")
        created = _parse_date(g.get("created"))
        updated = _parse_date(g.get("updated"))
        days = max(1, (today.date() - created.date()).days) if created else None
        visits = g.get("visits")
        creator = g.get("creator") or {}
        out.append({
            "universeId": uid,
            "placeId": g.get("rootPlaceId"),
            "nome": g.get("name"),
            "criador": creator.get("name"),
            "tipo_criador": creator.get("type"),
            "jogando_agora": g.get("playing"),
            "visitas": visits,
            "favoritos": g.get("favoritedCount"),
            "likes": up,
            "dislikes": down,
            "aprovacao_pct": round(100 * up / (up + down), 1) if isinstance(up, int) and isinstance(down, int) and up + down > 0 else None,
            "criado_em": g.get("created", "")[:10] or None,
            "atualizado_em": g.get("updated", "")[:10] or None,
            "dias_desde_criacao": days,
            "dias_desde_atualizacao": max(0, (today.date() - updated.date()).days) if updated else None,
            "visitas_por_dia_media": round(visits / days) if isinstance(visits, int) and days else None,
            "genero": g.get("genre"),
            "max_jogadores": g.get("maxPlayers"),
            "descricao": " ".join((g.get("description") or "").split())[:400],
            "link": f"https://www.roblox.com/games/{g.get('rootPlaceId')}" if g.get("rootPlaceId") else None,
        })
    return out


def fetch(universe_ids: list[int], use_cache: bool = True) -> list[dict]:
    ids = ",".join(str(i) for i in universe_ids)
    games = http_json(API_GAMES.format(ids=ids), ttl=600, use_cache=use_cache)
    try:
        votes = http_json(API_VOTES.format(ids=ids), ttl=600, use_cache=use_cache)
    except HttpError:
        votes = {"data": []}
    return build_report(games if isinstance(games, dict) else {}, votes if isinstance(votes, dict) else {})


def image_urls(universe_ids: list[int], use_cache: bool = True) -> dict:
    ids = ",".join(str(i) for i in universe_ids)
    out: dict = {u: {"icone": None, "thumbnails": []} for u in universe_ids}
    try:
        icons = http_json(API_ICON.format(ids=ids), ttl=3600, use_cache=use_cache)
        for it in icons.get("data", []) if isinstance(icons, dict) else []:
            if it.get("targetId") in out and it.get("imageUrl"):
                out[it["targetId"]]["icone"] = it["imageUrl"]
    except HttpError as e:
        print(f"aviso: ícones indisponíveis ({e})", file=sys.stderr)
    try:
        th = http_json(API_THUMBS.format(ids=ids), ttl=3600, use_cache=use_cache)
        for it in th.get("data", []) if isinstance(th, dict) else []:
            u = it.get("universeId")
            if u in out:
                out[u]["thumbnails"] = [t["imageUrl"] for t in it.get("thumbnails", []) if t.get("imageUrl")]
    except HttpError as e:
        print(f"aviso: thumbnails indisponíveis ({e})", file=sys.stderr)
    return out


def fmt_int(n) -> str:
    return f"{n:,}".replace(",", ".") if isinstance(n, int) else "?"


def main(argv: list[str] | None = None) -> int:
    utf8_console()
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("jogos", nargs="*", help="links do Roblox ou placeIds")
    ap.add_argument("--universo", nargs="*", type=int, default=[], help="universeIds")
    ap.add_argument("--imagens", metavar="PASTA", help="baixa ícone + thumbnails para esta pasta")
    ap.add_argument("--json", action="store_true")
    ap.add_argument("--sem-cache", action="store_true")
    a = ap.parse_args(argv)
    cache = not a.sem_cache
    uids = list(a.universo)
    try:
        for s in a.jogos:
            pid = parse_place_id(s)
            if pid is None:
                print(f"ERRO: não achei placeId em {s!r} (use o link /games/<número>/ ou o número)", file=sys.stderr)
                return 2
            data = http_json(API_UNIVERSE.format(pid=pid), ttl=30 * 86400, use_cache=cache)
            uid = data.get("universeId") if isinstance(data, dict) else None
            if not uid:
                print(f"ERRO: place {pid} não existe ou é privado", file=sys.stderr)
                return 2
            uids.append(int(uid))
        if not uids:
            ap.error("informe pelo menos um link, placeId ou --universo")
        uids = list(dict.fromkeys(uids))[:50]
        rep = fetch(uids, cache)
        imgs = {}
        if a.imagens:
            os.makedirs(a.imagens, exist_ok=True)
            urls = image_urls(uids, cache)
            for g in rep:
                u = urls.get(g["universeId"], {})
                saved = []
                for i, url in enumerate(([u["icone"]] if u.get("icone") else []) + u.get("thumbnails", [])):
                    name = os.path.join(a.imagens, f"{g['universeId']}_{'icone' if i == 0 and u.get('icone') else 'thumb' + str(i)}.png")
                    try:
                        with open(name, "wb") as f:
                            f.write(http_get(url, ttl=86400, use_cache=cache))
                        saved.append(name)
                    except (HttpError, OSError) as e:
                        print(f"aviso: imagem não baixada ({e})", file=sys.stderr)
                imgs[g["universeId"]] = saved
                g["imagens"] = saved
    except HttpError as e:
        print(f"ERRO Roblox API: {e}", file=sys.stderr)
        print("Dica: sem rede para *.roblox.com neste ambiente? Use a ferramenta de web nativa na página do jogo ou peça um print ao usuário.", file=sys.stderr)
        return 2
    if a.json:
        print(json.dumps({"fonte": "API pública do Roblox", "consultado_em": now_iso(), "jogos": rep}, ensure_ascii=False, indent=2))
        return 0
    print(f"fonte: API pública do Roblox · consultado em {now_iso()} (UTC-local da máquina)\n")
    print("| jogo | jogando agora | visitas | favoritos | aprovação | criado | atualizado há | visitas/dia (média) |")
    print("|---|---|---|---|---|---|---|---|")
    for g in rep:
        ap_txt = f"{g['aprovacao_pct']}%" if g["aprovacao_pct"] is not None else "?"
        upd = f"{g['dias_desde_atualizacao']} d" if g["dias_desde_atualizacao"] is not None else "?"
        print(f"| {g['nome']} | {fmt_int(g['jogando_agora'])} | {fmt_int(g['visitas'])} | {fmt_int(g['favoritos'])} | {ap_txt} | "
              f"{g['criado_em']} | {upd} | {fmt_int(g['visitas_por_dia_media'])} |")
    for g in rep:
        print(f"\n{g['nome']} ({g['link']}) · criador: {g['criador']} · gênero: {g['genero']} · até {g['max_jogadores']} por servidor")
        if g["descricao"]:
            print(f"  descrição: {g['descricao']}")
        if g.get("imagens"):
            print("  imagens para ver (abra com a ferramenta de leitura de arquivo): " + ", ".join(g["imagens"]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
