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
import mods.jei.JEI;

val builder as RecipePrimer = RecipeBuilder.newBuilder("arcane_compression_aer", "arcane_compressor", 360);
builder.addFluidInput(<liquid:pruified> * 16);
builder.addItemInputs([
    <thaumicrestoration:item_ingot> * 4,
    <thaumicwonders:primordial_grain> * 16,
]);
builder.addImpetusInput(100);
builder.addDimensionInput(822);
builder.addAspcetInput(1200, "aer");
builder.addItemOutput(<additions:blizzium_ingot>);
builder.build();

val builder1 as RecipePrimer = RecipeBuilder.newBuilder("arcane_compression_fire", "arcane_compressor", 360);
builder1.addItemInput(<thaumicrestoration:item_ingot:1> * 4);
builder1.addItemInput(<thaumicwonders:primordial_grain> * 16);
builder1.addFluidInput(<liquid:pruified> * 16);
builder1.addImpetusInput(100);
builder1.addAspcetInput(1200, "ignis");
builder1.addDimensionInput(822);
builder1.addItemOutput(<additions:blazingium_ingot>);
builder1.build();

val builder2 as RecipePrimer = RecipeBuilder.newBuilder("arcane_compression_water", "arcane_compressor", 360);
builder2.addItemInput(<thaumicrestoration:item_ingot:2> * 4);
builder2.addItemInput(<thaumicwonders:primordial_grain> * 16);
builder2.addFluidInput(<liquid:pruified> * 16);
builder2.addImpetusInput(100);
builder2.addAspcetInput(1200, "aqua");
builder2.addDimensionInput(823);
builder2.addItemOutput(<additions:tidalium_ingot>);
builder2.build();

val builder3 as RecipePrimer = RecipeBuilder.newBuilder("arcane_compression_earth", "arcane_compressor", 360);
builder3.addItemInput(<thaumicrestoration:item_ingot:3> * 4);
builder3.addItemInput(<thaumicwonders:primordial_grain> * 16);
builder3.addFluidInput(<liquid:pruified> * 16);
builder3.addImpetusInput(100);
builder3.addAspcetInput(1200, "terra");
builder3.addDimensionInput(824);
builder3.addItemOutput(<additions:terranium_ingot>);
builder3.build();

val builder4 as RecipePrimer = RecipeBuilder.newBuilder("arcane_compression_order", "arcane_compressor", 360);
builder4.addItemInput(<thaumicrestoration:item_ingot:4> * 4);
builder4.addItemInput(<thaumicwonders:primordial_grain> * 16);
builder4.addFluidInput(<liquid:pruified> * 16);
builder4.addImpetusInput(100);
builder4.addAspcetInput(1200, "ordo");
builder4.addDimensionInput(820);
builder4.addItemOutput(<additions:enlightium_ingot>);
builder4.build();

val builder5 as RecipePrimer = RecipeBuilder.newBuilder("arcane_compression_chaos", "arcane_compressor", 360);
builder5.addItemInput(<thaumicrestoration:item_ingot:5> * 4);
builder5.addItemInput(<thaumicwonders:primordial_grain> * 16);
builder5.addFluidInput(<liquid:pruified> * 16);
builder5.addImpetusInput(100);
builder5.addAspcetInput(1200, "perditio");
builder5.addDimensionInput(821);
builder5.addItemOutput(<additions:debarcium_ingot>);
builder5.build();

val builder6 as RecipePrimer = RecipeBuilder.newBuilder("arcane_compression_hexacite", "arcane_compressor", 720);
builder6.addItemInput(<ore:ingotBlizzium>);
builder6.addItemInput(<ore:ingotBlazingium>);
builder6.addItemInput(<ore:ingotTidalium>);
builder6.addItemInput(<ore:ingotTerranium>);
builder6.addItemInput(<ore:ingotEnlightium>);
builder6.addItemInput(<ore:ingotDebarcium>);
builder6.addFluidInput(<liquid:everite> * 576);
builder6.addImpetusInput(480);
builder6.addDimensionInput(78);
builder6.addItemOutput(<additions:hexacite_ingot> * 2);
builder6.build();