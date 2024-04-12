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

var Entries = JAOPCA.getMaterialsForType("INGOT");
var atvi as ComponentDefinition = MBDRegistry.getDefinition("gct_mac:atomic_viberator");
var atvict = atvi as ControllerDefinition;
var atdc as ComponentDefinition = MBDRegistry.getDefinition("gct_mac:atomic_decayer");
var atdcct = atdc as ControllerDefinition;
var atac as ComponentDefinition = MBDRegistry.getDefinition("gct_mac:atomic_acider");
var atacct = atac as ControllerDefinition;

for EntryItem in Entries {
    if (EntryItem.name != JAOPCA.getMaterial("CosmicNeutronium").name) {
        if (EntryItem.name == JAOPCA.getMaterial("Gold").name) {
            dissolution.addRecipe(<jaopca:compound.gold>, <gas:gold> * 200);
        } else if (EntryItem.name == JAOPCA.getMaterial("Iron").name) {
            dissolution.addRecipe(<jaopca:compound.iron>, <gas:iron> * 200);
        } else if (EntryItem.name == JAOPCA.getMaterial("Copper").name) {
            dissolution.addRecipe(<jaopca:compound.copper>, <gas:copper> * 200);
        } else if (EntryItem.name == JAOPCA.getMaterial("Silver").name) {
            dissolution.addRecipe(<jaopca:compound.silver>, <gas:silver> * 200);
        } else if (EntryItem.name == JAOPCA.getMaterial("Osmium").name) {
            dissolution.addRecipe(<jaopca:compound.osmium>, <gas:osmium> * 200);
        } else if (EntryItem.name == JAOPCA.getMaterial("Tin").name) {
            dissolution.addRecipe(<jaopca:compound.tin>, <gas:tin> * 200);
        } else if (EntryItem.name == JAOPCA.getMaterial("Lead").name) {
            dissolution.addRecipe(<jaopca:compound.lead>, <gas:lead> * 200);
        } else {
            dissolution.addRecipe(EntryItem.getItemStack("compound"), mods.mekanism.MekanismHelper.getGas("slurry_" + EntryItem.name) * 200);
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
    }
}

