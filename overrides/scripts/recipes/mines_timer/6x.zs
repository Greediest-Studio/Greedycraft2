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

var Entries = JAOPCA.getOresForType("INGOT");
var atvi as ComponentDefinition = MBDRegistry.getDefinition("gct_mac:atomic_viberator");
var atvict = atvi as ControllerDefinition;
var atdc as ComponentDefinition = MBDRegistry.getDefinition("gct_mac:atomic_decayer");
var atdcct = atdc as ControllerDefinition;
var atac as ComponentDefinition = MBDRegistry.getDefinition("gct_mac:atomic_acider");
var atacct = atac as ControllerDefinition;

for EntryItem in Entries {
    if (EntryItem.oreName != JAOPCA.getOre("CosmicNeutronium").oreName) {
        if (EntryItem.oreName == JAOPCA.getOre("Gold").oreName) {
            dissolution.addRecipe(<jaopca:item_compoundgold>, <gas:gold> * 200);
        } else if (EntryItem.oreName == JAOPCA.getOre("Iron").oreName) {
            dissolution.addRecipe(<jaopca:item_compoundiron>, <gas:iron> * 200);
        } else if (EntryItem.oreName == JAOPCA.getOre("Copper").oreName) {
            dissolution.addRecipe(<jaopca:item_compoundcopper>, <gas:copper> * 200);
        } else if (EntryItem.oreName == JAOPCA.getOre("Silver").oreName) {
            dissolution.addRecipe(<jaopca:item_compoundsilver>, <gas:silver> * 200);
        } else if (EntryItem.oreName == JAOPCA.getOre("Osmium").oreName) {
            dissolution.addRecipe(<jaopca:item_compoundosmium>, <gas:osmium> * 200);
        } else if (EntryItem.oreName == JAOPCA.getOre("Tin").oreName) {
            dissolution.addRecipe(<jaopca:item_compoundtin>, <gas:tin> * 200);
        } else if (EntryItem.oreName == JAOPCA.getOre("Lead").oreName) {
            dissolution.addRecipe(<jaopca:item_compoundlead>, <gas:lead> * 200);
        } else {
            dissolution.addRecipe(EntryItem.getItemStack("compound"), mods.mekanism.MekanismHelper.getGas("slurry" + EntryItem.oreName) * 200);
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

