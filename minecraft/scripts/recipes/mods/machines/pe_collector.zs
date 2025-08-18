/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50
#loader crafttweaker reloadable

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.SmartInterfaceData;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.FactoryRecipeThread;

import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("pe_collector", 1);
MachineModifier.setMaxParallelism("pe_collector", 256);
MachineModifier.setInternalParallelism("pe_collector", 1);

MMEvents.onControllerGUIRender("pe_collector", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///深渊位能收集器控制面板///", "§a机器名称：§eLV4 - 深渊位能收集器"];
    event.extraInfo = info;
});

RecipeBuilder.newBuilder("pe_1", "pe_collector", 100)
    .addDimensionInput(0)
    .addFluidOutput(<liquid:pe>)
    .build();

RecipeBuilder.newBuilder("pe_2", "pe_collector", 60)
    .addDimensionInput(50)
    .addFluidOutput(<liquid:pe>)
    .build();

RecipeBuilder.newBuilder("pe_3", "pe_collector", 30)
    .addDimensionInput(51)
    .addFluidOutput(<liquid:pe>)
    .build();

RecipeBuilder.newBuilder("pe_4", "pe_collector", 10)
    .addDimensionInput(52)
    .addFluidOutput(<liquid:pe>)
    .build();

RecipeBuilder.newBuilder("pe_5", "pe_collector", 10)
    .addDimensionInput(53)
    .addFluidOutput(<liquid:pe>)
    .build();

RecipeBuilder.newBuilder("pe_6", "pe_collector", 10)
    .addDimensionInput(54)
    .addFluidOutput(<liquid:pe>)
    .build();

RecipeBuilder.newBuilder("pe_7", "pe_collector", 4)
    .addDimensionInput(55)
    .addFluidOutput(<liquid:pe>)
    .build();

