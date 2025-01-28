/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */

#priority 32767

// Server side translations
global serverTranslations as string[string][string] = {
    zh_cn: {
        "greedycraft.zensummoning.barako.fail.1": "§c召唤失败。周围的地形不够开阔。\n§c你需要周围有至少15*15格的平坦开阔空间。\n§c高草等可以穿过的方块同样也会影响召唤。\n§6可以尝试使用Prefab的§e结构部件§6搭建平台。",
        "greedycraft.zensummoning.barako.fail.2": "§c召唤失败。周围的地板不够平整。\n§c你需要周围有至少15*15格的平坦开阔空间。\n§c这条消息表明祭坛上方有足够的空气，但是祭坛所处的平台大小不够或有缺口。\n§6可以尝试使用Prefab的§e结构部件§6搭建平台。",
        "greedycraft.zensummoning.barako.fail.3": "§c雨水会削弱太阳酋长的能力，现在他不愿回应你的召唤！\n§6等到晴天再试试！",
        "greedycraft.zensummoning.barako.fail.4": "§c太阳酋长无法在夜间发挥他的能力，现在他不愿回应你的召唤！\n§6等到白天再试试！",
        "greedycraft.zensummoning.barako.fail.5": "§c你只能在主世界召唤太阳酋长！",
        "greedycraft.zensummoning.barako.success": "§6太阳酋长 §5§o已苏醒！",
        "greedycraft.zensummoning.frostmaw.fail.1": "§c召唤失败。周围的地形不够开阔。\n§c你需要周围有至少15*15格的平坦开阔空间。\n§c高草等可以穿过的方块同样也会影响召唤。\n§6可以尝试使用Prefab的§e结构部件§6搭建平台。",
        "greedycraft.zensummoning.frostmaw.fail.2": "§c召唤失败。周围的地板不够平整。\n§c你需要周围有至少15*15格的平坦开阔空间。\n§cc这条消息表明祭坛上方有足够的空气，但是祭坛所处的平台大小不够或有缺口。\n§6可以尝试使用Prefab的§e结构部件§6搭建平台。",
        "greedycraft.zensummoning.frostmaw.fail.3": "§c冰霜巨口不愿回应你的召唤，你所在的地点太热了。它只在寒冷的生物群系下雪时出没！",
        "greedycraft.zensummoning.frostmaw.fail.4": "§c冰霜巨口不愿回应你的召唤，现在的天气过于晴朗。它只在寒冷的生物群系下雪时出没！",
        "greedycraft.zensummoning.frostmaw.fail.5": "§c你只能在主世界召唤冰霜巨口！",
        "greedycraft.zensummoning.frostmaw.success": "§b冰霜巨口 §5§o已苏醒！",

        "greedycraft.zensummoning.zethur.fail.1": "§c召唤失败。周围的地形不够开阔。\n§c你需要周围有至少15*15格的平坦开阔空间。\n§c高草等可以穿过的方块同样也会影响召唤。\n§6可以尝试使用Prefab的§e结构部件§6搭建平台。",
        "greedycraft.zensummoning.zethur.fail.2": "§c召唤失败。周围的地板不够平整。\n§c你需要周围有至少15*15格的平坦开阔空间。\n§cc这条消息表明祭坛上方有足够的空气，但是祭坛所处的平台大小不够或有缺口。\n§6可以尝试使用Prefab的§e结构部件§6搭建平台。",
        "greedycraft.zensummoning.zethur.fail.4": "§c西风雷鸣云无法被凝聚……现在的天气过于晴朗。它只在下雨天时出没！",
        "greedycraft.zensummoning.zethur.fail.5": "§c你只能在天境召唤西风雷鸣云！",
        "greedycraft.zensummoning.zethur.success": "§9西风雷鸣云 §5§o已苏醒！",

        "greedycraft.zensummoning.beholder.fail.1": "§c召唤失败。周围的地形不够开阔。\n§c你需要周围有至少15*15格的平坦开阔空间。\n§c高草等可以穿过的方块同样也会影响召唤。\n§6可以尝试使用Prefab的§e结构部件§6搭建平台。",
        "greedycraft.zensummoning.beholder.fail.2": "§c召唤失败。周围的地板不够平整。\n§c你需要周围有至少15*15格的平坦开阔空间。\n§cc这条消息表明祭坛上方有足够的空气，但是祭坛所处的平台大小不够或有缺口。\n§6可以尝试使用Prefab的§e结构部件§6搭建平台。",
        "greedycraft.zensummoning.beholder.fail.5": "§c你只能在冰晶雪原召唤天气之眼！",
        "greedycraft.zensummoning.beholder.success": "§a天气之眼 §5§o已苏醒！",

        "greedycraft.zensummoning.ghasther.fail.1": "§c召唤失败。周围的地形不够开阔。\n§c你需要周围有至少15*15格的平坦开阔空间。\n§c高草等可以穿过的方块同样也会影响召唤。\n§6可以尝试使用Prefab的§e结构部件§6搭建平台。",
        "greedycraft.zensummoning.ghasther.fail.2": "§c召唤失败。周围的地板不够平整。\n§c你需要周围有至少15*15格的平坦开阔空间。\n§cc这条消息表明祭坛上方有足够的空气，但是祭坛所处的平台大小不够或有缺口。\n§6可以尝试使用Prefab的§e结构部件§6搭建平台。",
        "greedycraft.zensummoning.ghasther.fail.5": "§c你只能在下界召唤恶魂女王！",
        "greedycraft.zensummoning.ghasther.success": "§4恶魂女王 §5§o已苏醒！",

        "greedycraft.zensummoning.end.fail.1": "§c召唤失败。周围的地形不够开阔。\n§c你需要周围有至少15*15格的平坦开阔空间。\n§c高草等可以穿过的方块同样也会影响召唤。\n§6可以尝试使用Prefab的§e结构部件§6搭建平台。",
        "greedycraft.zensummoning.end.fail.2": "§c召唤失败。周围的地板不够平整。\n§c你需要周围有至少15*15格的平坦开阔空间。\n§cc这条消息表明祭坛上方有足够的空气，但是祭坛所处的平台大小不够或有缺口。\n§6可以尝试使用Prefab的§e结构部件§6搭建平台。",
        "greedycraft.zensummoning.end.fail.5": "§c你只能在末地召唤巴克莱！",
        "greedycraft.zensummoning.end.success": "§5末地术士巴克莱 §5§o已苏醒！",

        "greedycraft.zensummoning.kraken.fail.1": "§c召唤失败。周围的地形不够开阔。\n§c你需要周围有至少15*15格的水域空间。",
        "greedycraft.zensummoning.kraken.fail.2": "§c召唤失败。周围的地板不够平整。\n§c你需要周围有至少15*15格的平坦开阔空间。\n§cc这条消息表明祭坛上方有足够的空气，但是祭坛所处的平台大小不够或有缺口。\n§6可以尝试使用Prefab的§e结构部件§6搭建平台。",
        "greedycraft.zensummoning.kraken.fail.3": "§c克拉肯无法回应你的召唤，这里太浅了，至少要在海平面下方15格才能召唤克拉肯！",
        "greedycraft.zensummoning.kraken.fail.5": "§c你只能在主世界召唤克拉肯！",
        "greedycraft.zensummoning.kraken.success": "§1克拉肯 §5§o已苏醒！",

        "greedycraft.zensummoning.ironslime.fail.1": "§c召唤失败。周围的地形不够开阔。\n§c你需要周围有至少15*15格的平坦开阔空间。\n§c高草等可以穿过的方块同样也会影响召唤。\n§6可以尝试使用Prefab的§e结构部件§6搭建平台。",
        "greedycraft.zensummoning.ironslime.fail.2": "§c召唤失败。周围的地板不够平整。\n§c你需要周围有至少15*15格的平坦开阔空间。\n§cc这条消息表明祭坛上方有足够的空气，但是祭坛所处的平台大小不够或有缺口。\n§6可以尝试使用Prefab的§e结构部件§6搭建平台。",
        "greedycraft.zensummoning.ironslime.fail.5": "§c你只能在末地召唤钢铁史莱姆王！",
        "greedycraft.zensummoning.ironslime.success": "§b钢铁史莱姆王 §5§o已苏醒！",

        "greedycraft.zensummoning.alchemist.fail.1": "§c召唤失败。周围的地形不够开阔。\n§c你需要周围有至少15*15格的平坦开阔空间。\n§c高草等可以穿过的方块同样也会影响召唤。\n§6可以尝试使用Prefab的§e结构部件§6搭建平台。",
        "greedycraft.zensummoning.alchemist.fail.2": "§c召唤失败。周围的地板不够平整。\n§c你需要周围有至少15*15格的平坦开阔空间。\n§cc这条消息表明祭坛上方有足够的空气，但是祭坛所处的平台大小不够或有缺口。\n§6可以尝试使用Prefab的§e结构部件§6搭建平台。",
        "greedycraft.zensummoning.alchemist.fail.5": "§c你只能在恒晓之地召唤炼金术士！",
        "greedycraft.zensummoning.alchemist.success": "§c炼金术士 §5§o已苏醒！",

        "greedycraft.zensummoning.summoner.fail.1": "§c召唤失败。周围的地形不够开阔。\n§c你需要周围有至少15*15格的平坦开阔空间。\n§c高草等可以穿过的方块同样也会影响召唤。\n§6可以尝试使用Prefab的§e结构部件§6搭建平台。",
        "greedycraft.zensummoning.summoner.fail.2": "§c召唤失败。周围的地板不够平整。\n§c你需要周围有至少15*15格的平坦开阔空间。\n§cc这条消息表明祭坛上方有足够的空气，但是祭坛所处的平台大小不够或有缺口。\n§6可以尝试使用Prefab的§e结构部件§6搭建平台。",
        "greedycraft.zensummoning.summoner.fail.5": "§c你只能在永昼之地召唤召唤术士！",
        "greedycraft.zensummoning.summoner.success": "§b召唤术士 §5§o已苏醒！",

        "greedycraft.zensummoning.tcreopargh.fail.1": "§c你只能在下界召唤§c§kTCreopargh§r§c。",
        "greedycraft.zensummoning.tcreopargh.fail.2": "§c无法召唤§c§kTCreopargh§r§c。周围的地形不够开阔。",
        "greedycraft.zensummoning.tcreopargh.fail.3": "§c无法召唤§c§kTCreopargh§r§c。周围的地形不够平坦。",
        "greedycraft.zensummoning.tcreopargh.minion.name": "TCreopargh的侍从",
        "greedycraft.zensummoning.tcreopargh.name": "TCreopargh的冤魂",
        "greedycraft.zensummoning.tcreopargh.success": "§cTCreopargh §5§o已苏醒！",
        "greedycraft.scoreboard.creative_mode": "§d§l创造模式",
        "greedycraft.scoreboard.cheat_mode": "§c§l作弊模式",
        "greedycraft.scoreboard.true_hero": "§e%s§6§l，永远的神！",
        "greedycraft.scoreboard.title": "§b§l贪婪整合包§r §6v%s",
        "greedycraft.scoreboard.mode.adventure": "§9游戏模式：§6冒险",
        "greedycraft.scoreboard.mode.casual": "§9游戏模式：§a休闲",
        "greedycraft.scoreboard.mode.expert": "§9游戏模式：§c专家",
        "greedycraft.scoreboard.author": "原作：§dTCreopargh",
        "greedycraft.scoreboard.author2": "改进：§dGreediest工作室",
        "greedycraft.stage.unfamiliar.name": "§5§ka§r §d未知物品 §5§ka§r",
        "greedycraft.stage.wither_skull.name": "§c无法直视的头颅",
        "greedycraft.stage.disabled_item.name": "§4已禁用的物品",
        "greedycraft.omnipedia.name": "§d§ka§r §b百科全书 §d§ka§r",
        "greedycraft.omnipedia.tooltip": "§a§o好好看书了吗？",
        "greedycraft.omnipedia.version": "§6第%s版",
        "greedycraft.misc.badluckpotion.name": "§8非酋药剂",
        "greedycraft.misc.badluckpotion.tooltip": "§9今天出货率真高啊！",
        "greedycraft.misc.blight_potion.name": "§8§l枯萎药剂",
        "greedycraft.misc.blight_potion.tooltip": "§d蕴含了世间枯萎力量的药剂",
        "greedycraft.misc.bug_stone.name": "§c错误之石",
        "greedycraft.misc.bug_stone.tooltip.1": "§e如果你得到了这个，证明你发现了一个BUG！",
        "greedycraft.misc.bug_stone.tooltip.2": "§e如果是这种情况，请将其汇报给作者！",
        "greedycraft.misc.draconic_potion.name": "§5§l巨龙药剂",
        "greedycraft.misc.draconic_potion.tooltip": "§d蕴含了世间强大力量的药剂",
        "greedycraft.misc.flyingpotion.name": "§6羽化登仙药剂",
        "greedycraft.misc.flyingpotion.tooltip": "§b你咋不上天呢？",
        "greedycraft.misc.head": "§b的头",
        "greedycraft.misc.knockbackwand.name": "§b击退之杖",
        "greedycraft.misc.knockbackwand.tooltip": "§d§o你不要过来啊！！！",
        "greedycraft.misc.lightspeedpotion.name": "§b§o卡其脱离太",
        "greedycraft.misc.lightspeedpotion.tooltip": "§a感受疾风吧！",
        "greedycraft.misc.spawn_egg=§b的刷怪蛋tion.name": "§b§oDeja Vu",
        "greedycraft.misc.lightspeedpotion.tooltip": "§aFeel the speed!",
        "greedycraft.misc.spawn_egg": "§b's spawn egg",
        "tile.greedycraft-sorrowium_ore.name": "殇魂矿石"
    }
};
