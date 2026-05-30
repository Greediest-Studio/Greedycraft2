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

MMEvents.onControllerGUIRender("arcane_alchemical_pot", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///机械注魔矩阵控制面板///", "§a机器名称：§eLV3 - 奥术炼金釜"];
    event.extraInfo = info;
});

MachineModifier.setMaxThreads("arcane_alchemical_pot", 32);
MachineModifier.setMaxParallelism("arcane_alchemical_pot", 1);
MachineModifier.setInternalParallelism("arcane_alchemical_pot", 1);

RecipeAdapterBuilder.create("arcane_alchemical_pot", "thaumcraft:whimcraft_crucible")
    .addEnergyPerTickInput(360)
    .setMaxThreads(1)
    .build();

/*MMEvents.onMachinePreTick("arcane_alchemical_pot", function(event as MachineTickEvent) {
    if (!event.controller.hasModifier("arcane_alchemical_pot_speed")) {
        event.controller.addPermanentModifier("arcane_alchemical_pot_speed", RecipeModifierBuilder.create("modularmachinery:duration", "input", 0.04, 1, false).build());
    }
});*/