/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */


#priority 50

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.player.IPlayer;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.ctutils.utils.Math;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.jei.JEI;

MMEvents.onControllerGUIRender("arcane_matrix", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///机械注魔矩阵控制面板///", "§a机器名称：§eLV4 - 机械注魔矩阵"];
    event.extraInfo = info;
});

MachineModifier.setMaxThreads("arcane_matrix", 32);
MachineModifier.setMaxParallelism("arcane_matrix", 256);
MachineModifier.setInternalParallelism("arcane_matrix", 1);

RecipeAdapterBuilder.create("arcane_matrix", "thaumcraft:whimcraft_infusion_matrix")
    .addEnergyPerTickInput(3600)
    .build();