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

RecipeBuilder.newBuilder("phosphorus", "mechanical_blast_furnace", 400)
    .addItemInput(<ore:gemApatite> * 2)
    .addItemInput(<ore:gemQuartz> * 3)
    .addItemInput(<ore:fuelCoke> * 5)
    .addEnergyPerTickInput(1024)
    .addGasOutput("carbonoxide", 5000)
    .addFluidOutput(<liquid:phosphorus> * 72)
    .addItemOutput(<thermalfoundation:material:864> * 3)
    .build();

RecipeBuilder.newBuilder("strontium", "mechanical_blast_furnace", 400)
    .addItemInput(<ore:dustStrontiumSulfate> * 1)
    .addItemInput(<ore:fuelCoke> * 4)
    .addEnergyPerTickInput(1024)
    .addGasOutput("carbonoxide", 4000)
    .addItemOutput(<additions:mekaddon-strontium_sulfide> * 1)
    .build();

RecipeBuilder.newBuilder("barium", "mechanical_blast_furnace", 400)
    .addItemInput(<ore:dustBariumSulfate> * 1)
    .addItemInput(<ore:fuelCoke> * 4)
    .addEnergyPerTickInput(1024)
    .addGasOutput("carbonoxide", 4000)
    .addItemOutput(<additions:mekaddon-barium_sulfide> * 1)
    .build();

RecipeBuilder.newBuilder("calcium", "mechanical_blast_furnace", 600)
    .addItemInput(<ore:blockCalciumCarbonate> * 1)
    .addEnergyPerTickInput(1024)
    .addGasOutput("carbondioxide", 9000)
    .addItemOutput(<additions:mekaddon-calcium_oxide> * 9)
    .build();