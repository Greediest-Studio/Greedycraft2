#!/usr/bin/env python3
"""
translate_en_us_lang.py  -- Phase 3: Translate __UNTRANSLATED__ entries
Usage: python translate_en_us_lang.py
"""
import re, sys, shutil, unicodedata
from pathlib import Path

# Force UTF-8 stdout so Chinese characters and box-drawing print correctly
if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8', errors='replace')

REPO      = Path(__file__).parent
RESOURCES  = REPO / "minecraft" / "resources"
ORESOURCES = REPO / "minecraft" / "oresources"

MYSTERY_MODIDS = {"da","db","ee","taiga","palebloom","whimcraft","trinity","elementalend"}
THAUM_MODIDS   = {"thaumcraft","thaumicenergistics","thaumicrestoration","thaumictinkerer","thaumicwonders"}
LAST_MODIDS    = {"jaopca","modularmachinery"}
JOURNEY_MODID  = "journey"

ORDINALS = {"壹":"I","贰":"II","叁":"III","肆":"IV","伍":"V",
            "陆":"VI","柒":"VII","捌":"VIII","玖":"IX","拾":"X"}
CATEGORY = {"科技":"Tech","魔法":"Magic","冒险":"Adventure","休闲":"Casual",
            "挑战":"Challenge","里程碑":"Milestone","整合包模式":"Pack Mode","毕业":"Graduation"}

