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

RecipeBuilder.newBuilder("genite_build", "gene_builder", 1000, 0)
    .addItemInput(<additions:cytosinite_ingot>)
    .addItemInput(<additions:greedycraft-thyminite_ingot>)
    .addItemInput(<additions:greedycraft-guaninite_ingot>)
    .addItemInput(<additions:greedycraft-adeninite_ingot>)
    .addEnergyPerTickInput(1150)
    .addItemOutput(<gct_ores:genite_ingot>)
    .build();