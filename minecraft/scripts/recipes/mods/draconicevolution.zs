/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 1

import moretweaker.draconicevolution.FusionCrafting;

FusionCrafting.remove(<draconicevolution:chaos_shard>);
FusionCrafting.remove(<minecraft:nether_star>);
FusionCrafting.remove(<draconicevolution:draconic_pick>);

FusionCrafting.add(<gct_ores:chaotic_draconium_block> * 4, <draconicevolution:draconic_block> * 4, 2, 1203268000, [ 
    <ore:ingotEverite>,
    <ore:ingotEverite>,
    <draconicevolution:chaos_shard>,
    <draconicevolution:chaos_shard>,
    <contenttweaker:chaos_heart>,
    <contenttweaker:chaos_heart>,
    <ore:metalChaotic>,
    <ore:metalChaotic>
]);
FusionCrafting.add(<gct_ores:stormy_witherium_block> * 4, <gct_ores:relifed_witherium_block> * 4, 2, 1203268000, [ 
    <ore:ingotEverite>,
    <ore:ingotEverite>,
    <gct_ores:stormy_shard>,
    <gct_ores:stormy_shard>,
    <ore:netherStarWithered>,
    <ore:netherStarWithered>,
    <ore:metalChaotic>,
    <ore:metalChaotic>
]);
FusionCrafting.add(<gct_ores:command_core>, <mekanism:controlcircuit:3>, 2, 2147483647, [
    <ore:ingotHarcadium>,
    <ore:ingotHarcadium>,
    <ore:ingotHarcadium>,
    <ore:ingotHarcadium>,
    <ore:ingotVoidEssence>,
    <ore:ingotVoidEssence>,
    <ore:ingotVoidEssence>,
    <ore:ingotVoidEssence>,
    <ore:ingotAdamantium>,
    <ore:ingotAdamantium>,
    <ore:ingotAdamantium>,
    <ore:ingotAdamantium>,
    <ore:blockDraconiumChaotic>,
    <ore:ingotChromasteel>,
    <ore:ingotCrimsonite>,
    <ore:ingotAdaminite>
]);
FusionCrafting.add(<gct_ores:creepy_wither_doll>, <additions:harcadium_block>, 2, 3355443200, [
    <minecraft:skull:1>,
    <minecraft:skull:1>,
    <minecraft:skull:1>,
    <minecraft:skull:1>,
    <minecraft:soul_sand>,
    <minecraft:soul_sand>,
    <minecraft:soul_sand>,
    <minecraft:soul_sand>
]);
FusionCrafting.add(<gct_ores:rng_relinquisher>, <draconicevolution:chaotic_core>, 3, 16777216000, [
    <ore:ingotHarcadium>,
    <ore:ingotHarcadium>,
    <ore:ingotVoidEssence>,
    <ore:ingotVoidEssence>,
    <ore:metalChaotic>,
    <ore:metalChaotic>,
    <ore:metalChaotic>,
    <ore:metalChaotic>
]);
FusionCrafting.add(<minecraft:command_block>, <gct_ores:command_core>, 3, 5242880000, [
    <ore:coreRelifed>,
    <ore:coreRelifed>,
    <ore:coreRelifed>,
    <ore:coreRelifed>,
    <ore:coreRelifed>,
    <ore:coreRelifed>,
    <ore:coreRelifed>,
    <ore:coreRelifed>,
    <ore:coreChaotic>,
    <ore:bedrock>,
    <ore:bedrock>,
    <ore:blockAdamantium>
]);
FusionCrafting.add(<gct_ores:creepy_witherstorm_doll>, <gct_ores:creepy_wither_doll>, 3, 12345678900, [
    <ore:coreEpic>,
    <ore:coreEpic>,
    <ore:blockInsaniumEssence>,
    <minecraft:command_block>
]);
FusionCrafting.add(<gct_ores:ruled_draconium_block> * 4, <gct_ores:chaotic_draconium_block> * 4, 3, 102400000000, [
    <ore:coreChaotic>,
    <contenttweaker:chaos_heart>,
    <ore:blockAdamantium>,
    <contenttweaker:chaos_heart>,
    <ore:blockAdamantium>,
    <ore:blockChaosShard>,
    <ore:blockEverite>,
    <ore:blockEverite>
]);
FusionCrafting.add(<gct_ores:equipment_witherium_block> * 4, <gct_ores:stormy_witherium_block> * 4, 3, 102400000000, [
    <ore:coreStormy>,
    <ore:netherStarWithered>,
    <ore:blockAdamantium>,
    <ore:netherStarWithered>,
    <ore:blockAdamantium>,
    <ore:blockStormyShard>,
    <ore:blockEverite>,
    <ore:blockEverite>
]);
FusionCrafting.add(<gct_ores:relifed_witherium_block> * 4, <tiths:block_witherium> * 4, 1, 350000000, [
    <gct_ores:witheric_core>,
    <gct_ores:witheric_core>,
    <gct_ores:witheric_core>,
    <gct_ores:witheric_core>,
    <gct_ores:witheric_core>,
    <gct_ores:witheric_core>,
    <ore:netherStar>
]);
FusionCrafting.add(<gct_ores:fallen_metal_ingot>, <tconevo:material>, 1, 256000, [
    <gct_ores:fallen_core>,
    <ore:blockRedstone>,
    <ore:gemDiamond>,
    <ore:gemDiamond>
]);
FusionCrafting.add(<gct_ores:relifed_metal_ingot>, <tconevo:material>, 2, 4096000, [
    <gct_ores:relifed_core>,
    <draconicevolution:wyvern_energy_core>,
    <ore:netherStar>,
    <ore:netherStar>
]);
FusionCrafting.add(<gct_ores:stormy_metal_ingot>, <tconevo:material>, 3, 1024000000, [
    <gct_ores:stormy_core>,
    <draconicevolution:draconic_energy_core>,
    <minecraft:dragon_egg>,
    <minecraft:dragon_egg>
]);
FusionCrafting.add(<gct_ores:ordered_fusion_core>, <draconicevolution:fusion_crafting_core>, 3, 131072000000, [
    <ore:gemOrderCrystal>,
    <ore:gemOrderCrystal>,
    <draconicevolution:crafting_injector:3>,
    <draconicevolution:crafting_injector:3>,
    <draconicevolution:crafting_injector:3>,
    <draconicevolution:crafting_injector:3>,
    <draconicevolution:crafting_injector:3>,
    <draconicevolution:crafting_injector:3>,
    <draconicevolution:crafting_injector:3>,
    <draconicevolution:crafting_injector:3>,
    <draconicevolution:crafting_injector:3>,
    <draconicevolution:crafting_injector:3>,
    <draconicevolution:crafting_injector:3>,
    <draconicevolution:crafting_injector:3>,
    <draconicevolution:crafting_injector:3>,
    <draconicevolution:crafting_injector:3>
]);
FusionCrafting.add(<draconicevolution:crafting_injector:1>, <draconicevolution:crafting_injector>, 0, 256000, [
    <gct_ores:fallen_core>,
    <minecraft:diamond>,
    <gct_ores:witheric_core>,
    <minecraft:diamond>,
    <gct_ores:witheric_core>,
    <minecraft:diamond>,
    <tiths:block_witherium>,
    <minecraft:diamond>
]);
FusionCrafting.add(<draconicevolution:crafting_injector:2>, <draconicevolution:crafting_injector:1>, 1, 1792000, [
    <minecraft:diamond>,
    <minecraft:diamond>,
    <gct_ores:fallen_core>,
    <gct_ores:relifed_witherium_block>,
    <gct_ores:fallen_core>,
    <minecraft:diamond>,
    <minecraft:diamond>
]);
FusionCrafting.add(<draconicevolution:crafting_injector:3>, <draconicevolution:crafting_injector:2>, 2, 48000000, [
    <minecraft:diamond>,
    <minecraft:diamond>,
    <gct_ores:stormy_core>,
    <minecraft:dragon_egg>,
    <minecraft:diamond>,
    <minecraft:diamond>
]);
FusionCrafting.add(<minecraft:barrier> * 4, <minecraft:glass> * 4, 3, 500000000, [
    <ore:bedrock>,
    <ore:nuggetCosmilite>,
    <ore:bedrock>,
    <ore:nuggetCosmilite>,
    <ore:bedrock>,
    <ore:nuggetCosmilite>
]);
FusionCrafting.add(<extendedcrafting:material:14>, <extendedcrafting:material:2>, 0, 128000, [
    <ore:ingotVibranium>,
    <ore:ingotVibranium>,
    <extendedcrafting:material:7>,
    <extendedcrafting:material:7>
]);
FusionCrafting.add(<extendedcrafting:material:15>, <extendedcrafting:material:2>, 1, 2560000, [
    <ore:ingotFusionMatrix>,
    <ore:ingotFusionMatrix>,
    <extendedcrafting:material:7>,
    <extendedcrafting:material:7>
]);
FusionCrafting.add(<extendedcrafting:material:16>, <extendedcrafting:material:2>, 2, 51200000, [
    <ore:ingotBalancedMatrix>,
    <ore:ingotBalancedMatrix>,
    <extendedcrafting:material:7>,
    <extendedcrafting:material:7>
]);
FusionCrafting.add(<extendedcrafting:material:17>, <extendedcrafting:material:2>, 3, 1024000000, [
    <ore:ingotRadiationMatrix>,
    <ore:ingotRadiationMatrix>,
    <extendedcrafting:material:7>,
    <extendedcrafting:material:7>
]);
FusionCrafting.add(<extendedcrafting:material:18>, <extendedcrafting:material:2>, 3, 4096000000, [
    <ore:ingotCrystaltine>,
    <ore:ingotCrystaltine>,
    <extendedcrafting:material:7>,
    <extendedcrafting:material:7>
]);
FusionCrafting.add(<godagglomerationplate:godagglomerationplate>, <botanicadds:gaia_plate>, 3, 24000000000, [
    <ore:ingotMythsteel>,
    <ore:ingotMythsteel>,
    <ore:ingotMythsteel>,
    <ore:ingotMythsteel>,
    <ore:ingotCosmilite>,
    <ore:ingotCosmilite>,
    <ore:ingotCosmilite>,
    <ore:ingotCosmilite>,
    <ore:ingotBotanical>,
    <ore:ingotBotanical>,
    <ore:ingotOrichalcosReversed>,
    <ore:ingotOrichalcosReversed>,
    <ore:ingotOrichalcosReversed>,
    <ore:ingotOrichalcosReversed>,
    <ore:blockMana>,
    <ore:blockMana>
]);
FusionCrafting.add(<additions:chaotic_crystal_gem>, <gct_ores:chaos_shard_block>, 3, 1048576000, [
    <ore:gemTerrestrial>,
    <ore:gemTerrestrial>,
    <gct_ores:shalloite>,
    <gct_ores:shalloite>
]);
FusionCrafting.add(<additions:stormy_crystal_gem>, <gct_ores:stormy_shard_block>, 3, 1048576000, [
    <ore:gemTerrestrial>,
    <ore:gemTerrestrial>,
    <gct_ores:shalloite>,
    <gct_ores:shalloite>
]);
FusionCrafting.add(<contenttweaker:chaotic_energy_core>, <draconicevolution:draconic_energy_core>, 2, 8000000000, [
    <draconicevolution:chaos_shard:1>,
    <draconicevolution:chaos_shard:1>,
    <draconicevolution:chaos_shard:1>,
    <draconicevolution:chaos_shard:1>,
    <ore:blockRedstone>,
    <ore:blockRedstone>,
    <ore:blockRedstone>,
    <ore:blockRedstone>
]);
FusionCrafting.add(<avaritia:extreme_crafting_table>, <extendedcrafting:table_ultimate>, 1, 800000000, [ 
    <avaritia:block_resource:2>,
    <avaritia:block_resource:2>,
    <avaritia:resource:1>,
    <avaritia:resource:1>,
    <ore:coreExcellent>,
    <ore:coreExcellent>,
    <additions:ancient_tome_fragment>,
    <additions:ancient_tome_fragment>
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
FusionCrafting.add(<additions:blueprint_tactic>, <additions:blueprint>, 0, 4000000, [ 
    <draconicevolution:draconium_ingot>,
    <draconicevolution:draconium_ingot>,
    <draconicevolution:draconium_ingot>,
    <draconicevolution:draconium_ingot>
]);
FusionCrafting.add(<additions:blueprint_tinkering>, <additions:blueprint>, 0, 4000000, [ 
    <ore:ingotWitherium>,
    <ore:ingotWitherium>,
    <ore:ingotWitherium>,
    <ore:ingotWitherium>
]);
FusionCrafting.add(<draconicevolution:chaotic_core>, <draconicevolution:chaos_shard>, 2, 314572800, [ 
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
    <enderio:item_alloy_endergy_ingot:3>,
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
    <contenttweaker:chaotic_energy_core>,
    <contenttweaker:chaotic_energy_core>,
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
FusionCrafting.add(<additions:creative_shard>, <draconicevolution:chaotic_core>, 3, 2147483648, [
    <ore:ingotCosmilite>,
    <ore:ingotCosmilite>,
    <ore:ingotCosmilite>,
    <ore:ingotCosmilite>,
    <additions:bounty_hunter_medal>,
    <additions:sand_of_time>,
    <additions:ancient_tome_page>,
    <additions:ancient_tome_page>
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
    <enderio:item_alloy_endergy_ingot:3>,
    <ore:ingotOrbadite>,
    <ore:metalWyvern>,
    <ore:metalWyvern>
]);
FusionCrafting.add(<gct_ores:stormy_core>, <gct_ores:stormy_shard>, 2, 3145728000, [ 
    <gct_ores:fallen_metal_ingot>,
    <gct_ores:fallen_metal_ingot>,
    <gct_ores:relifed_metal_ingot>,
    <gct_ores:relifed_metal_ingot>,
    <avaritia:resource:4>,
    <avaritia:resource:4>,
    <additions:chromasteel_ingot>,
    <additions:chromasteel_ingot>
]);
FusionCrafting.add(<additions:basic_fusion_core>, <draconicevolution:fusion_crafting_core>, 0, 256000, [
    <ore:coreBasic>,
    <ore:coreBasic>,
    <draconicevolution:crafting_injector>,
    <draconicevolution:crafting_injector>,
    <draconicevolution:crafting_injector>,
    <draconicevolution:crafting_injector>,
    <draconicevolution:crafting_injector>,
    <draconicevolution:crafting_injector>,
    <draconicevolution:crafting_injector>,
    <draconicevolution:crafting_injector>    
]);
FusionCrafting.add(<additions:wyvern_fusion_core>, <draconicevolution:fusion_crafting_core>, 1, 10240000, [
    <ore:coreExcellent>,
    <ore:coreExcellent>,
    <draconicevolution:crafting_injector:1>,
    <draconicevolution:crafting_injector:1>,
    <draconicevolution:crafting_injector:1>,
    <draconicevolution:crafting_injector:1>,
    <draconicevolution:crafting_injector:1>,
    <draconicevolution:crafting_injector:1>,
    <draconicevolution:crafting_injector:1>,
    <draconicevolution:crafting_injector:1>
]);
FusionCrafting.add(<additions:draconic_fusion_core>, <draconicevolution:fusion_crafting_core>, 2, 204800000, [
    <ore:coreSuperior>,
    <ore:coreSuperior>,
    <draconicevolution:crafting_injector:2>,
    <draconicevolution:crafting_injector:2>,
    <draconicevolution:crafting_injector:2>,
    <draconicevolution:crafting_injector:2>,
    <draconicevolution:crafting_injector:2>,
    <draconicevolution:crafting_injector:2>,
    <draconicevolution:crafting_injector:2>,
    <draconicevolution:crafting_injector:2>
]);
FusionCrafting.add(<minecraft:spawn_egg>.withTag({EntityTag: {id: "thaumadditions:blue_wolf"}}), <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:wolf"}}), 3, 204800000, [
    <thaumadditions:blue_bone>,
    <thaumadditions:blue_bone>
]);
FusionCrafting.add(<additions:chaotic_fusion_core>, <draconicevolution:fusion_crafting_core>, 3, 4096000000, [
    <ore:coreEpic>,
    <ore:coreEpic>,
    <draconicevolution:crafting_injector:3>,
    <draconicevolution:crafting_injector:3>,
    <draconicevolution:crafting_injector:3>,
    <draconicevolution:crafting_injector:3>,
    <draconicevolution:crafting_injector:3>,
    <draconicevolution:crafting_injector:3>,
    <draconicevolution:crafting_injector:3>,
    <draconicevolution:crafting_injector:3>
]);
FusionCrafting.add(<additions:calculus_ingot>, <gct_ores:ruled_draconium_ingot>, 3, 1618033988, [
    <ore:ingotNumbereum>,
    <ore:ingotNumbereum>,
    <ore:ingotNumbereum>,
    <ore:ingotNumbereum>,
    <ore:ingotNumbereum>,
    <ore:ingotNumbereum>,
    <additions:arcane_crystal_ball>,
    <additions:arcane_crystal_ball>
]);