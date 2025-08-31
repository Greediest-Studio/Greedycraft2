/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 750

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import mods.zenstages.ZenStager;
import mods.zenstages.Stage;
import mods.ItemStages;

import scripts.util.gamestages as GameStagesUtil;

GameStagesUtil.removeItemStages([
    <extrabotany:candybag>,
    <extrabotany:candy:*>,
    <ore:rock>,
    <ore:gemBoronNitride>,
    <ore:dustBoronNitride>,
    <taiga:basalt_block>,
    <ore:dustDiamond>,
    <cyclicmagic:slingshot_weapon>,
    <aether_legacy:aercloud:*>,
    <ore:dustSalt>,
    <mekanism:salt>,
    <bloodmagic:monster_soul:3>,
    <ore:blockSalt>,
    <aether_legacy:ambrosium_shard>,
    <cyclicmagic:ender_tnt_6>,
    <cyclicmagic:ender_tnt_5>,
    <cyclicmagic:ender_tnt_4>,
    <cyclicmagic:ender_tnt_3>,
    <cyclicmagic:ender_tnt_2>,
    <cyclicmagic:ender_tnt_1>,
    <extrabotany:material>,
    <extrabotany:bottledstar>,
    <extrabotany:bottledpixie>,
    <extrabotany:rewardbag:*>,
    <mekanism:basicblock:3>,
    <nuclearcraft:ingot_block:7>,
    <nuclearcraft:ore:7>,
    <nuclearcraft:ingot:7>,
    <nuclearcraft:ingot_block:8>,
    <nuclearcraft:ingot_block:12>,
    <nuclearcraft:material_block:2>,
    <nuclearcraft:ingot:8>,
    <nuclearcraft:dust:8>,
    <nuclearcraft:gem:6>,
    <nuclearcraft:ingot:11>,
    <nuclearcraft:dust:11>,
    <extendedcrafting:material:129>,
    <extendedcrafting:material:128>,
    <extendedcrafting:material:140>,
    <nuclearcraft:gem_dust:2>,
    <nuclearcraft:ingot_block:11>,
    <extendedcrafting:material:36>,
    <extendedcrafting:material:37>,
    <extendedcrafting:storage:5>,
    <nuclearcraft:fission_dust:6>
] as IIngredient[]);

GameStagesUtil.restageItems("wielder_of_infinity", [
    <avaritia:infinity_sword>,
    <avaritia:infinity_bow>,
    <avaritia:infinity_pickaxe>,
    <avaritia:infinity_shovel>,
    <avaritia:infinity_axe>,
    <avaritia:infinity_hoe>,
    <avaritia:infinity_helmet>,
    <avaritia:infinity_chestplate>,
    <avaritia:infinity_pants>,
    <avaritia:infinity_boots>,
    <ore:ingotInfinity>,
    <ore:blockInfinity>,
    <bloodmagic:sacrificial_dagger:1>,
    <thermalcultivation:watering_can:32000>
]);

GameStagesUtil.restageItems("warped", [
    <gct_aby:key_of_warped>,
    <gct_aby:key_of_warped_active>
]);

