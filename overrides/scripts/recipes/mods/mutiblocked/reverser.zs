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

var reverser as ComponentDefinition = MBDRegistry.getDefinition("gct_mac:reverser");
var reverserct = reverser as ControllerDefinition;

reverserct.recipeMap.start()
    .duration(100)
    .inputFluids(<liquid:liquidantimatter> * 100)
    .inputItems(<ore:ingotOrichalcos>)
    .outputItems(<additions:botaniaddon-reversed_orichalcos>)
    .buildAndRegister();