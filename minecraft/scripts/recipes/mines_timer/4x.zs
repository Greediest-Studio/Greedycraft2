/*
 * This script is created for the GreedyCraft modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 1750

import mods.jaopca.JAOPCA;
import mods.jaopca.Material;
import mods.mekanism.chemical.dissolution;
import mods.jei.JEI;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

MachineModifier.setMaxThreads("factory_4x", 32);
MachineModifier.setMaxParallelism("factory_4x", 65536);

MMEvents.onControllerGUIRender("factory_4x", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///化学固相联合工厂控制面板///", "§a机器名称：§eELYSIA工厂 - 化学固相联合工厂"];
    info += ("§a附属模块：" ~ (event.controller.hasModule("advanced") ? "§e升级模块" : "§c无"));
    event.extraInfo = info;
});

var Entries = JAOPCA.getMaterialsForType("INGOT");

for entry in Entries {
    if (banList has entry.name) {
        continue;
    }
    RecipeBuilder.newBuilder("ore_4x_" + entry.name as string, "factory_4x", 100)
        .addItemInput(entry.getOreDictEntry("ore"))
        .addFluidInput(<liquid:liquidhydrogenchloride> * 150)
        .addGasInput(<gas:oxygen> * 500)
        .addEnergyPerTickInput(20000)
        .addItemOutput(entry.getItemStack("ingot") * 4)
        .setMaxThreads(1)
        .build();
    RecipeBuilder.newBuilder("ore_4x_crystals_" + entry.name as string, "factory_4x", 20)
        .addItemInput(entry.getOreDictEntry("crystal"))
        .addFluidInput(<liquid:liquidhydrogenchloride> * 30)
        .addGasInput(<gas:oxygen> * 100)
        .addEnergyPerTickInput(20000)
        .addItemOutput(entry.getItemStack("ingot"))
        .setMaxThreads(1)
        .build();
    furnace.addRecipe(entry.getItemStack("ingot"), entry.getOreDictEntry("ore"), 0.1f);
}