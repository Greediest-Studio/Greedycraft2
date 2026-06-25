"""
jar_fill_from_full_index.py  v2
Scan the full mods directory (530 jars), build a jar index, then for every
en_us.lang in the repo:
  1. Fill __UNTRANSLATED__<zh> values where the jar has the exact key
  2. Fill values that still contain CJK characters (residual from the broken
     glossary-agent pass) where the jar has the exact key
  3. Add any zh_cn.lang key entirely absent from en_us.lang where the jar has it
Only uses jar values on exact key match. No translation in this script.
"""
import re, zipfile
from pathlib import Path

REPO_ROOT    = Path(r"C:\Users\julian\IdeaProjects\Greedycraft2")
MC           = REPO_ROOT / "minecraft"
FULL_MODS    = Path(r"C:\Users\julian\AppData\Roaming\PrismLauncher\instances\GreedyCraft2-2.8.5 (1)\minecraft\mods")
SEARCH_ROOTS = [MC / "resources", MC / "oresources"]

# Repo-directory-name -> actual jar modid (when they differ)
MODID_ALIASES: dict[str, str] = {
    "betweenlands": "thebetweenlands",
}

CJK_RE = re.compile(r"[一-鿿㐀-䶿]")

# ── helpers ───────────────────────────────────────────────────────────────────

def parse_lang(text: str):
    """Returns (header_lines, kv). Skips # comment lines throughout."""
    lines = text.splitlines()
    header, kv = [], {}
    past_header = False
    for line in lines:
        stripped = line.strip()
        if not past_header:
            if stripped == "" or stripped.startswith("#"):
                header.append(line)
                continue
            past_header = True
        if stripped.startswith("#") or stripped == "":
            continue
        if "=" in stripped:
            key, _, value = stripped.partition("=")
            kv[key] = value
    return header, kv


def write_lang(path: Path, header, kv):
    lines = header + [f"{k}={v}" for k, v in kv.items()]
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def build_jar_index(mods_dir: Path):
    index: dict[str, tuple[Path, str]] = {}
    pattern = re.compile(r"assets/([^/]+)/lang/en_[uU][sS]\.lang$")
    jars = list(mods_dir.rglob("*.jar"))
    print(f"Scanning {len(jars)} JARs ...")
    for jar_path in jars:
        try:
            with zipfile.ZipFile(jar_path, "r") as zf:
                for name in zf.namelist():
                    m = pattern.match(name)
                    if m:
                        modid = m.group(1)
                        if modid not in index:
                            index[modid] = (jar_path, name)
        except Exception:
            pass
    print(f"Found en_us.lang for {len(index)} modids.\n")
    return index


def read_jar_lang(jar_path: Path, entry_name: str):
    with zipfile.ZipFile(jar_path, "r") as zf:
        raw = zf.read(entry_name).decode("utf-8", errors="replace")
    _, kv = parse_lang(raw)
    return kv


def needs_fill(value: str) -> bool:
    """True if the value needs to be replaced from the jar."""
    return value.startswith("__UNTRANSLATED__") or bool(CJK_RE.search(value))

# ── main ──────────────────────────────────────────────────────────────────────

def main():
    jar_index = build_jar_index(FULL_MODS)

    # Collect repo zh_cn.lang files, dedup
    seen: set[Path] = set()
    zh_files: list[Path] = []
    for root in SEARCH_ROOTS:
        for p in list(root.rglob("zh_cn.lang")) + list(root.rglob("zh_CN.lang")):
            rp = p.resolve()
            if rp not in seen:
                seen.add(rp)
                zh_files.append(p)

    print(f"Processing {len(zh_files)} lang files ...\n")

    results = []
    skipped_no_jar = []

    for zh_path in sorted(zh_files):
        dir_modid = zh_path.parent.parent.name
        jar_modid = MODID_ALIASES.get(dir_modid, dir_modid)
        en_path   = zh_path.parent / "en_us.lang"
        root_tag  = "oresources" if "oresources" in str(zh_path) else "resources"

        if jar_modid not in jar_index:
            skipped_no_jar.append(f"{dir_modid} ({root_tag})")
            continue

        if not en_path.exists():
            continue

        jar_path, jar_entry = jar_index[jar_modid]
        jar_kv = read_jar_lang(jar_path, jar_entry)
        if not jar_kv:
            continue

        zh_raw = zh_path.read_text(encoding="utf-8", errors="replace")
        en_raw = en_path.read_text(encoding="utf-8", errors="replace")
        _, zh_kv = parse_lang(zh_raw)
        header, en_kv = parse_lang(en_raw)

        filled = added = still_missing = 0
        changed = False

        for key, _zh_val in zh_kv.items():
            if key in en_kv:
                if needs_fill(en_kv[key]):
                    if key in jar_kv:
                        en_kv[key] = jar_kv[key]
                        filled += 1
                        changed = True
                    else:
                        still_missing += 1
                # else: already good English, leave it
            else:
                # Key entirely absent from en_us.lang
                if key in jar_kv:
                    en_kv[key] = jar_kv[key]
                    added += 1
                    changed = True
                else:
                    still_missing += 1

        if changed:
            # Preserve zh key order, then any extra existing keys
            ordered: dict[str, str] = {}
            for key in zh_kv:
                if key in en_kv:
                    ordered[key] = en_kv[key]
            for key, val in en_kv.items():
                if key not in ordered:
                    ordered[key] = val
            write_lang(en_path, header, ordered)

        results.append({
            "modid":   dir_modid,
            "root":    root_tag,
            "jar":     jar_path.name,
            "filled":  filled,
            "added":   added,
            "missing": still_missing,
        })

    # ── report ────────────────────────────────────────────────────────────────
    changed_results   = [r for r in results if r["filled"] or r["added"]]
    unmatched_results = [r for r in results if not r["filled"] and not r["added"] and r["missing"]]
    clean_already     = [r for r in results if not r["filled"] and not r["added"] and not r["missing"]]

    if changed_results:
        print(f"{'modid':<28} {'root':<11} {'filled':>7} {'added':>6} {'still_missing':>14}  jar")
        print("-" * 115)
        for r in sorted(changed_results, key=lambda x: -(x["filled"] + x["added"])):
            print(f"{r['modid']:<28} {r['root']:<11} {r['filled']:>7} {r['added']:>6} {r['missing']:>14}  {r['jar'][:50]}")

    if unmatched_results:
        print("\n-- Jar found but no keys matched (jar uses different key scheme) --")
        for r in sorted(unmatched_results, key=lambda x: -x["missing"]):
            print(f"  {r['modid']} ({r['root']}): {r['missing']} unmatched  [{r['jar'][:50]}]")

    if clean_already:
        print("\n-- Already fully covered by jar (0 residual, 0 missing) --")
        for r in sorted(clean_already, key=lambda x: x["modid"]):
            print(f"  {r['modid']} ({r['root']})")

    if skipped_no_jar:
        print(f"\n-- No jar found for {len(skipped_no_jar)} modid(s) --")
        for s in sorted(skipped_no_jar):
            print(f"  {s}")

    total_f = sum(r["filled"] for r in results)
    total_a = sum(r["added"]  for r in results)
    total_m = sum(r["missing"] for r in results)
    print(f"\nTOTALS: filled={total_f}  added={total_a}  still_missing={total_m}")


if __name__ == "__main__":
    main()
