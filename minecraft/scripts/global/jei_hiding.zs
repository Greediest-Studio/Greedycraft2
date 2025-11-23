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

JEI.hide(<liquid:brick_nether>);
JEI.hide(<liquid:brick_nether_glazed>);
JEI.hide(<liquid:brick_seared>);
JEI.hide(<liquid:cthugha>);
JEI.hide(<liquid:cosmic_neutronium>);
JEI.hide(<liquid:coralium_brick>);
JEI.hide(<liquid:cesium>);
JEI.hide(<liquid:ethaxium_brick>);
JEI.hide(<liquid:hustur>);
JEI.hide(<liquid:sulphur>);
JEI.hide(<liquid:solsteel>);
JEI.hide(<liquid:americium_241_carbide>);
JEI.hide(<liquid:americium_241_nitride>);
JEI.hide(<liquid:americium_241_oxide>);
JEI.hide(<liquid:americium_241_z_a>);
JEI.hide(<liquid:americium_242_carbide>);
JEI.hide(<liquid:americium_242_nitride>);
JEI.hide(<liquid:americium_242_oxide>);
JEI.hide(<liquid:americium_242_z_a>);
JEI.hide(<liquid:americium_243_carbide>);
JEI.hide(<liquid:americium_243_nitride>);
JEI.hide(<liquid:americium_243_oxide>);
JEI.hide(<liquid:americium_243_z_a>);
JEI.hide(<liquid:berkelium_247_carbide>);
JEI.hide(<liquid:berkelium_247_nitride>);
JEI.hide(<liquid:berkelium_247_oxide>);
JEI.hide(<liquid:berkelium_247_z_a>);
JEI.hide(<liquid:berkelium_248_carbide>);
JEI.hide(<liquid:berkelium_248_nitride>);
JEI.hide(<liquid:berkelium_248_oxide>);
JEI.hide(<liquid:berkelium_248_z_a>);
JEI.hide(<liquid:californium_249_carbide>);
JEI.hide(<liquid:californium_249_nitride>);
JEI.hide(<liquid:californium_249_oxide>);
JEI.hide(<liquid:californium_249_z_a>);
JEI.hide(<liquid:californium_250_carbide>);
JEI.hide(<liquid:californium_250_nitride>);
JEI.hide(<liquid:californium_250_oxide>);
JEI.hide(<liquid:californium_250_z_a>);
JEI.hide(<liquid:californium_251_carbide>);
JEI.hide(<liquid:californium_251_nitride>);
JEI.hide(<liquid:californium_251_oxide>);
JEI.hide(<liquid:californium_251_z_a>);
JEI.hide(<liquid:californium_252_carbide>);
JEI.hide(<liquid:californium_252_nitride>);
JEI.hide(<liquid:californium_252_oxide>);
JEI.hide(<liquid:californium_252_z_a>);
JEI.hide(<liquid:curium_243_carbide>);
JEI.hide(<liquid:curium_243_nitride>);
JEI.hide(<liquid:curium_243_oxide>);
JEI.hide(<liquid:curium_243_z_a>);
JEI.hide(<liquid:curium_245_carbide>);
JEI.hide(<liquid:curium_245_nitride>);
JEI.hide(<liquid:curium_245_oxide>);
JEI.hide(<liquid:curium_245_z_a>);
JEI.hide(<liquid:curium_246_carbide>);
JEI.hide(<liquid:curium_246_nitride>);
JEI.hide(<liquid:curium_246_oxide>);
JEI.hide(<liquid:curium_246_z_a>);
JEI.hide(<liquid:curium_247_carbide>);
JEI.hide(<liquid:curium_247_nitride>);
JEI.hide(<liquid:curium_247_oxide>);
JEI.hide(<liquid:curium_247_z_a>);
JEI.hide(<liquid:neptunium_236_carbide>);
JEI.hide(<liquid:neptunium_236_nitride>);
JEI.hide(<liquid:neptunium_236_oxide>);
JEI.hide(<liquid:neptunium_236_z_a>);
JEI.hide(<liquid:neptunium_237_carbide>);
JEI.hide(<liquid:neptunium_237_nitride>);
JEI.hide(<liquid:neptunium_237_oxide>);
JEI.hide(<liquid:neptunium_237_z_a>);
JEI.hide(<liquid:plutonium_238_carbide>);
JEI.hide(<liquid:plutonium_238_nitride>);
JEI.hide(<liquid:plutonium_238_oxide>);
JEI.hide(<liquid:plutonium_238_z_a>);
JEI.hide(<liquid:plutonium_239_carbide>);
JEI.hide(<liquid:plutonium_239_nitride>);
JEI.hide(<liquid:plutonium_239_oxide>);
JEI.hide(<liquid:plutonium_239_z_a>);
JEI.hide(<liquid:plutonium_241_carbide>);
JEI.hide(<liquid:plutonium_241_nitride>);
JEI.hide(<liquid:plutonium_241_oxide>);
JEI.hide(<liquid:plutonium_241_z_a>);
JEI.hide(<liquid:plutonium_242_carbide>);
JEI.hide(<liquid:plutonium_242_nitride>);
JEI.hide(<liquid:plutonium_242_oxide>);
JEI.hide(<liquid:plutonium_242_z_a>);
JEI.hide(<liquid:uranium_233_carbide>);
JEI.hide(<liquid:uranium_233_nitride>);
JEI.hide(<liquid:uranium_233_oxide>);
JEI.hide(<liquid:uranium_233_z_a>);
JEI.hide(<liquid:uranium_235_carbide>);
JEI.hide(<liquid:uranium_235_nitride>);
JEI.hide(<liquid:uranium_235_oxide>);
JEI.hide(<liquid:uranium_235_z_a>);
JEI.hide(<liquid:uranium_238_carbide>);
JEI.hide(<liquid:uranium_238_nitride>);
JEI.hide(<liquid:uranium_238_oxide>);
JEI.hide(<liquid:uranium_238_z_a>);

