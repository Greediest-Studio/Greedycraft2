/*
 * This script is created for the GreedyCraft modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 1750

import mods.jaopca.JAOPCA;
import mods.jaopca.Material;
import mods.mekanism.chemical.dissolution;
import mods.jei.JEI;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;

MachineModifier.setMaxThreads("factory_4x", 32);
MachineModifier.setInternalParallelism("factory_4x", 4);
MachineModifier.setMaxParallelism("factory_4x", 1024);

var Entries = JAOPCA.getMaterialsForType("INGOT");

for entry in Entries {
    RecipeBuilder.newBuilder("ore_4x_" + entry.name as string, "factory_4x", 100)
        .addItemInput(entry.getOreDictEntry("ore"))
        .addFluidInput(<liquid:liquidhydrogenchloride> * 150)
        .addGasInput(<gas:oxygen> * 500)
        .addEnergyPerTickInput(20000)
        .addItemOutput(entry.getItemStack("ingot") * 4)
        .build();
    RecipeBuilder.newBuilder("ore_4x_crystals_" + entry.name as string, "factory_4x", 20)
        .addItemInput(entry.getOreDictEntry("crystal"))
        .addFluidInput(<liquid:liquidhydrogenchloride> * 30)
        .addGasInput(<gas:oxygen> * 100)
        .addEnergyPerTickInput(20000)
        .addItemOutput(entry.getItemStack("ingot"))
        .build();
}