"""scope_check.py — report __UNTRANSLATED__ and residual CJK counts per en_us.lang"""
import re
from pathlib import Path

CJK = re.compile(r"[一-鿿㐀-䶿]")
MC = Path(r"C:\Users\julian\IdeaProjects\Greedycraft2\minecraft")

roots = [MC / "resources", MC / "oresources"]
summary = []
for root in roots:
    for en_path in sorted(root.rglob("en_us.lang")):
        text = en_path.read_text(encoding="utf-8", errors="replace")
        untrans = text.count("__UNTRANSLATED__")
        kv_lines = [l for l in text.splitlines()
                    if "=" in l and not l.strip().startswith("#")]
        cjk_vals = [l for l in kv_lines if CJK.search(l.partition("=")[2])]
        if untrans > 0 or cjk_vals:
            rel = en_path.relative_to(MC)
            summary.append((str(rel), untrans, len(cjk_vals)))

summary.sort(key=lambda x: -(x[1] + x[2]))
print(f"{'file':<55}  {'UNTRANSLATED':>12}  {'CJK_values':>10}")
print("-" * 83)
for f, u, c in summary:
    print(f"  {f:<53}  {u:>12}  {c:>10}")
print(f"\nFiles needing work: {len(summary)}")
