/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */


#priority 3000

import mods.thermalexpansion.Transposer;
import mods.thermalexpansion.Compactor;
import mods.thermalexpansion.InductionSmelter;
import mods.thermalexpansion.Insolator;
import mods.thermalexpansion.Pulverizer;
import mods.thermalexpansion.Infuser;
import mods.thermalexpansion.Coolant;
import mods.thermalexpansion.Enchanter;
import mods.thermalexpansion.Crucible;
import mods.thermalexpansion.Refinery;

Transposer.addFillRecipe(<thermalfoundation:fertilizer:1>, <thermalfoundation:fertilizer:0>, <liquid:resin> * 200, 20);

Crucible.addRecipe(<liquid:hellstone> * 144, <divinerpg:hellstone_ingot>, 50);

InductionSmelter.removeRecipe(<thermalfoundation:material:768>, <thermalfoundation:material>);
InductionSmelter.removeRecipe(<thermalfoundation:material:769>, <thermalfoundation:material>);
InductionSmelter.removeRecipe(<thermalfoundation:material:802>, <thermalfoundation:material>);
InductionSmelter.removeRecipe(<thermalfoundation:material:768>, <minecraft:iron_ingot>);
InductionSmelter.removeRecipe(<thermalfoundation:material:769>, <minecraft:iron_ingot>);
InductionSmelter.removeRecipe(<thermalfoundation:material:802>, <minecraft:iron_ingot>);

Insolator.removeRecipe(<appliedenergistics2:crystal_seed>, <minecraft:glowstone_dust>);
Insolator.removeRecipe(<appliedenergistics2:crystal_seed:600>, <minecraft:glowstone_dust>);
Insolator.removeRecipe(<appliedenergistics2:crystal_seed:1200>, <minecraft:glowstone_dust>);

Insolator.addRecipe(<thebetweenlands:spirit_fruit>,
 <thebetweenlands:sapling_spirit_tree>, 
 <thebetweenlands:sap_spit>*4, 
 25000, 
 <thebetweenlands:sapling_spirit_tree>, 
 105);
 
Insolator.addRecipe(<thebetweenlands:forbidden_fig>,
 <thebetweenlands:forbidden_fig>, 
 <thebetweenlands:sap_spit>*4, 
 25000, 
 <thebetweenlands:forbidden_fig>, 
 15);

Pulverizer.addRecipe(<additions:purifying_dust> * 8, <botania:specialflower>.withTag({type: "puredaisy"}), 600);

InductionSmelter.addRecipe(<additions:glowing_signalum_ingot>, <additions:glowing_signalum_dust>, <minecraft:sand>, 4000);
InductionSmelter.addRecipe(<minecraft:dye:15>, <additions:cytosinite_ingot>, <mekanism:otherdust>, 1000000, <additions:uracilite_ingot>, 2);
InductionSmelter.addRecipe(<minecraft:dye:15>, <additions:adeninite_ingot>, <mekanism:otherdust>, 1000000, <additions:uracilite_ingot>, 2);
InductionSmelter.addRecipe(<minecraft:dye:15>, <additions:guaninite_ingot>, <mekanism:otherdust>, 1000000, <additions:uracilite_ingot>, 2);
InductionSmelter.addRecipe(<minecraft:dye:15>, <additions:thyminite_ingot>, <mekanism:otherdust>, 1000000, <additions:uracilite_ingot>, 2);

Transposer.addFillRecipe(<additions:glowing_signalum_dust>, <thermalfoundation:material:101>, <fluid:glowstone> * 1000, 4000);
Transposer.addFillRecipe(<additions:thermallite_core_1>, <additions:balance_core>, <liquid:pyrotheum> * 10000, 256000);
Transposer.addFillRecipe(<additions:thermallite_core_2>, <additions:thermallite_core_1>, <liquid:cryotheum> * 10000, 256000);
Transposer.addFillRecipe(<additions:thermallite_core_3>, <additions:thermallite_core_2>, <liquid:aerotheum> * 10000, 256000);
Transposer.addFillRecipe(<additions:thermallite_core_4>, <additions:thermallite_core_3>, <liquid:petrotheum> * 10000, 256000);
Transposer.addFillRecipe(<additions:thermallite_core_5>, <additions:thermallite_core_4>, <liquid:lumixeium> * 10000, 256000);
Transposer.addFillRecipe(<additions:thermallite_core_6>, <additions:thermallite_core_5>, <liquid:noxexeum> * 10000, 256000);
Transposer.addFillRecipe(<additions:thermallite_core_7>, <additions:thermallite_core_6>, <liquid:tonitruium> * 10000, 256000);
Transposer.addFillRecipe(<additions:thermallite_ingot>, <additions:thermallite_core_7>, <liquid:naturaeum> * 10000, 256000);
Transposer.addFillRecipe(<jaopca:dust.husturite>, <jaopca:dust.cthulhurite>, <liquid:aerotheum> * 6400, 400000);
Transposer.addFillRecipe(<additions:glowing_crystal>, <astralsorcery:itemcraftingcomponent>, <liquid:glowstone> * 750, 3000);

Infuser.addRecipe(<thaumcraft:primordial_pearl>, <thaumcraft:primordial_pearl:1>, 200000);
Infuser.addRecipe(<thaumcraft:primordial_pearl>, <thaumcraft:primordial_pearl:2>, 400000);
Infuser.addRecipe(<thaumcraft:primordial_pearl>, <thaumcraft:primordial_pearl:3>, 600000);
Infuser.addRecipe(<thaumcraft:primordial_pearl>, <thaumcraft:primordial_pearl:4>, 800000);
Infuser.addRecipe(<thaumcraft:primordial_pearl>, <thaumcraft:primordial_pearl:5>, 1000000);
Infuser.addRecipe(<thaumcraft:primordial_pearl>, <thaumcraft:primordial_pearl:6>, 1200000);
Infuser.addRecipe(<thaumcraft:primordial_pearl>, <thaumcraft:primordial_pearl:7>, 1400000);
Infuser.addRecipe(<thaumcraft:primordial_pearl>, <thaumcraft:primordial_pearl:8>, 1600000);
Infuser.addRecipe(<draconicevolution:draconium_block:1>, <draconicevolution:draconium_block>, 100000);

Coolant.addCoolant(<liquid:cryonium>, 6000000, 75);
Coolant.addCoolant(<liquid:ice_alloy>, 7000000, 80);
Coolant.addCoolant(<liquid:liquid_helium>, 8000000, 100);
Coolant.addCoolant(<liquid:hecryo_liquid>, 10000000, 100);

Refinery.addRecipe(<liquid:rich_brine> * 100, null, <liquid:brine> * 1000, 100000);
Refinery.addRecipe(<liquid:mixed_hydrocarbon> * 100, null, <liquid:refined_fuel> * 150, 50000);

