/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 930

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import mods.zenstages.ZenStager;
import mods.zenstages.Stage;
import mods.ItemStages;

import scripts.util.gamestages as GameStagesUtil;


GameStagesUtil.stageDescendantOfTheSun.addOreReplacement(<additions:infernium_ore>, <quark:basalt>, false);
GameStagesUtil.stageDescendantOfTheSun.addOreReplacement(<additions:plasmarite_ore>, <minecraft:end_stone>, false);
GameStagesUtil.stageDescendantOfTheSun.addOreReplacement(<additions:canopium_ore>, <twilightforest:deadrock:2>, false);
GameStagesUtil.stageDescendantOfTheSun.addOreReplacement(<additions:freezite_ore>, <netherex:frostburn_ice>, false);

GameStagesUtil.stageEnderCharm.addOreReplacement(<minecraft:end_portal_frame:*>, <additions:unknown_block>, false);

GameStagesUtil.stageGettingStarted.addOreReplacement(<ore:chest>, <additions:unknown_block>, false);
GameStagesUtil.stageGettingStarted.addOreReplacement(<ore:workbench>, <additions:unknown_block>, false);

GameStagesUtil.stageHardmode.addOreReplacement(<additions:cytosinite_ore>, <biomesoplenty:mud>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<biomesoplenty:gem_ore:*>, <minecraft:stone>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<biomesoplenty:gem_ore:0>, <minecraft:end_stone>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<draconicevolution:draconium_ore:1>, <minecraft:netherrack>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<draconicevolution:draconium_ore:2>, <minecraft:end_stone>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<draconicevolution:draconium_ore>, <minecraft:stone>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<netherex:amethyst_ore>, <minecraft:netherrack>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<ore:oreCryonium>, <minecraft:stone>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<ore:oreTitanium>, <minecraft:end_stone>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<taiga:abyssum_ore:*>, <minecraft:end_stone>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<taiga:aurorium_ore:*>, <minecraft:end_stone>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<taiga:dilithium_ore:*>, <minecraft:stone>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<taiga:duranite_ore:*>, <minecraft:stone>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<taiga:eezo_ore:*>, <minecraft:stone>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<taiga:jauxum_ore:*>, <minecraft:stone:1>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<taiga:karmesine_ore:*>, <minecraft:stone:5>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<taiga:meteorite_block>, <minecraft:stone>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<taiga:meteoritecobble_block>, <minecraft:cobblestone>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<taiga:obsidiorite_block>, <minecraft:stone>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<taiga:obsidioritecobble_block>, <minecraft:cobblestone>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<taiga:osram_ore:*>, <taiga:basalt_block>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<taiga:ovium_ore:*>, <minecraft:stone:3>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<taiga:palladium_ore:*>, <minecraft:end_stone>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<taiga:prometheum_ore:*>, <minecraft:netherrack>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<taiga:tiberium_ore:*>, <minecraft:netherrack>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<taiga:uru_ore:*>, <minecraft:stone>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<taiga:valyrium_ore:*>, <minecraft:netherrack>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<taiga:vibranium_ore:*>, <minecraft:stone>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<additions:aetherium_ore:*>, <aether_legacy:quicksoil>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<additions:mistium_ore:*>, <abyssalcraft:stone:6>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<additions:thyminite_ore:*>, <biomesoplenty:ash_block>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<additions:lavarite_ore:*>, <taiga:basalt_block>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<additions:bnightium_ore:*>, <abyssalcraft:stone>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<additions:guaninite_ore:*>, <abyssalcraft:abyssalsand>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<gct_ores:reditrite_cobblestone:*>, <minecraft:cobblestone>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<gct_ores:reditrite_block:*>, <minecraft:stone>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<additions:snowingium_ore:*>, <minecraft:snow>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<additions:oceanium_ore:*>, <quark:elder_prismarine>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<additions:adeninite_ore:*>, <abyssalcraft:stone:3>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<gct_ores:witherium_ore_overworld:*>, <minecraft:stone>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<gct_ores:witherium_ore_nether:*>, <minecraft:netherrack>, false);
GameStagesUtil.stageHardmode.addOreReplacement(<gct_ores:witherium_ore_end:*>, <minecraft:end_stone>, false);

GameStagesUtil.stageNether.addOreReplacement(<minecraft:anvil:*>, <additions:unknown_block>, false);
GameStagesUtil.stageNether.addOreReplacement(<minecraft:beacon:*>, <additions:unknown_block>, false);
GameStagesUtil.stageNether.addOreReplacement(<minecraft:enchanting_table:*>, <additions:unknown_block>, false);
GameStagesUtil.stageNether.addOreReplacement(<netherendingores:ore_other_1>, <minecraft:stone>, false);
GameStagesUtil.stageNether.addOreReplacement(<ore:oreAeroite>, <aether_legacy:aercloud>, false);
GameStagesUtil.stageNether.addOreReplacement(<divinerpg:rupee_ore>, <minecraft:stone>, false);
GameStagesUtil.stageNether.addOreReplacement(<divinerpg:arlemite_ore>, <minecraft:stone>, false);
GameStagesUtil.stageNether.addOreReplacement(<divinerpg:realmite_ore>, <minecraft:stone>, false);

