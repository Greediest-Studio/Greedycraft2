/*
 * This script is created for the GreedyCraft 
 * 你知道湮灭媒介之类的得一个个手搓有多麻烦吗(恼)
 * 给你一拳
 */

#priority 20

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

RecipeBuilder.newBuilder("abyss_oc", "abyss_ceremony_executant", 100)
    .addItemInput(<abyssalcraft:oblivionshard> * 4)
    .addItemInput(<minecraft:ender_eye> * 1)
    .addItemInput(<minecraft:redstone> * 4)
    .addFluidInput(<liquid:pe> * 500)
    .addEnergyPerTickInput(100)
    .addItemOutput(<abyssalcraft:oc> * 1)
    .build();

RecipeBuilder.newBuilder("abyss_trans", "abyss_ceremony_executant", 100)
    .addItemInput(<abyssalcraft:cpearl> * 1)
    .addItemInput(<minecraft:diamond> * 2)
    .addItemInput(<minecraft:blaze_powder> * 4)
    .addItemInput(<minecraft:ender_pearl> * 2)
    .addFluidInput(<liquid:pe> * 30)
    .addEnergyPerTickInput(100)
    .addItemOutput(<abyssalcraft:transmutationgem> * 1)
    .build();

RecipeBuilder.newBuilder("key_empty", "abyss_ceremony_executant", 100)
    .addItemInput(<abyssalcraft:gatewaykey> * 1)
    .addItemInput(<projecte:item.pe_matter> * 8)
    .addFluidInput(<liquid:pe> * 1000)
    .addEnergyPerTickInput(100)
    .addItemOutput(<gct_ores:door_key_empty> * 1)
    .build();

RecipeBuilder.newBuilder("ancientmud", "abyss_ceremony_executant", 100)
    .addItemInput(<gct_aby:shoggothtancale> * 4)
    .addItemInput(<gct_aby:essenceofdarkerrealm> * 2)
    .addItemInput(<gct_mobs:sanite_block> * 1)
    .addItemInput(<abyssalcraft:ingotblock:3> * 1)
    .addFluidInput(<liquid:pe> * 5000)
    .addEnergyPerTickInput(100)
    .addItemOutput(<gct_aby:ancientmud> * 1)
    .build();

RecipeBuilder.newBuilder("abyssine", "abyss_ceremony_executant", 100)
    .addItemInput(<additions:taigaddon-cthughate_ingot> * 1)
    .addItemInput(<gct_mobs:cthulhurite_ingot> * 1)
    .addItemInput(<additions:taigaddon-husturite_ingot> * 1)
    .addItemInput(<gct_mobs:shubniggurathium_ingot> * 1)
    .addItemInput(<gct_mobs:yogsothothium_ingot> * 1)
    .addItemInput(<gct_mobs:nyarlathotepium_ingot> * 1)
    .addItemInput(<gct_ores:balanced_matrix_ingot> * 2)
    .addItemInput(<gct_mobs:azathothium_ingot> * 1)
    .addFluidInput(<liquid:pe> * 5000)
    .addEnergyPerTickInput(100)
    .addItemOutput(<jaopca:block.abyssine> * 1)
    .build();

RecipeBuilder.newBuilder("living_fire", "abyss_ceremony_executant", 100)
    .addItemInput(<tiths:ingot_stellarium> * 1)
    .addItemInput(<additions:moltenium_ingot> * 2)
    .addItemInput(<additions:greedycraft-flamium_ingot> * 2)
    .addItemInput(<additions:infernium_ingot> * 2)
    .addItemInput(<extrautils2:ingredients:17> * 2)
    .addFluidInput(<liquid:pe> * 6400)
    .addEnergyPerTickInput(100)
    .addItemOutput(<additions:greedycraft-living_fire> * 1)
    .build();

RecipeBuilder.newBuilder("book", "abyss_ceremony_executant", 100)
    .addItemInput(<abyssalcraft:abyssalnomicon>)
    .addFluidInput(<liquid:pe> * 1440)
    .addEnergyPerTickInput(100)
    .addItemOutput(<abyssalcraft:abyssalnomicon>.withTag({PotEnergy: 100000.0 as float}) * 1)
    .build();
