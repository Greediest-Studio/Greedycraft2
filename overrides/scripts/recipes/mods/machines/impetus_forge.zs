/*
 * This script is created for the GreedyCraft Tweaks by 孤梦梦.
 */


#priority 50

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

RecipeBuilder.newBuilder("ydjs","impetus_forge",60)
    .addItemInput(<ore:ingotPrimordial>)
    .setDimension([14676])
    .addImpetusInput(1000)
    .addItemOutput(<additions:impetusite_ingot>)
    .build();