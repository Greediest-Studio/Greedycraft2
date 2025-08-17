/*
 * This script is created for the GreedyCraft Tweaks by 咕咕咕咕咕咕咕.
 */

#priority 50


import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.ctutils.utils.Math;
import mods.modularmachinery.RecipeBuilder;

RecipeBuilder.newBuilder("entropy_1","entropy_reverse",20)
    .addFluidInput(<liquid:water> * 1000)
    .addFluidInput(<liquid:lava> * 1000)
    .addEnergyPerTickInput(1000000)
    .addFluidOutput(<liquid:cryotheum> * 1000)
    .addFluidOutput(<liquid:pyrotheum> * 1000)
    .build();