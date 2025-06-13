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
import mods.ctutils.utils.Math;
import mods.jei.JEI;

import scripts.util.machines as MMUtil;

function addSolidification(output as IItemStack, liquid as ILiquidStack, cooler as ILiquidStack, timeMultiplier as float) as void {
    RecipeBuilder.newBuilder("solidification_" + liquid.name, "condensation_solidificator", (40 * timeMultiplier) as int)
        .addFluidInput(liquid)
        .addFluidInput(cooler)
        .addEnergyPerTickInput(50000)
        .addItemOutput(output)
        .build();
}

addSolidification(<additions:mana_ingot>, <liquid:mana> * 144, <liquid:cryotheum> * 20, 1.0f);
addSolidification(<additions:pe_ingot>, <liquid:pe> * 144, <liquid:cryotheum> * 20, 1.0f);
addSolidification(<additions:flux_ingot>, <liquid:flux> * 144, <liquid:cryotheum> * 20, 1.0f);
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
addSolidification(<additions:bromine_ingot>, <liquid:bromine> * 144, <liquid:cryotheum> * 20, 1.0f);
