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

val modularmachinery as IMod = loadedMods["modularmachinery"];
for controller in modularmachinery.items {
    if (controller.definition.id has "_controller" && !(controller.definition.id has "_factory_controller")) {
        JEI.addDescription(controller, "§c该物品不可用，请使用机械对应的集成控制器");
        controller.addTooltip("§c该物品不可用，请使用机械对应的集成控制器");
        JEI.hide(controller);
    } else if (controller.definition.id has "_controller") {
        JEI.addDescription(controller, "§e可以使用§a机械组装器§e右键集成控制器开启自动搭建\n§e流体可以用热力膨胀的大桶盛装\n§e使用§a高级机械拆卸器§e也可以一键拆卸机器");
        controller.addTooltip("§e可以使用§a机械组装器§e右键集成控制器开启自动搭建");
        controller.addTooltip("§e流体可以用热力膨胀的大桶盛装");
        controller.addTooltip("§e使用§a高级机械拆卸器§e也可以一键拆卸机器");
    }
}


JEI.hide(<thermalexpansion:florb>);
JEI.hide(<openblocks:tank>);
JEI.hide(<forestry:refractory>);

JEI.addItem(<thermalfoundation:material:132>);

JEI.hideCategory("Painter");