/*
 * This script is created for the GreedyCraft Tweaks by 咕咕咕.
 */

#priority 30

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.game.IGame;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.RecipeFinishEvent;
import mods.modularmachinery.RecipePrimer;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("fallen_star", 4);
MachineModifier.setInternalParallelism("fallen_star", 1);
MachineModifier.setMaxParallelism("fallen_star", 1);

RecipeBuilder.newBuilder("bajin" , "fallen_star" , 3000, 2)
    .addLifeEssenceInput(2500000,false)
    .addItemInput(<ore:blockPorpezite> * 1).setChance(0.0f)
    .addEnergyPerTickInput(1000000)
    .addItemOutput(<tiths:ore_inert_witherium> * 64)
    .addItemOutput(<additions:mekaddon-ruthenium_ore> * 48)
    .addItemOutput(<additions:greedycraft-bismuth_ore> * 48)
    .addItemOutput(<additions:mekaddon-rhodium_ore> * 16)
    .addItemOutput(<appliedenergistics2:sky_stone_block> * 128)
    .build();
