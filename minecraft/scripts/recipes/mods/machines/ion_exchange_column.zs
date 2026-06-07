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
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.RecipeTickEvent;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("ion_exchange_column", 1);
MachineModifier.setMaxParallelism("ion_exchange_column", 4096);
MachineModifier.setInternalParallelism("ion_exchange_column", 1);

MMEvents.onControllerGUIRender("ion_exchange_column", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///大型离子交换柱控制面板///",
        "§a机器名称：§eLV5 - 大型离子交换柱"
    ];
    event.extraInfo = info;
});

RecipeBuilder.newBuilder("ion_exchange_trinite_solution", "ion_exchange_column", 1200)
    .addFluidInput(<liquid:actinide_solution> * 5000)
    .addFluidInput(<liquid:nitric_acid> * 5000)
    .addEnergyPerTickInput(60000000)
    .addFluidOutput(<liquid:uranyl_nitrate_solution> * 7500)
    .addFluidOutput(<liquid:neptunyl_nitrate_solution> * 1000)
    .addFluidOutput(<liquid:plutonyl_nitrate_solution> * 1000)
    .addFluidOutput(<liquid:heavy_actinide_nitrate_solution> * 500)
    .addRadiationOutput(1, 1)
    .build();
