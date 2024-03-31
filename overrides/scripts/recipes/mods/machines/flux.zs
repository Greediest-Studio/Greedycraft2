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

RecipeBuilder.newBuilder("flux_craft", "flux_melter", 2)
    .addEnergyPerTickInput(500000000)
    .addFluidOutput(<liquid:flux>)
    .build();

RecipeBuilder.newBuilder("flux_reduce", "flux_reducer", 1)
    .addFluidInput(<liquid:flux>)
    .addEnergyPerTickOutput(1000000000)
    .build();