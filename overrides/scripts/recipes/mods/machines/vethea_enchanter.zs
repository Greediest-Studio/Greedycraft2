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

RecipeBuilder.newBuilder("vethea_mk1", "vethea_enchanter", 100)
    .addItemInput(<divinerpg:teaker_lump>)
    .addItemInput(<ore:ingotModularium> * 1)
    .addItemOutput(<additions:vethea-vethea_ingot_mk1> * 1)
    .build();

RecipeBuilder.newBuilder("vethea_mk2", "vethea_enchanter", 100)
    .addItemInput(<divinerpg:amthirmis_lump>)
    .addItemInput(<ore:ingotModularium> * 1)
    .addItemOutput(<additions:vethea-vethea_ingot_mk2> * 1)
    .build();

RecipeBuilder.newBuilder("vethea_mk3", "vethea_enchanter", 100)
    .addItemInput(<divinerpg:darven_lump>)
    .addItemInput(<ore:ingotModularium> * 1)
    .addItemOutput(<additions:vethea-vethea_ingot_mk3> * 1)
    .build();

RecipeBuilder.newBuilder("vethea_mk4", "vethea_enchanter", 100)
    .addItemInput(<divinerpg:cermile_lump>)
    .addItemInput(<ore:ingotModularium> * 1)
    .addItemOutput(<additions:vethea-vethea_ingot_mk4> * 1)
    .build();

RecipeBuilder.newBuilder("vethea_mk5", "vethea_enchanter", 100)
    .addItemInput(<divinerpg:pardimal_lump>)
    .addItemInput(<ore:ingotModularium> * 1)
    .addItemOutput(<additions:vethea-vethea_ingot_mk5> * 1)
    .build();

RecipeBuilder.newBuilder("vethea_mk6", "vethea_enchanter", 100)
    .addItemInput(<divinerpg:quadrotic_lump>)
    .addItemInput(<ore:ingotModularium> * 1)
    .addItemOutput(<additions:vethea-vethea_ingot_mk6> * 1)
    .build();

RecipeBuilder.newBuilder("vethea_mk7", "vethea_enchanter", 100)
    .addItemInput(<divinerpg:karos_lump>)
    .addItemInput(<ore:ingotModularium> * 1)
    .addItemOutput(<additions:vethea-vethea_ingot_mk7> * 1)
    .build();

RecipeBuilder.newBuilder("vethea_mk8", "vethea_enchanter", 100)
    .addItemInput(<divinerpg:heliosis_lump>)
    .addItemInput(<ore:ingotModularium> * 1)
    .addItemOutput(<additions:vethea-vethea_ingot_mk8> * 1)
    .build();

RecipeBuilder.newBuilder("vethea_mk9", "vethea_enchanter", 100)
    .addItemInput(<divinerpg:arksiane_lump>)
    .addItemInput(<ore:ingotModularium> * 1)
    .addItemOutput(<additions:vethea-vethea_ingot_mk9> * 1)
    .build();