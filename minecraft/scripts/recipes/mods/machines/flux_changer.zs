/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50


import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineUpgradeBuilder;
import mods.modularmachinery.MachineUpgradeHelper;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeModifier;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MMEvents;
import mods.ctutils.utils.Math;

import scripts.util.machines as MMUtil;

MachineModifier.setMaxParallelism("flux_melter", 2147483647);
MachineModifier.setInternalParallelism("flux_melter", 2147483647);
MachineModifier.setMaxThreads("flux_melter", 1);

MachineModifier.setMaxParallelism("flux_reducer", 2147483647);
MachineModifier.setInternalParallelism("flux_reducer", 2147483647);
MachineModifier.setMaxThreads("flux_reducer", 1);

MMEvents.onControllerGUIRender("flux_melter", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///通量凝结装置控制面板///",
        "§a机器名称：§eLV2 - 通量凝结装置"
    ];
    event.extraInfo = info;
});

MMEvents.onControllerGUIRender("flux_reducer", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///通量还原装置控制面板///",
        "§a机器名称：§eLV2 - 通量还原装置"
    ];
    event.extraInfo = info;
});

RecipeBuilder.newBuilder("flux_craft", "flux_melter", 2)
    .addEnergyPerTickInput(500000000)
    .addFluidOutput(<liquid:flux>)
    .build();

RecipeBuilder.newBuilder("flux_reduce", "flux_reducer", 1)
    .addFluidInput(<liquid:flux>)
    .addEnergyPerTickOutput(1000000000)
    .build();

