#priority 7
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import mods.eventtweaker.Minecraft;

var Tooltipitem as string[IItemStack] = {
    <contenttweaker:laurus> : "每隔10秒获得一层充能，每层充能可以阻止一次生命值损失，至多获得2层充能",
    <contenttweaker:empty_heart> : "减少50%生命上限，增加60%回复",
    <contenttweaker:giant_hand> : "对生命值上限大于100的单位造成额外25%伤害",
    <contenttweaker:third_mana_eye> : "魔力工具消耗魔力减免20%，增加魔法伤害",
    <contenttweaker:bauble_god_eye> : "给予邪神的注视，每秒消耗生命点数(LP)",
    <contenttweaker:bauble_luck> : "幸幸运运~",
    <contenttweaker:bauble_lucky> : "更加幸运！",
    <contenttweaker:bauble_resistance> : "破盾概率降为十分之一",
    <contenttweaker:mind_power_pearl> : "吸收周围掉落物",
    <contenttweaker:bauble_regeneration> : "此即信仰！",
    <contenttweaker:magic_quiver> : "又快又准！\n箭的伤害提升10%，飞行速度提升20%，下坠略微减少",
    <contenttweaker:rotted_sachet> : "好臭！离我远点！\n敌怪针对装备者索敌距离减少，不容易被怪物锁定，提升5%伤害和5%暴击率",
    <contenttweaker:stalker_quiver> : "由魔法箭袋和腐香囊合成，结合了两件饰品的力量\n箭的伤害提升15%，飞行速度提升40%，下坠略微减少，降低仇恨",

};

for m , k in Tooltipitem{
    m.addTooltip(k);
}

<contenttweaker:laurus>.addAdvancedTooltip(function(item) {
    var str0 as int = 0;
    var str1 as float = 0.0F;
    if(!isNull(item.tag.laurus)){
        var data as float = item.tag.laurus.asFloat();
        while (data > 0) {
            data -= 200;
            str0 += 1;
        }
        str1 = ((data - (str0 * 200)) / 20) as float;
    }
    return "可抵挡攻击次数为 " ~ str0 ~ " 次\n冷却剩" ~ str1 ~ "秒";
});

