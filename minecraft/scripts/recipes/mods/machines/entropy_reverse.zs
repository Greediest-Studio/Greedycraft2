/*
 * This script is created for the GreedyCraft Tweaks by 咕咕咕咕咕咕咕.
 */

#priority 50


import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("entropy_reverse", 8);
MachineModifier.setMaxParallelism("entropy_reverse", 256);
MachineModifier.setInternalParallelism("entropy_reverse", 1);

MMEvents.onControllerGUIRender("entropy_reverse", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///逆熵解离装置控制面板///", "§a机器名称：§eLV4 - 逆熵解离装置"];
    event.extraInfo = info;
});

RecipeBuilder.newBuilder("entropy_1", "entropy_reverse", 20)
    .addFluidInput(<liquid:water> * 1000)
    .addFluidInput(<liquid:lava> * 1000)
    .addEnergyPerTickInput(1000000)
    .addFluidOutput(<liquid:cryotheum> * 1000)
    .addFluidOutput(<liquid:pyrotheum> * 1000)
    .build();

RecipeBuilder.newBuilder("entropy_2", "entropy_reverse", 200)
    .addItemInput(<ore:blockNihilite>).setChance(0.0f)
    .addEnergyPerTickInput(1000000)
    .addFluidOutput(<liquid:liquid_air> * 1000)
    .addFluidOutput(<liquid:liquidantimatter> * 1000)
    .build();