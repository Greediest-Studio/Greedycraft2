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
import mods.modularmachinery.RecipePrimer;
import mods.ctutils.utils.Math;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MMEvents;
import mods.jei.JEI;

RecipeBuilder.newBuilder("arcane_compression_voidmetal", "arcane_compressor", 120)
    .addItemInput(<ore:ingotBrass> * 2)
    .addFluxInput(100)
    .addAspectInput(20, "vacuos")
    .addItemOutput(<thaumcraft:ingot:1>)
    .build();

RecipeBuilder.newBuilder("arcane_compression_aer", "arcane_compressor", 360)
    .addItemInput(<thaumicrestoration:item_ingot> * 4)
    .addItemInput(<thaumicwonders:primordial_grain> * 16)
    .addFluidInput(<liquid:pruified> * 16)
    .addImpetusInput(100)
    .addAspectInput(1200, "aer")
    .addDimensionInput(822)
    .addItemOutput(<additions:blizzium_ingot>)
    .build();

RecipeBuilder.newBuilder("arcane_compression_fire", "arcane_compressor", 360)
    .addItemInput(<thaumicrestoration:item_ingot:1> * 4)
    .addItemInput(<thaumicwonders:primordial_grain> * 16)
    .addFluidInput(<liquid:pruified> * 16)
    .addImpetusInput(100)
    .addAspectInput(1200, "ignis")
    .addDimensionInput(822)
    .addItemOutput(<additions:blazingium_ingot>)
    .build();

RecipeBuilder.newBuilder("arcane_compression_water", "arcane_compressor", 360)
    .addItemInput(<thaumicrestoration:item_ingot:2> * 4)
    .addItemInput(<thaumicwonders:primordial_grain> * 16)
    .addFluidInput(<liquid:pruified> * 16)
    .addImpetusInput(100)
    .addAspectInput(1200, "aqua")
    .addDimensionInput(823)
    .addItemOutput(<additions:tidalium_ingot>)
    .build();

RecipeBuilder.newBuilder("arcane_compression_earth", "arcane_compressor", 360)
    .addItemInput(<thaumicrestoration:item_ingot:3> * 4)
    .addItemInput(<thaumicwonders:primordial_grain> * 16)
    .addFluidInput(<liquid:pruified> * 16)
    .addImpetusInput(100)
    .addAspectInput(1200, "terra")
    .addDimensionInput(824)
    .addItemOutput(<additions:terranium_ingot>)
    .build();

RecipeBuilder.newBuilder("arcane_compression_order", "arcane_compressor", 360)
    .addItemInput(<thaumicrestoration:item_ingot:4> * 4)
    .addItemInput(<thaumicwonders:primordial_grain> * 16)
    .addFluidInput(<liquid:pruified> * 16)
    .addImpetusInput(100)
    .addAspectInput(1200, "ordo")
    .addDimensionInput(820)
    .addItemOutput(<additions:enlightium_ingot>)
    .build();

RecipeBuilder.newBuilder("arcane_compression_chaos", "arcane_compressor", 360)
    .addItemInput(<thaumicrestoration:item_ingot:5> * 4)
    .addItemInput(<thaumicwonders:primordial_grain> * 16)
    .addFluidInput(<liquid:pruified> * 16)
    .addImpetusInput(100)
    .addAspectInput(1200, "perditio")
    .addDimensionInput(821)
    .addItemOutput(<additions:debarcium_ingot>)
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
    .addDimensionInput(78)
    .addItemOutput(<additions:hexacite_ingot> * 2)
    .build();