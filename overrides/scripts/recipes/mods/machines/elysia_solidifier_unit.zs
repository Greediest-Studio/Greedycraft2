/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50


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
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;

MachineModifier.setMaxThreads("elysia_solidifier", 1);
MachineModifier.setInternalParallelism("elysia_solidifier", 4);
MachineModifier.setMaxParallelism("elysia_solidifier", 65536);

function addSolidification(output as IItemStack, liquid as ILiquidStack, cooler as ILiquidStack, timeMultiplier as float) as void {
    RecipeBuilder.newBuilder("solidification_" + liquid.name, "elysia_solidifier", (40 * timeMultiplier) as int)
        .addFluidInput(liquid)
        .addFluidInput(cooler)
        .addEnergyPerTickInput(50000)
        .addItemOutput(output)
        .addRecipeTooltip("§d凝结配方支持模块化电容升级，详情请查询“模块化电容”")
        .build();
}

addSolidification(<additions:hydrogen_ingot>, <liquid:liquid_hydrogen> * 144, <liquid:hecryo_liquid> * 100, 4.0f);
addSolidification(<additions:helium_ingot>, <liquid:liquid_helium> * 144, <liquid:hecryo_liquid> * 100, 10.0f);
addSolidification(<additions:nitrogen_ingot>, <liquid:liquid_nitrogen> * 144, <liquid:hecryo_liquid> * 100, 3.0f);
addSolidification(<additions:oxygen_ingot>, <liquid:liquid_oxygen> * 144, <liquid:hecryo_liquid> * 100, 3.0f);
addSolidification(<additions:fluorine_ingot>, <liquid:liquid_fluorine> * 144, <liquid:hecryo_liquid> * 100, 5.0f);
addSolidification(<additions:neon_ingot>, <liquid:liquid_neon> * 144, <liquid:hecryo_liquid> * 100, 8.0f);
addSolidification(<additions:chlorine_ingot>, <liquid:liquid_chlorine> * 144, <liquid:hecryo_liquid> * 100, 1.5f);
addSolidification(<additions:argon_ingot>, <liquid:liquid_argon> * 144, <liquid:hecryo_liquid> * 100, 6.0f);
addSolidification(<additions:krypton_ingot>, <liquid:liquid_krypton> * 144, <liquid:hecryo_liquid> * 100, 4.0f);
addSolidification(<additions:xenon_ingot>, <liquid:liquid_xenon> * 144, <liquid:hecryo_liquid> * 100, 2.0f);
addSolidification(<additions:radon_ingot>, <liquid:liquid_radon> * 144, <liquid:hecryo_liquid> * 100, 1.2f);

RecipeAdapterBuilder.create("elysia_solidifier", "nuclearcraft:ingot_former")
    .addRecipeTooltip("§d凝结配方支持模块化电容升级，详情请查询“模块化电容”")
    .build();