GameStagesUtil.restageItem("awakened", <draconicevolution:chaos_shard>);
GameStagesUtil.restageItem("chaotic_dominator", <draconicevolution:chaotic_core>);
GameStagesUtil.restageItem("quardstate", <draconicevolution:awakened_core>);
GameStagesUtil.restageItems("chaotic", [
    <mekanism:machineblock2:14>,
    <avaritia:resource:5>,
    <draconicevolution:reactor_component>
]);
GameStagesUtil.restageItems("master_engineer", [
    <enderio:block_killer_joe>,
    <cyclicmagic:block_user>,
    <ore:alloyUltimate>,
    <ore:circuitUltimate>
]);
GameStagesUtil.restageItems("wither_slayer", [
    <enderio:block_reinforced_obsidian>, 
    <enderio:item_alloy_endergy_ingot:3>
]);
GameStagesUtil.restageItem("awakened", <cyclicmagic:glowing_chorus>);
GameStagesUtil.restageItems("getting_started", [
    <cyclicmagic:crafting_food>,
    <cyclicmagic:sandstone_pickaxe>,
    <cyclicmagic:sandstone_axe>,
    <cyclicmagic:sandstone_spade>,
    <ore:ingotAluminum>,
    <ore:ingotAluminium>,
    <ore:ingotBronze>,
    <ore:ingotTin>,
    <ore:ingotCopper>,
    <ore:ingotSilver>,
    <ore:ingotLead>,
    <ore:ingotNickel>,
    <ore:ingotMithril>,
    <ore:ingotSteel>,
    <ore:ingotElectrum>,
    <ore:ingotInvar>,
    <ore:ingotConstantan>,
    <ore:ingotSignalum>
]);
GameStagesUtil.restageItems("fusion_matrix", [ 
    <ore:dustDraconium>,
    <draconicevolution:wyvern_core>,
    <draconicevolution:draconic_core>,
    <ore:ingotDraconium>,
    <ore:oreDraconium>,
    <ore:dustDraconium>,
    <ore:blockDraconium>,
    <ore:ingotDraconiumAwakened>,
    <ore:blockDraconiumAwakened>,
    <ore:nuggetDraconiumAwakened>,
    <mysticalagradditions:awakened_draconium_essence>,
    <mysticalagradditions:special:4>,
    <ore:nuggetDraconium>,
    <draconicevolution:draconium_chest>,
    <mysticalagriculture:draconium_essence>
]);
GameStagesUtil.restageItems("wyvern", [
    <avaritia:neutron_collector>, 
    <avaritia:resource:2>,
    <ore:nuggetCosmicNeutronium>,
    <ore:ingotCosmicNeutronium>,
    <ore:blockCosmicNeutronium>
] as IIngredient[]);
GameStagesUtil.restageItem("awakened", <avaritia:neutronium_compressor>);
GameStagesUtil.restageItems("hardmode", [
    <cyclicmagic:block_disenchanter>,
    <extendedcrafting:storage:2>,
    <nuclearcraft:ingot_block2:1>
]);
GameStagesUtil.restageItem("fusion_matrix", <cyclicmagic:ender_lightning>);
GameStagesUtil.restageItems("graduated", [
    <cyclicmagic:battery_infinite>,
    <projecte:item.pe_harvest_god>,
    <draconicevolution:draconium_capacitor:2>,
    <projectex:final_star>,
    <draconicevolution:creative_exchanger>
]);
GameStagesUtil.restageItems("master_engineer", [
    <cyclicmagic:harvester_block>,
    <nuclearcraft:centrifuge>,
    <nuclearcraft:manufactory>,
    <nuclearcraft:infuser>,
    <nuclearcraft:melter>,
    <nuclearcraft:supercooler>,
    <nuclearcraft:electrolyzer>,
    <nuclearcraft:pressurizer>,
    <nuclearcraft:chemical_reactor>,
    <nuclearcraft:salt_mixer>,
    <nuclearcraft:crystallizer>,
    <nuclearcraft:enricher>,
    <nuclearcraft:compound:5>,
    <nuclearcraft:part:10>,
    <nuclearcraft:part:8>,
    <nuclearcraft:part:4>,
    <nuclearcraft:part:1>,
    <nuclearcraft:part>,
    <nuclearcraft:alloy:1>,
    <nuclearcraft:ingot:6>,
    <nuclearcraft:alloy:6>,
    <nuclearcraft:ingot:5>,
    <nuclearcraft:part:7>,
    <nuclearcraft:alloy:3>,
    <nuclearcraft:part:9>,
    <nuclearcraft:alloy:2>,
    <ore:ingotLithium>,
    <ore:oreLithium>,
    <ore:blockLithium>,
    <ore:dustLithium>,
    <ore:ingotBoron>,
    <ore:oreBoron>,
    <ore:blockBoron>,
    <ore:dustBoron>,
    <ore:ingotFerroboron>,
    <ore:ingotTough>,
    <ore:ingotHardCarbon>
] as IIngredient[]);
GameStagesUtil.restageItems("master_wizard", [
    <astralsorcery:blockstarlightinfuser>,
    <astralsorcery:blockattunementaltar>,
    <astralsorcery:blockaltar:3>,
    <astralsorcery:blockprism>,
    <astralsorcery:itemshiftingstar>,
    <astralsorcery:itemcraftingcomponent:4>
] as IIngredient[]);
GameStagesUtil.restageItems("energy_matter_core", [
    <projectex:stone_table>,
    <projectex:arcane_tablet>,
    <projecte:transmutation_table>,
    <projecte:item.pe_transmutation_tablet>,
    <projectex:collector:*>,
    <projectex:matter:*>,
    <projecte:condenser_mk1>,
    <projecte:condenser_mk2>
] as IIngredient[]);
GameStagesUtil.restageItems("epic_engineer", [
    <mekanismgenerators:generator:10>,
    <mekanismgenerators:generator:11>,
    <mekanismgenerators:generator:12>,
    <mekanismgenerators:generator:7>,
    <mekanismgenerators:turbineblade>
] as IIngredient[]);
GameStagesUtil.restageItems("skilled_engineer", [
    <nuclearcraft:alloy:9>
] as IIngredient[]);