# ─── Glossary (longest-first after sort) ─────────────────────────────────────
_G_BASE = [
    # Chemistry prefixes / compound terms
    ("三氧化二","Trioxide of"),("二氧化","Dioxide"),("氧化","Oxide"),
    ("碳化","Carbide"),("氮化","Nitride"),("氢化","Hydride"),
    ("硫化","Sulfide"),("氟化","Fluoride"),("氯化","Chloride"),
    ("硫酸","Sulfuric Acid"),("盐酸","Hydrochloric Acid"),("硝酸","Nitric Acid"),
    ("高锰酸钾","Potassium Permanganate"),
    # NuclearCraft compound fuels / isotopes
    ("高浓缩氧化钚","Highly Enriched Plutonium Oxide"),
    ("低浓缩氧化铀","Low Enriched Uranium Oxide"),
    ("高浓缩氧化铀","Highly Enriched Uranium Oxide"),
    ("氧化铀","Uranium Oxide"),("氧化钚","Plutonium Oxide"),
    ("六氟化铀","Uranium Hexafluoride"),
    ("高浓缩铀-233","HEU-233"),("高浓缩铀-235","HEU-235"),
    ("低浓缩铀-235","LEU-235"),("低浓缩铀-238","LEU-238"),
    ("高浓缩铀","Highly Enriched Uranium"),("低浓缩铀","Low Enriched Uranium"),
    ("高浓缩钍","Highly Enriched Thorium"),("低浓缩钍","Low Enriched Thorium"),
    ("浓缩铀","Enriched Uranium"),("贫化铀","Depleted Uranium"),("贫铀","Depleted Uranium"),
    ("高浓缩","Highly Enriched"),("低浓缩","Low Enriched"),("超高浓缩","Very Highly Enriched"),
    # NuclearCraft mechanics
    ("热交换器","Heat Exchanger"),("热交换","Heat Exchange"),
    ("冷却剂","Coolant"),("冷却液","Coolant"),("冷却","Cooling"),
    ("燃料棒","Fuel Rod"),("燃料丸","Fuel Pellet"),
    ("燃料组件","Fuel Assembly"),
    ("核废料","Nuclear Waste"),("核燃料","Nuclear Fuel"),
    ("核反应堆","Nuclear Reactor"),("核电站","Nuclear Power Plant"),
    ("裂变","Fission"),("聚变","Fusion"),
    ("辐射污染","Radiation Contamination"),("辐射防护","Radiation Shielding"),
    ("辐射源","Radiation Source"),("放射性","Radioactive"),("辐射","Radioactive"),
    ("熔融盐","Molten Salt"),("石墨","Graphite"),
    ("氧化锆","Zirconia"),("锆合金","Zirconium Alloy"),
    ("锰氧化物","Manganese Oxide"),
    ("不锈钢","Stainless Steel"),("高碳钢","High Carbon Steel"),
    # Isotopes
    ("铀-233","U-233"),("铀-235","U-235"),("铀-238","U-238"),
    ("钚-239","Pu-239"),("钚-241","Pu-241"),
    ("钍-232","Th-232"),("钍-229","Th-229"),
    ("镎-236","Np-236"),("镅-241","Am-241"),("锎-252","Cf-252"),
    # Elements (longer compound forms first, then single-char)
    ("铀","Uranium"),("钚","Plutonium"),("钍","Thorium"),
    ("氙","Xenon"),("钋","Polonium"),("镭","Radium"),
    ("铍","Beryllium"),("硼","Boron"),("锂","Lithium"),
    ("氦","Helium"),("氢","Hydrogen"),("氚","Tritium"),("氘","Deuterium"),
    ("硅","Silicon"),("钠","Sodium"),("铝","Aluminium"),
    ("铜","Copper"),("金","Gold"),("银","Silver"),("铅","Lead"),
    ("锡","Tin"),("钛","Titanium"),("钴","Cobalt"),("镍","Nickel"),
    ("镁","Magnesium"),("锰","Manganese"),("铬","Chromium"),("钒","Vanadium"),
    ("钼","Molybdenum"),("钨","Tungsten"),("铂","Platinum"),("钯","Palladium"),
    ("铑","Rhodium"),("钌","Ruthenium"),("铱","Iridium"),("钇","Yttrium"),
    ("锶","Strontium"),("铯","Cesium"),("铷","Rubidium"),("锌","Zinc"),
    ("锗","Germanium"),("砷","Arsenic"),("硒","Selenium"),("锑","Antimony"),
    ("碲","Tellurium"),("铋","Bismuth"),("汞","Mercury"),("钙","Calcium"),
    ("钾","Potassium"),("磷","Phosphorus"),("硫","Sulfur"),
    ("氟","Fluorine"),("氯","Chlorine"),("溴","Bromine"),("碘","Iodine"),
    ("氮","Nitrogen"),("氧","Oxygen"),("碳","Carbon"),
    ("锆","Zirconium"),("铌","Niobium"),("锝","Technetium"),("铼","Rhenium"),
    ("锇","Osmium"),("铊","Thallium"),("铟","Indium"),
    ("镧","Lanthanum"),("铈","Cerium"),("镨","Praseodymium"),("钕","Neodymium"),
    ("钐","Samarium"),("铕","Europium"),("钆","Gadolinium"),("铽","Terbium"),
    ("镝","Dysprosium"),("钬","Holmium"),("铒","Erbium"),("铥","Thulium"),
    ("镱","Ytterbium"),("镥","Lutetium"),
    # Iron compounds (铁砧 before 铁 to prevent 铁→Iron inside 铁砧)
    ("铁砧","Anvil"),("铁","Iron"),
    # Minecraft vanilla
    ("末影珍珠","Ender Pearl"),("末影之眼","Eye of Ender"),
    ("末影石","End Stone"),("末影人","Enderman"),("末影龙","Ender Dragon"),
    ("末地","The End"),
    ("下界之星","Nether Star"),("下界合金","Netherite"),
    ("下界岩","Netherrack"),("下界","Nether"),
    ("主世界","Overworld"),
    ("魂沙","Soul Sand"),("灵魂沙","Soul Sand"),
    ("凋灵骷髅","Wither Skeleton"),("凋灵","Wither"),
    ("苦力怕","Creeper"),("僵尸猪灵","Zombified Piglin"),("僵尸","Zombie"),
    ("骷髅","Skeleton"),("蜘蛛","Spider"),("史莱姆","Slime"),
    ("岩浆怪","Magma Cube"),("烈焰人","Blaze"),
    ("监守者","Warden"),("远古守卫者","Elder Guardian"),("守卫者","Guardian"),
    ("流浪商人","Wandering Trader"),("村民","Villager"),
    ("铁傀儡","Iron Golem"),("雪傀儡","Snow Golem"),
    ("幻翼","Phantom"),("女巫","Witch"),("溺尸","Drowned"),("尸壳","Husk"),
    ("信标","Beacon"),("弓箭手","Archer"),
    ("粘性活塞","Sticky Piston"),("活塞","Piston"),
    ("红石块","Redstone Block"),("红石矿石","Redstone Ore"),
    ("红石灯","Redstone Lamp"),("红石粉","Redstone Dust"),("红石","Redstone"),
    ("青金石","Lapis Lazuli"),("钻石","Diamond"),("绿宝石","Emerald"),
    ("紫水晶","Amethyst"),("石英","Quartz"),("燧石","Flint"),
    ("骨粉","Bone Meal"),("骨头","Bone"),("骨","Bone"),
    ("皮革","Leather"),("羽毛","Feather"),
    ("工作台","Crafting Table"),("熔炉","Furnace"),
    ("箱子","Chest"),("潜影箱","Shulker Box"),
    ("漏斗","Hopper"),("发射器","Dispenser"),("投掷器","Dropper"),
    ("附魔台","Enchanting Table"),("铁砧","Anvil"),
    # Botania / magic
    ("花瓣","Petal"),("花粉","Pollen"),("花","Flower"),
    ("符文","Rune"),("纹章","Sigil"),("铭文","Inscription"),
    ("灵气","Aura"),("魔力","Mana"),
    # Thaumcraft shared (晶石/法杖 overridden for thaum context)
    ("奥术","Arcane"),("奥法","Arcane"),("炼金","Alchemy"),
    ("傀儡","Golem"),("晶石","Crystal"),("法杖","Staff"),
    # Materials / minerals
    ("矿石","Ore"),("合金","Alloy"),("碎片","Fragment"),
    ("粉末","Powder"),("水晶","Crystal"),("晶体","Crystal"),
    ("宝石","Gem"),("熔岩","Lava"),("岩浆","Lava"),
    ("精华","Essence"),("结晶","Crystallized"),
    # Game verbs / nouns
    ("燃料","Fuel"),("能量","Energy"),("流体","Fluid"),("液体","Liquid"),
    ("气体","Gas"),("固体","Solid"),("物品","Item"),
    ("方块","Block"),("机器","Machine"),("装置","Device"),
    ("工具","Tool"),("武器","Weapon"),("盔甲","Armor"),
    ("头盔","Helmet"),("胸甲","Chestplate"),("护腿","Leggings"),("靴子","Boots"),
    ("剑","Sword"),("斧","Axe"),("镐","Pickaxe"),("铲","Shovel"),("锄","Hoe"),
    ("弓","Bow"),("弩","Crossbow"),("箭矢","Arrow"),("箭","Arrow"),
    ("盾牌","Shield"),("药水","Potion"),("喷溅药水","Splash Potion"),
    ("种子","Seed"),("农作物","Crop"),("植物","Plant"),
    ("树木","Tree"),("原木","Log"),("木板","Planks"),("木材","Wood"),
    ("石头","Stone"),("泥土","Dirt"),("沙子","Sand"),("砾石","Gravel"),
    ("黏土","Clay"),("玻璃","Glass"),("混凝土","Concrete"),
    ("石砖","Stone Bricks"),("砖块","Bricks"),("砖","Brick"),
    ("台阶","Slab"),("楼梯","Stairs"),("地毯","Carpet"),
    ("经验","Experience"),("等级","Level"),("技能","Skill"),("天赋","Talent"),
    ("伤害","Damage"),("速度","Speed"),("力量","Strength"),
    ("防御","Defense"),("抗性","Resistance"),("免疫","Immunity"),
    ("充能","Charge"),("持续","Duration"),("范围","Range"),
    ("死亡","Death"),("生命","Life"),("治愈","Heal"),("复活","Revive"),
    ("激活","Activate"),("使用","Use"),("制作","Craft"),("合成","Craft"),
    ("获得","Obtain"),("升级","Upgrade"),("放置","Place"),("创建","Create"),
    ("生成","Generate"),("消耗","Consume"),("增加","Increase"),
    ("减少","Decrease"),("提升","Enhance"),("完成","Complete"),
    ("开始","Start"),("进入","Enter"),("探索","Explore"),
    ("击败","Defeat"),("收集","Collect"),("建造","Build"),
    ("研究","Research"),("发现","Discover"),("连接","Connect"),
    ("输入","Input"),("输出","Output"),("存储","Storage"),("传输","Transfer"),
    ("高级","Advanced"),("强化","Enhanced"),("精制","Refined"),
    ("浓缩","Enriched"),("枯竭","Depleted"),("熔融","Molten"),
    # Lore / dimension / modifiers
    ("暗影","Shadow"),("虚空","Void"),("混沌","Chaos"),("秩序","Order"),
    ("以太","Aether"),("深渊","Abyss"),("孢子","Spore"),
    ("腐败","Corruption"),("腐蚀","Corrosion"),
    ("古代","Ancient"),("神秘","Mystical"),("神话","Mythical"),
    ("传说","Legendary"),("史诗","Epic"),("稀有","Rare"),
    ("精英","Elite"),("独特","Unique"),("普通","Common"),
    ("血液","Blood"),("灵魂","Soul"),("精神","Spirit"),("魂","Soul"),
    ("鳞片","Scale"),("翅膀","Wing"),("爪","Claw"),
    ("尘埃","Dust"),("灰烬","Ash"),("蒸汽","Steam"),("蒸气","Vapor"),
    ("光明","Light"),("黑暗","Darkness"),("神圣","Divine"),
    ("火焰","Flame"),("冰霜","Frost"),("雷电","Thunder"),
    ("毒素","Toxin"),("毒","Poison"),("爆炸","Explosion"),
    ("吸血","Vampiric"),("冰冻","Freeze"),("燃烧","Burning"),
    ("守护","Guardian"),("猎手","Hunter"),("勇士","Warrior"),
    ("黑曜石","Obsidian"),("萤石","Glowstone"),("荧石","Glowstone"),
    ("海晶石","Prismarine"),("末地石","End Stone"),
    ("砂砾","Gravel"),("沙","Sand"),("土","Dirt"),
    # Single-char suffixes (must be last so they don't eat compound prefixes)
    ("块","Block"),("锭","Ingot"),("粉","Dust"),("板","Plate"),
    ("粒","Nugget"),("晶","Crystal"),
]

