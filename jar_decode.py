"""
jar_decode.py — Re-fill en_us.lang for target mods using only official jar English.
No translations in this script. Resets each target file to clean __UNTRANSLATED__ state.
"""
import re, zipfile
from pathlib import Path

REPO_ROOT = Path(__file__).parent
MC = REPO_ROOT / "minecraft"
MODS_DIR = MC / "mods"

# (source_root_name, modid)
TARGET_MODS = [
    ("resources",   "betweenlands"),
    ("resources",   "erebus"),
    ("resources",   "travelerstitles"),
    ("oresources",  "enderio"),
]


def parse_lang(text):
    """Returns (header_lines, kv). Skips # comment lines everywhere (not just header)."""
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


def build_jar_index():
    index = {}
    pattern = re.compile(r"assets/([^/]+)/lang/en_[uU][sS]\.lang$")
    jars = list(MODS_DIR.rglob("*.jar"))
    print(f"Scanning {len(jars)} JARs …")
    for jar_path in jars:
        try:
            with zipfile.ZipFile(jar_path) as zf:
                for name in zf.namelist():
                    m = pattern.match(name)
                    if m:
                        modid = m.group(1)
                        if modid not in index:
                            index[modid] = (jar_path, name)
        except Exception:
            pass
    return index


def read_jar_lang(jar_path, entry_name):
    with zipfile.ZipFile(jar_path) as zf:
        raw = zf.read(entry_name).decode("utf-8", errors="replace")
    _, kv = parse_lang(raw)
    return kv


CJK = re.compile(r"[一-鿿㐀-䶿＀-￯]")


def main():
    jar_index = build_jar_index()
    print()

    grand_untrans = 0
    grand_cjk = 0

    for root_name, modid in TARGET_MODS:
        root = MC / root_name
        zh_path = root / modid / "lang" / "zh_cn.lang"
        en_path = root / modid / "lang" / "en_us.lang"

        if not zh_path.exists():
            print(f"  [{modid}/{root_name}] zh_cn.lang not found — skipping")
            continue

        zh_raw = zh_path.read_text(encoding="utf-8", errors="replace")
        header, zh_kv = parse_lang(zh_raw)

        official_en = {}
        jar_label = "no jar"
        if modid in jar_index:
            jar_path, jar_entry = jar_index[modid]
            official_en = read_jar_lang(jar_path, jar_entry)
            jar_label = jar_path.name

        out_kv = {}
        filled = untrans = 0
        for key, zh_val in zh_kv.items():
            if key in official_en:
                out_kv[key] = official_en[key]
                filled += 1
            else:
                out_kv[key] = f"__UNTRANSLATED__{zh_val}"
                untrans += 1

        lines = header + [f"{k}={v}" for k, v in out_kv.items()]
        en_path.write_text("\n".join(lines) + "\n", encoding="utf-8")

        # Residual CJK = values that contain CJK outside of __UNTRANSLATED__ wrapper
        # (should be 0 — all CJK is inside __UNTRANSLATED__)
        cjk_count = sum(
            1 for v in out_kv.values()
            if not v.startswith("__UNTRANSLATED__") and CJK.search(v)
        )

        grand_untrans += untrans
        grand_cjk += cjk_count

        print(
            f"  [{modid}/{root_name}]  jar={jar_label}"
            f"  filled={filled}  __UNTRANSLATED__={untrans}  residual_CJK={cjk_count}"
        )

    print(f"\nTotal __UNTRANSLATED__: {grand_untrans}")
    print(f"Total residual CJK (outside UNTRANSLATED wrapper): {grand_cjk}")


if __name__ == "__main__":
    main()
