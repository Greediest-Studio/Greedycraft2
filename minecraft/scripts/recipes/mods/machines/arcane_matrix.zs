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
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.RecipeModifierBuilder;
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
    .addRecipeTooltip("§e实际加工时间将乘以0.04（缩短到1/25）")
    .build();

MMEvents.onMachinePreTick("arcane_matrix", function(event as MachineTickEvent) {
    if (!event.controller.hasModifier("arcane_matrix_speed")) {
        event.controller.addPermanentModifier("arcane_matrix_speed", RecipeModifierBuilder.create("modularmachinery:duration", "input", 0.04, 1, false).build());
    }
});