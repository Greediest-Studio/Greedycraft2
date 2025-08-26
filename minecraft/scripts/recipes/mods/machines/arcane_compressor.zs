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
import mods.modularmachinery.MachineModifier;
import mods.jei.JEI;

MMEvents.onControllerGUIRender("arcane_compressor", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///奥术凝聚台控制面板///", "§a机器名称：§eLV3 - 奥术凝聚台"];
    event.extraInfo = info;
});

MachineModifier.setMaxThreads("arcane_compressor", 256);
MachineModifier.setMaxParallelism("arcane_compressor", 1);
MachineModifier.setInternalParallelism("arcane_compressor", 1);

RecipeBuilder.newBuilder("arcane_compression_voidmetal", "arcane_compressor", 120)
    .addItemInput(<ore:ingotBrass> * 2)
    .addFluxInput(20)
    .addAspcetInput(20, "vacuos")
    .addItemOutput(<thaumcraft:ingot:1>)
    .build();

RecipeBuilder.newBuilder("arcane_compression_primordial", "arcane_compressor", 300)
    .addItemInput(<ore:ingotFusionMatrix> * 1)
    .addItemInput(<ore:nuggetPrimordial> * 5)
    .addItemInput(<thaumicwonders:primordial_grain> * 8)
    .addAspcetInput(30, "metallum")
    .addItemOutput(<tconevo:metal:20>)
    .build();

RecipeBuilder.newBuilder("arcane_compression_aer", "arcane_compressor", 360)
    .addItemInput(<thaumicrestoration:item_ingot> * 4)
    .addItemInput(<thaumicwonders:primordial_grain> * 16)
    .addFluidInput(<liquid:pruified> * 16)
    .addImpetusInput(100)
    .addAspcetInput(1200, "aer")
    .addDimensionInput(822)
    .addItemOutput(<additions:blizzium_ingot>)
    .build();

RecipeBuilder.newBuilder("arcane_compression_fire", "arcane_compressor", 360)
    .addItemInput(<thaumicrestoration:item_ingot:1> * 4)
    .addItemInput(<thaumicwonders:primordial_grain> * 16)
    .addFluidInput(<liquid:pruified> * 16)
    .addImpetusInput(100)
    .addAspcetInput(1200, "ignis")
    .addDimensionInput(822)
    .addItemOutput(<additions:blazingium_ingot>)
    .build();

RecipeBuilder.newBuilder("arcane_compression_water", "arcane_compressor", 360)
    .addItemInput(<thaumicrestoration:item_ingot:2> * 4)
    .addItemInput(<thaumicwonders:primordial_grain> * 16)
    .addFluidInput(<liquid:pruified> * 16)
    .addImpetusInput(100)
    .addAspcetInput(1200, "aqua")
    .addDimensionInput(823)
    .addItemOutput(<additions:tidalium_ingot>)
    .build();

RecipeBuilder.newBuilder("arcane_compression_earth", "arcane_compressor", 360)
    .addItemInput(<thaumicrestoration:item_ingot:3> * 4)
    .addItemInput(<thaumicwonders:primordial_grain> * 16)
    .addFluidInput(<liquid:pruified> * 16)
    .addImpetusInput(100)
    .addAspcetInput(1200, "terra")
    .addDimensionInput(824)
    .addItemOutput(<additions:terranium_ingot>)
    .build();

RecipeBuilder.newBuilder("arcane_compression_order", "arcane_compressor", 360)
    .addItemInput(<thaumicrestoration:item_ingot:4> * 4)
    .addItemInput(<thaumicwonders:primordial_grain> * 16)
    .addFluidInput(<liquid:pruified> * 16)
    .addImpetusInput(100)
    .addAspcetInput(1200, "ordo")
    .addDimensionInput(820)
    .addItemOutput(<additions:enlightium_ingot>)
    .build();

RecipeBuilder.newBuilder("arcane_compression_chaos", "arcane_compressor", 360)
    .addItemInput(<thaumicrestoration:item_ingot:5> * 4)
    .addItemInput(<thaumicwonders:primordial_grain> * 16)
    .addFluidInput(<liquid:pruified> * 16)
    .addImpetusInput(100)
    .addAspcetInput(1200, "perditio")
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