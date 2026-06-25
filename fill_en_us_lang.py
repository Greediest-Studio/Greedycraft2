"""
fill_en_us_lang.py  —  Greedycraft2 language file bootstrapper

For every zh_cn.lang under minecraft/resources/ and minecraft/oresources/:
  - Locate the mod's official en_us.lang inside the matching JAR (by modid)
  - Write a new en_us.lang using official English where available,
    __UNTRANSLATED__<zh_value> for anything missing
  - If en_us.lang already exists: back it up and add only missing keys
  - Write translation_report_lang.md summarising results
"""

import os
import re
import shutil
import zipfile
from pathlib import Path
from typing import Optional

# ── Paths ─────────────────────────────────────────────────────────────────────
REPO_ROOT   = Path(__file__).parent
MC          = REPO_ROOT / "minecraft"
RESOURCES   = MC / "resources"
ORESOURCES  = MC / "oresources"
MODS_DIR    = MC / "mods"
REPORT_PATH = REPO_ROOT / "translation_report_lang.md"

SEARCH_ROOTS = [RESOURCES, ORESOURCES]

# ── Lang parsing ──────────────────────────────────────────────────────────────

def parse_lang(text: str) -> tuple[list[str], dict[str, str]]:
    """
    Returns (header_lines, key_to_value).
    header_lines: leading # comment / blank lines before the first key=value.
    Preserves original insertion order of keys.
    """
    lines = text.splitlines()
    header: list[str] = []
    kv: dict[str, str] = {}
    past_header = False

    for line in lines:
        stripped = line.strip()
        if not past_header:
            if stripped == "" or stripped.startswith("#"):
                header.append(line)
                continue
            else:
                past_header = True
        # key=value — everything after the FIRST '=' is the value
        if "=" in stripped:
            key, _, value = stripped.partition("=")
            kv[key] = value
        # ignore unparseable lines silently

    return header, kv


def write_lang(path: Path, header: list[str], kv: dict[str, str]) -> None:
    lines = header + [f"{k}={v}" for k, v in kv.items()]
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")

# ── JAR index (built once, reused for all modids) ─────────────────────────────

def build_jar_index(mods_dir: Path) -> dict[str, tuple[Path, str]]:
    """
    Returns modid -> (jar_path, entry_name) for every en_us.lang found in any jar.
    Accepts both en_us.lang and en_US.lang.
    Scans mods_dir recursively to also pick up submods/.
    """
    index: dict[str, tuple[Path, str]] = {}
    pattern = re.compile(r"assets/([^/]+)/lang/en_[uU][sS]\.lang$")

    jars = list(mods_dir.rglob("*.jar"))
    print(f"  Scanning {len(jars)} JARs for en_us.lang entries …")

    for jar_path in jars:
        try:
            with zipfile.ZipFile(jar_path, "r") as zf:
                for name in zf.namelist():
                    m = pattern.match(name)
                    if m:
                        modid = m.group(1)
                        if modid not in index:          # first jar wins
                            index[modid] = (jar_path, name)
        except (zipfile.BadZipFile, OSError):
            pass                                        # skip corrupt/non-zip

    print(f"  Found en_us.lang for {len(index)} modids in JARs.")
    return index


def read_jar_lang(jar_path: Path, entry_name: str) -> dict[str, str]:
    """Read and parse a lang file from inside a jar."""
    with zipfile.ZipFile(jar_path, "r") as zf:
        raw = zf.read(entry_name).decode("utf-8", errors="replace")
    _, kv = parse_lang(raw)
    return kv

# ── Per-file processing ───────────────────────────────────────────────────────