# Thaum-specific overrides (prepended for thaum context)
_G_THAUM_OVERRIDES = [
    ("晶石","Vis Crystal"),("法杖","Wand"),("魔法","Vis"),("魔力","Vis"),("灵气","Vis"),
]

# Sort by key length desc (longest-match)
GLOSSARY_BASE  = sorted(_G_BASE, key=lambda x: -len(x[0]))
GLOSSARY_THAUM = sorted(_G_THAUM_OVERRIDES + _G_BASE, key=lambda x: -len(x[0]))

# ─── Translation engine ───────────────────────────────────────────────────────

# Protect these format tokens with placeholders
_TOKEN_RE = re.compile(
    r'(§[0-9a-fklmnorA-FKLMNOR]'       # §x color codes
    r'|%\d+\$[sd]'                       # %1$s style
    r'|%[sd]'                            # %s %d
    r'|\\\n'                             # literal \n escape
    r'|\$\{[^}]+\}'                      # ${varName}
    r'|\{[0-9]+\}'                       # {0} {1}
    r')'
)

def _is_cjk(c: str) -> bool:
    try:
        return unicodedata.category(c) in ('Lo',) and '一' <= c <= '鿿' or \
               '㐀' <= c <= '䶿' or '豈' <= c <= '﫿' or \
               '　' <= c <= '〿'
    except Exception:
        return False

