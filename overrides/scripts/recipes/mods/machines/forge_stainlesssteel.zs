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

RecipeBuilder.newBuilder("stainlesssteel", "stainlesssteel_forge", 10, 0)
    .addItemInput(<ore:ingotIron> * 4)
    .addItemInput(<ore:gemCoal> * 4)
    .addItemInput(<ore:ingotManganese> * 2)
    .addItemInput(<ore:ingotChromium> * 1)
    .addItemInput(<ore:ingotNickel> * 1)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<additions:stainless_steel_ingot> * 12)
    .build();

RecipeBuilder.newBuilder("coke", "stainlesssteel_forge", 10, 0)
    .addItemInput(<ore:coal> * 8)
    .addEnergyPerTickInput(1000)
    .addItemOutput(<thermalfoundation:material:802> * 12)
    .build();