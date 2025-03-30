import crafttweaker.mods.IMod;
import crafttweaker.oredict.IOreDictEntry;

import mods.jei.JEI;

val pewter as IMod = loadedMods["pewter"];
for fluidItems in pewter.items {
    JEI.hide(fluidItems);
}

val contenttweaker as IMod = loadedMods["contenttweaker"];
for oreItems in contenttweaker.items {
    if (!isNull(oreItems.ores)) {
        if (oreItems.ores.length != 0) {
            if (oreItems.ores[0].name has "ore") {
                JEI.hide(oreItems);
            }
        }
    }
}

JEI.hide(<thermalexpansion:florb>);
JEI.hide(<openblocks:tank>);
JEI.hide(<forestry:refractory>);

JEI.hideCategory("Painter");

JEI.addDescription(<aeble:bubble_ring>,"装备时，提供常驻的水下呼吸");
JEI.addDescription(<aeble:obsidian_ring>,"装备时，提供常驻的防火和抗性1");
JEI.addDescription(<aeble:air_ring>,"装备时，免疫摔落伤害");
JEI.addDescription(<aeble:regeneration_ring>,"装备时，提供常驻的生命恢复1");
JEI.addDescription(<additions:greedycraft-twilit_ingot>, "§f合成方式请查询§c暮晶块");
JEI.addDescription(<gct_mobs:earth_ingot>, "§f使用§c神圣钢锭§f右击激活的地缚祭坛结构以合成§c大地之锭");
JEI.addDescription(<gct_aby:sanity_altar>,"§c远古淤泥§f需在§c黑暗领域§f处召唤！召唤时请在§c灵神台座上§f放置一个§c黑曜石");
JEI.addDescription(<gct_aby:ancientmud>,"§c远古淤泥§f需在§c黑暗领域§f处召唤！召唤时请在§c灵神台座上§f放置一个§c黑曜石");
JEI.addDescription(<nuclearcraft:gem_dust>,"§c使用电导齿轮解锁磨粉机制作钻石粉");