def _has_cjk(s: str) -> bool:
    return any('⺀' <= c <= '鿿' for c in s)

def _protect_tokens(text: str) -> tuple[str, list[str]]:
    tokens: list[str] = []
    def _rep(m: re.Match) -> str:
        idx = len(tokens)
        tokens.append(m.group(0))
        return f"\x00{idx}\x00"
    return _TOKEN_RE.sub(_rep, text), tokens

def _restore_tokens(text: str, tokens: list[str]) -> str:
    def _rep(m: re.Match) -> str:
        return tokens[int(m.group(1))]
    return re.sub(r'\x00(\d+)\x00', _rep, text)

def _apply_gl(text: str, gl: list[tuple[str,str]]) -> str:
    """Longest-first glossary substitution with auto-spacing."""
    out: list[str] = []
    i = 0
    n = len(text)
    while i < n:
        matched = False
        for zh, en in gl:
            L = len(zh)
            if text[i:i+L] == zh:
                # Insert space between adjacent ASCII words
                if out and en:
                    last = out[-1]
                    if last and last[-1].isalpha() and en[0].isalpha():
                        out.append(' ')
                out.append(en)
                i += L
                matched = True
                break
        if not matched:
            c = text[i]
            # If previous char was ASCII letter and this is ASCII letter, no space needed
            out.append(c)
            i += 1
    return ''.join(out)

