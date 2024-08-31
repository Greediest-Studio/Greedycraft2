/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */

#priority 30


import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

import scripts.util.machines as MMUtil;

RecipeBuilder.newBuilder("stainlesssteel", "stainlesssteel_forge", 40, 0)
    .addItemInput(<ore:ingotIron> * 8)
    .addItemInput(<ore:gemCoal> * 8)
    .addItemInput(<ore:ingotManganese> * 4)
    .addItemInput(<ore:ingotChromium> * 2)
    .addItemInput(<ore:ingotNickel> * 2)
    .addEnergyPerTickInput(100)
    .addItemOutput(<additions:stainless_steel_ingot> * 8)
    .build();