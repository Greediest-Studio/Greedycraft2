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
import mods.jaopca.JAOPCA;

Transposer.addFillRecipe(<thermalfoundation:fertilizer:1>, <thermalfoundation:fertilizer:0>, <liquid:resin> * 200, 20);

Crucible.removeRecipe(<divinerpg:hellstone_ingot>);
Crucible.removeRecipe(<additions:mekaddon-hydrogen_ingot>);
Crucible.removeRecipe(<additions:mekaddon-helium_ingot>);
Crucible.removeRecipe(<additions:mekaddon-nitrogen_ingot>);
Crucible.removeRecipe(<additions:mekaddon-oxygen_ingot>);
Crucible.removeRecipe(<additions:mekaddon-fluorine_ingot>);
Crucible.removeRecipe(<additions:mekaddon-neon_ingot>);
Crucible.removeRecipe(<additions:mekaddon-argon_ingot>);
Crucible.removeRecipe(<additions:mekaddon-krypton_ingot>);
Crucible.removeRecipe(<additions:mekaddon-xenon_ingot>);
Crucible.removeRecipe(<additions:mekaddon-radon_ingot>);
Crucible.removeRecipe(<jaopca:item_nuggethydrogen>);
Crucible.removeRecipe(<jaopca:item_nuggethelium>);
Crucible.removeRecipe(<jaopca:item_nuggetnitrogen>);
Crucible.removeRecipe(<jaopca:item_nuggetoxygen>);
Crucible.removeRecipe(<jaopca:item_nuggetfluorine>);
Crucible.removeRecipe(<jaopca:item_nuggetneon>);
Crucible.removeRecipe(<jaopca:item_nuggetargon>);
Crucible.removeRecipe(<jaopca:item_nuggetkrypton>);
Crucible.removeRecipe(<jaopca:item_nuggetxenon>);
Crucible.removeRecipe(<jaopca:item_nuggetradon>);
Crucible.removeRecipe(<jaopca:block_blockhydrogen>);
Crucible.removeRecipe(<jaopca:block_blockhelium>);
Crucible.removeRecipe(<jaopca:block_blocknitrogen>);
Crucible.removeRecipe(<jaopca:block_blockoxygen>);
Crucible.removeRecipe(<jaopca:block_blockfluorine>);
Crucible.removeRecipe(<jaopca:block_blockneon>);
Crucible.removeRecipe(<jaopca:block_blockargon>);
Crucible.removeRecipe(<jaopca:block_blockkrypton>);
Crucible.removeRecipe(<jaopca:block_blockxenon>);
Crucible.removeRecipe(<jaopca:block_blockradon>);
Crucible.removeRecipe(<jaopca:item_dusthydrogen>);
Crucible.removeRecipe(<jaopca:item_dusthelium>);
Crucible.removeRecipe(<jaopca:item_dustnitrogen>);
Crucible.removeRecipe(<jaopca:item_dustoxygen>);
Crucible.removeRecipe(<jaopca:item_dustfluorine>);
Crucible.removeRecipe(<jaopca:item_dustneon>);
Crucible.removeRecipe(<jaopca:item_dustargon>);
Crucible.removeRecipe(<jaopca:item_dustkrypton>);
Crucible.removeRecipe(<jaopca:item_dustxenon>);
Crucible.removeRecipe(<jaopca:item_dustradon>);
Crucible.removeRecipe(<jaopca:item_platehydrogen>);
Crucible.removeRecipe(<jaopca:item_platehelium>);
Crucible.removeRecipe(<jaopca:item_platenitrogen>);
Crucible.removeRecipe(<jaopca:item_plateoxygen>);
Crucible.removeRecipe(<jaopca:item_platefluorine>);
Crucible.removeRecipe(<jaopca:item_plateneon>);
Crucible.removeRecipe(<jaopca:item_plateargon>);
Crucible.removeRecipe(<jaopca:item_platekrypton>);
Crucible.removeRecipe(<jaopca:item_platexenon>);
Crucible.removeRecipe(<jaopca:item_plateradon>);

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

Pulverizer.addRecipe(<nyx:meteor_dust>, <nyx:meteor_ingot>, 600);
Pulverizer.addRecipe(<nyx:meteor_dust> * 9, <nyx:meteor_block>, 600);
Pulverizer.addRecipe(<nyx:meteor_dust>, <nyx:meteor_shard>, 600);
Pulverizer.addRecipe(<additions:greedycraft-purifying_dust> * 8, <botania:specialflower>.withTag({type: "puredaisy"}), 600);

InductionSmelter.addRecipe(<additions:greedycraft-glowing_signalum_ingot>, <additions:greedycraft-glowing_signalum_dust>, <minecraft:sand>, 4000);
InductionSmelter.addRecipe(<minecraft:dye:15>, <additions:cytosinite_ingot>, <mekanism:otherdust>, 1000000, <additions:greedycraft-uracilite_ingot>, 2);
InductionSmelter.addRecipe(<minecraft:dye:15>, <additions:greedycraft-adeninite_ingot>, <mekanism:otherdust>, 1000000, <additions:greedycraft-uracilite_ingot>, 2);
InductionSmelter.addRecipe(<minecraft:dye:15>, <additions:greedycraft-guaninite_ingot>, <mekanism:otherdust>, 1000000, <additions:greedycraft-uracilite_ingot>, 2);
InductionSmelter.addRecipe(<minecraft:dye:15>, <additions:greedycraft-thyminite_ingot>, <mekanism:otherdust>, 1000000, <additions:greedycraft-uracilite_ingot>, 2);

Transposer.addFillRecipe(<additions:greedycraft-glowing_signalum_dust>, <thermalfoundation:material:101>, <fluid:glowstone> * 1000, 4000);
Transposer.addFillRecipe(<additions:mekaddon-thermallite_core_1>, <additions:mekaddon-balance_core>, <liquid:pyrotheum> * 10000, 256000);
Transposer.addFillRecipe(<additions:mekaddon-thermallite_core_2>, <additions:mekaddon-thermallite_core_1>, <liquid:cryotheum> * 10000, 256000);
Transposer.addFillRecipe(<additions:mekaddon-thermallite_core_3>, <additions:mekaddon-thermallite_core_2>, <liquid:aerotheum> * 10000, 256000);
Transposer.addFillRecipe(<additions:mekaddon-thermallite_core_4>, <additions:mekaddon-thermallite_core_3>, <liquid:petrotheum> * 10000, 256000);
Transposer.addFillRecipe(<additions:mekaddon-thermallite_core_5>, <additions:mekaddon-thermallite_core_4>, <liquid:lumixeium> * 10000, 256000);
Transposer.addFillRecipe(<additions:mekaddon-thermallite_core_6>, <additions:mekaddon-thermallite_core_5>, <liquid:noxexeum> * 10000, 256000);
Transposer.addFillRecipe(<additions:mekaddon-thermallite_core_7>, <additions:mekaddon-thermallite_core_6>, <liquid:tonitruium> * 10000, 256000);
Transposer.addFillRecipe(<additions:mekaddon-thermallite_ingot>, <additions:mekaddon-thermallite_core_7>, <liquid:naturaeum> * 10000, 256000);
Transposer.addFillRecipe(<jaopca:item_dusthusturite>, <jaopca:item_dustcthulhurite>, <liquid:aerotheum> * 6400, 400000);
Transposer.addFillRecipe(<additions:greedycraft-glowing_crystal>, <astralsorcery:itemcraftingcomponent>, <liquid:glowstone> * 750, 3000);

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