GameStagesUtil.stageNoviceEngineer.addOreReplacement(<enderio:block_simple_alloy_smelter>, <additions:unknown_block>, false);
GameStagesUtil.stageNoviceEngineer.addOreReplacement(<enderio:block_simple_crafter>, <additions:unknown_block>, false);
GameStagesUtil.stageNoviceEngineer.addOreReplacement(<enderio:block_simple_furnace>, <additions:unknown_block>, false);
GameStagesUtil.stageNoviceEngineer.addOreReplacement(<enderio:block_simple_sag_mill>, <additions:unknown_block>, false);
GameStagesUtil.stageNoviceEngineer.addOreReplacement(<enderio:block_simple_stirling_generator>, <additions:unknown_block>, false);

GameStagesUtil.stageSkilledEngineer.addOreReplacement(<mekanism:oreblock>, <minecraft:stone>, false);
GameStagesUtil.stageSkilledEngineer.addOreReplacement(<netherendingores:ore_end_modded_1:11>, <minecraft:end_stone>, false);
GameStagesUtil.stageSkilledEngineer.addOreReplacement(<netherendingores:ore_end_modded_1:13>, <minecraft:end_stone>, false);
GameStagesUtil.stageSkilledEngineer.addOreReplacement(<netherendingores:ore_end_modded_1:2>, <minecraft:end_stone>, false);
GameStagesUtil.stageSkilledEngineer.addOreReplacement(<netherendingores:ore_end_modded_1:6>, <minecraft:end_stone>, false);
GameStagesUtil.stageSkilledEngineer.addOreReplacement(<netherendingores:ore_nether_modded_1:11>, <minecraft:netherrack>, false);
GameStagesUtil.stageSkilledEngineer.addOreReplacement(<netherendingores:ore_nether_modded_1:13>, <minecraft:netherrack>, false);
GameStagesUtil.stageSkilledEngineer.addOreReplacement(<netherendingores:ore_nether_modded_1:2>, <minecraft:netherrack>, false);
GameStagesUtil.stageSkilledEngineer.addOreReplacement(<netherendingores:ore_nether_modded_1:6>, <minecraft:netherrack>, false);
GameStagesUtil.stageSkilledEngineer.addOreReplacement(<thermalfoundation:ore:6>, <minecraft:stone>, false);
GameStagesUtil.stageSkilledEngineer.addOreReplacement(<thermalfoundation:ore:7>, <minecraft:stone>, false);

GameStagesUtil.stageWitherSlayer.addOreReplacement(<journey:hellstoneore>, <minecraft:netherrack>, false);

GameStagesUtil.stageChaoticDominator.addOreReplacement(<gct_mobs:gravity_debris>, <aether_legacy:holystone>, false);

GameStagesUtil.stageChaotic.addOreReplacement(<additions:harcadium_ore>, <minecraft:stone>, false);
GameStagesUtil.stageChaotic.addOreReplacement(<additions:nether_harcadium_ore>, <minecraft:stone>, false);
GameStagesUtil.stageChaotic.addOreReplacement(<additions:end_harcadium_ore>, <minecraft:stone>, false);
GameStagesUtil.stageChaotic.addOreReplacement(<tiths:ore_redins>, <minecraft:stone>, false);
GameStagesUtil.stageChaotic.addOreReplacement(<tiths:ore_corundum>, <minecraft:stone>, false);
GameStagesUtil.stageChaotic.addOreReplacement(<tiths:ore_pyrophyllite>, <minecraft:stone>, false);
GameStagesUtil.stageChaotic.addOreReplacement(<tiths:ore_lizanite>, <minecraft:netherrack>, false);
GameStagesUtil.stageChaotic.addOreReplacement(<tiths:ore_spinel>, <minecraft:stone>, false);
GameStagesUtil.stageChaotic.addOreReplacement(<tiths:ore_tourmaline>, <minecraft:stone>, false);
GameStagesUtil.stageChaotic.addOreReplacement(<tiths:ore_opal>, <minecraft:stone>, false);
GameStagesUtil.stageChaotic.addOreReplacement(<tiths:ore_cordierite>, <minecraft:stone>, false);
GameStagesUtil.stageChaotic.addOreReplacement(<tiths:ore_prehnite>, <minecraft:stone>, false);

