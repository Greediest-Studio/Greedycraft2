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
            alias: ["下界深处"],
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
            alias: ["万物聚合"],
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
            alias: ["支配混沌"],
            lore: [
                "末地的混沌之物已被你击败，你已经战无不胜了。"
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
                "你已经掌握了混沌的力量。"
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
            alias: ["美梦再临"],
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
                "六倍矿，八倍矿"
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
        quardstate: {
            alias: ["四相破除"],
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
        challenger_h: {
            alias: ["挑战者VIII"],
            lore: [
                "完成一定数量挑战任务的奖励。"
            ],
            unlocks: [
                "可以制作更高级的生物农场",
                "可以制作更高级的神秘农业精华和作物"
            ]
        },
        challenger_i: {
            alias: ["挑战者IX"],
            lore: [
                "完成一定数量挑战任务的奖励。"
            ],
            unlocks: [
                "可以制作更高级的生物农场",
                "可以制作更高级的神秘农业精华和作物"
            ]
        },
        challenger_all: {
            alias: ["挑战者之桂冠"],
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
            alias: ["质能守恒"],
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
            alias: ["深渊门户"],
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
            alias: ["盖亚肃清"],
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
            alias: ["凌驾寰宇"],
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
            alias: ["交错旅者"],
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
    }
};
