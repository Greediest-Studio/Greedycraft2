/*
 * This script is created for the GreedyCraft Tweaks by 咕咕咕.
 */

#priority 50

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MMEvents;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxParallelism("neutron_activator", 2147483647);
MachineModifier.setInternalParallelism("neutron_activator", 2147483647);
MachineModifier.setMaxThreads("neutron_activator", 2);

MMEvents.onControllerGUIRender("neutron_activator", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///大型中子活化器控制面板///", "§a机器名称：§eLV3 - 大型中子活化器"];
    event.extraInfo = info;
});

RecipeBuilder.newBuilder("pollonium", "neutron_activator",1)
    .addEnergyPerTickInput(10000)
    .addGasInput(<gas:nuclearwaste> * 10)
    .addGasOutput(<gas:polonium> * 1)
    .setMaxThreads(1)
    .build();

RecipeBuilder.newBuilder("tritium", "neutron_activator",1)
    .addEnergyPerTickInput(1000)
    .addGasInput(<gas:lithium> * 1)
    .addGasOutput(<gas:tritium> * 1)
    .setMaxThreads(1)
    .build();