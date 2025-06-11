/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import thaumcraft.aspect.CTAspect;
import mods.modularmachinery.RecipeBuilder;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

import scripts.util.machines as MMUtil;

var cthulhu as CTAspect = <aspect:cthulhu>.internal;

RecipeBuilder.newBuilder("cthulhu_crafting", "tritransmutor", 5)
    .addAspcetInput(1, "coralos")
    .addAspcetInput(1, "dreadia")
    .addAspcetInput(1, "abyss")
    .addItemOutput(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "cthulhu"}]}))
    .build();