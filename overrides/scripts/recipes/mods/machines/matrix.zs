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
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

import scripts.util.machines as MMUtil;

MachineModifier.setMaxThreads("matrix_fusioner", 1);
MachineModifier.setInternalParallelism("matrix_fusioner", 1);
MachineModifier.setMaxParallelism("matrix_fusioner", 256);
MachineModifier.setMaxThreads("matrix_balancer", 1);
MachineModifier.setInternalParallelism("matrix_balancer", 1);
MachineModifier.setMaxParallelism("matrix_balancer", 256);

RecipeAdapterBuilder.create("matrix_balancer", "modularmachinery:matrix_fusioner");

RecipeBuilder.newBuilder("fusion_matrix", "matrix_fusioner", 200)
    .addItemInput(<ore:ingotEnderium> * 1)
    .addItemInput(<ore:ingotCobalt> * 1)
    .addItemInput(<ore:ingotArdite> * 1)
    .addFluidInput(<liquid:adamant_fluid> * 72)
    .addEnergyPerTickInput(256)
    .addItemOutput(<tconevo:material> * 3)
    .build();


RecipeBuilder.newBuilder("balanced_matrix", "matrix_balancer", 4000)
    .addItemInput(<tconevo:material> * 1)
    .addItemInput(<avaritia:resource:4> * 1)
    .addItemInput(<additions:protonium_ingot> * 1)
    .addItemInput(<additions:electronium_ingot> * 1)
    .addFluidInput(<liquid:flashite> * 432)
    .addFluidInput(<liquid:overlaite> * 432)
    .addEnergyPerTickInput(32768)
    .addItemOutput(<gct_ores:balanced_matrix_ingot> * 1)
    .build();