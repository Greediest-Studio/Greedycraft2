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

RecipeBuilder.newBuilder("arcane_compression_air", "arcane_compressor", 360)
    .addItemInput(<thaumicrestoration:item_ingot> * 4)
    .addItemInput(<thaumicwonders:primordial_grain> * 16)
    .addFluidInput(<liquid:pruified> * 16)
    .addImpetusInput(100)
    .addAspectInput("aer", 1200)
    .setDimension([826])
    .addItemOutput(<additions:greedycraft-blizzium_ingot>)
    .build();
RecipeBuilder.newBuilder("arcane_compression_fire", "arcane_compressor", 360)
    .addItemInput(<thaumicrestoration:item_ingot:1> * 4)
    .addItemInput(<thaumicwonders:primordial_grain> * 16)
    .addFluidInput(<liquid:pruified> * 16)
    .addImpetusInput(100)
    .addAspectInput("ignis", 1200)
    .setDimension([822])
    .addItemOutput(<additions:greedycraft-blazingium_ingot>)
    .build();
RecipeBuilder.newBuilder("arcane_compression_water", "arcane_compressor", 360)
    .addItemInput(<thaumicrestoration:item_ingot:2> * 4)
    .addItemInput(<thaumicwonders:primordial_grain> * 16)
    .addFluidInput(<liquid:pruified> * 16)
    .addImpetusInput(100)
    .addAspectInput("aqua", 1200)
    .setDimension([823])
    .addItemOutput(<additions:greedycraft-tidalium_ingot>)
    .build();
RecipeBuilder.newBuilder("arcane_compression_earth", "arcane_compressor", 360)
    .addItemInput(<thaumicrestoration:item_ingot:3> * 4)
    .addItemInput(<thaumicwonders:primordial_grain> * 16)
    .addFluidInput(<liquid:pruified> * 16)
    .addImpetusInput(100)
    .addAspectInput("terra", 1200)
    .setDimension([824])
    .addItemOutput(<additions:greedycraft-terranium_ingot>)
    .build();
RecipeBuilder.newBuilder("arcane_compression_order", "arcane_compressor", 360)
    .addItemInput(<thaumicrestoration:item_ingot:4> * 4)
    .addItemInput(<thaumicwonders:primordial_grain> * 16)
    .addFluidInput(<liquid:pruified> * 16)
    .addImpetusInput(100)
    .addAspectInput("ordo", 1200)
    .setDimension([820])
    .addItemOutput(<additions:greedycraft-enlightium_ingot>)
    .build();
RecipeBuilder.newBuilder("arcane_compression_chaos", "arcane_compressor", 360)
    .addItemInput(<thaumicrestoration:item_ingot:5> * 4)
    .addItemInput(<thaumicwonders:primordial_grain> * 16)
    .addFluidInput(<liquid:pruified> * 16)
    .addImpetusInput(100)
    .addAspectInput("perditio", 1200)
    .setDimension([821])
    .addItemOutput(<additions:greedycraft-debarcium_ingot>)
    .build();
RecipeBuilder.newBuilder("arcane_compression_hexacite", "arcane_compressor", 720)
    .addItemInput(<ore:ingotBlizzium>)
    .addItemInput(<ore:ingotBlazingium>)
    .addItemInput(<ore:ingotTidalium>)
    .addItemInput(<ore:ingotTerranium>)
    .addItemInput(<ore:ingotEnlightium>)
    .addItemInput(<ore:ingotDebarcium>)
    .addFluidInput(<liquid:everite> * 576)
    .addImpetusInput(480)
    .setDimension([78])
    .addItemOutput(<additions:greedycraft-hexacite_ingot> * 2)
    .build();