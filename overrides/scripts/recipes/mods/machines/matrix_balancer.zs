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

RecipeBuilder.newBuilder("balanced_matrix", "matrix_balancer", 4000)
    .addItemInput(<tconevo:material> * 1)
    .addItemInput(<avaritia:resource:4> * 1)
    .addItemInput(<additions:protonium_ingot> * 1)
    .addItemInput(<additions:electronium_ingot> * 1)
    .addFluidInput(<liquid:flashite> * 432)
    .addFluidInput(<liquid:overlaite> * 432)
    .addEnergyPerTickInput(32768)
    .addItemOutput(<gct_ores:balanced_matrix_ingot> * 1)
    .build();