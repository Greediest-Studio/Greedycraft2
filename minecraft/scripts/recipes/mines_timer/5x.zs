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

MachineModifier.setMaxThreads("factory_5x", 32);
MachineModifier.setInternalParallelism("factory_5x", 4);
MachineModifier.setMaxParallelism("factory_5x", 1024);

var Entries = JAOPCA.getMaterialsForType("INGOT");

for entry in Entries {
    if (banList has entry.name) {
        continue;
    }
    RecipeBuilder.newBuilder("ore_5x_" + entry.name as string, "factory_5x", 100)
        .addItemInput(entry.getOreDictEntry("ore"))
        .addFluidInput(<liquid:sulfuric_acid> * 100)
        .addFluidInput(<liquid:water> * 1000)
        .addEnergyPerTickInput(25000)
        .addItemOutput(entry.getItemStack("crystal") * 5)
        .build();
    RecipeBuilder.newBuilder("compound_5x_" + entry.name as string, "factory_5x", 20)
        .addItemInput(entry.getOreDictEntry("compound"))
        .addFluidInput(<liquid:sulfuric_acid> * 20)
        .addFluidInput(<liquid:water> * 200)
        .addEnergyPerTickInput(25000)
        .addItemOutput(entry.getItemStack("crystal"))
        .build();
}