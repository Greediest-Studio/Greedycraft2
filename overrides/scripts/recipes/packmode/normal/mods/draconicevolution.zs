/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */ 

#priority 1

import moretweaker.draconicevolution.FusionCrafting;

FusionCrafting.remove(<draconicevolution:chaos_shard>);
FusionCrafting.remove(<minecraft:nether_star>);
FusionCrafting.remove(<draconicevolution:draconic_pick>);

FusionCrafting.add(<avaritia:extreme_crafting_table>, <extendedcrafting:table_ultimate>, 1, 800000000, [ 
    <avaritia:block_resource:2>,
    <avaritia:block_resource:2>,
    <avaritia:resource:1>,
    <avaritia:resource:1>,
    <ore:coreExcellent>,
    <ore:coreExcellent>,
    <additions:greedycraft-ancient_tome_fragment>,
    <additions:greedycraft-ancient_tome_fragment>
]);
FusionCrafting.add(<draconicevolution:awakened_core>, <minecraft:nether_star>, 1, 393216000, [ 
    <ore:coreExcellent>,
    <ore:coreExcellent>,
    <draconicevolution:draconic_ingot>,
    <draconicevolution:draconic_ingot>,
    <additions:aeonsteel_ingot>,
    <ore:metalAwakened>,
    <additions:aeonsteel_ingot>,
    <ore:metalAwakened>
]);
FusionCrafting.add(<additions:greedycraft-blueprint_tactic>, <additions:greedycraft-blueprint>, 0, 4000000, [ 
    <draconicevolution:draconium_ingot>,
    <draconicevolution:draconium_ingot>,
    <draconicevolution:draconium_ingot>,
    <draconicevolution:draconium_ingot>
]);
FusionCrafting.add(<additions:greedycraft-blueprint_tinkering>, <additions:greedycraft-blueprint>, 0, 4000000, [ 
    <ore:ingotWitherium>,
    <ore:ingotWitherium>,
    <ore:ingotWitherium>,
    <ore:ingotWitherium>
]);
FusionCrafting.add(<draconicevolution:chaotic_core>, <draconicevolution:chaos_shard>, 2, 3145728000, [ 
    <tconevo:metal>,
    <tconevo:metal>,
    <tconevo:metal:5>,
    <tconevo:metal:5>,
    <avaritia:resource:4>,
    <avaritia:resource:4>,
    <additions:chromasteel_ingot>,
    <additions:chromasteel_ingot>
]);
FusionCrafting.add(<draconicevolution:wyvern_core>, <minecraft:nether_star>, 0, 24576000, [ 
    <ore:coreDraconium>,
    <ore:coreDraconium>,
    <ore:coreDraconium>,
    <ore:coreDraconium>,
    <ore:ingotNiobium>,
    <ore:ingotOrbadite>,
    <ore:metalWyvern>,
    <ore:metalWyvern>
]);
FusionCrafting.add(<solarflux:solar_panel_wyvern>, <solarflux:solar_panel_8>, 1, 12800000, [ 
    <tconevo:metal>,
    <tconevo:metal>,
    <tconevo:metal>,
    <tconevo:metal>,
    <draconicevolution:wyvern_energy_core>,
    <draconicevolution:wyvern_energy_core>,
    <draconicevolution:wyvern_energy_core>,
    <draconicevolution:wyvern_energy_core>
]);
FusionCrafting.add(<solarflux:solar_panel_draconic>, <solarflux:solar_panel_wyvern>, 2, 102400000, [ 
    <tconevo:metal:5>,
    <tconevo:metal:5>,
    <tconevo:metal:5>,
    <tconevo:metal:5>,
    <draconicevolution:draconic_energy_core>,
    <draconicevolution:draconic_energy_core>,
    <draconicevolution:draconic_energy_core>,
    <draconicevolution:draconic_energy_core>
]);
FusionCrafting.add(<draconicevolution:reactor_core>, <draconicevolution:chaos_shard>, 3, 3276800000, [ 
    <additions:cosmilite_ingot>,
    <additions:cosmilite_ingot>,
    <tconevo:metal:5>,
    <tconevo:metal:5>,
    <draconicadditions:chaotic_energy_core>,
    <draconicadditions:chaotic_energy_core>,
    <ore:metalEvery>,
    <ore:metalEvery>
]);
FusionCrafting.add(<additions:electronium_ingot>, <tconevo:material>, 0, 100000000, [ 
    <redstonearsenal:material:32>,
    <redstonerepository:material:1>,
    <redstonearsenal:material:32>,
    <redstonerepository:material:1>,
    <redstonearsenal:material:32>,
    <redstonerepository:material:1>,
    <redstonearsenal:material:32>,
    <redstonerepository:material:1>
]);
FusionCrafting.add(<additions:greedycraft-creative_shard>, <draconicevolution:chaotic_core>, 3, 2147483648, [
    <ore:ingotCosmilite>,
    <ore:ingotCosmilite>,
    <ore:ingotCosmilite>,
    <ore:ingotCosmilite>,
    <additions:greedycraft-bounty_hunter_medal>,
    <additions:greedycraft-sand_of_time>,
    <additions:greedycraft-ancient_tome_page>,
    <additions:greedycraft-ancient_tome_page>
]);
FusionCrafting.add(<gct_ores:relifed_core>, <minecraft:nether_star>, 1, 393216000, [ 
    <ore:coreExcellent>,
    <ore:coreExcellent>,
    <gct_ores:relifed_witherium_ingot>,
    <gct_ores:relifed_witherium_ingot>,
    <additions:aeonsteel_ingot>,
    <ore:metalAwakened>,
    <additions:aeonsteel_ingot>,
    <ore:metalAwakened>
]);
FusionCrafting.add(<gct_ores:fallen_core>, <minecraft:nether_star>, 0, 24576000, [ 
    <ore:coreWitherium>,
    <ore:coreWitherium>,
    <ore:coreWitherium>,
    <ore:coreWitherium>,
    <ore:ingotNiobium>,
    <ore:ingotOrbadite>,
    <ore:metalWyvern>,
    <ore:metalWyvern>
]);
FusionCrafting.add(<gct_ores:stormy_core>, <gct_ores:stormy_shard>, 2, 3145728000, [ 
    <tconevo:metal>,
    <tconevo:metal>,
    <tconevo:metal:5>,
    <tconevo:metal:5>,
    <avaritia:resource:4>,
    <avaritia:resource:4>,
    <additions:chromasteel_ingot>,
    <additions:chromasteel_ingot>
]);