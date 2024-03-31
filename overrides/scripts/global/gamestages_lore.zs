/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */ 

#priority 32765

global gameStagesLore as string[][string][string][string] = {
    zh_cn: {
        getting_started: {
            alias: ["初出茅庐"],
            lore: [
                "你已经踏出了冒险的第一步！"
            ],
            unlocks: [
                "各种工具与武器",
                "工作台与木制品"
            ]
        },
        twilight_shield: {
            alias: ["暮色庇护"],
            lore: [
                "再也不用惧怕地狱的炎热了！"
            ],
            unlocks: [
                "可以进入下界"
            ]
        },
        twilight_forest: {
            alias: ["暮色探险家"],
            lore: [
                "欢迎来到暮色森林！"
            ],
            unlocks: [
                "难度有些许提升"
            ]
        },
        nether: {
            alias: ["地心深处"],
            lore: [
                "欢迎来到充满宝藏的炼狱！"
            ],
            unlocks: [
                "Cyclic的各种辅助工具",
                "各种下界专属物品",
                "大量地牢宝藏",
                "怪物现在会拥有更强力的盔甲和武器",
                "可以进入天境"
            ]
        },
        abyssal_conquerer: {
            alias: ["征服深渊"],
            lore: [
                "深渊的巨龙已经被你击败，不过在深渊之下，还有更加令人绝望的领域..."
            ],
            unlocks: [
                "可以迎战凋灵"
            ]
        },
        wither_slayer: {
            alias: ["凋灵杀手"],
            lore: [
                "邪恶的灵魂已被击败，世界终于从凋灵的命运中逃脱...",
                "终末之地的巨龙正在凝视着你的一举一动。"
            ],
            unlocks: [
                "使用下界之星制作的物品",
                "可以制作防凋灵方块",
                "可以制作末影护符"
            ]
        },
        fearless_man: {
            alias: ["勇气可嘉"],
            lore: [
                "在与女武神的较量中，你已经证明了你的实力，你现在可以进入恐惧之地了。"
            ],
            unlocks: [
                "可以进入恐惧之地"
            ]
        },
        ender_charm: {
            alias: ["终末之路"],
            lore: [
                "请做好准备，你即将开启一段不归之旅。"
            ],
            unlocks: [
                "可以进入末地",
                "可以迎战末影龙",
                "击败末影龙后难度会大幅提升，请做好准备。"
            ]
        },
        hardmode: {
            alias: ["困难模式"],
            lore: [
                "千万别以为已经结束了！这刚刚开始……",
                "末影龙体内被诅咒的灵魂已被释放。",
                "在刚才的较量中，他并没有使出全力，因为它得知自己将获得解脱。",
                "巨龙之力影响到了每一个维度，无尽的挑战在等着你..."
            ],
            unlocks: [
                "游戏难度大幅提升",
                "新的生物开始生成",
                "世界各处可以找到新的矿物",
                "龙之研究内容",
                "无尽贪婪内容",
                "额外植物学内容",
                "等价交换内容",
                "怪物现在会拥有更强力的盔甲和武器",
                "可以探索末地的其余部分",
                "地牢里可以开出新的宝物"
            ]
        },
        fusion_matrix: {
            alias: ["聚合之力"],
            lore: [
                "你获得了一种崭新的材料，你相信它有无比强大的潜力。"
            ],
            unlocks: [
                "龙锭，凋灵锭",
                "电子锭",
                "可以召唤困难模式Boss",
                "可以进入梦魇世界"
            ]
        },
        wyvern: {
            alias: ["飞龙在天"],
            lore: [
                "你获得了飞龙核心，仅仅是拿在手上就能感觉到那股力量。"
            ],
            unlocks: [
                "飞龙金属",
                "可以迎战太阳酋长"
            ]
        },
        awakened: {
            alias: ["神龙觉醒"],
            lore: [
                "飞龙核心在巨大的能量下获得了觉醒，激发出了全部的力量。"
            ],
            unlocks: [
                "神龙金属",
                "可以在末地挖掘钛",
                "可以迎战混沌守卫",
                "可以挖掘基岩",
                "创造模式飞行"
            ]
        },
        chaotic_dominator: {
            alias: ["混沌支配者"],
            lore: [
                "这个世界的最后支柱已被你击败，你已经战无不胜了。"
            ],
            unlocks: [
                "死亡金币",
                "可以制作难度调整物品",
                "混沌核心"
            ]
        },
        chaotic: {
            alias: ["混沌之主"],
            lore: [
                "掌握了混沌的力量，你离终点已经不远了。"
            ],
            unlocks: [
                "混沌金属",
                "寰宇锭"
            ]
        },
        wielder_of_infinity: {
            alias: ["§c§o无§e§o尽§a§o支§b§o配§5§o者"],
            lore: [
                "距离成为裁决者只差一步之遥。"
            ],
            unlocks: [
                "无尽装备",
                "创造之魂",
                "彩虹发电机"
            ]
        },
        graduated: {
            alias: ["§6§o毕业生"],
            lore: [
                "很快，真相就会揭晓……"
            ],
            unlocks: [
                "创造模式物品",
                "特别奖励",
                "最后的终端"
            ]
        },
        vethea_breaker: {
            alias: ["梦魇破坏者"],
            lore: [
                "终于逃出了这个牢笼……"
            ],
            unlocks: [
                "或许你可以试试，如何让梦魇世界与主世界连接起来……？"
            ]
        },
        noob_engineer: {
            alias: ["工业菜鸟"],
            lore: [
                "你理解了什么是通量，什么是导管，什么是机器……"
            ],
            unlocks: [
                "热力膨胀(Thermal Expansion)",
                "最基础的科技线内容"
            ]
        },
        novice_engineer: {
            alias: ["工业萌新"],
            lore: [
                "你对工业有了基本的了解。"
            ],
            unlocks: [
                "部分实用附加内容",
                "末影接口(Ender IO)"
            ]
        },
        skilled_engineer: {
            alias: ["工业能手"],
            lore: [
                "你对工业有了更深入的了解，你可以建造一些更复杂的机器了。"
            ],
            unlocks: [
                "铂，铱和末影",
                "部分随意作品内容",
                "大型反应堆",
                "通用机械(Mekanism)"
            ]
        },
        master_engineer: {
            alias: ["工业大佬"],
            lore: [
                "你对工业的了解已经出神入化。"
            ],
            unlocks: [
                "终极通用机械合金和电路板",
                "高级太阳能板",
                "使用者方块",
                "量子采石场"
            ]
        },
        epic_engineer: {
            alias: ["工业专家"],
            lore: [
                "你开始探索物质间的奥秘。"
            ],
            unlocks: [
                "核电工艺，工业先锋！",
                "更高级的发电装置",
                "你开始受到核辐射！",
                "六倍矿，七倍矿"
            ]
        },
        noob_wizard: {
            alias: ["魔法学徒"],
            lore: [
                "你开始发现世界中蕴含着一些不同于“物质”的东西。"
            ],
            unlocks: [
                "星辉魔法内容"
            ]
        },
        novice_wizard: {
            alias: ["初级法师"],
            lore: [
                "随着慢慢的摸索，你终于对魔法有了初步的了解。"
            ],
            unlocks: [
                "神秘锭",
                "血魔法内容",
                "注魔合成",
                "精密奥术装置"
            ]
        },
        skilled_wizard: {
            alias: ["中级法师"],
            lore: [
                "在经历了一系列法术实验后，你对魔法的了解又加深了。"
            ],
            unlocks: [
                "猩红锭",
                "自然灵气内容",
                "自然帷幕"
            ]
        },
        master_wizard: {
            alias: ["高级法师"],
            lore: [
                "伴随着不断的尝试，你对魔法有了更深入的了解。"
            ],
            unlocks: [
                "星辉魔法后期内容",
                "提高注魔合成效率的物品",
                "奥术水晶球"
            ]
        },
        epic_wizard: {
            alias: ["神职法师"],
            lore: [
                "经过无数次的失败与磨难，你终于对魔法有了极其深入的领悟。"
            ],
            unlocks: [
                "虚空金属和元金",
                "神秘时代扩展内容",
                "质能转换核心"
            ]
        },
        descendant_of_the_sun: {
            alias: ["太阳的后裔"],
            lore: [
                "你打破了挡在混沌守卫面前的最后一道屏障！全新的金属生成在了四个世界。"
            ],
            unlocks: [
                "可以挖掘永燃、封晶、苍穹、等离子矿"
            ]
        },
        wand_blueprint: {
            alias: ["法杖蓝图"],
            lore: [
                "解锁了法杖的制作配方。"
            ],
            unlocks: [
                "可以制作并使用匠魂法杖"
            ]
        },
        shuriken_blueprint: {
            alias: ["回旋镖蓝图"],
            lore: [
                "解锁了回旋镖的制作配方。"
            ],
            unlocks: [
                "可以制作并使用匠魂回旋镖"
            ]
        },
        laser_gun_blueprint: {
            alias: ["镭射枪蓝图"],
            lore: [
                "解锁了镭射枪的制作配方。"
            ],
            unlocks: [
                "可以制作并使用匠魂镭射枪"
            ]
        },
        ring_blueprint : {
            alias: ["饰品蓝图"],
            lore: [
                "解锁了匠魂饰品的制作配方。"
            ],
            unlocks: [
                "可以制作戒指",
                "可以制作手套"
            ]
        },
        tinkering_blueprint: {
            alias: ["匠艺蓝图"],
            lore: [
                "解锁了一部分匠魂武器的制作配方。"
            ],
            unlocks: [
                "可以制作战斧",
                "可以制作海盗短弯刀",
                "可以制作东方短弯刀",
                "可以制作爆炸弓"
            ]
        },
        tactic_blueprint: {
            alias: ["战术蓝图"],
            lore: [
                "解锁了一部分匠魂武器的制作配方。"
            ],
            unlocks: [
                "可以制作劈刀",
                "可以制作长剑",
                "可以制作武士刀",
                "可以制作西洋剑"
            ]
        },
        challenger_a: {
            alias: ["挑战者I"],
            lore: [
                "完成一定数量挑战任务的奖励。"
            ],
            unlocks: [
                "可以制作更高级的生物农场",
                "可以制作更高级的神秘农业精华和作物"
            ]
        },
        challenger_b: {
            alias: ["挑战者II"],
            lore: [
                "完成一定数量挑战任务的奖励。"
            ],
            unlocks: [
                "可以制作更高级的生物农场",
                "可以制作更高级的神秘农业精华和作物"
            ]
        },
        challenger_c: {
            alias: ["挑战者III"],
            lore: [
                "完成一定数量挑战任务的奖励。"
            ],
            unlocks: [
                "可以制作更高级的生物农场",
                "可以制作更高级的神秘农业精华和作物"
            ]
        },
        challenger_d: {
            alias: ["挑战者IV"],
            lore: [
                "完成一定数量挑战任务的奖励。"
            ],
            unlocks: [
                "可以制作更高级的生物农场",
                "可以制作更高级的神秘农业精华和作物"
            ]
        },
        challenger_e: {
            alias: ["挑战者V"],
            lore: [
                "完成一定数量挑战任务的奖励。"
            ],
            unlocks: [
                "可以制作更高级的生物农场",
                "可以制作更高级的神秘农业精华和作物"
            ]
        },
        challenger_f: {
            alias: ["挑战者VI"],
            lore: [
                "完成一定数量挑战任务的奖励。"
            ],
            unlocks: [
                "可以制作更高级的生物农场",
                "可以制作更高级的神秘农业精华和作物"
            ]
        },
        challenger_g: {
            alias: ["挑战者VII"],
            lore: [
                "完成一定数量挑战任务的奖励。"
            ],
            unlocks: [
                "可以制作更高级的生物农场",
                "可以制作更高级的神秘农业精华和作物"
            ]
        },
        challenger_all: {
            alias: ["挑战者VIII"],
            lore: [
                "完成一定数量挑战任务的奖励。"
            ],
            unlocks: [
                "这个...敬请期待！"
            ]
        },
        super_hardmode: {
            alias: ["超级困难模式！"],
            lore: [
                "你不是想要挑战么？这就是！"
            ],
            unlocks: [
                "难度直接拉满！"
            ]
        },
        energy_matter_core: {
            alias: ["质量即能量！"],
            lore: [
                "你终于学会了将物质进行转换的方法。"
            ],
            unlocks: [
                "物品现在会显示EMC值",
                "解锁更高级的转化桌",
                "可以将物品转化为EMC"
            ]
        },
        gatekeeper: {
            alias: ["践踏守门者"],
            lore: [
                "表层深渊，征服！"
            ],
            unlocks: [
                "可以进入深暗领域等中层深渊维度",
                "更多的……掉san的生物！",
                "更加疯狂！"
            ]
        },
        gaia_deleter: {
            alias: ["盖亚删除者"],
            lore: [
                "大地之母已被击败，接下来……"
            ],
            unlocks: [
                "可以进入精灵国度",
                "四级符文！"
            ]
        },
        storm_breaker: {
            alias: ["风暴平息"],
            lore: [
                "来自传说的巨型野兽被击败……"
            ],
            unlocks: [
                "可以制作风暴核心"
            ]
        },
        stormy: {
            alias: ["风暴之力"],
            lore: [
                "寰宇之下，万物之上"
            ],
            unlocks: [
                "可以制作寰宇锭"
            ]
        },
        cosmic: {
            alias: ["寰宇支配者"],
            lore: [
                "或许曾经它是终点，可现在它微不足道。"
            ],
            unlocks: [
                "新的矿物已经生成",
                "更多的拓展内容",
                "难度增加",
                "史诗级支线！"
            ]
        },
        balanced_matrix: {
            alias: ["趋于平衡"],
            lore: [
                "更加强大，更加复杂的……金属。"
            ],
            unlocks: [
                "可以前往秩序之地",
                "难度飙升"
            ]
        },
        betweenland_traveller: {
            alias: ["交错旅行家"],
            lore: [
                "你终于明白了那沼泽中祭坛的真正意义。"
            ],
            unlocks: [
                "可以前往交错次元",
                "可以挑战交错次元的BOSS",
                "可以制作匠魂的交错系列装备",
                "新的状态属性——残蚀值！"
            ]
        },
        warped: {
            alias: ["心灵扭曲"],
            lore: [
                "扭曲遗址，中层深渊最后的防线。"
            ],
            unlocks: [
                "可以进入扭曲遗址",
                "可以制作强大的外神金属",
                "交错钢锭！"
            ]
        },
        order: {
            alias: ["遵守秩序"],
            lore: [
                "混沌的尽头便是秩序？"
            ],
            unlocks: [
                "来自终焉的呼唤已经收到"
            ]
        },
        final: {
            alias: ["终焉之光"],
            lore: [
                "当然，距离结束……还有一段距离。"
            ],
            unlocks: [
                "冰与火之歌系列物品",
                "难度增加",
                "龙之研究高级内容"
            ]
        }
    },
    en_us: {
        getting_started: {
            alias: ["Now It Begins..."],
            lore: [
                "You have made your first step into the adventure!"
            ],
            unlocks: [
                "Various tools and weapons",
                "Crafting table and wooden stuff"
            ]
        },
        twilight_shield: {
            alias: ["No Longer Afraid of Hell!"],
            lore: [
                "You can now stand the heat in the Nether."
            ],
            unlocks: [
                "Access to the Nether"
            ]
        },
        twilight_forest: {
            alias: ["Twilight Explorer"],
            lore: [
                "Welcome to Twilight Forest!"
            ],
            unlocks: [
                "Difficulty is slightly increased"
            ]
        },
        nether: {
            alias: ["Journey to Hell"],
            lore: [
                "Welcome to hell! Challenges and treasures await."
            ],
            unlocks: [
                "Stuff from Cyclic mod which can be very helpful",
                "Bunch of Nether exclusive items",
                "Bunch of dungeon loot you may have got before",
                "Mobs now wear stronger armors and hold stronger weapons",
                "Access to the Aether",
                "Allows summoning of little maids who can aid you in many ways"
            ]
        },
        abyssal_conquerer: {
            alias: ["Conquerer of the Abyss"],
            lore: [
                "The dragon in the abyss has been defeated. You hear dreads echo under your feet."
            ],
            unlocks: [
                "You can now fight the Wither"
            ]
        },
        wither_slayer: {
            alias: ["Purifier of the World"],
            lore: [
                "The evil soul has been defeated and the world has finally been freed from the destiny of withering...",
                "A mighty presence in the End is watching you."
            ],
            unlocks: [
                "Items that uses Nether Star as ingredient",
                "Wither-proof blocks",
                "Ender Charm can be crafted"
            ]
        },
        fearless_man: {
            alias: ["Bravery Matters"],
            lore: [
                "You have proved yourself in the battle with Valkyrie. Now you can go to the Dreadlands."
            ],
            unlocks: [
                "Access to the Dreadlands"
            ]
        },
        ender_charm: {
            alias: ["The End of the Road"],
            lore: [
                "Be prepared, you are going to begin a journey that has no return."
            ],
            unlocks: [
                "Access to the End",
                "You can now challenge the Ender Dragon",
                "Be prepared because difficulty will greatly increase after defeating Ender Dragon"
            ]
        },
        hardmode: {
            alias: ["As Hard as It Seems"],
            lore: [
                "The cursed soul within the dragon has been unleashed.",
                "In that battle, the dragon didn't use its full power because it knows that it will be freed.",
                "The draconic force spreads to every dimension, bringing the world with strong opponents and ways to eliminate them."
            ],
            unlocks: [
                "Difficulty comes to a whole new level",
                "New mobs begin to spawn",
                "New ores can be found across every dimension",
                "Draconic Evolution content",
                "Avaritia content",
                "Extra Botany content",
                "ProjectE (Equivalent Exchange) content",
                "Mobs now wear stronger armors and hold stronger weapons",
                "You can now explore the outer islands of the End.",
                "New treasures can be found in dungeon loot"
            ]
        },
        fusion_matrix: {
            alias: ["Power of Fusion"],
            lore: [
                "You have obtained a new type of material which you believe to have very strong potential."
            ],
            unlocks: [
                "Draconium",
                "Electronium",
                "Hardmode Bosses can be summoned",
                "Ready to challenge Frostmaw"
            ]
        },
        wyvern: {
            alias: ["Dragon but With Less Legs"],
            lore: [
                "You have obtained the Wyvern Core. You can feel the power even by just holding it."
            ],
            unlocks: [
                "Wyvern Metal",
                "You can now challenge Barako, the Sun Chief"
            ]
        },
        awakened: {
            alias: ["The Dragon Awakens"],
            lore: [
                "The Wyvern Core has awakened under excessive energy and activated its full power."
            ],
            unlocks: [
                "Draconic Metal",
                "You can now mine Titanium in the End",
                "Chaos Guardian is ready to be challenged",
                "Bedrock can be mined with a proper tool",
                "Creative flight can be enabled with proper gear"
            ]
        },
        chaotic_dominator: {
            alias: ["Dominator of Entropy"],
            lore: [
                "The guardian of Chaos has been defeated and you are pretty much invincible now."
            ],
            unlocks: [
                "Death Coin",
                "Difficulty changers can now be crafted",
                "Chaotic Core"
            ]
        },
        chaotic: {
            alias: ["Lord of the Chaos"],
            lore: [
                "You are close to the finish line by possessing the Force of Chaos."
            ],
            unlocks: [
                "Chaotic Metal",
                "Cosmilite",
                "Infinity Catalyst"
            ]
        },
        wielder_of_infinity: {
            alias: ["§c§oDomi§e§onator §a§oof §b§oInfi§5§onity"],
            lore: [
                "You are getting really close to becoming an executor."
            ],
            unlocks: [
                "Infinity Armors and Tools",
                "Creative Soul",
                "Rainbow Generator"
            ]
        },
        graduated: {
            alias: ["§6§oThe Truth Awaits"],
            lore: [
                "The executor has been chosen. What choice will they make?"
            ],
            unlocks: [
                "Creative mode exclusive items",
                "Special Reward",
                "The Executor Terminal"
            ]
        },
        novice_engineer: {
            alias: ["Tech Newbie"],
            lore: [
                "You have gained some basic understandings to technology."
            ],
            unlocks: [
                "Some Actually Additions content",
                "Ender IO"
            ]
        },
        skilled_engineer: {
            alias: ["Tech Expert"],
            lore: [
                "You have gained more understandings to technology and can build some complicated machines now."
            ],
            unlocks: [
                "Platinum, Iridium and Enderium",
                "Some Random Things content",
                "Extreme Reactors",
                "Mekanism"
            ]
        },
        master_engineer: {
            alias: ["Tech Master"],
            lore: [
                "You have goals on tech that is beyond the understandings of normal folks."
            ],
            unlocks: [
                "Ultimate mekanism alloy & circuit",
                "Advanced solar panels",
                "User blocks",
                "Quantum quarries"
            ]
        },
        novice_wizard: {
            alias: ["Apprentice"],
            lore: [
                "You have gained basic knowledge about magic."
            ],
            unlocks: [
                "Thaumium",
                "Blood Magic content",
                "Infusion crafting",
                "Complex thaumcraft mechanism"
            ]
        },
        skilled_wizard: {
            alias: ["Archmage"],
            lore: [
                "You have understood magic further through hard work."
            ],
            unlocks: [
                "Crimsonite",
                "Rest of Astral Sorcery content",
                "Infusion crafting boosters",
                "Arcane Crystal Ball"
            ]
        },
        master_wizard: {
            alias: ["Master Mage"],
            lore: [
                "You have finally gained a deep understanding of magic through millions of failures."
            ],
            unlocks: [
                "Void Metal and Primordial",
                "Extended Thaumcraft content",
                "Energy-Matter Conversion Core"
            ]
        },
        descendant_of_the_sun: {
            alias: ["Conquer the Sun!"],
            lore: [
                "You have defeated Barako, the Sun Chief. A hot metal has spawned in Nether."
            ],
            unlocks: [
                "You can now mine Infernium"
            ]
        },
        wand_blueprint: {
            alias: ["Sceptre Blueprint"],
            lore: [
                " Unlocked recipe for Sceptre."
            ],
            unlocks: [
                "You can now craft and use Tinker's tool: Sceptre"
            ]
        },
        shuriken_blueprint: {
            alias: ["Shuriken Blueprint"],
            lore: [
                " Unlocked recipe for Shuriken."
            ],
            unlocks: [
                "You can now craft and use Tinker's tool: Shuriken"
            ]
        },
        laser_gun_blueprint: {
            alias: ["Laser Gun Blueprint"],
            lore: [
                " Unlocked recipe for Laser Guns."
            ],
            unlocks: [
                "You can now craft and use Tinker's tool: Laser Gun"
            ]
        },
        tactic_blueprint: {
            alias: ["Tactical Blueprint"],
            lore: [
                " Unlocked recipe for a lot of Tinker's weapons."
            ],
            unlocks: [
                "You can now craft and use Cleaver",
                "You can now craft and use Longsword",
                "You can now craft and use Rapier",
                "You can now craft and use Katana"
            ]
        },
        challenger_a: {
            alias: ["Challenger I"],
            lore: [
                "Rewarded for completing a set amount of challenge quests."
            ],
            unlocks: [
                "Allows to make higher tiers of tiny mob farm",
                "Allows to make higher tiers of crops and essence in mystical agriculture"
            ]
        },
        challenger_b: {
            alias: ["Challenger II"],
            lore: [
                "Rewarded for completing a set amount of challenge quests."
            ],
            unlocks: [
                "Allows to make higher tiers of tiny mob farm",
                "Allows to make higher tiers of crops and essence in mystical agriculture"
            ]
        },
        challenger_c: {
            alias: ["Challenger III"],
            lore: [
                "Rewarded for completing a set amount of challenge quests."
            ],
            unlocks: [
                "Allows to make higher tiers of tiny mob farm",
                "Allows to make higher tiers of crops and essence in mystical agriculture"
            ]
        },
        challenger_d: {
            alias: ["Challenger IV"],
            lore: [
                "Rewarded for completing a set amount of challenge quests."
            ],
            unlocks: [
                "Allows to make higher tiers of tiny mob farm",
                "Allows to make higher tiers of crops and essence in mystical agriculture"
            ]
        },
        challenger_e: {
            alias: ["Challenger V"],
            lore: [
                "Rewarded for completing a set amount of challenge quests."
            ],
            unlocks: [
                "Allows to make higher tiers of tiny mob farm",
                "Allows to make higher tiers of crops and essence in mystical agriculture"
            ]
        },
        challenger_f: {
            alias: ["Challenger VI"],
            lore: [
                "Rewarded for completing a set amount of challenge quests."
            ],
            unlocks: [
                "Allows to make higher tiers of tiny mob farm",
                "Allows to make higher tiers of crops and essence in mystical agriculture"
            ]
        },
        challenger_g: {
            alias: ["Challenger VII"],
            lore: [
                "Rewarded for completing a set amount of challenge quests."
            ],
            unlocks: [
                "Allows to make higher tiers of tiny mob farm",
                "Allows to make higher tiers of crops and essence in mystical agriculture"
            ]
        },
        challenger_all: {
            alias: ["Challenger VIII"],
            lore: [
                "Rewarded for completing a set amount of challenge quests."
            ],
            unlocks: [
                "...Coming soon I guess?"
            ]
        },
        super_hardmode: {
            alias: ["Feel the pain!"],
            lore: [
                "You asked for challenge, here it is!"
            ],
            unlocks: [
                "Maxed out difficulty!"
            ]
        },
        energy_matter_core: {
            alias: ["Mass is Energy!"],
            lore: [
                "You have finally learned how to convert between matter and energy."
            ],
            unlocks: [
                "Items now display EMC values",
                "Unlocks advanced transmutation devices",
                "Allows conversion between items and EMC"
            ]
        }
    }
};