def _key_hint(key: str) -> str | None:
    """Extract English translation from well-named lang key (fallback)."""
    parts = key.split('.')
    if not parts:
        return None
    # Use last component before terminal .name/.desc/.tooltip
    tail = parts[-1]
    if tail in ('name','desc','tooltip','description','info'):
        if len(parts) < 2:
            return None
        base_part = parts[-2]
    else:
        base_part = tail
    # Remove modid: prefix
    if ':' in base_part:
        base_part = base_part.split(':',1)[1]
    # Try known suffix patterns
    suffix_map = [
        ('_essence','Essence'),('_ingot','Ingot'),('_ore','Ore'),
        ('_block','Block'),('_dust','Dust'),('_nugget','Nugget'),
        ('_plate','Plate'),('_gem','Gem'),('_fragment','Fragment'),
        ('_crystal','Crystal'),('_seed','Seed'),('_crop','Crop'),
        ('_fluid','Fluid'),('_gas','Gas'),('_alloy','Alloy'),
        ('_powder','Powder'),
    ]
    for suf, en_suf in suffix_map:
        if base_part.endswith(suf):
            base = base_part[:-len(suf)]
            base_en = ' '.join(w.capitalize() for w in base.split('_') if w)
            return f"{base_en} {en_suf}" if base_en else en_suf
    return None

def _clean(text: str) -> str:
    # Collapse multiple spaces, strip
    return re.sub(r'  +', ' ', text).strip()

def translate_value(zh_val: str, gl: list[tuple[str,str]], key: str = '') -> tuple[str, bool]:
    """
    Translate a Chinese value.
    Returns (translated_string, had_residual_cjk).
    """
    protected, tokens = _protect_tokens(zh_val)
    translated = _apply_gl(protected, gl)
    result = _restore_tokens(translated, tokens)
    result = _clean(result)
    residual = _has_cjk(result)
    # If residual CJK and we have a key hint, try key hint
    if residual:
        hint = _key_hint(key)
        if hint and not _has_cjk(hint):
            # Count remaining CJK in glossary result vs using hint
            hint_residual = _has_cjk(hint)
            if not hint_residual:
                # Prefer hint only if it looks reasonable (not just 1-2 chars)
                if len(hint.strip()) >= 3:
                    result = hint
                    residual = False
    return result, residual

def translate_chapter_title(raw: str) -> str:
    """Translate chapter title like '【科技·壹】初始科技' → '[Tech·I] Initial Technology'."""
    # Handle simple standalone
    if raw in CATEGORY:
        return CATEGORY[raw]
    # Match bracketed pattern
    m = re.match(r'^【(.+?)(?:·(.+?))?】(.*)$', raw)
    if m:
        cat_zh  = m.group(1)
        ord_zh  = m.group(2)
        rest_zh = (m.group(3) or '').strip()
        cat_en  = CATEGORY.get(cat_zh, cat_zh)
        if ord_zh:
            ord_en = ORDINALS.get(ord_zh, ord_zh)
            prefix = f"[{cat_en}·{ord_en}]"
        else:
            prefix = f"[{cat_en}]"
        if rest_zh:
            rest_en, _ = translate_value(rest_zh, GLOSSARY_BASE)
            return f"{prefix} {rest_en}"
        return prefix
    # Fallback
    result, _ = translate_value(raw, GLOSSARY_BASE)
    return result