def process_lang_file(
    zh_path: Path,
    jar_index: dict[str, tuple[Path, str]],
) -> dict:
    """
    Process one zh_cn.lang.  Returns a stats dict for the report.
    """
    # modid is the folder two levels above lang/zh_cn.lang
    modid = zh_path.parent.parent.name
    en_path = zh_path.parent / "en_us.lang"

    # Parse zh_cn
    zh_raw = zh_path.read_text(encoding="utf-8", errors="replace")
    header, zh_kv = parse_lang(zh_raw)

    # Lookup official English
    jar_match: Optional[Path] = None
    jar_entry = ""
    official_en: dict[str, str] = {}

    if modid in jar_index:
        jar_match, jar_entry = jar_index[modid]
        official_en = read_jar_lang(jar_match, jar_entry)

    # Decide what to do with existing en_us.lang
    existing_en: dict[str, str] = {}
    backed_up = False

    if en_path.exists():
        bak_path = zh_path.parent / "en_us.lang.bak"
        if not bak_path.exists():          # don't clobber an older backup
            shutil.copy2(en_path, bak_path)
        backed_up = True
        _, existing_en = parse_lang(en_path.read_text(encoding="utf-8", errors="replace"))

    # Build the output key-value map (preserving zh key order)
    out_kv: dict[str, str] = dict(existing_en)   # start from what we have

    filled_from_jar = 0
    left_untranslated = 0

    for key, zh_val in zh_kv.items():
        if key in existing_en:
            # Already translated in the existing en_us — leave it alone
            continue
        if key in official_en:
            out_kv[key] = official_en[key]
            filled_from_jar += 1
        else:
            out_kv[key] = f"__UNTRANSLATED__{zh_val}"
            left_untranslated += 1

    # Re-order so zh key order comes first, then any extra existing keys at end
    ordered: dict[str, str] = {}
    for key in zh_kv:
        ordered[key] = out_kv[key]
    for key in existing_en:
        if key not in ordered:
            ordered[key] = existing_en[key]

    write_lang(en_path, header, ordered)

    return {
        "modid":            modid,
        "zh_path":          zh_path,
        "en_path":          en_path,
        "jar_matched":      jar_match is not None,
        "jar_name":         jar_match.name if jar_match else "",
        "zh_keys":          len(zh_kv),
        "filled_from_jar":  filled_from_jar,
        "untranslated":     left_untranslated,
        "had_existing_en":  backed_up,
    }

# ── Report writing ─────────────────────────────────────────────────────────────

def write_report(results: list[dict]) -> None:
    lines = [
        "# Translation Bootstrap Report — lang files",
        "",
        "Generated by `fill_en_us_lang.py`.",
        "",
        "| modid | source root | jar matched | jar name | zh keys | filled from jar | __UNTRANSLATED__ | had existing en_us |",
        "|---|---|---|---|---|---|---|---|",
    ]

    total_zh = total_filled = total_untrans = 0

    for r in sorted(results, key=lambda x: (-x["untranslated"], x["modid"])):
        root = "oresources" if "oresources" in str(r["zh_path"]) else "resources"
        jar_ok   = "✓" if r["jar_matched"] else "✗"
        had_en   = "yes (backed up)" if r["had_existing_en"] else "no"
        jar_name = r["jar_name"] if r["jar_name"] else "—"

        lines.append(
            f'| `{r["modid"]}` | {root} | {jar_ok} | `{jar_name}` | '
            f'{r["zh_keys"]} | {r["filled_from_jar"]} | {r["untranslated"]} | {had_en} |'
        )
        total_zh       += r["zh_keys"]
        total_filled   += r["filled_from_jar"]
        total_untrans  += r["untranslated"]

    lines += [
        "",
        f"**Totals:** {len(results)} files | {total_zh} zh keys | "
        f"{total_filled} filled from jar | {total_untrans} __UNTRANSLATED__",
    ]

    REPORT_PATH.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"\nReport written to {REPORT_PATH}")

# ── Main ──────────────────────────────────────────────────────────────────────

def main() -> None:
    print("Building JAR index …")
    jar_index = build_jar_index(MODS_DIR)

    # Collect with both case variants, then deduplicate by resolved path
    # (Windows rglob is case-insensitive so both patterns match the same files)
    seen: set[Path] = set()
    zh_files: list[Path] = []
    for root in SEARCH_ROOTS:
        for p in list(root.rglob("zh_cn.lang")) + list(root.rglob("zh_CN.lang")):
            rp = p.resolve()
            if rp not in seen:
                seen.add(rp)
                zh_files.append(p)

    print(f"\nFound {len(zh_files)} zh_cn.lang files to process.\n")

    results: list[dict] = []
    for i, zh_path in enumerate(sorted(zh_files), 1):
        modid = zh_path.parent.parent.name
        print(f"  [{i:3}/{len(zh_files)}] {modid} … ", end="", flush=True)
        r = process_lang_file(zh_path, jar_index)
        tag = f"jar={r['jar_name'][:30]!r}" if r["jar_matched"] else "no jar"
        print(f"filled={r['filled_from_jar']}, untranslated={r['untranslated']}  ({tag})")
        results.append(r)

    write_report(results)
    print("\nDone.")


if __name__ == "__main__":
    main()
