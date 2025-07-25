/*
 * This script is created for the GreedyCraft modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 1750
#loader multiblocked

import mods.jaopca.JAOPCA;
import mods.mekanism.chemical.dissolution;
import mods.multiblocked.MBDRegistry;
import mods.multiblocked.definition.ControllerDefinition;
import mods.multiblocked.definition.ComponentDefinition;
import mods.multiblocked.recipe.RecipeMap;
import mods.jei.JEI;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;

MachineModifier.setMaxThreads("factory_atomic_vibrator", 32);
MachineModifier.setInternalParallelism("factory_atomic_vibrator", 32);
MachineModifier.setMaxParallelism("factory_atomic_vibrator", 32);

MachineModifier.setMaxThreads("factory_atomic_decayer", 32);
MachineModifier.setInternalParallelism("factory_atomic_decayer", 32);
MachineModifier.setMaxParallelism("factory_atomic_decayer", 32);

MachineModifier.setMaxThreads("factory_atomic_acider", 32);
MachineModifier.setInternalParallelism("factory_atomic_acider", 32);
MachineModifier.setMaxParallelism("factory_atomic_acider", 32);

var Entries = JAOPCA.getMaterialsForType("INGOT");
var atvi as ComponentDefinition = MBDRegistry.getDefinition("gct_mac:atomic_viberator");
var atvict = atvi as ControllerDefinition;
var atdc as ComponentDefinition = MBDRegistry.getDefinition("gct_mac:atomic_decayer");
var atdcct = atdc as ControllerDefinition;
var atac as ComponentDefinition = MBDRegistry.getDefinition("gct_mac:atomic_acider");
var atacct = atac as ControllerDefinition;

function lowerCase(str as string) as string {
    var output as string = "";
    for letter in str.split("") {
        if ("ABCDEFGHIJKLMNOPQRSTUVWXYZ" has letter && output != "") {
            output = output + "_" + letter.toLowerCase();
        } else if ("ABCDEFGHIJKLMNOPQRSTUVWXYZ" has letter && output == "") {
            output = output + letter.toLowerCase();
        } else {
            output = output + letter;
        }
    }
    return output;
}

for EntryItem in Entries {
    if (EntryItem.getOreDictEntry("ingot").name != JAOPCA.getMaterial("CosmicNeutronium").getOreDictEntry("ingot").name) {
        if (EntryItem.getOreDictEntry("ingot").name == JAOPCA.getMaterial("Gold").getOreDictEntry("ingot").name) {
            dissolution.addRecipe(<jaopca:compound.gold>, <gas:gold> * 200);
        } else if (EntryItem.getOreDictEntry("ingot").name == JAOPCA.getMaterial("Iron").getOreDictEntry("ingot").name) {
            dissolution.addRecipe(<jaopca:compound.iron>, <gas:iron> * 200);
        } else if (EntryItem.getOreDictEntry("ingot").name == JAOPCA.getMaterial("Copper").getOreDictEntry("ingot").name) {
            dissolution.addRecipe(<jaopca:compound.copper>, <gas:copper> * 200);
        } else if (EntryItem.getOreDictEntry("ingot").name == JAOPCA.getMaterial("Silver").getOreDictEntry("ingot").name) {
            dissolution.addRecipe(<jaopca:compound.silver>, <gas:silver> * 200);
        } else if (EntryItem.getOreDictEntry("ingot").name == JAOPCA.getMaterial("Osmium").getOreDictEntry("ingot").name) {
            dissolution.addRecipe(<jaopca:compound.osmium>, <gas:osmium> * 200);
        } else if (EntryItem.getOreDictEntry("ingot").name == JAOPCA.getMaterial("Tin").getOreDictEntry("ingot").name) {
            dissolution.addRecipe(<jaopca:compound.tin>, <gas:tin> * 200);
        } else if (EntryItem.getOreDictEntry("ingot").name == JAOPCA.getMaterial("Lead").getOreDictEntry("ingot").name) {
            dissolution.addRecipe(<jaopca:compound.lead>, <gas:lead> * 200);
        } else {
            if (!isNull(mods.mekanism.MekanismHelper.getGas("slurry_" + lowerCase(EntryItem.name)))) {
                dissolution.addRecipe(EntryItem.getItemStack("compound"), mods.mekanism.MekanismHelper.getGas("slurry_" + lowerCase(EntryItem.name)) * 200);
            }
        }
        atvict.recipeMap.start()
            .duration(40)
            .inputFluids(<liquid:neutronium> * 576)
            .inputItems(EntryItem.getOreDictEntry("ore"))
            .inputFE(1.0f, 256000)
            .outputItems(EntryItem.getItemStack("radiation") * 6)
            .buildAndRegister();
        atdcct.recipeMap.start()
            .duration(10)
            .inputItems(EntryItem.getOreDictEntry("radiation"))
            .inputFE(1.0f, 64000)
            .outputItems(EntryItem.getItemStack("pured"))
            .buildAndRegister();
        atacct.recipeMap.start()
            .duration(15)
            .inputFluids(<liquid:hydrofluoric_acid> * 75)
            .inputFluids(<liquid:nitric_acid> * 25)
            .inputItems(EntryItem.getOreDictEntry("pured"))
            .inputFE(1.0f, 256000)
            .outputItems(EntryItem.getItemStack("compound"))
            .buildAndRegister();
        //Factory Recipe
        RecipeBuilder.newBuilder("vib_" ~ lowerCase(EntryItem.name), "factory_atomic_vibrator", 40)
            .addFluidInput(<liquid:neutronium> * 576)
            .addItemInput(EntryItem.getOreDictEntry("ore"))
            .addEnergyPerTickInput(10000)
            .addItemOutput(EntryItem.getItemStack("radiation") * 6)
            .build();
        RecipeBuilder.newBuilder("dec_" ~ lowerCase(EntryItem.name), "factory_atomic_decayer", 10)
            .addItemInput(EntryItem.getOreDictEntry("radiation"))
            .addEnergyPerTickInput(40000)
            .addItemOutput(EntryItem.getItemStack("pured"))
            .build();
        RecipeBuilder.newBuilder("aci_" ~ lowerCase(EntryItem.name), "factory_atomic_acider", 15)
            .addFluidInput(<liquid:aqua_fluoride> * 100)
            .addItemInput(EntryItem.getOreDictEntry("pured"))
            .addEnergyPerTickInput(20000)
            .addItemOutput(EntryItem.getItemStack("compound"))
            .build();
    }
}

