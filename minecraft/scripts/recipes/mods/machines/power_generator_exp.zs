
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

import scripts.util.machines as MMUtil;

val regName = "exp_power_generator";
val speed = 100;

MachineModifier.setMaxThreads("exp_power_generator", 1);
MachineModifier.setInternalParallelism("exp_power_generator", 1);
MachineModifier.setMaxParallelism("exp_power_generator", 256);

RecipeBuilder.newBuilder(regName + "_general", regName, speed, 0)
    .addFluidInput(<liquid:experience> * 100)
    .addEnergyPerTickOutput(2048)
    .build();

MMEvents.onControllerGUIRender("exp_power_generator", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///经验发电机控制面板///",
        "§a机器名称：§eLV1 - 经验发电机"
    ];
    event.extraInfo = info;
});