# ─── Lang file processing ─────────────────────────────────────────────────────

def parse_lang(path: Path) -> list[tuple[str, str, str]]:
    """Return list of (raw_line, key, value) for each line."""
    lines = path.read_text(encoding='utf-8', errors='replace').splitlines()
    result = []
    for line in lines:
        if '=' in line and not line.startswith('#'):
            k, _, v = line.partition('=')
            result.append((line, k.strip(), v))
        else:
            result.append((line, '', ''))
    return result

def translate_lang_file(en_path: Path, modid: str) -> dict:
    """
    Translate all __UNTRANSLATED__ entries in en_path in-place.
    Returns stats dict.
    """
    gl = GLOSSARY_THAUM if modid in THAUM_MODIDS else GLOSSARY_BASE
    parsed = parse_lang(en_path)
    out_lines = []
    stats = {'total':0,'translated':0,'residual':0,'skipped':0}
    for (raw, key, val) in parsed:
        if val.startswith('__UNTRANSLATED__'):
            zh = val[len('__UNTRANSLATED__'):]
            stats['total'] += 1
            en, had_residual = translate_value(zh, gl, key)
            out_lines.append(f"{key}={en}")
            stats['translated'] += 1
            if had_residual:
                stats['residual'] += 1
        else:
            out_lines.append(raw)
    en_path.write_text('\n'.join(out_lines) + '\n', encoding='utf-8')
    return stats

def collect_mystery(en_path: Path, modid: str) -> list[tuple[str,str,str]]:
    """Return list of (key, zh_val, translated_val) for mystery mod review."""
    gl = GLOSSARY_BASE
    parsed = parse_lang(en_path)
    rows = []
    for (_, key, val) in parsed:
        if val.startswith('__UNTRANSLATED__'):
            zh = val[len('__UNTRANSLATED__'):]
            en, _ = translate_value(zh, gl, key)
            rows.append((key, zh, en))
    return rows

# ─── Validation ───────────────────────────────────────────────────────────────

def validate_lang_pair(en_path: Path, zh_path: Path) -> list[str]:
    """Return list of validation error messages."""
    errors = []
    if not en_path.exists():
        errors.append(f"MISSING: {en_path}")
        return errors
    en_lines = en_path.read_text(encoding='utf-8', errors='replace').splitlines()
    zh_lines = zh_path.read_text(encoding='utf-8', errors='replace').splitlines()
    en_keys = {l.split('=',1)[0].strip() for l in en_lines if '=' in l and not l.startswith('#')}
    zh_keys = {l.split('=',1)[0].strip() for l in zh_lines if '=' in l and not l.startswith('#')}
    for k in sorted(zh_keys - en_keys):
        errors.append(f"KEY_MISSING in en: {k}")
    for line in en_lines:
        stripped = line.lstrip()
        if '__UNTRANSLATED__' in line and not stripped.startswith('#'):
            errors.append(f"STILL_UNTRANSLATED: {line[:120]}")
    return errors

# ─── Chapter SNBT processing ──────────────────────────────────────────────────

def translate_chapter_snbts() -> list[tuple[str, str, str]]:
    """Translate title fields in all chapter.snbt files. Returns [(path, old_title, new_title)]."""
    results = []
    chapter_dir = REPO / "minecraft" / "config" / "ftbquests" / "normal" / "chapters"
    for snbt in sorted(chapter_dir.glob("*/chapter.snbt")):
        text = snbt.read_text(encoding='utf-8', errors='replace')
        m = re.search(r'^(\s*title:\s*)"([^"]*)"', text, re.MULTILINE)
        if not m:
            continue
        raw_title = m.group(2)
        new_title = translate_chapter_title(raw_title)
        results.append((str(snbt.relative_to(REPO)), raw_title, new_title))
    return results

