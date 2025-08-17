/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */

#priority 30

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

val regName = "loot_power_generator";
val speed = 100;

MachineModifier.setMaxThreads("loot_power_generator", 1);
MachineModifier.setInternalParallelism("loot_power_generator", 1);
MachineModifier.setMaxParallelism("loot_power_generator", 256);

RecipeBuilder.newBuilder(regName + "_t0", regName, speed / 2, 0)
    .addItemInput(<ore:dungeonLootTier0>)
    .addEnergyPerTickOutput(1024)
    .build();

RecipeBuilder.newBuilder(regName + "_t1", regName, speed, 0)
    .addItemInput(<ore:dungeonLootTier1>)
    .addEnergyPerTickOutput(2048)
    .build();

RecipeBuilder.newBuilder(regName + "_t2", regName, speed * 2, 0)
    .addItemInput(<ore:dungeonLootTier2>)
    .addEnergyPerTickOutput(4096)
    .build();
   
RecipeBuilder.newBuilder(regName + "_t3", regName, speed * 4, 0)
    .addItemInput(<ore:dungeonLootTier3>)
    .addEnergyPerTickOutput(16384)
    .build();

RecipeBuilder.newBuilder(regName + "_legendite", regName, speed * 15, 0)
    .addItemInput(<ore:ingotLegendite>)
    .addEnergyPerTickOutput(131072)
    .build();

MMEvents.onControllerGUIRender("loot_power_generator", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///战利品发电机控制面板///",
        "§a机器名称：§eLV1 - 战利品发电机"
    ];
    event.extraInfo = info;
});