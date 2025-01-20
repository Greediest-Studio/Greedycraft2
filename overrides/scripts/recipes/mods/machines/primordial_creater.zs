/*
 * This script is created for the GreedyCraft Tweaks by 咕咕咕.
 */

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.ctutils.utils.Math;
import mods.modularmachinery.RecipeBuilder;

RecipeBuilder.newBuilder("makepeal", "primordial_creater", 100)
    .addItemInput(<thaumicwonders:primordial_grain> * 2)
    .addEnergyPerTickInput(1000000)
    .addItemOutput(<thaumcraft:primordial_pearl> * 1)
    .build();

RecipeBuilder.newBuilder("breakpeal", "primordial_creater", 100)
    .addItemInput(<thaumcraft:primordial_pearl> * 2)
    .addEnergyPerTickInput(100000)
    .addItemOutput(<thaumicwonders:primordial_grain> * 48)
    .build();

RecipeBuilder.newBuilder("worldsalt", "primordial_creater", 10)
    .addItemInput(<ore:itemSalt> * 1)
    .addEnergyPerTickInput(100)
    .addItemOutput(<thaumcraft:salis_mundus> * 1)
    .build();

RecipeBuilder.newBuilder("primordial_ingot", "primordial_creater", 100)
    .addItemInput(<tconevo:material> * 10)
    .addItemInput(<thaumcraft:primordial_pearl> * 1)
    .addEnergyPerTickInput(10000)
    .addItemOutput(<tconevo:metal:20> * 10)
    .build();

RecipeBuilder.newBuilder("bluewolffur", "primordial_creater", 100)
    .addItemInput(<minecraft:leather> * 4)
    .addItemInput(<thaumadditions:mithrillium_nugget> * 1)
    .addEnergyPerTickInput(10000)
    .addItemOutput(<thaumadditions:zeith_fur> * 4)
    .build();

RecipeBuilder.newBuilder("eldritch_slime", "primordial_creater", 100)
    .addItemInput(<thaumcraft:bottle_taint> * 8)
    .addItemInput(<ore:slimeball> * 1)
    .addEnergyPerTickInput(10000)
    .addItemOutput(<additions:greedycraft-eldritch_slime> * 1)
    .build();

RecipeBuilder.newBuilder("corruptium_ingot", "primordial_creater", 100)
    .addItemInput(<thaumcraft:bottle_taint> * 8)
    .addItemInput(<tconevo:metal:20> * 1)
    .addEnergyPerTickInput(10000)
    .addItemOutput(<additions:greedycraft-corruptium_ingot> * 1)
    .build();