def write_chapter_snbts(chapter_translations: list[tuple[str, str, str]]) -> None:
    chapter_dir = REPO / "minecraft" / "config" / "ftbquests" / "normal" / "chapters"
    for (rel_path, old_title, new_title) in chapter_translations:
        snbt = REPO / rel_path
        text = snbt.read_text(encoding='utf-8', errors='replace')
        new_text = re.sub(
            r'^(\s*title:\s*)"' + re.escape(old_title) + '"',
            lambda m2: m2.group(0).replace('"' + old_title + '"', '"' + new_title + '"'),
            text, count=1, flags=re.MULTILINE
        )
        snbt.write_text(new_text, encoding='utf-8')

# ─── Find all en_us / zh_cn pairs ────────────────────────────────────────────

def find_pairs() -> list[tuple[Path, Path, str]]:
    """Return [(en_path, zh_path, modid)] for resources + oresources."""
    pairs = []
    seen = set()
    for root in [RESOURCES, ORESOURCES]:
        for zh in sorted(root.rglob("zh_cn.lang")) + sorted(root.rglob("zh_CN.lang")):
            rp = zh.resolve()
            if rp in seen:
                continue
            seen.add(rp)
            en = zh.parent / "en_us.lang"
            if not en.exists():
                continue
            # modid = folder two levels up from lang/
            modid = zh.parent.parent.name
            pairs.append((en, zh, modid))
    return pairs

# ─── Edge-case self-test ──────────────────────────────────────────────────────

def run_edge_tests():
    tests = [
        ("合金", GLOSSARY_BASE,  "Alloy"),
        ("金属", GLOSSARY_BASE,  None),
        ("铁砧", GLOSSARY_BASE,  "Anvil"),
        ("方块", GLOSSARY_BASE,  "Block"),
        ("铁块", GLOSSARY_BASE,  "Iron Block"),
    ]
    print("\n--- Edge-case tests ---")
    for (zh, gl, expected) in tests:
        got, residual = translate_value(zh, gl)
        status = "OK" if (expected is None or got == expected) else f"FAIL expected {expected!r}"
        print(f"  {zh!r:12s} -> {got!r:25s} residual={residual}  {status}")
    print()

# ─── Main ─────────────────────────────────────────────────────────────────────

