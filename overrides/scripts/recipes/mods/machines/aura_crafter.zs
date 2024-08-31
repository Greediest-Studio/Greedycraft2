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

RecipeBuilder.newBuilder("aurune_craft", "aura_crafter", 240)
    .addItemInput(<ore:ingotSky> * 2)
    .addItemInput(<ore:ingotEarth> * 2)
    .addItemInput(<ore:ingotEverite> * 1)
    .addItemInput(<naturesaura:gold_powder> * 2)
    .addItemInput(<ore:gemAmbrosium> * 4)
    .addAuraInput(1000, true)
    .addItemOutput(<additions:greedycraft-aurune_ingot> * 3)
    .build();