GameStagesUtil.stageEpicEngineer.addOreReplacement(<nuclearcraft:ore:3>, <minecraft:stone>, false);
GameStagesUtil.stageEpicEngineer.addOreReplacement(<nuclearcraft:ore:4>, <minecraft:stone>, false);
GameStagesUtil.stageEpicEngineer.addOreReplacement(<netherendingores:ore_end_modded_1:12>, <minecraft:end_stone>, false);
GameStagesUtil.stageEpicEngineer.addOreReplacement(<netherendingores:ore_end_modded_1:13>, <minecraft:end_stone>, false);
GameStagesUtil.stageEpicEngineer.addOreReplacement(<netherendingores:ore_nether_modded_1:12>, <minecraft:netherrack>, false);
GameStagesUtil.stageEpicEngineer.addOreReplacement(<netherendingores:ore_nether_modded_1:13>, <minecraft:netherrack>, false);
GameStagesUtil.stageEpicEngineer.addOreReplacement(<mekanism:oreblock:5>, <minecraft:stone>, false);
GameStagesUtil.stageEpicEngineer.addOreReplacement(<additions:thallium_ore>, <minecraft:end_stone>, false);

GameStagesUtil.stageMasterEngineer.addOreReplacement(<nuclearcraft:ore:5>, <minecraft:stone>, false);
GameStagesUtil.stageMasterEngineer.addOreReplacement(<nuclearcraft:ore:6>, <minecraft:stone>, false);

GameStagesUtil.stageCosmic.addOreReplacement(<additions:fraxinium_ore>, <minecraft:stone>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:rubium_ore>, <minecraft:stone>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:cestium_ore>, <minecraft:stone>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:vanadium_ore>, <minecraft:stone>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:indium_ore>, <minecraft:stone>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:swinium_ore>, <minecraft:stone>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:gallium_ore>, <minecraft:packed_ice>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:xenidium_ore>, <minecraft:netherrack>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:lighteum_ore>, <minecraft:netherrack>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:rapesesium_ore>, <minecraft:netherrack>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:mangisite_ore>, <biomesoplenty:flesh>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:manarium_ore>, <minecraft:end_stone>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:breakium_ore>, <minecraft:end_stone>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:fenzium_ore>, <minecraft:end_stone>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:sissidium_ore>, <minecraft:end_stone>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:technetium_ore>, <minecraft:end_stone>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:soilium_ore>, <stygian:endobsidian>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:stripium_ore>, <abyssalcraft:stone:1>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:togrium_ore>, <abyssalcraft:stone:2>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:antimony_ore>, <abyssalcraft:stone:3>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:dimesium_ore>, <abyssalcraft:stone:6>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:yoggleseum_ore>, <abyssalcraft:stone:6>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:cloudite_ore>, <aether_legacy:holystone>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:molybdenum_ore>, <aether_legacy:holystone>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:dawnium_ore>, <gct_ores:reditrite_block>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:losessium_ore>, <gct_mobs:bloodyrock>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:oneo_ore>, <minecraft:bedrock>, false);
GameStagesUtil.stageCosmic.addOreReplacement(<additions:ttwo_ore>, <minecraft:bedrock>, false);

GameStagesUtil.stageDisabled.addOreReplacement(<mekanism:oreblock:1>, <thermalfoundation:ore>, false);
GameStagesUtil.stageDisabled.addOreReplacement(<nuclearcraft:ore>, <thermalfoundation:ore>, false);
GameStagesUtil.stageDisabled.addOreReplacement(<tconstruct:common_ore>, <thermalfoundation:ore>, false);
GameStagesUtil.stageDisabled.addOreReplacement(<mekanism:oreblock:2>, <thermalfoundation:ore:1>, false);
GameStagesUtil.stageDisabled.addOreReplacement(<nuclearcraft:ore:1>, <thermalfoundation:ore:1>, false);
GameStagesUtil.stageDisabled.addOreReplacement(<tconstruct:common_ore:1>, <thermalfoundation:ore:1>, false);
GameStagesUtil.stageDisabled.addOreReplacement(<tconstruct:common_ore:2>, <thermalfoundation:ore:4>, false);
GameStagesUtil.stageDisabled.addOreReplacement(<nuclearcraft:ore:4>, <mekanism:oreblock:5>, false);
GameStagesUtil.stageDisabled.addOreReplacement(<netherendingores:ore_end_modded_1:13>, <netherendingores:ore_end_modded_1:12>, false);
GameStagesUtil.stageDisabled.addOreReplacement(<netherendingores:ore_nether_modded_1:13>, <netherendingores:ore_nether_modded_1:12>, false);
GameStagesUtil.stageDisabled.addOreReplacement(<mekanism:oreblock:4>, <thermalfoundation:ore:3>, false);
GameStagesUtil.stageDisabled.addOreReplacement(<nuclearcraft:ore:2>, <thermalfoundation:ore:3>, false);