def main():
    run_edge_tests()

    # ── 1. Print chapter titles preview ──────────────────────────────────────
    chapter_translations = translate_chapter_snbts()
    print("--- Chapter title translations (" + str(len(chapter_translations)) + " chapters) ---")
    for (path, old, new) in chapter_translations:
        print(f"  {old!r:35s} → {new!r}")
    print()

    # ── 2. Collect all pairs, classify ───────────────────────────────────────
    pairs = find_pairs()
    normal_pairs  = []
    mystery_pairs = []
    last_pairs    = []
    journey_en = journey_zh = None

    for (en, zh, modid) in pairs:
        if modid == JOURNEY_MODID and RESOURCES in en.parents:
            journey_en, journey_zh = en, zh
            normal_pairs.append((en, zh, modid))
        elif modid in MYSTERY_MODIDS:
            mystery_pairs.append((en, zh, modid))
        elif modid in LAST_MODIDS:
            last_pairs.append((en, zh, modid))
        else:
            normal_pairs.append((en, zh, modid))

    # ── 3. Translate normal mods ──────────────────────────────────────────────
    all_stats: dict[str, dict] = {}
    print(f"--- Translating {len(normal_pairs)} normal lang files ---")
    for (en, zh, modid) in normal_pairs:
        stats = translate_lang_file(en, modid)
        all_stats[str(en.relative_to(REPO))] = stats
        label = f"{modid} ({str(en.relative_to(REPO))})"
        print(f"  {label[:70]:70s}  translated={stats['translated']:5d}  residual={stats['residual']:4d}")

    # ── 4. Copy journey to oresources ────────────────────────────────────────
    if journey_en:
        oresources_journey = ORESOURCES / JOURNEY_MODID / "lang" / "en_us.lang"
        if oresources_journey.exists():
            shutil.copy2(journey_en, oresources_journey)
            print(f"\nCopied journey → {oresources_journey.relative_to(REPO)}")

    # ── 5. Last: jaopca and modularmachinery ──────────────────────────────────
    print(f"\n--- Last batch ({len(last_pairs)} files) ---")
    for (en, zh, modid) in last_pairs:
        stats = translate_lang_file(en, modid)
        all_stats[str(en.relative_to(REPO))] = stats
        print(f"  {modid:30s}  translated={stats['translated']:5d}  residual={stats['residual']:4d}")

    # ── 6. Mystery modids → review file ──────────────────────────────────────
    review_path = RESOURCES / "REVIEW_unknown_modids.md"
    mystery_rows: list[tuple[str, str, str, str]] = []
    for (en, zh, modid) in mystery_pairs:
        rows = collect_mystery(en, modid)
        for (key, zh_val, en_val) in rows:
            mystery_rows.append((modid, key, zh_val, en_val))

    if mystery_rows:
        lines = ["# Mystery Modid Review\n",
                 "These modids are unknown/custom — translations proposed but NOT written to lang files.\n",
                 "Review and copy accepted entries into the respective en_us.lang files.\n\n"]
        cur_modid = None
        for (modid, key, zh_val, en_val) in mystery_rows:
            if modid != cur_modid:
                lines.append(f"\n## {modid}\n\n")
                cur_modid = modid
            lines.append(f"- `{key}`\n  - ZH: `{zh_val}`\n  - EN: `{en_val}`\n")
        review_path.write_text(''.join(lines), encoding='utf-8')
        print(f"\nWrote {len(mystery_rows)} mystery entries → {review_path.relative_to(REPO)}")

    # ── 7. Write chapter SNBTs ────────────────────────────────────────────────
    write_chapter_snbts(chapter_translations)
    print(f"\nWrote {len(chapter_translations)} chapter SNBT titles.")

    # ── 8. Validation ─────────────────────────────────────────────────────────
    print("\n--- Validation ---")
    val_errors: dict[str, list[str]] = {}
    all_val_pairs = normal_pairs + last_pairs
    for (en, zh, modid) in all_val_pairs:
        errs = validate_lang_pair(en, zh)
        if errs:
            val_errors[str(en.relative_to(REPO))] = errs

    if val_errors:
        for path, errs in val_errors.items():
            print(f"  ERRORS in {path}:")
            for e in errs[:5]:
                print(f"    {e}")
            if len(errs) > 5:
                print(f"    ... and {len(errs)-5} more")
    else:
        print("  All en_us.lang files pass validation.")

    # ── 9. Write report ───────────────────────────────────────────────────────
    report_path = REPO / "translation_report_translated.md"
    total_t = sum(s['translated'] for s in all_stats.values())
    total_r = sum(s['residual']   for s in all_stats.values())
    report_lines = [
        "# Translation Report\n\n",
        f"- Files processed: {len(all_stats)}\n",
        f"- Entries translated: {total_t}\n",
        f"- Entries with residual CJK: {total_r}\n",
        f"- Mystery modids (review file): {len(MYSTERY_MODIDS)}\n",
        f"- Validation errors: {sum(len(v) for v in val_errors.values())}\n\n",
        "## Per-file stats\n\n",
        "| File | Translated | Residual CJK |\n",
        "|------|------------|---------------|\n",
    ]
    for path, stats in sorted(all_stats.items(), key=lambda x: -x[1]['residual']):
        report_lines.append(f"| {path} | {stats['translated']} | {stats['residual']} |\n")
    if val_errors:
        report_lines.append("\n## Validation errors\n\n")
        for path, errs in val_errors.items():
            report_lines.append(f"\n### {path}\n\n")
            for e in errs:
                report_lines.append(f"- {e}\n")
    report_path.write_text(''.join(report_lines), encoding='utf-8')
    print(f"\nReport → {report_path.relative_to(REPO)}")
    print(f"Done. {total_t} entries translated, {total_r} with residual CJK.")

if __name__ == '__main__':
    main()
