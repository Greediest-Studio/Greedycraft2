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

RecipeBuilder.newBuilder("zodiacite", "bright_altar", 800)
    .addItemInput(<ore:ingotBalancedMatrix> * 1)
    .addItemInput(<ore:dustAstralMetal> * 12)
    .addItemInput(<ore:ingotLunarine> * 8)
    .addItemInput(<ore:ingotNasalum> * 8)
    .addItemInput(<ore:ingotMeteor> * 24)
    .addItemInput(<astralsorcery:itemusabledust:1> * 8)
    .addItemInput(<gct_mobs:polarisite> * 16)
    .addFluidInput(<liquid:astralsorcery.liquidstarlight> * 16000)
    .addStarlightInput(8000)
    .addItemOutput(<additions:greedycraft-zodiacite_ingot> * 2)
    .build();