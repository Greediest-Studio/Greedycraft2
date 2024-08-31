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

RecipeBuilder.newBuilder("liquidedmana", "mana_liquefactor", 1)
    .addManaInput(1000)
    .addEnergyPerTickInput(1000)
    .addFluidOutput(<liquid:mana> * 1)
    .build();