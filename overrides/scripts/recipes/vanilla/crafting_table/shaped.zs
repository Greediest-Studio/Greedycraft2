/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */

#priority 4000

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import scripts.util.recipes as RecipeUtil;
import scripts.util.lang as LangUtil;

////////////////////////////////
//                            //
//      Shaped   Recipes      //
//                            //
////////////////////////////////

recipes.remove(<divinerpg:mysterious_clock>);
recipes.remove(<divinerpg:twilight_clock>);
recipes.remove(<theaurorian:aurorianportalframebricks>);
recipes.remove(<journey:eucaportalframe>);
recipes.remove(<utilityworlds:portal_void>);
recipes.remove(<utilityworlds:portal_garden>);
recipes.remove(<divinerpg:infernal_flame>);
recipes.remove(<avaritia:neutron_collector>);
recipes.remove(<additions:greedycraft-slime_crown>);
recipes.remove(<divinerpg:snow_globe>);
recipes.remove(<divinerpg:arcana_portal_frame>);
recipes.remove(<journey:flamecoin>);
recipes.remove(<journey:summoningtable>);
recipes.remove(<journey:boilingportalframe>);
recipes.remove(<divinerpg:horde_horn>);
recipes.remove(<divinerpg:call_of_the_watcher>);
recipes.remove(<naturesaura:gold_fiber>);

recipes.addShaped(<gugu-utils:starlightinputhatch:2>, [[<modularmachinery:itemmodularium>, <ore:ingotAstralMetal>, <modularmachinery:itemmodularium>],[<ore:ingotAstralMetal>, <gugu-utils:starlightinputhatch:1>, <ore:ingotAstralMetal>], [<modularmachinery:itemmodularium>, <ore:ingotAstralMetal>, <modularmachinery:itemmodularium>]]);
recipes.addShaped(<additions:botaniaddon-elfsteel_block>, [[<ore:ingotElfsteel>, <ore:ingotElfsteel>, <ore:ingotElfsteel>],[<ore:ingotElfsteel>, <ore:ingotElfsteel>, <ore:ingotElfsteel>], [<ore:ingotElfsteel>, <ore:ingotElfsteel>, <ore:ingotElfsteel>]]);
recipes.addShaped(<actuallyadditions:block_giant_chest_large>, [[<prefab:item_bundle_of_timber>, <ore:ingotIridium>, <prefab:item_bundle_of_timber>],[<ore:ingotIridium>, <actuallyadditions:block_giant_chest_medium>, <ore:ingotIridium>], [<prefab:item_bundle_of_timber>, <ore:ingotIridium>, <prefab:item_bundle_of_timber>]]);
recipes.addShaped(<actuallyadditions:block_giant_chest_medium>, [[<prefab:item_bundle_of_timber>, <ore:ingotChrome>, <prefab:item_bundle_of_timber>],[<ore:ingotChrome>, <actuallyadditions:block_giant_chest>, <ore:ingotChrome>], [<prefab:item_bundle_of_timber>, <ore:ingotChrome>, <prefab:item_bundle_of_timber>]]);
recipes.addShaped(<actuallyadditions:block_giant_chest>, [[<prefab:item_bundle_of_timber>, <ore:ingotIron>, <prefab:item_bundle_of_timber>],[<ore:ingotIron>, <ore:chest>, <ore:ingotIron>], [<prefab:item_bundle_of_timber>, <ore:ingotIron>, <prefab:item_bundle_of_timber>]]);
recipes.addShaped(<divinerpg:mysterious_clock> * 1, [[<divinerpg:netherite_chunk>, <tconstruct:ingots:2>, <divinerpg:netherite_chunk>], [<divinerpg:shadow_bar>, <minecraft:clock>, <divinerpg:shadow_bar>],[<additions:twilightaddon-refined_twilight_gem>, <tconstruct:ingots:2>, <additions:twilightaddon-refined_twilight_gem>]]);
recipes.addShaped(<divinerpg:infernal_flame> * 1, [[<minecraft:redstone>, <divinerpg:purple_blaze>, <minecraft:glowstone_dust>], [<minecraft:redstone>, <ore:gemDivine>, <minecraft:glowstone_dust>],[<minecraft:redstone>, <divinerpg:purple_blaze>, <minecraft:glowstone_dust>]]);
recipes.addShaped(<additions:greedycraft-slime_crown> * 1, [[<minecraft:gold_ingot>, <thermalfoundation:material:161>, <minecraft:gold_ingot>], [<tconstruct:ingots:3>, <minecraft:slime>, <tconstruct:ingots:3>],[<tconstruct:ingots:3>, <tconstruct:ingots:3>, <tconstruct:ingots:3>]]);
recipes.addShaped(<ftbquests:lootcrate>.withTag({type: "loot_level_5"}), [[<ftbquests:lootcrate>.withTag({type: "loot_level_4"}), <ftbquests:lootcrate>.withTag({type: "loot_level_4"}), <ftbquests:lootcrate>.withTag({type: "loot_level_4"})],[<ftbquests:lootcrate>.withTag({type: "loot_level_4"}), <ftbquests:lootcrate>.withTag({type: "loot_level_4"}), <ftbquests:lootcrate>.withTag({type: "loot_level_4"})], [<ftbquests:lootcrate>.withTag({type: "loot_level_4"}), <ftbquests:lootcrate>.withTag({type: "loot_level_4"}), <ftbquests:lootcrate>.withTag({type: "loot_level_4"})]]);
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag: {id: "divinerpg:the_grue"}}) * 1, [[null, <ore:ingotArlemite>, null], [<ore:ingotRupee>, <minecraft:egg>, <ore:ingotRupee>],[null, <ore:ingotArlemite>, null]]);
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag: {id: "divinerpg:enthralled_dramcryx"}}) * 1, [[null, <divinerpg:rupee_ingot>, null], [<divinerpg:arlemite_ingot>, <minecraft:egg>, <divinerpg:arlemite_ingot>],[null, <divinerpg:rupee_ingot>, null]]);
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag: {id: "divinerpg:scorcher"}}) * 1, [[null, <divinerpg:purple_blaze>, null], [<divinerpg:purple_blaze>, <minecraft:egg>, <divinerpg:purple_blaze>],[null, <divinerpg:purple_blaze>, null]]);
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag: {id: "journey:witherspine"}}) * 1, [[null, <minecraft:skull:1>, null], [<tconstruct:materials:17>, <minecraft:egg>, <tconstruct:materials:17>],[null, <minecraft:skull:1>, null]]);
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag: {id: "journey:reaper"}}) * 1, [[null, <minecraft:skull:1>, null], [<quark:black_ash>, <minecraft:egg>, <quark:black_ash>],[null, <tconstruct:materials:17>, null]]);
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag: {id: "journey:minighast"}}) * 1, [[null, <journey:boilpowder>, null], [<minecraft:ghast_tear>, <minecraft:egg>, <minecraft:ghast_tear>],[null, <minecraft:ghast_tear>, null]]);
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag: {id: "journey:screamer"}}) * 1, [[null, <journey:hellstoneingot>, null], [<journey:hellstoneingot>, <minecraft:egg>, <journey:hellstoneingot>],[null, <minecraft:ender_eye>, null]]);
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag: {id: "journey:turducken"}}) * 1, [[null, <minecraft:feather>, null], [<journey:storoningot>, <minecraft:egg>, <journey:storoningot>],[null, <minecraft:feather>, null]]);
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag: {id: "journey:purplian"}}) * 1, [[null, <tconstruct:ingots:2>, null], [<journey:shadiumingot>, <minecraft:egg>, <journey:shadiumingot>],[null, <tconstruct:ingots:2>, null]]);
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag: {id: "journey:overseer"}}) * 1, [[null, <thermalfoundation:material:24>, null], [<journey:luniumingot>, <minecraft:egg>, <journey:luniumingot>],[null, <thermalfoundation:material:24>, null]]);
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag: {id: "journey:overseerelder"}}) * 1, [[null, <minecraft:ender_eye>, null], [<journey:storoningot>, <minecraft:egg>, <journey:storoningot>],[null, <minecraft:ender_eye>, null]]);
recipes.addShaped(<modularmachinery:builder_1_controller> * 1, [[<thermalfoundation:material:324>, <thermalfoundation:material:354>, <thermalfoundation:material:324>], [<thermalfoundation:material:354>, <modularmachinery:blockcontroller>, <thermalfoundation:material:354>],[<thermalfoundation:material:324>, <thermalfoundation:material:354>, <thermalfoundation:material:324>]]);
recipes.addShaped(<gct_ores:blue_print_empty> * 1, [[<nuclearcraft:dust:8>, <nuclearcraft:dust:8>, <nuclearcraft:dust:8>], [<nuclearcraft:dust:8>, <minecraft:paper>, <nuclearcraft:dust:8>],[<nuclearcraft:dust:8>, <nuclearcraft:dust:8>, <nuclearcraft:dust:8>]]);
recipes.addShaped(<gct_ores:blue_print_forge> * 1, [[<gct_ores:blue_print_empty>, <gct_ores:blue_print_empty>, <gct_ores:blue_print_empty>], [<gct_ores:blue_print_empty>, <additions:greedycraft-modularium_block>, <gct_ores:blue_print_empty>],[<gct_ores:blue_print_empty>, <gct_ores:blue_print_empty>, <gct_ores:blue_print_empty>]]);
recipes.addShaped(<divinerpg:snow_globe> * 1, [[<divinerpg:fury_fire>, <botania:rune:7>, <divinerpg:fury_fire>], [<additions:greedycraft-royal_gel>, <botania:rune:7>, <additions:greedycraft-royal_gel>],[<divinerpg:bluefire_stone>, <divinerpg:hellstone_ingot>, <divinerpg:bluefire_stone>]]);
recipes.addShaped(<divinerpg:arcana_portal_frame> * 1, [[<divinerpg:corrupted_shards>, <divinerpg:bluefire_stone>, <divinerpg:molten_shards>], [<divinerpg:divine_shards>, <divinerpg:ice_shards>, <divinerpg:jungle_shards>],[<abyssalcraft:stone:1>, <divinerpg:terran_shards>, <abyssalcraft:stone:1>]]);
recipes.addShaped(<additions:greedycraft-awakened_eye> * 1, [[<additions:greedycraft-iciricium_ingot>, <botania:manaresource:14>, <additions:greedycraft-iciricium_ingot>], [<abyssalcraft:cingot>, <abyssalcraft:eoa>, <abyssalcraft:cingot>],[<tconstruct:ingots:3>, <botania:manaresource:14>, <tconstruct:ingots:3>]]);
recipes.addShaped(<additions:greedycraft-iciricium_scroll> * 1, [[<additions:greedycraft-iciricium_ingot>, <thaumcraft:scribing_tools>, <additions:greedycraft-iciricium_ingot>], [<additions:greedycraft-iciricium_ingot>, <minecraft:paper>, <additions:greedycraft-iciricium_ingot>],[<additions:greedycraft-iciricium_ingot>, <thaumcraft:scribing_tools>, <additions:greedycraft-iciricium_ingot>]]);
recipes.addShaped(<additions:greedycraft-bravery_certificate> * 1, [[<additions:greedycraft-gem_of_valkyrie>, <minecraft:nether_star>, <additions:greedycraft-gem_of_valkyrie>], [<abyssalcraft:cingot>, <additions:greedycraft-soul_of_slider>, <abyssalcraft:cingot>],[<additions:greedycraft-balancite_ingot>, <aether_legacy:golden_amber>, <additions:greedycraft-balancite_ingot>]]);
recipes.addShaped(<journey:flamecoin> * 1, [[<minecraft:snow>, <additions:durasteel_ingot>, <minecraft:snow>], [<additions:durasteel_ingot>, <additions:greedycraft-gem_of_sing>, <additions:durasteel_ingot>],[<minecraft:snow>, <additions:durasteel_ingot>, <minecraft:snow>]]);
recipes.addShaped(<twilightforest:auroralized_glass> * 4, [[<twilightforest:aurora_block>, <minecraft:glass>, <twilightforest:aurora_block>], [<minecraft:glass>, <twilightforest:aurora_block>, <minecraft:glass>],[<twilightforest:aurora_block>, <minecraft:glass>, <twilightforest:aurora_block>]]);
recipes.addShaped(<gugu-utils:environmenthatch> * 1, [[<ae2wtlib:infinity_booster_card>, <minecraft:redstone_block>, <ae2wtlib:infinity_booster_card>], [<minecraft:redstone_block>, <additions:greedycraft-modularium_block>, <minecraft:redstone_block>],[<ae2wtlib:infinity_booster_card>, <minecraft:redstone_block>, <ae2wtlib:infinity_booster_card>]]);
recipes.addShaped(<gugu-utils:energyoutputport> * 1, [[<additions:greedycraft-modularium_block>, <redstonearsenal:material:32>, <additions:greedycraft-modularium_block>], [<redstonearsenal:material:32>, <modularmachinery:blockenergyoutputhatch:3>, <redstonearsenal:material:32>],[<additions:greedycraft-modularium_block>, <redstonearsenal:material:32>, <additions:greedycraft-modularium_block>]]);
recipes.addShaped(<gugu-utils:sparkmanahatch:0> * 1, [[<modularmachinery:itemmodularium>, <botania:spark>, <modularmachinery:itemmodularium>], [<botania:pool:0>, <modularmachinery:blockcasing:0>, <botania:pool:0>],[<modularmachinery:itemmodularium>, <botania:spreader:0>, <modularmachinery:itemmodularium>]]);
recipes.addShaped(<gugu-utils:sparkmanahatch:1> * 1, [[<modularmachinery:itemmodularium>, <botania:spark>, <modularmachinery:itemmodularium>], [<botania:spreader:0>, <modularmachinery:blockcasing:0>, <botania:spreader:0>],[<modularmachinery:itemmodularium>, <botania:lens:0>, <modularmachinery:itemmodularium>]]);
recipes.addShaped(<gugu-utils:starlightinputhatch:0> * 1, [[<modularmachinery:itemmodularium>, <astralsorcery:itemcraftingcomponent:0>, <modularmachinery:itemmodularium>], [<astralsorcery:itemcraftingcomponent:0>, <modularmachinery:blockcasing:0>, <astralsorcery:itemcraftingcomponent:0>],[<modularmachinery:itemmodularium>, <astralsorcery:itemcraftingcomponent:0>, <modularmachinery:itemmodularium>]]);
recipes.addShaped(<gugu-utils:starlightinputhatch:1> * 1, [[<modularmachinery:itemmodularium>, <astralsorcery:itemcraftingcomponent:1>, <modularmachinery:itemmodularium>], [<astralsorcery:itemcraftingcomponent:1>, <gugu-utils:starlightinputhatch:0>, <astralsorcery:itemcraftingcomponent:1>],[<modularmachinery:itemmodularium>, <astralsorcery:itemcraftingcomponent:1>, <modularmachinery:itemmodularium>]]);
recipes.addShaped(<gugu-utils:starlightinputhatch:2> * 1, [[<modularmachinery:itemmodularium>, <ore:ingotAstralMetal>, <modularmachinery:itemmodularium>],[<ore:ingotAstralMetal>, <gugu-utils:starlightinputhatch:1>, <ore:ingotAstralMetal>], [<modularmachinery:itemmodularium>, <ore:ingotAstralMetal>, <modularmachinery:itemmodularium>]]);
recipes.addShaped(<additions:greedycraft-storm_kicker>, [[<ore:rodStone>, <ore:coal>, <ore:rodStone>],[<ore:coal>, <ore:rodStone>, <ore:coal>], [<ore:rodStone>, <ore:coal>, <ore:rodStone>]]);
recipes.addShaped(<additions:greedycraft-dragon_kicker>, [[<ore:rodStone>, <ore:alloyBasic>, <ore:rodStone>],[<ore:alloyBasic>, <ore:rodStone>, <ore:alloyBasic>], [<ore:rodStone>, <ore:alloyBasic>, <ore:rodStone>]]);
recipes.addShaped(<gct_ores:shalloite_block_chiseled>, [[null, <gct_ores:shalloite_slab>, null],[null, <gct_ores:shalloite_slab>, null], [null, null, null]]);
recipes.addShaped(<gct_ores:shalloite_slab> * 6, [[null, null, null],[<gct_ores:shalloite_block>, <gct_ores:shalloite_block>, <gct_ores:shalloite_block>], [null, null, null]]);

recipes.addShaped(<gugu-utils:aspecthatch:1> * 1, [[<modularmachinery:itemmodularium>, <thaumcraft:tube>, <modularmachinery:itemmodularium>], [<thaumcraft:tube>, <modularmachinery:blockcasing:0>, <thaumcraft:tube>],[<thaumcraft:ingot:0>, <thaumcraft:ingot:0>, <thaumcraft:ingot:0>]]);
recipes.addShaped(<journey:ash> * 1, [[<biomesoplenty:ash>, <thermalfoundation:material:768>, <biomesoplenty:ash>], [<thermalfoundation:material:768>, <biomesoplenty:ash>, <thermalfoundation:material:768>],[<biomesoplenty:ash>, <thermalfoundation:material:768>, <biomesoplenty:ash>]]);
recipes.addShaped(<journey:summoningtable> * 1, [[<additions:greedycraft-soul_of_slider>, <additions:greedycraft-chillinium_ingot>, <additions:greedycraft-soul_of_slider>], [<journey:hellstoneingot>, <journey:bleedstoneore>, <journey:hellstoneingot>],[<journey:bloodrock>, <additions:greedycraft-chillinium_ingot>, <journey:bloodrock>]]);
recipes.addShaped(<journey:boilingportalframe> * 1, [[<minecraft:nether_brick>, <divinerpg:molten_shards>, <minecraft:nether_brick>], [<divinerpg:molten_shards>, <additions:greedycraft-sun_crystal>, <divinerpg:molten_shards>],[<minecraft:nether_brick>, <divinerpg:molten_shards>, <minecraft:nether_brick>]]);
recipes.addShaped(<additions:greedycraft-ender_charm> * 1, [[<additions:greedycraft-hellite_ingot>, <additions:durasteel_ingot>, <additions:greedycraft-hellite_ingot>], [<additions:greedycraft-chillinium_ingot>, <minecraft:nether_star>, <additions:greedycraft-chillinium_ingot>],[<abyssalcraft:dreadiumingot>, <additions:durasteel_ingot>, <abyssalcraft:dreadiumingot>]]);
recipes.addShaped(<divinerpg:horde_horn> * 1, [[null, <additions:durasteel_ingot>, <divinerpg:ender_stone>], [<additions:durasteel_ingot>, <cyclicmagic:ender_eye_orb>, <divinerpg:ender_stone>],[<divinerpg:ender_stone>, <divinerpg:ender_stone>, null]]);
recipes.addShaped(<divinerpg:call_of_the_watcher> * 1, [[<divinerpg:ender_stone>, <enderio:item_alloy_endergy_ingot:2>, <divinerpg:ender_stone>], [<enderio:item_alloy_endergy_ingot:2>, <divinerpg:watching_eye>, <enderio:item_alloy_endergy_ingot:2>],[<divinerpg:ender_stone>, <enderio:item_alloy_endergy_ingot:2>, <divinerpg:ender_stone>]]);
recipes.addShaped(<theaurorian:aurorianportalframebricks>, [[<ore:ingotIciricium>, <ore:ingotManyullyn>, <ore:ingotIciricium>],[<ore:ingotManyullyn>, <twilightforest:aurora_block>, <ore:ingotManyullyn>], [<ore:ingotIciricium>, <ore:ingotManyullyn>, <ore:ingotIciricium>]]);
recipes.addShaped(<divinerpg:twilight_clock> * 1, [[<divinerpg:the_watcher_statue>, <divinerpg:parasecta_statue>, <divinerpg:dramix_statue>], [<divinerpg:ayeraco_statue_blue>, <divinerpg:mysterious_clock>, <divinerpg:ayeraco_statue_purple>],[<divinerpg:ayeraco_statue_red>, <divinerpg:ayeraco_statue_yellow>, <divinerpg:ayeraco_statue_green>]]);
recipes.addShaped(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:builder_1"}) * 1, [[<thermalfoundation:material:320>, <gct_ores:blue_print_forge>, <thermalfoundation:material:320>], [<gct_ores:blue_print_forge>, <jaopca:item_plateexperience>, <gct_ores:blue_print_forge>],[<thermalfoundation:material:320>, <gct_ores:blue_print_forge>, <thermalfoundation:material:320>]]);
recipes.addShaped(<modularmachinery:blockcasing:0> * 4, [[null, <modularmachinery:itemmodularium>, null], [<modularmachinery:itemmodularium>, <divinerpg:fire_crystal>, <modularmachinery:itemmodularium>],[null, <modularmachinery:itemmodularium>, null]]);
recipes.addShaped(<modularmachinery:blockinputbus:0> * 1, [[<divinerpg:fire_crystal>, <modularmachinery:itemmodularium>, <divinerpg:fire_crystal>], [<modularmachinery:itemmodularium>, <divinerpg:fire_crystal>, <modularmachinery:itemmodularium>],[null, <modularmachinery:itemmodularium>, null]]);
recipes.addShaped(<modularmachinery:blockoutputbus:0> * 1, [[null, <modularmachinery:itemmodularium>, null], [<modularmachinery:itemmodularium>, <divinerpg:fire_crystal>, <modularmachinery:itemmodularium>],[<divinerpg:fire_crystal>, <modularmachinery:itemmodularium>, <divinerpg:fire_crystal>]]);
recipes.addShaped(<tcomplement:melter:0> * 1, [[<tconstruct:materials:0>, <divinerpg:smooth_glass>, <tconstruct:materials:0>], [<divinerpg:smooth_glass>, null, <divinerpg:smooth_glass>],[<tconstruct:materials:0>, <tconstruct:materials:0>, <tconstruct:materials:0>]]);
recipes.addShaped(<tcomplement:melter:8> * 1, [[null, <tconstruct:materials:0>, null], [<tconstruct:materials:0>, <tconstruct:materials:0>, <tconstruct:materials:0>],[<tconstruct:materials:0>, <divinerpg:demon_furnace>, <tconstruct:materials:0>]]);
recipes.addShaped(<tcomplement:alloy_tank:0> * 1, [[<tconstruct:materials:0>, <thermalfoundation:material:163>, <tconstruct:materials:0>], [<thermalfoundation:material:163>, <divinerpg:fire_crystal>, <thermalfoundation:material:163>],[<tconstruct:materials:0>, <thermalfoundation:material:163>, <tconstruct:materials:0>]]);
recipes.addShaped(<divinerpg:demon_furnace> * 1, [[<divinerpg:fire_crystal>, <divinerpg:dream_stone>, <divinerpg:fire_crystal>], [<divinerpg:dream_stone>, <divinerpg:fire_crystal>, <divinerpg:dream_stone>],[<divinerpg:fire_crystal>, <divinerpg:dream_stone>, <divinerpg:fire_crystal>]]);
recipes.addShaped(<modularmachinery:vethea_enchanter_controller> * 1, [[<modularmachinery:itemmodularium>, <divinerpg:dream_stone>, <modularmachinery:itemmodularium>], [<divinerpg:dream_stone>, <divinerpg:teaker_lump>, <divinerpg:dream_stone>],[<modularmachinery:itemmodularium>, <divinerpg:dream_stone>, <modularmachinery:itemmodularium>]]);
recipes.addShaped(<hooked:hook:3> * 1, [[<additions:vethea-vethea_ingot_mk3>, <divinerpg:fire_crystal>, <additions:vethea-vethea_ingot_mk3>], [null, <divinerpg:dirty_pearls>, <divinerpg:fire_crystal>],[<divinerpg:dirty_pearls>, null, <additions:vethea-vethea_ingot_mk3>]]);
recipes.addShaped(<hooked:hook:4> * 1, [[<additions:vethea-vethea_ingot_mk9>, <divinerpg:firelight>, <additions:vethea-vethea_ingot_mk9>], [null, <hooked:hook:3>, <divinerpg:firelight>],[<divinerpg:arksiane_lump>, null, <additions:vethea-vethea_ingot_mk9>]]);
recipes.addShaped(<journey:eucaportalframe> * 1, [[<aether_legacy:holystone>, <jaopca:item_nuggetcryonium>, <aether_legacy:holystone>], [<gct_ores:lavarite_nugget>, <journey:eucaportalgem>, <gct_ores:snowingium_nugget>],[<aether_legacy:holystone>, <gct_ores:aetherium_nugget>, <aether_legacy:holystone>]]);
recipes.addShaped(<additions:greedycraft-thunder_eye> * 1, [[<aether_legacy:aercloud:0>, <additions:aeonsteel_ingot>, <aether_legacy:aercloud:0>], [<gct_ores:witherium_dust>, <minecraft:nether_star>, <gct_ores:witherium_dust>],[<aether_legacy:aercloud:0>, <additions:aeonsteel_ingot>, <aether_legacy:aercloud:0>]]);
recipes.addShaped(<additions:greedycraft-weather_breathe> * 1, [[null, <additions:greedycraft-chillinium_ingot>, <draconicevolution:draconium_dust>], [<additions:aeonsteel_ingot>, <draconicevolution:draconium_dust>, <additions:greedycraft-chillinium_ingot>],[<additions:greedycraft-chillinium_ingot>, <additions:aeonsteel_ingot>, null]]);
recipes.addShaped(<additions:greedycraft-blood_tears> * 1, [[null, <gct_ores:witherium_dust>, null], [<minecraft:ghast_tear>, <journey:balmy_teardrop>, <minecraft:ghast_tear>],[<additions:aeonsteel_ingot>, <tconevo:metal:25>, <additions:aeonsteel_ingot>]]);
recipes.addShaped(<additions:greedycraft-beast_hand> * 1, [[<additions:aeonsteel_ingot>, null, <additions:aeonsteel_ingot>], [<twilightforest:alpha_fur>, <draconicevolution:draconium_dust>, <twilightforest:alpha_fur>],[null, <twilightforest:alpha_fur>, null]]);
recipes.addShaped(<additions:greedycraft-canopy_totem> * 1, [[null, <draconicevolution:wyvern_core>, null], [<taiga:yrdeen_ingot>, <minecraft:totem_of_undying>, <taiga:yrdeen_ingot>],[null, <minecraft:nether_star>, null]]);
recipes.addShaped(<additions:greedycraft-end_totem> * 1, [[null, <draconicevolution:wyvern_core>, null], [<taiga:nihilite_ingot>, <minecraft:totem_of_undying>, <taiga:nihilite_ingot>],[null, <minecraft:nether_star>, null]]);
recipes.addShaped(<additions:greedycraft-ice_totem> * 1, [[null, <draconicevolution:wyvern_core>, null], [<taiga:tritonite_ingot>, <minecraft:totem_of_undying>, <taiga:tritonite_ingot>],[null, <minecraft:nether_star>, null]]);
recipes.addShaped(<blue_skies:zeal_lighter> * 1, [[<journey:celestiumingot>, <minecraft:feather>, null], [<journey:celestiumingot>, null, <minecraft:flint>],[<minecraft:feather>, <minecraft:flint>, <journey:luniumclump>]]);
recipes.addShaped(<blue_skies:lunar_stonebrick> * 14, [[<abyssalcraft:shadowgem>, <journey:flairiumingot>, <abyssalcraft:shadowgem>], [<journey:flairiumingot>, <minecraft:emerald>, <journey:flairiumingot>],[<abyssalcraft:shadowgem>, <journey:flairiumingot>, <abyssalcraft:shadowgem>]]);
recipes.addShaped(<blue_skies:turquoise_stonebrick> * 14, [[<astralsorcery:itemcraftingcomponent>, <journey:desingot>, <astralsorcery:itemcraftingcomponent>],[<journey:desingot>, <minecraft:diamond>, <journey:desingot>], [<astralsorcery:itemcraftingcomponent>, <journey:desingot>, <astralsorcery:itemcraftingcomponent>]]);
recipes.addShaped(<journey:mysteriousdisk> * 1, [[<journey:fluffyfeather>, <journey:golemchunk>, <journey:fluffyfeather>], [<journey:golemchunk>, <journey:cloudiaorb>, <journey:golemchunk>],[<journey:fluffyfeather>, <journey:golemchunk>, <journey:fluffyfeather>]]);
recipes.addShaped(<journey:sentryeye> * 6, [[null, <journey:ancient_stone>, <journey:ancient_stone>], [<journey:ancient_stone>, <journey:ancient_stone>, null],[<minecraft:ender_eye>, <journey:ancient_stone>, null]]);
recipes.addShaped(<mist:portal_base:2>, [[<minecraft:gold_block>, <minecraft:gold_block>, <minecraft:gold_block>],[<twilightforest:deadrock:2>, <minecraft:gold_block>, <twilightforest:deadrock:2>], [<twilightforest:deadrock:2>, <twilightforest:deadrock:2>, <twilightforest:deadrock:2>]]);
recipes.addShaped(<mist:portal_base:3>, [[<twilightforest:deadrock:2>, <twilightforest:deadrock:2>, <twilightforest:deadrock:2>],[<twilightforest:deadrock:2>, <minecraft:gold_block>, <twilightforest:deadrock:2>], [<minecraft:gold_block>, <minecraft:gold_block>, <minecraft:gold_block>]]);
recipes.addShaped(<gct_ores:senterian_wrench> * 1, [[null, <journey:senterian_soul>, <journey:sentry_disk>], [<journey:senterian_soul>, <journey:sentry_disk>, <journey:senterian_soul>],[<journey:sentry_disk>, <journey:senterian_soul>, null]]);
recipes.addShaped(<gct_mobs:reversed_dreamwood_fence> * 3, [[null, null, null],[<gct_mobs:reversed_dreamwood_plank>, <ore:stickWood>, <gct_mobs:reversed_dreamwood_plank>], [<gct_mobs:reversed_dreamwood_plank>, <ore:stickWood>, <gct_mobs:reversed_dreamwood_plank>]]);
recipes.addShaped(<gct_mobs:reversed_dreamwood_slab> * 6, [[null, null, null],[null, null, null], [<gct_mobs:reversed_dreamwood_plank>, <gct_mobs:reversed_dreamwood_plank>, <gct_mobs:reversed_dreamwood_plank>]]);
recipes.addShaped(<gct_mobs:reversed_dreamwood_stairs> * 8, [[<gct_mobs:reversed_dreamwood_plank>, null, null],[<gct_mobs:reversed_dreamwood_plank>, <gct_mobs:reversed_dreamwood_plank>, null], [<gct_mobs:reversed_dreamwood_plank>, <gct_mobs:reversed_dreamwood_plank>, <gct_mobs:reversed_dreamwood_plank>]]);
recipes.addShaped(<gct_mobs:botanical_ingot>, [[null, <ore:soulBotanical>, null],[<ore:soulBotanical>, <ore:ingotMythsteel>, <ore:soulBotanical>], [null, <ore:soulBotanical>, null]]);
recipes.addShaped(<additions:link-starchain_ingot>, [[<ore:ingotAdaminite>, <ore:ingotAstralStarmetal>, <ore:ingotMirion>],[<ore:ingotBoundMetal>, <actuallyadditions:item_mining_lens>, <ore:ingotSentientMetal>], [<ore:ingotSignalum>, <astralsorcery:itemcraftingcomponent:4>, <ore:ingotEnderium>]]);
recipes.addShaped(<mekanism:machineblock:8>, [[<ore:ingotIron>, <minecraft:furnace>, <ore:ingotIron>],[<ore:alloyBasic>, <ore:ingotOsmium>, <ore:alloyBasic>], [<ore:ingotIron>, <minecraft:furnace>, <ore:ingotIron>]]);
recipes.addShaped(<additions:greedycraft-lock_of_space>, [[<rftools:dimensional_shard>, <rftools:dimensional_shard>, <rftools:dimensional_shard>],[<rftools:dimensional_shard>, <rftools:dimensional_shard>, <rftools:dimensional_shard>], [<rftools:dimensional_shard>, <rftools:dimensional_shard>, <rftools:dimensional_shard>]]);
recipes.addShaped(<rftools:dimensional_shard>, [[<additions:greedycraft-space_shard_small>, <additions:greedycraft-space_shard_small>, <additions:greedycraft-space_shard_small>],[<additions:greedycraft-space_shard_small>, <additions:greedycraft-space_shard_small>, <additions:greedycraft-space_shard_small>], [<additions:greedycraft-space_shard_small>, <additions:greedycraft-space_shard_small>, <additions:greedycraft-space_shard_small>]]);
recipes.addShaped(<botania:manaresource:5> * 32, [[<gct_mobs:gaia_heart>, null, null],[null, null, null], [null, null, null]]);
recipes.addShaped(<avaritia:neutron_collector> * 1, [[<minecraft:quartz_block:0>, <minecraft:hopper>, <minecraft:quartz_block:0>], [<minecraft:iron_block>, <avaritia:resource:1>, <minecraft:iron_block>],[<minecraft:quartz_block:0>, <minecraft:redstone_block>, <minecraft:quartz_block:0>]]);
recipes.addShaped(<journey:reinforcedcrystalingot>, [[<journey:lunitechunk>,<journey:purplegem>,<journey:frostgem>], [<journey:greengem>,<journey:desingot>,<journey:bluegem>], [<journey:magic_dust>,<journey:yellowgem>,<journey:cavecrystal>]]);
recipes.addShaped(<journey:frostgem>, [[null,<journey:crystalflake>,null], [<journey:crystalflake>,<journey:frostflake>,<journey:crystalflake>], [null,<journey:crystalflake>,null]]);
recipes.addShaped(<additions:greedycraft-astral_star>, [[null, <ore:ingotCerulean>, null],[<ore:ingotCerulean>, <ore:ingotAurorianSteel>, <ore:ingotUmbra>], [null, <ore:ingotUmbra>, null]]);
recipes.addShaped(<additions:greedycraft-conduct_gear>, [[<ore:gearSilver>, null, <ore:gearIron>],[null, <ore:gearGold>, null], [<ore:gearCopper>, null, <ore:gearTin>]]);
recipes.addShaped(<naturesaura:gold_fiber> * 4, [[<ore:treeLeaves>, <ore:nuggetEucite>, <ore:treeLeaves>],[<ore:nuggetEucite>, <minecraft:tallgrass:1>, <ore:nuggetEucite>], [<ore:treeLeaves>, <ore:nuggetEucite>, <ore:treeLeaves>]]);
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag: {id: "thebetweenlands:peat_mummy"}}), [[<ore:gemValonite>, <thebetweenlands:sap_ball>, <ore:gemValonite>],[<thebetweenlands:sap_ball>, <ore:egg>, <thebetweenlands:sap_ball>], [<ore:gemValonite>, <thebetweenlands:sap_ball>, <ore:gemValonite>]]);
recipes.addShaped(<enderio:item_material:66>, [[<enderio:block_end_iron_bars>, <ore:ingotEndSteel>, <enderio:block_end_iron_bars>],[<ore:ingotEndSteel>, <ore:dustDurasteel>, <ore:ingotEndSteel>], [<enderio:block_end_iron_bars>, <ore:ingotEndSteel>, <enderio:block_end_iron_bars>]]);
recipes.addShaped(<journey:ancient_stone> * 4, [[null, <minecraft:bedrock>, null],[<minecraft:bedrock>, <ore:blockChloroplast>, <minecraft:bedrock>], [null, <minecraft:bedrock>, null]]);
recipes.addShaped(<additions:greedycraft-undead_ingot>, [[null, <ore:essenceUndead>, null],[<ore:essenceUndead>, <ore:ingotSorrowium>, <ore:essenceUndead>], [null, <ore:essenceUndead>, null]]);
recipes.addShaped(<multiblocked:entity>, [[<ore:ingotZircaloy>, <ore:ingotZircaloy>, <ore:ingotZircaloy>],[<ore:ingotZircaloy>, <tinymobfarm:iron_farm>, <ore:ingotZircaloy>], [<ore:ingotZircaloy>, <ore:ingotZircaloy>, <ore:ingotZircaloy>]]);
recipes.addShaped(<multiblocked:energy_output>, [[<ore:ingotZircaloy>, <ore:ingotZircaloy>, <ore:ingotZircaloy>],[<ore:ingotZircaloy>, <modularmachinery:blockenergyoutputhatch:2>, <ore:ingotZircaloy>], [<ore:ingotZircaloy>, <ore:ingotZircaloy>, <ore:ingotZircaloy>]]);
recipes.addShaped(<multiblocked:energy_input>, [[<ore:ingotZircaloy>, <ore:ingotZircaloy>, <ore:ingotZircaloy>],[<ore:ingotZircaloy>, <modularmachinery:blockenergyinputhatch:2>, <ore:ingotZircaloy>], [<ore:ingotZircaloy>, <ore:ingotZircaloy>, <ore:ingotZircaloy>]]);
recipes.addShaped(<multiblocked:fluid_output>, [[<ore:ingotZircaloy>, <ore:ingotZircaloy>, <ore:ingotZircaloy>],[<ore:ingotZircaloy>, <modularmachinery:blockfluidoutputhatch:2>, <ore:ingotZircaloy>], [<ore:ingotZircaloy>, <ore:ingotZircaloy>, <ore:ingotZircaloy>]]);
recipes.addShaped(<multiblocked:fluid_input>, [[<ore:ingotZircaloy>, <ore:ingotZircaloy>, <ore:ingotZircaloy>],[<ore:ingotZircaloy>, <modularmachinery:blockfluidinputhatch:2>, <ore:ingotZircaloy>], [<ore:ingotZircaloy>, <ore:ingotZircaloy>, <ore:ingotZircaloy>]]);
recipes.addShaped(<multiblocked:item_output>, [[<ore:ingotZircaloy>, <ore:ingotZircaloy>, <ore:ingotZircaloy>],[<ore:ingotZircaloy>, <modularmachinery:blockoutputbus:2>, <ore:ingotZircaloy>], [<ore:ingotZircaloy>, <ore:ingotZircaloy>, <ore:ingotZircaloy>]]);
recipes.addShaped(<multiblocked:item_input>, [[<ore:ingotZircaloy>, <ore:ingotZircaloy>, <ore:ingotZircaloy>],[<ore:ingotZircaloy>, <modularmachinery:blockinputbus:2>, <ore:ingotZircaloy>], [<ore:ingotZircaloy>, <ore:ingotZircaloy>, <ore:ingotZircaloy>]]);
recipes.addShaped(<gct_mobs:earth_orb>, [[<ore:obsidian>, <ore:ingotTerrasteel>, <ore:obsidian>],[<ore:ingotTerrasteel>, <ore:gemTerrestrial>, <ore:ingotTerrasteel>], [<ore:obsidian>, <ore:ingotTerrasteel>, <ore:obsidian>]]);
recipes.addShaped(<gct_mobs:earthbound_receiver>, [[<ore:livingwoodTwig>, <ore:ingotSky>, <ore:livingwoodTwig>],[<ore:livingwoodTwig>, <gct_mobs:earthbound_core>, <ore:livingwoodTwig>], [<ore:blockMud>, <ore:blockMud>, <ore:blockMud>]]);
recipes.addShaped(<gct_mobs:earthbound_core>, [[<ore:livingwoodTwig>, <ore:ingotAuraIron>, <ore:livingwoodTwig>],[<ore:livingwoodTwig>, <gct_mobs:holysteel_ingot>, <ore:livingwoodTwig>], [<naturesaura:infused_brick>, <naturesaura:infused_brick>, <naturesaura:infused_brick>]]);
recipes.addShaped(<gugu-utils:aurainputhatch>, [[<ore:ingotModularium>, <ore:ingotSky>, <ore:ingotModularium>],[<ore:ingotAuraIron>, <modularmachinery:blockcasing>, <ore:ingotAuraIron>], [<ore:ingotModularium>, <ore:ingotEarth>, <ore:ingotModularium>]]);
recipes.addShaped(<minecraft:end_portal_frame>, [[null, null, null],[null, <randomportals:upside_down_end_portal_frame>, null], [null, null, null]]);
recipes.addShaped(<randomportals:upside_down_end_portal_frame>, [[null, null, null],[null, <randomportals:vertical_end_portal_frame>, null], [null, null, null]]);
recipes.addShaped(<randomportals:vertical_end_portal_frame>, [[null, null, null],[null, <minecraft:end_portal_frame>, null], [null, null, null]]);
recipes.addShaped(<randomportals:upside_down_end_portal_frame>, [[<ore:endstone>, <ore:endstone>, <ore:endstone>],[<ore:endstone>, <ore:endstone>, <ore:endstone>], [<minecraft:ender_eye>, <ore:netherStar>, <minecraft:ender_eye>]]);
recipes.addShaped(<randomportals:vertical_end_portal_frame>, [[<ore:endstone>, <ore:endstone>, <minecraft:ender_eye>],[<ore:endstone>, <ore:endstone>, <ore:netherStar>], [<ore:endstone>, <ore:endstone>, <minecraft:ender_eye>]]);
recipes.addShaped(<gct_mac:endest_steel_forge>, [[<ore:ingotEndorium>, <ore:ingotEndorium>, <ore:ingotEndorium>],[<ore:pearlEnderEye>, <ore:ingotEnderite>, <ore:pearlEnderEye>], [<ore:ingotEndorium>, <ore:ingotEndorium>, <ore:ingotEndorium>]]);


RecipeUtil.addShaped("germanium_press", <additions:greedycraft-germanium_press>, [
    [<mysticalagriculture:fluix_essence>, <mysticalagriculture:fluix_essence>, <mysticalagriculture:fluix_essence>],
    [<mysticalagriculture:fluix_essence>, <ore:ingotGermanium>, <mysticalagriculture:fluix_essence>],
    [<mysticalagriculture:fluix_essence>, <mysticalagriculture:fluix_essence>, <mysticalagriculture:fluix_essence>]
]);
RecipeUtil.addShaped("wireless", <appliedenergistics2:material:41>, [
    [null, <ore:pearlFluix>, null],
    [<ore:ingotIron>, <appliedenergistics2:part:140>, <ore:ingotIron>],
    [<additions:greedycraft-wireless_processor>, <ore:ingotIron>, <additions:greedycraft-wireless_processor>]
]);
RecipeUtil.addShaped("ball_clock_alloy", <additions:eioaddon-clock_alloy_ball> * 24, [
    [null, <ore:ingotClockAlloy>, null],
    [<ore:ingotClockAlloy>, <ore:ingotClockAlloy>, <ore:ingotClockAlloy>],
    [null, <ore:ingotClockAlloy>, null]
]);
RecipeUtil.addShaped("ball_curse_alloy", <additions:eioaddon-curse_alloy_ball> * 24, [
    [null, <ore:ingotCurseAlloy>, null],
    [<ore:ingotCurseAlloy>, <ore:ingotCurseAlloy>, <ore:ingotCurseAlloy>],
    [null, <ore:ingotCurseAlloy>, null]
]);
RecipeUtil.addShaped("ball_twilit_alloy", <additions:eioaddon-twilit_alloy_ball> * 24, [
    [null, <ore:ingotTwilitAlloy>, null],
    [<ore:ingotTwilitAlloy>, <ore:ingotTwilitAlloy>, <ore:ingotTwilitAlloy>],
    [null, <ore:ingotTwilitAlloy>, null]
]);
RecipeUtil.addShaped("ball_mist_alloy", <additions:eioaddon-mist_alloy_ball> * 24, [
    [null, <ore:ingotMistAlloy>, null],
    [<ore:ingotMistAlloy>, <ore:ingotMistAlloy>, <ore:ingotMistAlloy>],
    [null, <ore:ingotMistAlloy>, null]
]);
RecipeUtil.addShaped("ball_killer_alloy", <additions:eioaddon-killer_alloy_ball> * 24, [
    [null, <ore:ingotKillerAlloy>, null],
    [<ore:ingotKillerAlloy>, <ore:ingotKillerAlloy>, <ore:ingotKillerAlloy>],
    [null, <ore:ingotKillerAlloy>, null]
]);
RecipeUtil.addShaped("ball_sharpen_alloy", <additions:eioaddon-sharpen_alloy_ball> * 24, [
    [null, <ore:ingotSharpenAlloy>, null],
    [<ore:ingotSharpenAlloy>, <ore:ingotSharpenAlloy>, <ore:ingotSharpenAlloy>],
    [null, <ore:ingotSharpenAlloy>, null]
]);
RecipeUtil.addShaped("withered_nether_star", <ageofminecraft:withered_nether_star> * 2, [
    [<additions:greedycraft-withered_nether_star_shard>, <additions:greedycraft-withered_nether_star_shard>, <additions:greedycraft-withered_nether_star_shard>],
    [<additions:greedycraft-withered_nether_star_shard>, <ageofminecraft:withered_nether_star>, <additions:greedycraft-withered_nether_star_shard>],
    [<additions:greedycraft-withered_nether_star_shard>, <additions:greedycraft-withered_nether_star_shard>, <additions:greedycraft-withered_nether_star_shard>]
]);
RecipeUtil.addShaped("catalyst_star", <additions:greedycraft-catalyst_star> * 2, [
    [<additions:greedycraft-catalyst_star_shard>, <additions:greedycraft-catalyst_star_shard>, <additions:greedycraft-catalyst_star_shard>],
    [<additions:greedycraft-catalyst_star_shard>, <additions:greedycraft-catalyst_star>, <additions:greedycraft-catalyst_star_shard>],
    [<additions:greedycraft-catalyst_star_shard>, <additions:greedycraft-catalyst_star_shard>, <additions:greedycraft-catalyst_star_shard>]
]);
RecipeUtil.addShaped("senterian_builder", <gct_ores:senterian_builder_lab>, [
    [<additions:greedycraft-broken_engine_shard>, <journey:sentry_disk>, <additions:greedycraft-broken_engine_shard>],
    [<journey:sentry_disk>, <additions:greedycraft-broken_engine_shard>, <journey:sentry_disk>],
    [<additions:greedycraft-broken_engine_shard>, <journey:sentry_disk>, <additions:greedycraft-broken_engine_shard>]
]);
RecipeUtil.addShaped("edeningot", <additions:greedycraft-eden_ingot> * 2,[
    [<ore:ingotIron>, <ore:fragmentsEden>, <ore:ingotIron>],
    [<ore:fragmentsEden>, <divinerpg:eden_heart>, <ore:fragmentsEden>],
    [<ore:ingotIron>, <ore:fragmentsEden>, <ore:ingotIron>]
]);
RecipeUtil.addShaped("wildwoodingot", <additions:greedycraft-wildwood_ingot> * 2,[
    [<ore:ingotIron>, <ore:fragmentsWildwood>, <ore:ingotIron>],
    [<ore:fragmentsWildwood>, <divinerpg:wildwood_heart>, <ore:fragmentsWildwood>],
    [<ore:ingotIron>, <ore:fragmentsWildwood>, <ore:ingotIron>]
]);
RecipeUtil.addShaped("apalachiaingot", <additions:greedycraft-apalachia_ingot> * 2,[
    [<ore:ingotIron>, <ore:fragmentsApalachia>, <ore:ingotIron>],
    [<ore:fragmentsApalachia>, <divinerpg:apalachia_heart>, <ore:fragmentsApalachia>],
    [<ore:ingotIron>, <ore:fragmentsApalachia>, <ore:ingotIron>]
]);
RecipeUtil.addShaped("skytherningot", <additions:greedycraft-skythern_ingot> * 2,[
    [<ore:ingotIron>, <ore:fragmentsSkythern>, <ore:ingotIron>],
    [<ore:fragmentsSkythern>, <divinerpg:skythern_heart>, <ore:fragmentsSkythern>],
    [<ore:ingotIron>, <ore:fragmentsSkythern>, <ore:ingotIron>]
]);
RecipeUtil.addShaped("mortumingot", <additions:greedycraft-mortum_ingot> * 2,[
    [<ore:ingotIron>, <ore:fragmentsMortum>, <ore:ingotIron>],
    [<ore:fragmentsMortum>, <divinerpg:mortum_heart>, <ore:fragmentsMortum>],
    [<ore:ingotIron>, <ore:fragmentsMortum>, <ore:ingotIron>]
]);
RecipeUtil.addShaped("wood_pattern", <tconstruct:pattern> * 16, [
    [null, <ore:logWoodVethea>, null],
    [<ore:logWoodVethea>, <divinerpg:fire_crystal>, <ore:logWoodVethea>],
    [null, <ore:logWoodVethea>, null]
]);
RecipeUtil.addShaped("tooltables1", <tconstruct:tooltables:1>.withTag({textureBlock: {id: "minecraft:planks", Count: 1 as byte, Damage: 0 as short}}), [
    [<ore:logWoodVethea>, <ore:logWoodVethea>, <ore:logWoodVethea>],
    [<ore:logWoodVethea>, <ore:pattern>, <ore:logWoodVethea>],
    [<ore:pattern>, null, <ore:pattern>]
]);
RecipeUtil.addShaped("tooltables2", <tconstruct:tooltables:2>.withTag({textureBlock: {id: "minecraft:log", Count: 1 as byte, Damage: 0 as short}}), [
    [<ore:logWoodVethea>, <ore:pattern>, <ore:logWoodVethea>],
    [<ore:logWoodVethea>, <ore:logWoodVethea>, <ore:logWoodVethea>],
    [<ore:pattern>, null, <ore:pattern>]
]);
RecipeUtil.addShaped("toolstation", <conarm:armorstation>, [
    [<ore:pattern>, <ore:pattern>, <ore:pattern>],
    [<ore:logWoodVethea>, <ore:pattern>, <ore:logWoodVethea>],
    [<ore:logWoodVethea>, null, <ore:logWoodVethea>]
]);
RecipeUtil.addShaped("armorstation", <tconstruct:tooltables:3>, [
    [<ore:pattern>, <ore:pattern>, <ore:pattern>],
    [<ore:logWoodVethea>, null, <ore:logWoodVethea>],
    [<ore:logWoodVethea>, null, <ore:logWoodVethea>]
]);
RecipeUtil.addShaped("tofustick", <tofucraft:tofustick>, [
    [<minecraft:gold_block>, <tofucraft:material:18>, <minecraft:gold_block>],
    [<minecraft:gold_block>, <tofucraft:blocktofumomen>, <minecraft:gold_block>],
    [null, <minecraft:stick>, null]
]);
RecipeUtil.addShaped("thaumcraft_nugget", <thaumcraft:nugget:10>, [
    [null, <minecraft:dirt>, null],
    [<minecraft:dirt>, <minecraft:gold_block>, <minecraft:dirt>],
    [null, <minecraft:dirt>, null]
]);
RecipeUtil.addShaped("dragonegg", <minecraft:dragon_egg>, [
    [null, <ore:scaleDragonEnder>, null],
    [<ore:scaleDragonEnder>, <ore:netherStar>, <ore:scaleDragonEnder>],
    [<ore:scaleDragonEnder>, <ore:scaleDragonEnder>, <ore:scaleDragonEnder>]
]);
RecipeUtil.addShaped("witherskull", <minecraft:skull:1>, [
    [<quark:black_ash>, <quark:black_ash>, <quark:black_ash>],
    [<quark:black_ash>, <mysticalagriculture:crafting:15>, <quark:black_ash>],
    [<quark:black_ash>, <quark:black_ash>, <quark:black_ash>]
]);
RecipeUtil.addShaped("difficultychanger_up_2", <scalinghealth:difficultychanger:1>, [
    [null, <tconstruct:materials:17>, null],
    [<tconstruct:materials:17>, <scalinghealth:heartcontainer>, <tconstruct:materials:17>],
    [<tconstruct:materials:17>, <tconstruct:materials:17>, <tconstruct:materials:17>]
]);
RecipeUtil.addShaped("difficultychanger_up", <scalinghealth:difficultychanger:1>, [
    [null, <netherex:wither_bone>, null],
    [<netherex:wither_bone>, <scalinghealth:heartcontainer>, <netherex:wither_bone>],
    [<netherex:wither_bone>, <netherex:wither_bone>, <netherex:wither_bone>]
]);
RecipeUtil.addShaped("difficultychanger_down", <scalinghealth:difficultychanger:0>, [
    [<minecraft:gold_ingot>, <minecraft:gold_ingot>, <minecraft:gold_ingot>],
    [<minecraft:gold_ingot>, <scalinghealth:heartcontainer>, <minecraft:gold_ingot>],
    [null, <minecraft:gold_ingot>, null]
]);
RecipeUtil.addShaped("totundying", <minecraft:totem_of_undying>, [
    [<minecraft:ender_eye>, <minecraft:golden_apple>, <minecraft:ender_eye>],
    [<minecraft:gold_ingot>, <minecraft:nether_star>, <minecraft:gold_ingot>],
    [null, <minecraft:gold_block>, null]
]);
RecipeUtil.addShaped("elytra", <minecraft:elytra>, [
    [<minecraft:paper>, <draconicevolution:wyvern_core>, <minecraft:paper>],
    [<minecraft:paper>, <minecraft:nether_star>, <minecraft:paper>],
    [<minecraft:paper>, null, <minecraft:paper>]
]);
RecipeUtil.addShaped("oemod1", <oeintegration:excavatemodifier>, [
    [<ore:gearBronze>, <ore:gearGold>, <ore:gearBronze>],
    [<ore:gearGold>, <ore:gearLead>, <ore:gearGold>],
    [<ore:gearBronze>, <ore:gearGold>, <ore:gearBronze>]
]);
RecipeUtil.addShaped("oemod2", <oeintegration:excavatemodifier>, [
    [<ore:gearGold>, <ore:gearBronze>, <ore:gearGold>],
    [<ore:gearBronze>, <ore:gearLead>, <ore:gearBronze>],
    [<ore:gearGold>, <ore:gearBronze>, <ore:gearGold>]
]);
RecipeUtil.addShaped("spawn_slime", <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:slime"}}), [
    [null, <ore:slimeball>, null],
    [<ore:slimeball>, <minecraft:egg>, <ore:slimeball>],
    [null, <ore:slimeball>, null]
]);
RecipeUtil.addShaped("villager_vial", <enderio:item_soul_vial:1>.withTag({entityId: "minecraft:villager"}), [
    [null, <minecraft:emerald>, null],
    [<minecraft:emerald>, <enderio:item_soul_vial>, <minecraft:emerald>],
    [null, <minecraft:emerald>, null]
]);
RecipeUtil.addShaped("auto_gen_2051907122", <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:villager"}}), [
    [null, <minecraft:emerald>, null],
    [<minecraft:emerald>, <minecraft:egg>, <minecraft:emerald>],
    [null, <minecraft:emerald>, null]
]);
RecipeUtil.addShaped("auto_gen_421398898", <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:blaze"}}), [
    [null, <minecraft:blaze_powder>, null],
    [<minecraft:blaze_powder>, <minecraft:egg>, <minecraft:blaze_powder>],
    [null, <minecraft:blaze_powder>, null]
]);
RecipeUtil.addShaped("auto_gen_-1453796942", <minecraft:spawn_egg>.withTag({EntityTag: {id: "thermalfoundation:blizz"}}), [
    [null, <thermalfoundation:material:2049>, null],
    [<thermalfoundation:material:2049>, <minecraft:egg>, <thermalfoundation:material:2049>],
    [null, <thermalfoundation:material:2049>, null]
]);
RecipeUtil.addShaped("auto_gen_-497967694", <minecraft:spawn_egg>.withTag({EntityTag: {id: "thermalfoundation:basalz"}}), [
    [null, <thermalfoundation:material:2053>, null],
    [<thermalfoundation:material:2053>, <minecraft:egg>, <thermalfoundation:material:2053>],
    [null, <thermalfoundation:material:2053>, null]
]);
RecipeUtil.addShaped("auto_gen_-402635342", <minecraft:spawn_egg>.withTag({EntityTag: {id: "thermalfoundation:blitz"}}), [
    [null, <thermalfoundation:material:2051>, null],
    [<thermalfoundation:material:2051>, <minecraft:egg>, <thermalfoundation:material:2051>],
    [null, <thermalfoundation:material:2051>, null]
]);
RecipeUtil.addShaped("auto_gen_-1181238140", <bountifulbaubles:trinketapple>, [
    [null, <ore:blockEmerald>, null],
    [null, <minecraft:golden_apple:1>, null],
    [null, <ore:blockGold>, null]
]);
RecipeUtil.addShaped("auto_gen_-2096872370", <additions:greedycraft-pioneer_medal>, [
    [<additions:greedycraft-ordinary_medal>, <additions:greedycraft-ordinary_medal>, <additions:greedycraft-ordinary_medal>],
    [<additions:greedycraft-ordinary_medal>, <additions:greedycraft-ordinary_medal>, <additions:greedycraft-ordinary_medal>],
    [<additions:greedycraft-ordinary_medal>, <additions:greedycraft-ordinary_medal>, <additions:greedycraft-ordinary_medal>]
]);
RecipeUtil.addShaped("auto_gen_-1484361380", <additions:greedycraft-greedy_medal>, [
    [<additions:greedycraft-pioneer_medal>, <additions:greedycraft-pioneer_medal>, <additions:greedycraft-pioneer_medal>],
    [<additions:greedycraft-pioneer_medal>, <additions:greedycraft-pioneer_medal>, <additions:greedycraft-pioneer_medal>],
    [<additions:greedycraft-pioneer_medal>, <additions:greedycraft-pioneer_medal>, <additions:greedycraft-pioneer_medal>]
]);
RecipeUtil.addShaped("auto_gen_11266081", <additions:greedycraft-item_purger>, [
    [null, null, <minecraft:stick>],
    [null, <minecraft:stick>, null],
    [<minecraft:wheat>, null, null]
]);
RecipeUtil.addShaped("auto_gen_-2104803001", <minecraft:splash_potion>.withTag({CustomPotionEffects: [{ShowParticles: 0 as byte, Duration: 2400, Id: 1, Amplifier: 126}, {ShowParticles: 0 as byte, Duration: 2400, Id: 8, Amplifier: 126}], CustomPotionColor: 720859, display: {Lore: [LangUtil.translate("greedycraft.misc.lightspeedpotion.tooltip")], Name: LangUtil.translate("greedycraft.misc.lightspeedpotion.name")}}), [
    [<minecraft:chorus_fruit>, <minecraft:chorus_fruit>, <minecraft:chorus_fruit>],
    [<minecraft:chorus_fruit>, <minecraft:glass_bottle>, <minecraft:chorus_fruit>],
    [<minecraft:chorus_fruit>, <minecraft:chorus_fruit>, <minecraft:chorus_fruit>]
]);
RecipeUtil.addShaped("auto_gen_1289690205", <ftbquests:lootcrate>.withTag({type:"loot_level_2"}), [
    [<ftbquests:lootcrate>.withTag({type:"loot_level_1"}), <ftbquests:lootcrate>.withTag({type:"loot_level_1"}), <ftbquests:lootcrate>.withTag({type:"loot_level_1"})],
    [<ftbquests:lootcrate>.withTag({type:"loot_level_1"}), <ftbquests:lootcrate>.withTag({type:"loot_level_1"}), <ftbquests:lootcrate>.withTag({type:"loot_level_1"})],
    [<ftbquests:lootcrate>.withTag({type:"loot_level_1"}), <ftbquests:lootcrate>.withTag({type:"loot_level_1"}), <ftbquests:lootcrate>.withTag({type:"loot_level_1"})]
]);
RecipeUtil.addShaped("auto_gen_-1223296379", <ftbquests:lootcrate>.withTag({type:"loot_level_3"}), [
    [<ftbquests:lootcrate>.withTag({type:"loot_level_2"}), <ftbquests:lootcrate>.withTag({type:"loot_level_2"}), <ftbquests:lootcrate>.withTag({type:"loot_level_2"})],
    [<ftbquests:lootcrate>.withTag({type:"loot_level_2"}), <ftbquests:lootcrate>.withTag({type:"loot_level_2"}), <ftbquests:lootcrate>.withTag({type:"loot_level_2"})],
    [<ftbquests:lootcrate>.withTag({type:"loot_level_2"}), <ftbquests:lootcrate>.withTag({type:"loot_level_2"}), <ftbquests:lootcrate>.withTag({type:"loot_level_2"})]
]);
RecipeUtil.addShaped("auto_gen_558684333", <ftbquests:lootcrate>.withTag({type:"loot_level_4"}), [
    [<ftbquests:lootcrate>.withTag({type:"loot_level_3"}), <ftbquests:lootcrate>.withTag({type:"loot_level_3"}), <ftbquests:lootcrate>.withTag({type:"loot_level_3"})],
    [<ftbquests:lootcrate>.withTag({type:"loot_level_3"}), <ftbquests:lootcrate>.withTag({type:"loot_level_3"}), <ftbquests:lootcrate>.withTag({type:"loot_level_3"})],
    [<ftbquests:lootcrate>.withTag({type:"loot_level_3"}), <ftbquests:lootcrate>.withTag({type:"loot_level_3"}), <ftbquests:lootcrate>.withTag({type:"loot_level_3"})]
]);
RecipeUtil.addShaped("auto_gen_-1874338203", <minecraft:splash_potion>.withTag({CustomPotionEffects: [{ShowParticles: 0 as byte, Duration: 1200, Id: 25, Amplifier: 126}], CustomPotionColor: 16722379, display: {Lore: [LangUtil.translate("greedycraft.misc.flyingpotion.tooltip")], Name: LangUtil.translate("greedycraft.misc.flyingpotion.name")}}), [
    [<minecraft:feather>, <minecraft:feather>, <minecraft:feather>],
    [<minecraft:feather>, <minecraft:glass_bottle>, <minecraft:feather>],
    [<minecraft:feather>, <minecraft:feather>, <minecraft:feather>]
]);
RecipeUtil.addShaped("auto_gen_6394519", <minecraft:splash_potion>.withTag({CustomPotionEffects: [{ShowParticles: 0 as byte, Duration: 6000, Id: 27, Amplifier: 126}], CustomPotionColor: 0, display: {Lore: [LangUtil.translate("greedycraft.misc.badluckpotion.tooltip")], Name: LangUtil.translate("greedycraft.misc.badluckpotion.name")}}), [
    [<ore:dyeBlack>, <ore:dyeBlack>, <ore:dyeBlack>],
    [<ore:dyeBlack>, <minecraft:glass_bottle>, <ore:dyeBlack>],
    [<ore:dyeBlack>, <ore:dyeBlack>, <ore:dyeBlack>]
]);
RecipeUtil.addShaped("auto_gen_684700803", <minecraft:stick>.withTag({ench: [{lvl: 10, id: 19}], display: {Lore: [LangUtil.translate("greedycraft.misc.knockbackwand.tooltip")], Name: LangUtil.translate("greedycraft.misc.knockbackwand.name")}}), [
    [<ore:blockSlime>, <ore:blockDiamond>, <ore:blockSlime>],
    [<ore:blockDiamond>, <minecraft:stick>, <ore:blockDiamond>],
    [<ore:blockSlime>, <ore:blockDiamond>, <ore:blockSlime>]
]);
RecipeUtil.addShaped("auto_gen_-1707222290", <additions:greedycraft-bloody_sacrifice>, [
    [<additions:greedycraft-raw_human_meat>, <tconstruct:edible:3>, <additions:greedycraft-raw_human_meat>],
    [<tconstruct:edible:3>, <minecraft:bone>, <tconstruct:edible:3>],
    [<additions:greedycraft-raw_human_meat>, <tconstruct:edible:3>, <additions:greedycraft-raw_human_meat>]
]);
RecipeUtil.addShaped("auto_gen_-1352061026", <additions:greedycraft-bloody_sacrifice>, [
    [<tconstruct:edible:3>, <additions:greedycraft-raw_human_meat>, <tconstruct:edible:3>],
    [<additions:greedycraft-raw_human_meat>, <minecraft:bone>, <additions:greedycraft-raw_human_meat>],
    [<tconstruct:edible:3>, <additions:greedycraft-raw_human_meat>, <tconstruct:edible:3>]
]);
RecipeUtil.addShaped("auto_gen_-2042519398", <additions:greedycraft-blood_sigil>, [
    [null, <tconstruct:edible:3>, null],
    [<tconstruct:edible:3>, <abyssalcraft:ironp>, <tconstruct:edible:3>],
    [null, <tconstruct:edible:3>, null]
]);
RecipeUtil.addShaped("auto_gen_1805774062", <additions:greedycraft-true_blood_sigil>, [
    [<additions:greedycraft-bloody_sacrifice>, <additions:greedycraft-blood_sigil>, <additions:greedycraft-bloody_sacrifice>],
    [<additions:greedycraft-blood_sigil>, <ore:shardCreative>, <additions:greedycraft-blood_sigil>],
    [<additions:greedycraft-bloody_sacrifice>, <additions:greedycraft-blood_sigil>, <additions:greedycraft-bloody_sacrifice>]
]);
RecipeUtil.addShaped("auto_gen_826338285", <minecraft:name_tag>, [
    [null, null, <minecraft:string>],
    [null, <minecraft:gold_ingot>, null],
    [<minecraft:paper>, null, null]
]);
RecipeUtil.addShaped("auto_gen_-295393253", <additions:greedycraft-poopburger>, [
    [<minecraft:wheat>, <minecraft:wheat>, <minecraft:wheat>],
    [<additions:greedycraft-poop>, <additions:greedycraft-poop>, <additions:greedycraft-poop>],
    [<minecraft:wheat>, <minecraft:wheat>, <minecraft:wheat>]
]);
RecipeUtil.addShaped("auto_gen_-1478408197", <netherex:wither_bone>, [
    [null, <netherex:wither_dust>, null],
    [<netherex:wither_dust>, <ore:bone>, <netherex:wither_dust>],
    [null, <netherex:wither_dust>, null]
]);
RecipeUtil.addShaped("auto_gen_1124990531", <projecte:item.pe_harvest_god>, [
    [<ore:soulCreative>, <minecraft:vine>, <ore:soulCreative>],
    [<minecraft:vine>, <projecte:item.pe_ring_iron_band>, <minecraft:vine>],
    [<ore:soulCreative>, <minecraft:vine>, <ore:soulCreative>]
]);
RecipeUtil.addShaped("auto_gen_-132199471", <projecte:nova_catalyst>, [
    [<projecte:item.pe_fuel:1>, <projecte:item.pe_fuel:1>, <projecte:item.pe_fuel:1>],
    [<projecte:item.pe_matter:1>, <minecraft:tnt>, <projecte:item.pe_matter:1>],
    [<projecte:item.pe_fuel:1>, <projecte:item.pe_fuel:1>, <projecte:item.pe_fuel:1>]
]);
RecipeUtil.addShaped("auto_gen_1281372914", <projecte:nova_cataclysm>, [
    [<projecte:nova_catalyst>, <projecte:nova_catalyst>, <projecte:nova_catalyst>],
    [<projecte:nova_catalyst>, <projecte:nova_catalyst>, <projecte:nova_catalyst>],
    [<projecte:nova_catalyst>, <projecte:nova_catalyst>, <projecte:nova_catalyst>]
]);
RecipeUtil.addShaped("wood_to_charcoal", <minecraft:coal:1> * 4, [
    [null, <ore:coal>, null],
    [<ore:coal>, <ore:logWood>, <ore:coal>],
    [null, <ore:coal>, null]
]);
RecipeUtil.addShaped("auto_gen_-162477942", <additions:greedycraft-medkit_small>, [
    [null, <scalinghealth:heartdust>, null],
    [<scalinghealth:heartdust>, <minecraft:glass_bottle>, <scalinghealth:heartdust>],
    [null, <scalinghealth:heartdust>, null]
]);
RecipeUtil.addShaped("auto_gen_-1175705809", <additions:greedycraft-medkit_big>, [
    [null, <scalinghealth:crystalshard>, null],
    [<scalinghealth:crystalshard>, <additions:greedycraft-medkit_small>, <scalinghealth:crystalshard>],
    [null, <scalinghealth:crystalshard>, null]
]);
RecipeUtil.addShaped("auto_gen_-1873046907", <additions:greedycraft-medkit_super>, [
    [null, <scalinghealth:heartcontainer>, null],
    [<scalinghealth:heartcontainer>, <additions:greedycraft-medkit_big>, <scalinghealth:heartcontainer>],
    [null, <scalinghealth:heartcontainer>, null]
]);
RecipeUtil.addShaped("auto_gen_1179581625", <mysticalagriculture:growth_accelerator> * 2, [
    [<mysticalagriculture:storage:3>, <mysticalagriculture:storage:4>, <mysticalagriculture:storage:3>],
    [<mysticalagriculture:storage:4>, <ore:blockCytosinite>, <mysticalagriculture:storage:4>],
    [<mysticalagriculture:storage:3>, <mysticalagriculture:storage:4>, <mysticalagriculture:storage:3>]
]);
RecipeUtil.addShaped("page0", <additions:greedycraft-ancient_tome_page> , [
    [<additions:greedycraft-ancient_tome_fragment>, <additions:greedycraft-ancient_tome_fragment>, <additions:greedycraft-ancient_tome_fragment>],
    [<additions:greedycraft-ancient_tome_fragment>, <additions:greedycraft-ancient_tome_fragment>, <additions:greedycraft-ancient_tome_fragment>],
    [<additions:greedycraft-ancient_tome_fragment>, <additions:greedycraft-ancient_tome_fragment>, <additions:greedycraft-ancient_tome_fragment>]
]);
RecipeUtil.addShaped("page1", <additions:greedycraft-ancient_tome> , [
    [<additions:greedycraft-ancient_tome_page>, <additions:greedycraft-ancient_tome_page>, <additions:greedycraft-ancient_tome_page>],
    [<additions:greedycraft-ancient_tome_page>, <additions:greedycraft-ancient_tome_page>, <additions:greedycraft-ancient_tome_page>],
    [<additions:greedycraft-ancient_tome_page>, <additions:greedycraft-ancient_tome_page>, <additions:greedycraft-ancient_tome_page>]
]);
RecipeUtil.addShaped("auto_gen_-1864302722", <mekanism:machineblock:4>, [
    [<mekanism:teleportationcore>, <mekanism:machineblock:15>, <mekanism:teleportationcore>],
    [<mekanism:robit>, <mekanism:basicblock:8>, <mekanism:machineblock2:6>],
    [<ore:shardCreative>, <ore:blockWyvernMetal>, <ore:shardCreative>]
]);
RecipeUtil.addShaped("auto_gen_-1579945966", <simplesmelteryaccelerator:smeltery_accelerator>, [
    [<tconstruct:materials>, <tconstruct:ingots:2>, <tconstruct:materials>],
    [<tconstruct:ingots:2>, <minecraft:diamond_block>, <tconstruct:ingots:2>],
    [<tconstruct:materials>, <tconstruct:ingots:2>, <tconstruct:materials>]
]);
RecipeUtil.addShaped("auto_gen_1084804943", <mekanismgenerators:generator:6> * 1, [
    [null, <ore:alloyUltimate>, null],
    [<ore:alloyUltimate>, <ore:ingotAeonsteel>, <ore:alloyUltimate>],
    [<mekanism:energytablet>, <ore:circuitUltimate>, <mekanism:energytablet>]
]);
RecipeUtil.addShaped("auto_gen_685141373", <mekanismgenerators:generator:5>, [
    [<mekanismgenerators:generator:1>, <mekanismgenerators:generator:1>, <mekanismgenerators:generator:1>],
    [<mekanismgenerators:generator:1>, <mekanism:atomicalloy>, <mekanismgenerators:generator:1>],
    [<mekanism:enrichedalloy>, <mekanism:enrichedalloy>, <mekanism:enrichedalloy>]
]);
RecipeUtil.addShaped("auto_gen_1109831349", <mekanismgenerators:generator:1>, [
    [<mekanismgenerators:solarpanel>, <mekanismgenerators:solarpanel>, <mekanismgenerators:solarpanel>],
    [<mekanism:enrichedalloy>, <mekanism:enrichedalloy>, <mekanism:enrichedalloy>],
    [<mekanism:enrichedalloy>, <mekanism:enrichedalloy>, <mekanism:enrichedalloy>]
]);
RecipeUtil.addShaped("auto_gen_-1399323772", <projecte:item.pe_soul_stone>, [
    [<minecraft:gold_ingot>, <draconicevolution:awakened_core>, <minecraft:gold_ingot>],
    [<botania:storage:3>, <ore:shardCreative>, <botania:storage:3>],
    [<minecraft:gold_ingot>, <draconicevolution:awakened_core>, <minecraft:gold_ingot>]
]);
RecipeUtil.addShaped("auto_gen_-1815095390", <projecte:item.pe_body_stone>, [
    [<minecraft:gold_ingot>, <minecraft:gold_ingot>, <minecraft:gold_ingot>],
    [<ore:shardCreative>, <draconicevolution:chaotic_core>, <ore:shardCreative>],
    [<minecraft:gold_ingot>, <minecraft:gold_ingot>, <minecraft:gold_ingot>]
]);
RecipeUtil.addShaped("auto_gen_-1600085367", <additions:greedycraft-experience_ingot>, [
    [<additions:greedycraft-experience_nugget>, <additions:greedycraft-experience_nugget>, <additions:greedycraft-experience_nugget>],
    [<additions:greedycraft-experience_nugget>, <additions:greedycraft-experience_nugget>, <additions:greedycraft-experience_nugget>],
    [<additions:greedycraft-experience_nugget>, <additions:greedycraft-experience_nugget>, <additions:greedycraft-experience_nugget>]
]);
RecipeUtil.addShaped("auto_gen_1001889940", <additions:greedycraft-experience_block>, [
    [<additions:greedycraft-experience_ingot>, <additions:greedycraft-experience_ingot>, <additions:greedycraft-experience_ingot>],
    [<additions:greedycraft-experience_ingot>, <additions:greedycraft-experience_ingot>, <additions:greedycraft-experience_ingot>],
    [<additions:greedycraft-experience_ingot>, <additions:greedycraft-experience_ingot>, <additions:greedycraft-experience_ingot>]
]);
RecipeUtil.addShaped("auto_gen_-1190739388", <additions:greedycraft-compressed_experience_block>, [
    [<additions:greedycraft-experience_block>, <additions:greedycraft-experience_block>, <additions:greedycraft-experience_block>],
    [<additions:greedycraft-experience_block>, <additions:greedycraft-experience_block>, <additions:greedycraft-experience_block>],
    [<additions:greedycraft-experience_block>, <additions:greedycraft-experience_block>, <additions:greedycraft-experience_block>]
]);
RecipeUtil.addShaped("auto_gen_235539040", <additions:greedycraft-experience_ingot>, [
    [<mysticalagriculture:xp_droplet>, <mysticalagriculture:xp_droplet>, <mysticalagriculture:xp_droplet>],
    [<mysticalagriculture:xp_droplet>, <mysticalagriculture:xp_droplet>, <mysticalagriculture:xp_droplet>],
    [<mysticalagriculture:xp_droplet>, <mysticalagriculture:xp_droplet>, <mysticalagriculture:xp_droplet>]
]);
RecipeUtil.addShaped("auto_gen_284734971", <minecraft:spawn_egg>.withTag({EntityTag:{id:"minecraft:cow"}}), [
    [null, <minecraft:leather>, null],
    [<minecraft:leather>, <minecraft:egg>, <minecraft:leather>],
    [null, <minecraft:leather>, null]
]);
RecipeUtil.addShaped("auto_gen_-1799280324", <minecraft:spawn_egg>.withTag({EntityTag:{id:"minecraft:enderman"}}), [
    [null, <minecraft:ender_pearl>, null],
    [<minecraft:ender_pearl>, <minecraft:egg>, <minecraft:ender_pearl>],
    [null, <minecraft:ender_pearl>, null]
]);
RecipeUtil.addShaped("auto_gen_-444867109", <tconstruct:tooltables>, [
    [<ore:plankWood>, <ore:plankWood>],
    [<ore:plankWood>, <ore:plankWood>]
]);
RecipeUtil.addShaped("auto_gen_893026726", <ironchest:iron_chest:2>, [
    [<minecraft:glass>, <minecraft:glass>, <minecraft:glass>],
    [<minecraft:diamond>, <minecraft:gold_block>, <minecraft:diamond>],
    [<minecraft:glass>, <minecraft:glass>, <minecraft:glass>]
]);
RecipeUtil.addShaped("auto_gen_-2024479741", <additions:greedycraft-aurora_heart>, [
    [<quark:rune:16>, <quark:rune:16>, <quark:rune:16>],
    [<quark:rune:16>, <mowziesmobs:ice_crystal>, <quark:rune:16>],
    [<quark:rune:16>, <quark:rune:16>, <quark:rune:16>]
]);
//
RecipeUtil.addShaped("auto_gen_-503951361", <additions:greedycraft-experience_ingot> * 8, [
    [<actuallyadditions:item_solidified_experience>, <actuallyadditions:item_solidified_experience>, <actuallyadditions:item_solidified_experience>],
    [<actuallyadditions:item_solidified_experience>, <actuallyadditions:item_solidified_experience>, <actuallyadditions:item_solidified_experience>],
    [<actuallyadditions:item_solidified_experience>, <actuallyadditions:item_solidified_experience>, <actuallyadditions:item_solidified_experience>]
]);
RecipeUtil.addShaped("auto_gen_-626897020", <projecte:interdiction_torch>, [
    [null, <ore:shardCreative>, null],
    [<projecte:item.pe_matter:1>, <minecraft:torch>, <projecte:item.pe_matter:1>],
    [<minecraft:glowstone_dust>, <minecraft:glowstone_dust>, <minecraft:glowstone_dust>]
]);
RecipeUtil.addShaped("auto_gen_-378684063", <bountifulbaubles:ringiron>, [
    [<ore:nuggetIron>, <ore:nuggetIron>, <ore:nuggetIron>],
    [<ore:nuggetIron>, null, <ore:nuggetIron>],
    [<ore:nuggetIron>, <ore:nuggetIron>, <ore:nuggetIron>]
]);
RecipeUtil.addShaped("auto_gen_-893381298", <draconicevolution:grinder>, [
    [<minecraft:iron_block>, <draconicevolution:awakened_core>, <minecraft:iron_block>],
    [<draconicevolution:awakened_core>, <tconevo:metal_block:2>, <draconicevolution:awakened_core>],
    [<minecraft:iron_block>, <draconicevolution:awakened_core>, <minecraft:iron_block>]
]);
RecipeUtil.addShaped("auto_gen_-1988060210", <extrautils2:rainbowgenerator>, [
    [<additions:greedycraft-aurora_heart>, <extrautils2:rainbowgenerator:2>, <additions:greedycraft-aurora_heart>],
    [<ore:soulCreative>, <ore:blockChromasteel>, <ore:soulCreative>],
    [<additions:greedycraft-aurora_heart>, <extrautils2:rainbowgenerator:1>, <additions:greedycraft-aurora_heart>]
]);
RecipeUtil.addShaped("auto_gen_-360710734", <extrautils2:chickenring>, [
    [<ore:feather>, <minecraft:iron_ingot>, <ore:feather>],
    [<minecraft:iron_ingot>, <magicfeather:magicfeather>, <minecraft:iron_ingot>],
    [<ore:feather>, <minecraft:iron_ingot>, <ore:feather>]
]);
RecipeUtil.addShaped("auto_gen_-2072364347", <minecraft:spawn_egg>.withTag({EntityTag:{id:"minecraft:ghast"}}), [
    [<ore:dustGlowstone>, <ore:blockGlass>, <ore:dustGlowstone>],
    [<ore:blockGlass>, <minecraft:egg>, <ore:blockGlass>],
    [<ore:dustGlowstone>, <ore:blockGlass>, <ore:dustGlowstone>]
]);
RecipeUtil.addShaped("auto_gen_-1542308372", <cyclicmagic:cable_wireless>, [
    [<thermalfoundation:material:167>, <minecraft:ender_eye>, <thermalfoundation:material:167>],
    [<minecraft:ender_eye>, <minecraft:chest>, <minecraft:ender_eye>],
    [<thermalfoundation:material:167>, <minecraft:ender_eye>, <thermalfoundation:material:167>]
]);
RecipeUtil.addShaped("auto_gen_142121176", <cyclicmagic:cable_wireless_energy>, [
    [<thermalfoundation:material:167>, <minecraft:ender_eye>, <thermalfoundation:material:167>],
    [<minecraft:ender_eye>, <minecraft:redstone_block>, <minecraft:ender_eye>],
    [<thermalfoundation:material:167>, <minecraft:ender_eye>, <thermalfoundation:material:167>]
]);
RecipeUtil.addShaped("auto_gen_-1750189736", <cyclicmagic:cable_wireless_fluid>, [
    [<thermalfoundation:material:167>, <minecraft:ender_eye>, <thermalfoundation:material:167>],
    [<minecraft:ender_eye>, <minecraft:bucket>, <minecraft:ender_eye>],
    [<thermalfoundation:material:167>, <minecraft:ender_eye>, <thermalfoundation:material:167>]
]);
RecipeUtil.addShaped("auto_gen_-1513078655", <cyclicmagic:battery>, [
    [<ore:ingotTin>, <ore:ingotTin>, <ore:ingotTin>],
    [<ore:ingotTin>, <thaumcraft:nugget:10>, <ore:ingotTin>],
    [<ore:ingotTin>, <ore:ingotTin>, <ore:ingotTin>]
]);
RecipeUtil.addShaped("auto_gen_918073950", <waystones:warp_stone>, [
    [<ore:obsidian>, <ore:gemDiamond>, <ore:obsidian>],
    [<ore:gemDiamond>, <ore:enderpearl>, <ore:gemDiamond>],
    [<ore:obsidian>, <ore:gemDiamond>, <ore:obsidian>]
]);
RecipeUtil.addShaped("auto_gen_2018337295", <thermalfoundation:material:23>, [
    [null, <ore:cobblestone>, null],
    [<ore:cobblestone>, null, <ore:cobblestone>],
    [null, <ore:cobblestone>, null]
]);
RecipeUtil.addShaped("auto_gen_-1351813342", <cfm:item_log> * 16, [
    [<ore:logWood>, <ore:logWood>],
    [null, null]
]);
RecipeUtil.addShaped("auto_gen_272915411", <minecraft:crafting_table> * 4, [
    [<ore:workbench>, <ore:workbench>],
    [<ore:workbench>, <ore:workbench>]
]);
RecipeUtil.addShaped("auto_gen_-1836563570", <projecte:item.pe_swrg>, [
    [<ore:feather>, <ore:shardCreative>, <ore:feather>],
    [<magicfeather:magicfeather>, <projecte:item.pe_ring_iron_band>, <magicfeather:magicfeather>],
    [<ore:feather>, <ore:shardCreative>, <ore:feather>]
]);
RecipeUtil.addShaped("auto_gen_1736866776", <actuallyadditions:item_wings_of_the_bats>, [
    [null, <draconicevolution:wyvern_core>, null],
    [<actuallyadditions:item_misc:15>, <actuallyadditions:item_misc:15>, <actuallyadditions:item_misc:15>],
    [<actuallyadditions:item_misc:15>, <minecraft:elytra>, <actuallyadditions:item_misc:15>]
]);
RecipeUtil.addShaped("auto_gen_695406342", <projecte:item.pe_repair_talisman>, [
    [<ore:shardCreative>, <ore:shardCreative>, <ore:shardCreative>],
    [<tconstruct:materials:19>, <projecte:item.pe_matter:1>, <tconstruct:materials:19>],
    [<projecte:item.pe_covalence_dust>, <projecte:item.pe_covalence_dust:2>, <projecte:item.pe_covalence_dust:1>]
]);
RecipeUtil.addShaped("bh_medal_upgrade0", <additions:greedycraft-bounty_hunter_medal_silver>, [
    [<additions:greedycraft-bounty_hunter_medal_bronze>, <additions:greedycraft-bounty_hunter_medal_bronze>, <additions:greedycraft-bounty_hunter_medal_bronze>],
    [<additions:greedycraft-bounty_hunter_medal_bronze>, <additions:greedycraft-bounty_hunter_medal_bronze>, <additions:greedycraft-bounty_hunter_medal_bronze>],
    [<additions:greedycraft-bounty_hunter_medal_bronze>, <additions:greedycraft-bounty_hunter_medal_bronze>, <additions:greedycraft-bounty_hunter_medal_bronze>]
]);
RecipeUtil.addShaped("bh_medal_upgrade1", <additions:greedycraft-bounty_hunter_medal>, [
    [<additions:greedycraft-bounty_hunter_medal_silver>, <additions:greedycraft-bounty_hunter_medal_silver>, <additions:greedycraft-bounty_hunter_medal_silver>],
    [<additions:greedycraft-bounty_hunter_medal_silver>, <additions:greedycraft-bounty_hunter_medal_silver>, <additions:greedycraft-bounty_hunter_medal_silver>],
    [<additions:greedycraft-bounty_hunter_medal_silver>, <additions:greedycraft-bounty_hunter_medal_silver>, <additions:greedycraft-bounty_hunter_medal_silver>]
]);
RecipeUtil.addShaped("auto_gen_-609778103", <danknull:dank_null_panel_0>, [
    [<ore:dustRedstone>, <ore:gemCoal>, <ore:dustRedstone>],
    [<ore:gemCoal>, <ore:dustRedstone>, <ore:gemCoal>],
    [<ore:dustRedstone>, <ore:gemCoal>, <ore:dustRedstone>]
]);
RecipeUtil.addShaped("auto_gen_-1593973926", <danknull:dank_null_panel_1>, [
    [<ore:gemLapis>, <ore:gemCoal>, <ore:gemLapis>],
    [<ore:gemCoal>, <ore:gemLapis>, <ore:gemCoal>],
    [<ore:gemLapis>, <ore:gemCoal>, <ore:gemLapis>]
]);
RecipeUtil.addShaped("auto_gen_1115440192", <danknull:dank_null_panel_2>, [
    [<ore:ingotIron>, <ore:gemCoal>, <ore:ingotIron>],
    [<ore:gemCoal>, <ore:ingotIron>, <ore:gemCoal>],
    [<ore:ingotIron>, <ore:gemCoal>, <ore:ingotIron>]
]);
RecipeUtil.addShaped("auto_gen_-1283760985", <danknull:dank_null_panel_3>, [
    [<ore:ingotGold>, <ore:gemCoal>, <ore:ingotGold>],
    [<ore:gemCoal>, <ore:ingotGold>, <ore:gemCoal>],
    [<ore:ingotGold>, <ore:gemCoal>, <ore:ingotGold>]
]);
RecipeUtil.addShaped("auto_gen_1421367790", <danknull:dank_null_panel_4>, [
    [<ore:gemDiamond>, <ore:gemCoal>, <ore:gemDiamond>],
    [<ore:gemCoal>, <ore:gemDiamond>, <ore:gemCoal>],
    [<ore:gemDiamond>, <ore:gemCoal>, <ore:gemDiamond>]
]);
RecipeUtil.addShaped("auto_gen_-1058951393", <danknull:dank_null_panel_5>, [
    [<ore:gemEmerald>, <ore:gemCoal>, <ore:gemEmerald>],
    [<ore:gemCoal>, <ore:gemEmerald>, <ore:gemCoal>],
    [<ore:gemEmerald>, <ore:gemCoal>, <ore:gemEmerald>]
]);
RecipeUtil.addShaped("dank_null_0", <danknull:dank_null_0>, [
    [null, <danknull:dank_null_panel_0>, null],
    [<danknull:dank_null_panel_0>, <ore:chest>, <danknull:dank_null_panel_0>],
    [null, <danknull:dank_null_panel_0>, null]
]);
RecipeUtil.addShaped("auto_gen_-555162558", <appliedenergistics2:material:35> * 4, [
    [null, <ore:dustRedstone>, null],
    [<ore:dustRedstone>, <ore:gemQuartz>, <ore:dustRedstone>],
    [null, <ore:dustRedstone>, null]
]);
RecipeUtil.addShaped("auto_gen_591200402", <additions:greedycraft-purifying_pill>, [
    [null, <ore:shardCreative>, null],
    [<ore:shardCreative>, <thaumcraft:sanity_soap>, <ore:shardCreative>],
    [null, <ore:shardCreative>, null]
]);
RecipeUtil.addShaped("auto_gen_252415292", <additions:greedycraft-fusion_matrix_block>, [
    [<tconevo:material>, <tconevo:material>, <tconevo:material>],
    [<tconevo:material>, <tconevo:material>, <tconevo:material>],
    [<tconevo:material>, <tconevo:material>, <tconevo:material>]
]);
RecipeUtil.addShaped("auto_gen_-1748732628", <extrabotany:material:6>, [
    [<ore:gaiaIngot>, <ore:ingotShadowium>, <ore:gaiaIngot>],
    [<ore:ingotPhotonium>, <draconicevolution:dragon_heart>, <ore:ingotPhotonium>],
    [<ore:gaiaIngot>, <ore:ingotShadowium>, <ore:gaiaIngot>]
]);
RecipeUtil.addShaped("auto_gen_-646800657", <thaumcraft:creative_flux_sponge>, [
    [<thaumcraft:ingot:1>, <minecraft:sponge>, <thaumcraft:ingot:1>],
    [<minecraft:sponge>, <ore:shardCreative>, <minecraft:sponge>],
    [<thaumcraft:ingot:1>, <minecraft:sponge>, <thaumcraft:ingot:1>]
]);
RecipeUtil.addShaped("auto_gen_-1606461473", <additions:greedycraft-death_coin>, [
    [<draconicevolution:awakened_core>, <additions:greedycraft-ancient_tome_fragment>, <draconicevolution:awakened_core>],
    [<tconevo:metal:5>, <additions:greedycraft-bounty_hunter_medal>, <tconevo:metal:5>],
    [<draconicevolution:awakened_core>, <ore:shardCreative>, <draconicevolution:awakened_core>]
]);
RecipeUtil.addShaped("auto_gen_-1300353737", <additions:infernium_ingot>, [
    [<additions:greedycraft-infernium_nugget>, <additions:greedycraft-infernium_nugget>, <additions:greedycraft-infernium_nugget>],
    [<additions:greedycraft-infernium_nugget>, <additions:greedycraft-infernium_nugget>, <additions:greedycraft-infernium_nugget>],
    [<additions:greedycraft-infernium_nugget>, <additions:greedycraft-infernium_nugget>, <additions:greedycraft-infernium_nugget>]
]);
RecipeUtil.addShaped("auto_gen_1001339440", <additions:greedycraft-infernium_block>, [
    [<additions:infernium_ingot>, <additions:infernium_ingot>, <additions:infernium_ingot>],
    [<additions:infernium_ingot>, <additions:infernium_ingot>, <additions:infernium_ingot>],
    [<additions:infernium_ingot>, <additions:infernium_ingot>, <additions:infernium_ingot>]
]);
RecipeUtil.addShaped("auto_gen_-627290965", <randomthings:timeinabottle>, [
    [<ore:shardCreative>, <draconicevolution:awakened_core>, <ore:shardCreative>],
    [<draconicevolution:awakened_core>, <minecraft:glass_bottle>, <draconicevolution:awakened_core>],
    [<ore:shardCreative>, <draconicevolution:awakened_core>, <ore:shardCreative>]
]);
RecipeUtil.addShaped("auto_gen_1077378325", <minecraft:vine>, [
    [<ore:plantFibre>, null, <ore:plantFibre>],
    [<ore:plantFibre>, <ore:plantFibre>, <ore:plantFibre>],
    [<ore:plantFibre>, null, <ore:plantFibre>]
]);
RecipeUtil.addShaped("auto_gen_-1896387144", <ambience:ocarina>, [
    [null, <minecraft:light_blue_glazed_terracotta>, null],
    [<minecraft:light_blue_glazed_terracotta>, <ore:soulCreative>, <minecraft:light_blue_glazed_terracotta>],
    [null, <minecraft:light_blue_glazed_terracotta>, null]
]);
RecipeUtil.addShaped("auto_gen_-1617883388", <ambience:horn>, [
    [null, <ore:soulCreative>, null],
    [<ore:soulCreative>, <twilightforest:crumble_horn>, <ore:soulCreative>],
    [null, <ore:soulCreative>, null]
]);
RecipeUtil.addShaped("auto_gen_1397188541", <hooked:hook>, [
    [<ore:stickWood>, <ore:stickWood>, <minecraft:stone_pickaxe>],
    [null, <ore:string>, <ore:stickWood>],
    [<ore:string>, null, <ore:stickWood>]
]);
RecipeUtil.addShaped("auto_gen_-138403773", <additions:greedycraft-cryonium_block>, [
    [<ore:ingotCryonium>, <ore:ingotCryonium>, <ore:ingotCryonium>],
    [<ore:ingotCryonium>, <ore:ingotCryonium>, <ore:ingotCryonium>],
    [<ore:ingotCryonium>, <ore:ingotCryonium>, <ore:ingotCryonium>]
]);
RecipeUtil.addShaped("auto_gen_100207823", <additions:greedycraft-beast_hand>, [
    [<ore:ingotAeonsteel>, <ore:blockSnow>, <ore:ingotAeonsteel>],
    [<twilightforest:alpha_fur>, <ore:dustDraconium>, <twilightforest:alpha_fur>],
    [null, <twilightforest:alpha_fur>, null]
]);
RecipeUtil.addShaped("auto_gen_1913024224", <additions:greedycraft-sun_totem>, [
    [null, <draconicevolution:wyvern_core>, null],
    [<ore:ingotSolarium>, <minecraft:totem_of_undying>, <ore:ingotSolarium>],
    [null, <ore:netherStar>, null]
]);
RecipeUtil.addShaped("auto_gen_-935233766", <cyclicmagic:block_miner>, [
    [null, <minecraft:iron_pickaxe>, null],
    [<ore:circuitUltimate>, <rftools:machine_frame>, <ore:circuitUltimate>],
    [null, <ore:shardCreative>, null]
]);
RecipeUtil.addShaped("auto_gen_-1848316431", <cyclicmagic:slingshot_weapon>, [
    [<ore:stickWood>, <ore:string>, <ore:stickWood>],
    [null, <ore:stickWood>, null],
    [null, <ore:stickWood>, null]
]);
RecipeUtil.addShaped("auto_gen_1438924738", <ambience:soundnizer>, [
    [<ore:itemCoal>, <ore:itemCoal>, <ore:itemCoal>],
    [<ore:itemCoal>, null, <ore:itemCoal>],
    [<ore:itemCoal>, null, null]
]);
RecipeUtil.addShaped("auto_gen_-14951606", <zensummoning:altar>, [
    [<ore:pearlEnderEye>, <tconevo:material>, <ore:pearlEnderEye>],
    [<tconevo:material>, <ore:netherStar>, <tconevo:material>],
    [<ore:pearlEnderEye>, <tconevo:material>, <ore:pearlEnderEye>]
]);
RecipeUtil.addShaped("shadow_egg", <minecraft:spawn_egg>.withTag({EntityTag: {id: "abyssalcraft:shadowmonster"}}), [
    [null, <ore:blockCoal>, null],
    [<ore:blockCoal>, <minecraft:egg>, <ore:blockCoal>],
    [null, <ore:blockCoal>, null]
]);
RecipeUtil.addShaped("card_0", <rftools:shape_card>, [
    [<ore:paper>, <ore:ingotBrick>, <ore:paper>],
    [<ore:ingotBrick>, <ore:shardCreative>, <ore:ingotBrick>],
    [<ore:paper>, <ore:ingotBrick>, <ore:paper>]
]);
RecipeUtil.addShaped("card_1", <rftools:shape_card:1>, [
    [<ore:paper>, <ore:ingotVoid>, <ore:paper>],
    [<ore:ingotVoid>, <rftools:shape_card>, <ore:ingotVoid>],
    [<ore:paper>, <ore:ingotVoid>, <ore:paper>]
]);
RecipeUtil.addShaped("environmental_controller", <rftools:environmental_controller>, [
    [<ore:pearlEnderEye>, <ore:netherStar>, <ore:pearlEnderEye>],
    [<ore:shardCreative>, <rftools:machine_frame>, <ore:shardCreative>],
    [<ore:pearlEnderEye>, <ore:netherStar>, <ore:pearlEnderEye>]
]);
RecipeUtil.addShaped("frame_alt", <rftools:machine_frame>, [
    [<ore:blockGlass>, <ore:ingotIron>, <ore:blockGlass>],
    [<ore:ingotIron>, <ore:gearTin>, <ore:ingotIron>],
    [<ore:blockGlass>, <ore:ingotIron>, <ore:blockGlass>]
]);
RecipeUtil.addShaped("cytosinite_block", <additions:greedycraft-cytosinite_block>, [
    [<ore:ingotCytosinite>, <ore:ingotCytosinite>, <ore:ingotCytosinite>],
    [<ore:ingotCytosinite>, <ore:ingotCytosinite>, <ore:ingotCytosinite>],
    [<ore:ingotCytosinite>, <ore:ingotCytosinite>, <ore:ingotCytosinite>]
]);
RecipeUtil.addShaped("terra_alloy_block", <additions:greedycraft-terra_alloy_block>, [
    [<ore:ingotTerraAlloy>, <ore:ingotTerraAlloy>, <ore:ingotTerraAlloy>],
    [<ore:ingotTerraAlloy>, <ore:ingotTerraAlloy>, <ore:ingotTerraAlloy>],
    [<ore:ingotTerraAlloy>, <ore:ingotTerraAlloy>, <ore:ingotTerraAlloy>]
]);
RecipeUtil.addShaped("auto_gen_-637448521", <minecraft:spawn_egg>.withTag({EntityTag:{id:"minecraft:stray"}}), [
    [null, <ore:wool>, null],
    [<ore:bone>, <ore:listAllegg>, <ore:bone>],
    [null, <ore:wool>, null]
]);
RecipeUtil.addShaped("auto_gen_1478856706", <minecraft:spawn_egg>.withTag({EntityTag:{id:"thaumcraft:cultistportallesser"}}), [
    [null, <ore:ingotThaumium>, null],
    [<ore:enderpearl>, <ore:listAllegg>, <ore:enderpearl>],
    [null, <ore:ingotThaumium>, null]
]);
RecipeUtil.addShaped("auto_gen_1834508295", <abyssalcraft:stone:7> * 8, [
    [<ore:stone>, <ore:stone>, <ore:stone>],
    [<ore:stone>, <abyssalcraft:shoggothflesh>, <ore:stone>],
    [<ore:stone>, <ore:stone>, <ore:stone>]
]);
RecipeUtil.addShaped("auto_gen_1268894182", <abyssalcraft:shoggothbiomass> * 3, [
    [<ore:itemBiomass>, <ore:itemBiomass>, <ore:itemBiomass>],
    [<ore:itemBiomass>, <abyssalcraft:ccluster9>, <ore:itemBiomass>],
    [<ore:itemBiomass>, <ore:itemBiomass>, <ore:itemBiomass>]
]);
RecipeUtil.addShaped("astral_metal_block", <additions:greedycraft-astral_metal_block>, [
    [<ore:ingotAstralMetal>, <ore:ingotAstralMetal>, <ore:ingotAstralMetal>],
    [<ore:ingotAstralMetal>, <ore:ingotAstralMetal>, <ore:ingotAstralMetal>],
    [<ore:ingotAstralMetal>, <ore:ingotAstralMetal>, <ore:ingotAstralMetal>]
]);
RecipeUtil.addShaped("cosmilite_block", <additions:greedycraft-cosmilite_block>, [
    [<ore:ingotCosmilite>, <ore:ingotCosmilite>, <ore:ingotCosmilite>],
    [<ore:ingotCosmilite>, <ore:ingotCosmilite>, <ore:ingotCosmilite>],
    [<ore:ingotCosmilite>, <ore:ingotCosmilite>, <ore:ingotCosmilite>]
]);
RecipeUtil.addShaped("auto_gen_-1610974886", <extrautils2:machine>.withTag({Type: "extrautils2:generator_slime"}), [
    [<ore:slimeball>, <ore:slimeball>, <ore:slimeball>],
    [<ore:slimeball>, null, <ore:slimeball>],
    [<ore:alloyBasic>, <extrautils2:machine>, <ore:alloyBasic>]
]);
RecipeUtil.addShaped("titanium_ingot", <additions:titanium_ingot>, [
    [<ore:nuggetTitanium>, <ore:nuggetTitanium>, <ore:nuggetTitanium>],
    [<ore:nuggetTitanium>, <ore:nuggetTitanium>, <ore:nuggetTitanium>],
    [<ore:nuggetTitanium>, <ore:nuggetTitanium>, <ore:nuggetTitanium>]
]);
RecipeUtil.addShaped("titanium_block", <additions:greedycraft-titanium_block>, [
    [<ore:ingotTitanium>, <ore:ingotTitanium>, <ore:ingotTitanium>],
    [<ore:ingotTitanium>, <ore:ingotTitanium>, <ore:ingotTitanium>],
    [<ore:ingotTitanium>, <ore:ingotTitanium>, <ore:ingotTitanium>]
]);
RecipeUtil.addShaped("forbidden_bible", <additions:greedycraft-forbidden_bible>, [
    [<ore:ingotVoid>, <ore:ingotDemonicMetal>, <ore:ingotVoid>],
    [<ore:ingotDemonicMetal>, <minecraft:skull:3>.withTag({SkullOwner: "TCreopargh"}), <ore:ingotDemonicMetal>],
    [<ore:ingotVoid>, <ore:ingotDemonicMetal>, <ore:ingotVoid>]
]);
RecipeUtil.addShaped("forbidden_bible_1", <additions:greedycraft-forbidden_bible>, [
    [<ore:ingotVoid>, <ore:ingotDemonicMetal>, <ore:ingotVoid>],
    [<ore:ingotDemonicMetal>, <minecraft:skull:3>.withTag({SkullOwner: {"Name": "TCreopargh"}}), <ore:ingotDemonicMetal>],
    [<ore:ingotVoid>, <ore:ingotDemonicMetal>, <ore:ingotVoid>]
]);
RecipeUtil.addShaped("time_order", <additions:greedycraft-delivery_order>, [
    [<ore:shardTime>, <ore:shardTime>, <ore:shardTime>],
    [<ore:shardTime>, <ore:paper>, <ore:shardTime>],
    [<ore:shardTime>, <ore:shardTime>, <ore:shardTime>]
]);
RecipeUtil.addShaped("difficulty_syncer", <additions:greedycraft-difficulty_syncer>, [
    [<ore:paneGlass>, <ore:paneGlass>, <ore:paneGlass>],
    [<ore:paneGlass>, <ore:bone>, <ore:paneGlass>],
    [<ore:paneGlass>, <ore:paneGlass>, <ore:paneGlass>]
]);
RecipeUtil.addShaped("xnet_cable", <xnet:netcable>.withTag({display: {LocName: "tile.xnet.netcable_blue.name"}}) * 32, [
    [null, <ore:dustRedstone>, null],
    [<ore:dustRedstone>, <ore:ingotCopper>, <ore:dustRedstone>],
    [null, <ore:dustRedstone>, null]
]);
RecipeUtil.addShaped("sol_flux_panel_1", <solarflux:solar_panel_2>, [
    [<solarflux:mirror>, <solarflux:mirror>, <solarflux:mirror>],
    [<solarflux:solar_panel_1>, <ore:ingotGold>, <solarflux:solar_panel_1>],
    [<ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>]
]);
RecipeUtil.addShaped("sol_flux_panel_2", <solarflux:solar_panel_3>, [
    [<solarflux:photovoltaic_cell_1>, <solarflux:photovoltaic_cell_1>, <solarflux:photovoltaic_cell_1>],
    [<ore:ingotInvar>, <solarflux:solar_panel_2>, <ore:ingotInvar>],
    [<ore:ingotInvar>, <ore:ingotInvar>, <ore:ingotInvar>]
]);
RecipeUtil.addShaped("sol_flux_panel_3", <solarflux:solar_panel_4>, [
    [<solarflux:photovoltaic_cell_2>, <solarflux:photovoltaic_cell_2>, <solarflux:photovoltaic_cell_2>],
    [<ore:ingotSteel>, <solarflux:solar_panel_3>, <ore:ingotSteel>],
    [<ore:ingotSteel>, <ore:ingotSteel>, <ore:ingotSteel>]
]);
RecipeUtil.addShaped("sol_flux_panel_4", <solarflux:solar_panel_5>, [
    [<solarflux:photovoltaic_cell_3>, <solarflux:photovoltaic_cell_3>, <solarflux:photovoltaic_cell_3>],
    [<ore:ingotStainlessSteel>, <solarflux:solar_panel_4>, <ore:ingotStainlessSteel>],
    [<ore:ingotStainlessSteel>, <ore:ingotEnergeticAlloy>, <ore:ingotStainlessSteel>]
]);
RecipeUtil.addShaped("sol_flux_panel_5", <solarflux:solar_panel_6>, [
    [<solarflux:photovoltaic_cell_4>, <solarflux:photovoltaic_cell_4>, <solarflux:photovoltaic_cell_4>],
    [<ore:ingotDurasteel>, <solarflux:solar_panel_5>, <ore:ingotDurasteel>],
    [<ore:ingotDurasteel>, <ore:ingotDurasteel>, <ore:ingotDurasteel>]
]);
RecipeUtil.addShaped("sol_flux_panel_6", <solarflux:solar_panel_7>, [
    [<solarflux:photovoltaic_cell_5>, <solarflux:photovoltaic_cell_5>, <solarflux:photovoltaic_cell_5>],
    [<ore:ingotFusionMatrix>, <solarflux:solar_panel_6>, <ore:ingotFusionMatrix>],
    [<ore:ingotFusionMatrix>, <ore:ingotFusionMatrix>, <ore:ingotFusionMatrix>]
]);
RecipeUtil.addShaped("sol_flux_panel_7", <solarflux:solar_panel_8>, [
    [<solarflux:photovoltaic_cell_6>, <solarflux:photovoltaic_cell_6>, <solarflux:photovoltaic_cell_6>],
    [<ore:ingotAeonsteel>, <solarflux:solar_panel_7>, <ore:ingotAeonsteel>],
    [<ore:ingotAeonsteel>, <ore:ingotAeonsteel>, <ore:ingotAeonsteel>]
]);
RecipeUtil.addShaped("bottledstar", <extrabotany:bottledstar>, [
    [<ore:petalYellow>, <ore:petalYellow>, <ore:petalYellow>],
    [<ore:blockGlass>, <ore:fallenStar>, <ore:blockGlass>],
    [<ore:blockGlass>, <ore:blockGlass>, <ore:blockGlass>]
]);
RecipeUtil.addShaped("end_portal_frame", <minecraft:end_portal_frame>, [
    [<ore:pearlEnderEye>, <ore:netherStar>, <ore:pearlEnderEye>],
    [<ore:endstone>, <ore:endstone>, <ore:endstone>],
    [<ore:endstone>, <ore:endstone>, <ore:endstone>]
]);
RecipeUtil.addShaped("experience_transporter", <additions:greedycraft-experience_transporter>, [
    [<ore:pearlEnderEye>, <ore:eternalLifeEssence>, <ore:pearlEnderEye>],
    [<ore:eternalLifeEssence>, <additions:greedycraft-pearl_of_knowledge>, <ore:eternalLifeEssence>],
    [<ore:pearlEnderEye>, <ore:eternalLifeEssence>, <ore:pearlEnderEye>]
]);
RecipeUtil.addShaped("netherite_block", <additions:greedycraft-netherite_block>, [
    [<ore:ingotNetherite>, <ore:ingotNetherite>, <ore:ingotNetherite>],
    [<ore:ingotNetherite>, <ore:ingotNetherite>, <ore:ingotNetherite>],
    [<ore:ingotNetherite>, <ore:ingotNetherite>, <ore:ingotNetherite>]
]);
RecipeUtil.addShaped("overworld_portal", <extrautils2:teleporter>, [
    [<ore:grass>, <ore:grass>, <ore:grass>],
    [<ore:grass>, <ore:pearlEnderEye>, <ore:grass>],
    [<ore:grass>, <ore:grass>, <ore:grass>]
]);
RecipeUtil.addShaped("skill_reset_scroll", <additions:greedycraft-skill_reset_scroll>, [
    [<ore:paper>, <ore:paper>, <ore:paper>],
    [<astralsorcery:itemshiftingstar>, <ore:netherStar>, <astralsorcery:itemshiftingstar>],
    [<ore:paper>, <ore:paper>, <ore:paper>]
]);
//
//
RecipeUtil.addShaped("tofu_machine_case", <tofucraft:tf_machine_case> * 8, [
    [<tofucraft:blocktofumetal>, <tofucraft:blocktofumetal>, <tofucraft:blocktofumetal>],
    [<tofucraft:blocktofumetal>, null, <tofucraft:blocktofumetal>],
    [<tofucraft:blocktofumetal>, <tofucraft:blocktofumetal>, <tofucraft:blocktofumetal>]
]);
RecipeUtil.addShaped("wood_pile", <forestry:wood_pile> * 1, [
    [<ore:logWood>, null, <ore:logWood>],
    [null, <ore:logWood>, null],
    [<ore:logWood>, null, <ore:logWood>]
]);
RecipeUtil.addShaped("blockinputbus_3", <modularmachinery:blockinputbus:3>, [
    [<ore:ingotModularium>, <ore:ingotStainlessSteel>, <ore:ingotModularium>],
    [<ore:ingotStainlessSteel>, <modularmachinery:blockinputbus:2>, <ore:ingotStainlessSteel>],
    [<ore:ingotModularium>, <ore:ingotStainlessSteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockinputbus_4", <modularmachinery:blockinputbus:4>, [
    [<ore:ingotModularium>, <ore:ingotDurasteel>, <ore:ingotModularium>],
    [<ore:ingotDurasteel>, <modularmachinery:blockinputbus:3>, <ore:ingotDurasteel>],
    [<ore:ingotModularium>, <ore:ingotDurasteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockinputbus_5", <modularmachinery:blockinputbus:5>, [
    [<ore:ingotModularium>, <ore:ingotAeonsteel>, <ore:ingotModularium>],
    [<ore:ingotAeonsteel>, <modularmachinery:blockinputbus:4>, <ore:ingotAeonsteel>],
    [<ore:ingotModularium>, <ore:ingotAeonsteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockinputbus_6", <modularmachinery:blockinputbus:6>, [
    [<ore:ingotModularium>, <ore:ingotChromasteel>, <ore:ingotModularium>],
    [<ore:ingotChromasteel>, <modularmachinery:blockinputbus:5>, <ore:ingotChromasteel>],
    [<ore:ingotModularium>, <ore:ingotChromasteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockoutputbus_3", <modularmachinery:blockoutputbus:3>, [
    [<ore:ingotModularium>, <ore:ingotStainlessSteel>, <ore:ingotModularium>],
    [<ore:ingotStainlessSteel>, <modularmachinery:blockoutputbus:2>, <ore:ingotStainlessSteel>],
    [<ore:ingotModularium>, <ore:ingotStainlessSteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockoutputbus_4", <modularmachinery:blockoutputbus:4>, [
    [<ore:ingotModularium>, <ore:ingotDurasteel>, <ore:ingotModularium>],
    [<ore:ingotDurasteel>, <modularmachinery:blockoutputbus:3>, <ore:ingotDurasteel>],
    [<ore:ingotModularium>, <ore:ingotDurasteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockoutputbus_5", <modularmachinery:blockoutputbus:5>, [
    [<ore:ingotModularium>, <ore:ingotAeonsteel>, <ore:ingotModularium>],
    [<ore:ingotAeonsteel>, <modularmachinery:blockoutputbus:4>, <ore:ingotAeonsteel>],
    [<ore:ingotModularium>, <ore:ingotAeonsteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockoutputbus_6", <modularmachinery:blockoutputbus:6>, [
    [<ore:ingotModularium>, <ore:ingotChromasteel>, <ore:ingotModularium>],
    [<ore:ingotChromasteel>, <modularmachinery:blockoutputbus:5>, <ore:ingotChromasteel>],
    [<ore:ingotModularium>, <ore:ingotChromasteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockfluidinputhatch_3", <modularmachinery:blockfluidinputhatch:3>, [
    [<ore:ingotModularium>, <ore:ingotStainlessSteel>, <ore:ingotModularium>],
    [<ore:ingotStainlessSteel>, <modularmachinery:blockfluidinputhatch:2>, <ore:ingotStainlessSteel>],
    [<ore:ingotModularium>, <ore:ingotStainlessSteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockfluidinputhatch_4", <modularmachinery:blockfluidinputhatch:4>, [
    [<ore:ingotModularium>, <ore:ingotDurasteel>, <ore:ingotModularium>],
    [<ore:ingotDurasteel>, <modularmachinery:blockfluidinputhatch:3>, <ore:ingotDurasteel>],
    [<ore:ingotModularium>, <ore:ingotDurasteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockfluidinputhatch_5", <modularmachinery:blockfluidinputhatch:5>, [
    [<ore:ingotModularium>, <ore:ingotAeonsteel>, <ore:ingotModularium>],
    [<ore:ingotAeonsteel>, <modularmachinery:blockfluidinputhatch:4>, <ore:ingotAeonsteel>],
    [<ore:ingotModularium>, <ore:ingotAeonsteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockfluidinputhatch_6", <modularmachinery:blockfluidinputhatch:6>, [
    [<ore:ingotModularium>, <ore:ingotChromasteel>, <ore:ingotModularium>],
    [<ore:ingotChromasteel>, <modularmachinery:blockfluidinputhatch:5>, <ore:ingotChromasteel>],
    [<ore:ingotModularium>, <ore:ingotChromasteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockfluidinputhatch_7", <modularmachinery:blockfluidinputhatch:7>, [
    [<ore:ingotModularium>, <ore:ingotCosmilite>, <ore:ingotModularium>],
    [<ore:ingotCosmilite>, <modularmachinery:blockfluidinputhatch:5>, <ore:ingotCosmilite>],
    [<ore:ingotModularium>, <ore:ingotCosmilite>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockfluidoutputhatch_3", <modularmachinery:blockfluidoutputhatch:3>, [
    [<ore:ingotModularium>, <ore:ingotStainlessSteel>, <ore:ingotModularium>],
    [<ore:ingotStainlessSteel>, <modularmachinery:blockfluidoutputhatch:2>, <ore:ingotStainlessSteel>],
    [<ore:ingotModularium>, <ore:ingotStainlessSteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockfluidoutputhatch_4", <modularmachinery:blockfluidoutputhatch:4>, [
    [<ore:ingotModularium>, <ore:ingotDurasteel>, <ore:ingotModularium>],
    [<ore:ingotDurasteel>, <modularmachinery:blockfluidoutputhatch:3>, <ore:ingotDurasteel>],
    [<ore:ingotModularium>, <ore:ingotDurasteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockfluidoutputhatch_5", <modularmachinery:blockfluidoutputhatch:5>, [
    [<ore:ingotModularium>, <ore:ingotAeonsteel>, <ore:ingotModularium>],
    [<ore:ingotAeonsteel>, <modularmachinery:blockfluidoutputhatch:4>, <ore:ingotAeonsteel>],
    [<ore:ingotModularium>, <ore:ingotAeonsteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockfluidoutputhatch_6", <modularmachinery:blockfluidoutputhatch:6>, [
    [<ore:ingotModularium>, <ore:ingotChromasteel>, <ore:ingotModularium>],
    [<ore:ingotChromasteel>, <modularmachinery:blockfluidoutputhatch:5>, <ore:ingotChromasteel>],
    [<ore:ingotModularium>, <ore:ingotChromasteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockfluidoutputhatch_7", <modularmachinery:blockfluidoutputhatch:7>, [
    [<ore:ingotModularium>, <ore:ingotCosmilite>, <ore:ingotModularium>],
    [<ore:ingotCosmilite>, <modularmachinery:blockfluidoutputhatch:5>, <ore:ingotCosmilite>],
    [<ore:ingotModularium>, <ore:ingotCosmilite>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockenergyinputhatch_3", <modularmachinery:blockenergyinputhatch:3>, [
    [<ore:ingotModularium>, <ore:ingotStainlessSteel>, <ore:ingotModularium>],
    [<ore:ingotStainlessSteel>, <modularmachinery:blockenergyinputhatch:2>, <ore:ingotStainlessSteel>],
    [<ore:ingotModularium>, <ore:ingotStainlessSteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockenergyinputhatch_4", <modularmachinery:blockenergyinputhatch:4>, [
    [<ore:ingotModularium>, <ore:ingotDurasteel>, <ore:ingotModularium>],
    [<ore:ingotDurasteel>, <modularmachinery:blockenergyinputhatch:3>, <ore:ingotDurasteel>],
    [<ore:ingotModularium>, <ore:ingotDurasteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockenergyinputhatch_5", <modularmachinery:blockenergyinputhatch:5>, [
    [<ore:ingotModularium>, <ore:ingotAeonsteel>, <ore:ingotModularium>],
    [<ore:ingotAeonsteel>, <modularmachinery:blockenergyinputhatch:4>, <ore:ingotAeonsteel>],
    [<ore:ingotModularium>, <ore:ingotAeonsteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockenergyinputhatch_6", <modularmachinery:blockenergyinputhatch:6>, [
    [<ore:ingotModularium>, <ore:ingotChromasteel>, <ore:ingotModularium>],
    [<ore:ingotChromasteel>, <modularmachinery:blockenergyinputhatch:5>, <ore:ingotChromasteel>],
    [<ore:ingotModularium>, <ore:ingotChromasteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockenergyinputhatch_7", <modularmachinery:blockenergyinputhatch:7>, [
    [<ore:ingotModularium>, <ore:ingotCosmilite>, <ore:ingotModularium>],
    [<ore:ingotCosmilite>, <modularmachinery:blockenergyinputhatch:5>, <ore:ingotCosmilite>],
    [<ore:ingotModularium>, <ore:ingotCosmilite>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockenergyoutputhatch_3", <modularmachinery:blockenergyoutputhatch:3>, [
    [<ore:ingotModularium>, <ore:ingotStainlessSteel>, <ore:ingotModularium>],
    [<ore:ingotStainlessSteel>, <modularmachinery:blockenergyoutputhatch:2>, <ore:ingotStainlessSteel>],
    [<ore:ingotModularium>, <ore:ingotStainlessSteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockenergyoutputhatch_4", <modularmachinery:blockenergyoutputhatch:4>, [
    [<ore:ingotModularium>, <ore:ingotDurasteel>, <ore:ingotModularium>],
    [<ore:ingotDurasteel>, <modularmachinery:blockenergyoutputhatch:3>, <ore:ingotDurasteel>],
    [<ore:ingotModularium>, <ore:ingotDurasteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockenergyoutputhatch_5", <modularmachinery:blockenergyoutputhatch:5>, [
    [<ore:ingotModularium>, <ore:ingotAeonsteel>, <ore:ingotModularium>],
    [<ore:ingotAeonsteel>, <modularmachinery:blockenergyoutputhatch:4>, <ore:ingotAeonsteel>],
    [<ore:ingotModularium>, <ore:ingotAeonsteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockenergyoutputhatch_6", <modularmachinery:blockenergyoutputhatch:6>, [
    [<ore:ingotModularium>, <ore:ingotChromasteel>, <ore:ingotModularium>],
    [<ore:ingotChromasteel>, <modularmachinery:blockenergyoutputhatch:5>, <ore:ingotChromasteel>],
    [<ore:ingotModularium>, <ore:ingotChromasteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockenergyoutputhatch_7", <modularmachinery:blockenergyoutputhatch:7>, [
    [<ore:ingotModularium>, <ore:ingotCosmilite>, <ore:ingotModularium>],
    [<ore:ingotCosmilite>, <modularmachinery:blockenergyoutputhatch:5>, <ore:ingotCosmilite>],
    [<ore:ingotModularium>, <ore:ingotCosmilite>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockinputbus_2", <modularmachinery:blockinputbus:2>, [
    [<ore:ingotModularium>, <ore:ingotSteel>, <ore:ingotModularium>],
    [<ore:ingotSteel>, <modularmachinery:blockinputbus:1>, <ore:ingotSteel>],
    [<ore:ingotModularium>, <ore:ingotSteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockoutputbus_2", <modularmachinery:blockoutputbus:2>, [
    [<ore:ingotModularium>, <ore:ingotSteel>, <ore:ingotModularium>],
    [<ore:ingotSteel>, <modularmachinery:blockoutputbus:1>, <ore:ingotSteel>],
    [<ore:ingotModularium>, <ore:ingotSteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockfluidinputhatch_2", <modularmachinery:blockfluidinputhatch:2>, [
    [<ore:ingotModularium>, <ore:ingotSteel>, <ore:ingotModularium>],
    [<ore:ingotSteel>, <modularmachinery:blockfluidinputhatch:1>, <ore:ingotSteel>],
    [<ore:ingotModularium>, <ore:ingotSteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockfluidoutputhatch_2", <modularmachinery:blockfluidoutputhatch:2>, [
    [<ore:ingotModularium>, <ore:ingotSteel>, <ore:ingotModularium>],
    [<ore:ingotSteel>, <modularmachinery:blockfluidoutputhatch:1>, <ore:ingotSteel>],
    [<ore:ingotModularium>, <ore:ingotSteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockenergyinputhatch_2", <modularmachinery:blockenergyinputhatch:2>, [
    [<ore:ingotModularium>, <ore:ingotSteel>, <ore:ingotModularium>],
    [<ore:ingotSteel>, <modularmachinery:blockenergyinputhatch:1>, <ore:ingotSteel>],
    [<ore:ingotModularium>, <ore:ingotSteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("blockenergyoutputhatch_2", <modularmachinery:blockenergyoutputhatch:2>, [
    [<ore:ingotModularium>, <ore:ingotSteel>, <ore:ingotModularium>],
    [<ore:ingotSteel>, <modularmachinery:blockenergyoutputhatch:1>, <ore:ingotSteel>],
    [<ore:ingotModularium>, <ore:ingotSteel>, <ore:ingotModularium>]
]);
RecipeUtil.addShaped("casing_strong", <modularmachinery:blockcasing:4> * 4, [
    [<ore:ingotSteel>, <modularmachinery:blockcasing>, <ore:ingotSteel>],
    [<modularmachinery:blockcasing>, null, <modularmachinery:blockcasing>],
    [<ore:ingotSteel>, <modularmachinery:blockcasing>, <ore:ingotSteel>]
]);
RecipeUtil.addShaped("high_oven_io_2", <tcomplement:high_oven_io:2>, [
    [<tcomplement:materials:1>, <ore:ingotIron>, <tcomplement:materials:1>],
    [null, null, null],
    [<tcomplement:materials:1>, <ore:ingotIron>, <tcomplement:materials:1>]
]);
RecipeUtil.addShaped("stainless_steel_block", <additions:greedycraft-stainless_steel_block>, [
    [<ore:ingotStainlessSteel>, <ore:ingotStainlessSteel>, <ore:ingotStainlessSteel>],
    [<ore:ingotStainlessSteel>, <ore:ingotStainlessSteel>, <ore:ingotStainlessSteel>],
    [<ore:ingotStainlessSteel>, <ore:ingotStainlessSteel>, <ore:ingotStainlessSteel>]
]);
RecipeUtil.addShaped("mekanism_casing", <mekanism:basicblock:8>, [
    [<ore:ingotStainlessSteel>, <ore:blockGlassHardened>, <ore:ingotStainlessSteel>],
    [<ore:blockGlassHardened>, <ore:ingotOsmium>, <ore:blockGlassHardened>],
    [<ore:ingotStainlessSteel>, <ore:blockGlassHardened>, <ore:ingotStainlessSteel>]
]);
RecipeUtil.addShaped("auto_gen_2008269634", <buildinggadgets:buildingtool>, [
    [<ore:ingotStainlessSteel>, <ore:dustRedstone>, <ore:ingotStainlessSteel>],
    [<ore:ingotBronze>, <ore:gemDiamond>, <ore:ingotBronze>],
    [<ore:ingotStainlessSteel>, <ore:dustRedstone>, <ore:ingotStainlessSteel>]
]);
RecipeUtil.addShaped("auto_gen_352019415", <buildinggadgets:exchangertool>, [
    [<ore:ingotStainlessSteel>, <ore:dustRedstone>, <ore:ingotStainlessSteel>],
    [<ore:pearlEnderEye>, <ore:gemDiamond>, <ore:pearlEnderEye>],
    [<ore:ingotStainlessSteel>, <ore:dustRedstone>, <ore:ingotStainlessSteel>]
]);
/* Disabled
RecipeUtil.addShaped("auto_gen_-1071431898", <buildinggadgets:copypastetool>, [
    [<ore:ingotStainlessSteel>, <ore:dustRedstone>, <ore:ingotStainlessSteel>],
    [<ore:slimeball>, <ore:gemDiamond>, <ore:slimeball>],
    [<ore:ingotStainlessSteel>, <ore:dustRedstone>, <ore:ingotStainlessSteel>]
]); */
/* Disabled
RecipeUtil.addShaped("auto_gen_12241914", <buildinggadgets:destructiontool>, [
    [<ore:ingotAeonsteel>, <minecraft:bedrock>, <ore:ingotAeonsteel>],
    [<ore:ingotRavaging>, <ore:netherStar>, <ore:ingotRavaging>],
    [<ore:ingotAeonsteel>, <minecraft:bedrock>, <ore:ingotAeonsteel>]
]); */
RecipeUtil.addShaped("witch_essence", <minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:witch"}}), [
    [null, <ore:essenceWitch>, null],
    [<ore:essenceWitch>, <ore:egg>, <ore:essenceWitch>],
    [null, <ore:essenceWitch>, null]
]);
RecipeUtil.addShaped("nylon_string", <additions:nylon_string>, [
    [<thermalfoundation:material:833>, <thermalfoundation:material:833>, <thermalfoundation:material:833>]
]);
RecipeUtil.addShaped("nylon_cloth", <additions:nylon_cloth>, [
    [<ore:stringNylon>, <ore:stringNylon>, <ore:stringNylon>],
    [<ore:stringNylon>, <ore:stringNylon>, <ore:stringNylon>],
    [<ore:stringNylon>, <ore:stringNylon>, <ore:stringNylon>]
]);
RecipeUtil.addShaped("rubber_band", <additions:rubber_band>, [
    [<thermalfoundation:material:832>, <thermalfoundation:material:832>, <thermalfoundation:material:832>]
]);
RecipeUtil.addShaped("ender_casing", <actuallyadditions:block_misc:8>, [
    [<ore:ingotEnderium>, <ore:ingotFusionMatrix>, <ore:ingotEnderium>],
    [<ore:ingotDurasteel>, <ore:blockQuartzBlack> | <ore:blockQuartzDark>, <ore:ingotDurasteel>],
    [<ore:ingotEnderium>, <ore:ingotFusionMatrix>, <ore:ingotEnderium>]
]);
RecipeUtil.addShaped("stainless_steel_ball", <additions:greedycraft-stainless_steel_ball> * 24, [
    [null, <ore:ingotStainlessSteel>, null],
    [<ore:ingotStainlessSteel>, <ore:ingotStainlessSteel>, <ore:ingotStainlessSteel>],
    [null, <ore:ingotStainlessSteel>, null]
]);
RecipeUtil.addShaped("plate_of_honor", <additions:greedycraft-plate_of_honor>, [
    [null, <quark:rune:16>, null],
    [<quark:rune:16>, <ore:cast>, <quark:rune:16>],
    [null, <quark:rune:16>, null]
]);
RecipeUtil.addShaped("emc_collector_purple", <projectex:collector:5>, [
    [null, <projectex:matter:2>, null],
    [<projectex:matter:2>, <ore:soulCreative>, <projectex:matter:2>],
    [null, <projectex:matter:2>, null]
]);
RecipeUtil.addShaped("demagnetizer", <demagnetize:demagnetizer>, [
    [<ore:ingotIron>, <ore:dustRedstone>, <ore:ingotIron>],
    [<ore:dustRedstone>, <ore:ingotElectricalSteel>, <ore:dustRedstone>],
    [<ore:ingotIron>, <ore:dustRedstone>, <ore:ingotIron>]
]);
RecipeUtil.addShaped("demagnetizer_advanced", <demagnetize:demagnetizer_advanced>, [
    [<ore:ingotStainlessSteel>, <ore:ingotConductiveIron>, <ore:ingotStainlessSteel>],
    [<ore:ingotConductiveIron>, <demagnetize:demagnetizer>, <ore:ingotConductiveIron>],
    [<ore:ingotStainlessSteel>, <ore:ingotConductiveIron>, <ore:ingotStainlessSteel>]
]);// 
RecipeUtil.addShaped("chunk_analyzer", <randomthings:chunkanalyzer>, [
    [<ore:stickIron>, null, <ore:stickIron>],
    [<ore:ingotStainlessSteel>, <ore:gemTerrestrial>, <ore:ingotStainlessSteel>],
    [<ore:ingotChromium>, <ore:ingotStainlessSteel>, <ore:ingotChromium>]
]);
RecipeUtil.addShaped("harvester", <cyclicmagic:harvester_block>, [
    [null, <cyclicmagic:tool_harvest_crops>, null],
    [<ore:ingotAeonsteel>, <minecraft:dispenser>, <ore:ingotAeonsteel>],
    [<ore:circuitUltimate>, <ore:ingotAeonsteel>, <ore:circuitUltimate>]
]);
RecipeUtil.addShaped("ma_mystical_fertilizer", <mysticalagriculture:mystical_fertilizer> * 2, [
    [<mysticalagriculture:fertilized_essence>, <thermalfoundation:fertilizer:2>, <mysticalagriculture:fertilized_essence>],
    [<thermalfoundation:fertilizer:2>, <ore:essenceSupremium>, <thermalfoundation:fertilizer:2>],
    [<mysticalagriculture:fertilized_essence>, <thermalfoundation:fertilizer:2>, <mysticalagriculture:fertilized_essence>]
]);
RecipeUtil.addShaped("protonium_block", <additions:greedycraft-protonium_block>, [
    [<ore:ingotProtonium>, <ore:ingotProtonium>, <ore:ingotProtonium>],
    [<ore:ingotProtonium>, <ore:ingotProtonium>, <ore:ingotProtonium>],
    [<ore:ingotProtonium>, <ore:ingotProtonium>, <ore:ingotProtonium>]
]);
RecipeUtil.addShaped("protonium_ingot", <additions:protonium_ingot>, [
    [<ore:nuggetCosmicNeutronium>, <projectex:matter>, <ore:nuggetCosmicNeutronium>],
    [<projectex:matter>, <additions:greedycraft-energy_matter_core>.transformReplace(<additions:greedycraft-energy_matter_core>), <projectex:matter>],
    [<ore:nuggetCosmicNeutronium>, <projectex:matter>, <ore:nuggetCosmicNeutronium>]
]);
RecipeUtil.addShaped("electronium_block", <additions:greedycraft-electronium_block>, [
    [<ore:ingotElectronium>, <ore:ingotElectronium>, <ore:ingotElectronium>],
    [<ore:ingotElectronium>, <ore:ingotElectronium>, <ore:ingotElectronium>],
    [<ore:ingotElectronium>, <ore:ingotElectronium>, <ore:ingotElectronium>]
]);
RecipeUtil.addShaped("respawn_anchor", <additions:greedycraft-respawn_anchor>, [
    [<ore:shardTime>, <ore:ingotAeroite>, <ore:shardTime>],
    [<ore:ingotAsgardium>, <ore:ingotAeroite>, <ore:ingotAsgardium>],
    [<ore:shardTime>, <ore:ingotAsgardium>, <ore:shardTime>]
]);
RecipeUtil.addShaped("crimsonite_block", <additions:greedycraft-crimsonite_block>, [
    [<ore:ingotCrimsonite>, <ore:ingotCrimsonite>, <ore:ingotCrimsonite>],
    [<ore:ingotCrimsonite>, <ore:ingotCrimsonite>, <ore:ingotCrimsonite>],
    [<ore:ingotCrimsonite>, <ore:ingotCrimsonite>, <ore:ingotCrimsonite>]
]);
RecipeUtil.addShaped("loli_lolipop", <additions:greedycraft-loli_lolipop>, [
    [null, <ore:listAllsugar>, <ore:shardTime>],
    [null, <ore:stickWood>, <ore:listAllsugar>],
    [<ore:stickWood>, null, null]
]);
RecipeUtil.addShaped("soul_forge", <bloodmagic:soul_forge>, [
    [<ore:ingotStainlessSteel>, null, <ore:ingotStainlessSteel>],
    [<ore:blockNetherBrick>, <ore:rodBlaze>, <ore:blockNetherBrick>],
    [<ore:blockNetherBrick>, <ore:blockIron>, <ore:blockNetherBrick>]
]);
RecipeUtil.addShaped("amber_brick", <thaumcraft:amber_brick> * 4, [
    [<ore:blockAmber>, <ore:blockAmber>],
    [<ore:blockAmber>, <ore:blockAmber>]
]);
RecipeUtil.addShaped("stellar_alloy_conduit_energy", <enderio:item_endergy_conduit:11> * 8, [
    [<ore:itemConduitBinder>, <ore:ingotStellarAlloy>, <ore:itemConduitBinder>],
    [<ore:itemInfinityGoop>, <ore:ingotTitanium>, <ore:itemInfinityGoop>],
    [<ore:itemConduitBinder>, <ore:ingotStellarAlloy>, <ore:itemConduitBinder>]
]);
RecipeUtil.addShaped("stellar_alloy_conduit_fluid", <enderio:item_fluid_conduit> * 8, [
    [<ore:itemConduitBinder>, <ore:ingotStellarAlloy>, <ore:itemConduitBinder>],
    [<ore:blockGlassHardened>, <ore:ingotTitanium>, <ore:blockGlassHardened>],
    [<ore:itemConduitBinder>, <ore:ingotStellarAlloy>, <ore:itemConduitBinder>]
]);
RecipeUtil.addShaped("calling_stone", <defiledlands:calling_stone>, [
    [<ore:dustBlaze>, <ore:gemScarlite>, <ore:dustBlaze>],
    [<ore:gemScarlite>, <defiledlands:black_heart>, <ore:gemScarlite>],
    [<ore:dustBlaze>, <ore:gemScarlite>, <ore:dustBlaze>]
]);
RecipeUtil.addShaped("cyclic_heart_food", <cyclicmagic:heart_food>, [
    [<scalinghealth:heartcontainer>, <scalinghealth:heartcontainer>, <scalinghealth:heartcontainer>],
    [<scalinghealth:heartcontainer>, <ore:ingotCrimsonite>, <scalinghealth:heartcontainer>],
    [<scalinghealth:heartcontainer>, <scalinghealth:heartcontainer>, <scalinghealth:heartcontainer>]
]);
RecipeUtil.addShaped("soul_vial", <enderio:item_soul_vial>, [
    [null, <ore:ingotSoularium>, null],
    [<ore:blockGlass>, null, <ore:blockGlass>],
    [null, <ore:blockGlass>, null]
]);
RecipeUtil.addShaped("ender_hook", <hooked:hook:4>, [
    [<ore:pearlEnderEye>, <ore:rodBlaze>, <ore:endstone>],
    [null, <hooked:hook:2>, <ore:rodBlaze>],
    [<ore:dustBlaze>, null, <ore:pearlEnderEye>]
]);
RecipeUtil.addShaped("soul_snare", <bloodmagic:soul_snare> * 8, [
    [null, <ore:dustDreadium>, <minecraft:web>],
    [null, <ore:stringNylon>, <ore:dustDreadium>],
    [<ore:ingotThaumium>, null, null]
]);
RecipeUtil.addShaped("blood_apple", <variegated:blood_apple>, [
    [<ore:ingotCrimsonite>, <ore:shardCreative>, <ore:ingotCrimsonite>],
    [<ore:shardCreative>, <minecraft:golden_apple>, <ore:shardCreative>],
    [<ore:ingotCrimsonite>, <ore:shardCreative>, <ore:ingotCrimsonite>]
]);
RecipeUtil.addShaped("hydra_spawn_egg", <minecraft:spawn_egg>.withTag({EntityTag: {id: "twilightforest:hydra"}}), [
    [<twilightforest:cooked_meef>, <twilightforest:cooked_meef>, <twilightforest:cooked_meef>],
    [<twilightforest:meef_stroganoff>, <minecraft:egg>, <twilightforest:meef_stroganoff>],
    [<twilightforest:cooked_meef>, <twilightforest:cooked_meef>, <twilightforest:cooked_meef>]
]);
RecipeUtil.addShaped("exu_building_wand", <extrautils2:itembuilderswand>, [
    [null, <ore:ingotAsgardium>, <ore:blockGold>],
    [null, <ore:blockMagicalWood>, <ore:ingotAsgardium>],
    [<ore:blockMagicalWood>, null, null]
]);
RecipeUtil.addShaped("bubble_ring", <aeble:bubble_ring>, [
    [<ore:ingotAqualite>, <ore:ingotAsgardium>, <ore:ingotAqualite>],
    [<ore:ingotAsgardium>, null, <ore:ingotAsgardium>],
    [<ore:ingotAqualite>, <ore:ingotAsgardium>, <ore:ingotAqualite>]
]);
RecipeUtil.addShaped("ice_ring", <aeble:ice_ring>, [
    [<ore:ice>, <ore:ingotAsgardium>, <ore:ice>],
    [<ore:ingotAsgardium>, null, <ore:ingotAsgardium>],
    [<ore:ice>, <ore:ingotAsgardium>, <ore:ice>]
]);
RecipeUtil.addShaped("zanite_ring", <aeble:zanite_ring>, [
    [<ore:gemZanite>, <ore:ingotAsgardium>, <ore:gemZanite>],
    [<ore:ingotAsgardium>, null, <ore:ingotAsgardium>],
    [<ore:gemZanite>, <ore:ingotAsgardium>, <ore:gemZanite>]
]);
RecipeUtil.addShaped("obsidian_ring", <aeble:obsidian_ring>, [
    [<ore:obsidian>, <ore:ingotAsgardium>, <ore:obsidian>],
    [<ore:ingotAsgardium>, null, <ore:ingotAsgardium>],
    [<ore:obsidian>, <ore:ingotAsgardium>, <ore:obsidian>]
]);
RecipeUtil.addShaped("regen_ring", <aeble:regeneration_ring>, [
    [<scalinghealth:heartcontainer>, <ore:ingotAsgardium>, <scalinghealth:heartcontainer>],
    [<ore:ingotAsgardium>, null, <ore:ingotAsgardium>],
    [<scalinghealth:heartcontainer>, <ore:ingotAsgardium>, <scalinghealth:heartcontainer>]
]);
RecipeUtil.addShaped("air_ring", <aeble:air_ring>, [
    [<ore:ingotAeroite>, <ore:ingotAsgardium>, <ore:ingotAeroite>],
    [<ore:ingotAsgardium>, null, <ore:ingotAsgardium>],
    [<ore:ingotAeroite>, <ore:ingotAsgardium>, <ore:ingotAeroite>]
]);
RecipeUtil.addShaped("valkyrie_belt", <aeble:valkyrie_belt>, [
    [<ore:ingotValkyrie>, <ore:ingotAsgardium>, <ore:ingotValkyrie>],
    [<ore:ingotAsgardium>, null, <ore:ingotAsgardium>],
    [<ore:ingotValkyrie>, <ore:ingotAsgardium>, <ore:ingotValkyrie>]
]);
RecipeUtil.addShaped("repulsion_belt", <aeble:repulsion_belt>, [
    [<ore:pearlEnderEye>, <ore:ingotAsgardium>, <ore:pearlEnderEye>],
    [<ore:ingotAsgardium>, null, <ore:ingotAsgardium>],
    [<ore:pearlEnderEye>, <ore:ingotAsgardium>, <ore:pearlEnderEye>]
]);
RecipeUtil.addShaped("coregod", <extrabotany:coregod>.withTag({}), [
    [<ore:quartzSunny>, <ore:quartzSunny>, <ore:quartzSunny>],
    [<ore:ingotOrichalcos>, <minecraft:elytra>, <ore:ingotOrichalcos>],
    [<ore:quartzSunny>, <ore:quartzSunny>, <ore:quartzSunny>]
]);
RecipeUtil.addShaped("iron_plate", <abyssalcraft:ironp> * 4, [
    [<ore:ingotIron>, <ore:ingotIron>],
    [<ore:ingotIron>, <ore:ingotIron>]
]);
RecipeUtil.addShaped("iron_trap_door", <minecraft:iron_trapdoor> * 2, [
    [<ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>],
    [<ore:ingotIron>, <ore:dustRedstone>, <ore:ingotIron>],
    [<ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>]
]);
RecipeUtil.addShaped("quantum_quarry_core", <extrautils2:quarry>, [
    [<draconicevolution:awakened_core>, <ore:ingotChromasteel>, <draconicevolution:awakened_core>],
    [<ore:ingotChromasteel>, <ore:magic_snow_globe>, <ore:ingotChromasteel>],
    [<draconicevolution:awakened_core>, <ore:ingotChromasteel>, <draconicevolution:awakened_core>]
]);
RecipeUtil.addShaped("quantum_quarry_proxy", <extrautils2:quarryproxy>, [
    [<ore:ingotEndSteel>, <ore:circuitUltimate>, <ore:ingotEndSteel>],
    [<ore:ingotAeonsteel>, <ore:gemTerrestrial>, <ore:ingotAeonsteel>],
    [<ore:ingotEndSteel>, <ore:ingotEndSteel>, <ore:ingotEndSteel>]
]);
RecipeUtil.addShaped("charm_of_keeping_2", <twilightforest:charm_of_keeping_2>, [
    [<ore:ingotDurasteel>, <twilightforest:charm_of_keeping_1>, <ore:ingotDurasteel>],
    [<twilightforest:charm_of_keeping_1>, <minecraft:golden_apple:1>, <twilightforest:charm_of_keeping_1>],
    [<ore:ingotDurasteel>, <twilightforest:charm_of_keeping_1>, <ore:ingotDurasteel>]
]);
RecipeUtil.addShaped("charm_of_keeping_3", <twilightforest:charm_of_keeping_3>, [
    [<ore:ingotAeonsteel>, <twilightforest:charm_of_keeping_2>, <ore:ingotAeonsteel>],
    [<twilightforest:charm_of_keeping_2>, <ore:netherStar>, <twilightforest:charm_of_keeping_2>],
    [<ore:ingotAeonsteel>, <twilightforest:charm_of_keeping_2>, <ore:ingotAeonsteel>]
]);
RecipeUtil.addShaped("mek_casing_2", <mekanism:basicblock2:7>, [
    [null, <ore:ingotAeonsteel>, null],
    [<ore:ingotAeonsteel>, <ore:ingotStainlessSteel>, <ore:ingotAeonsteel>],
    [null, <ore:ingotAeonsteel>, null]
]);
RecipeUtil.addShaped("mek_circuit_1", <mekanism:controlcircuit:1>, [
    [null, <ore:ingotStainlessSteel>, null],
    [<ore:alloyAdvanced>, <ore:circuitBasic>, <ore:alloyAdvanced>],
    [null, <ore:ingotStainlessSteel>, null]
]);
RecipeUtil.addShaped("mek_circuit_2", <mekanism:controlcircuit:2>, [
    [null, <ore:ingotDurasteel>, null],
    [<ore:alloyElite>, <ore:circuitAdvanced>, <ore:alloyElite>],
    [null, <ore:ingotDurasteel>, null]
]);
RecipeUtil.addShaped("mek_circuit_3", <mekanism:controlcircuit:3>, [
    [null, <ore:ingotAeonsteel>, null],
    [<ore:alloyUltimate>, <ore:circuitElite>, <ore:alloyUltimate>],
    [null, <ore:ingotAeonsteel>, null]
]);
RecipeUtil.addShaped("phantom_interface", <actuallyadditions:block_phantomface>, [
    [<ore:ingotAeonsteel>, <actuallyadditions:item_misc:8>, <ore:ingotAeonsteel>],
    [<ore:alloyUltimate>, <actuallyadditions:block_misc:8>, <ore:alloyUltimate>],
    [<ore:ingotAeonsteel>, <actuallyadditions:item_misc:8>, <ore:ingotAeonsteel>]
]);
RecipeUtil.addShaped("exu_user", <extrautils2:user>, [
    [<ore:blockAeonsteel>, <minecraft:dispenser>, <ore:blockAeonsteel>],
    [<ore:alloyUltimate>, <ore:circuitUltimate>, <ore:alloyUltimate>],
    [<ore:blockAeonsteel>, <extrautils2:redstoneclock>, <ore:blockAeonsteel>]
]);
RecipeUtil.addShaped("cyclic_user", <cyclicmagic:block_user>, [
    [<ore:blockAeonsteel>, <minecraft:dispenser>, <ore:blockAeonsteel>],
    [<ore:alloyUltimate>, <ore:circuitUltimate>, <ore:alloyUltimate>],
    [<ore:blockAeonsteel>, <cyclicmagic:clock>, <ore:blockAeonsteel>]
]);
RecipeUtil.addShaped("turret_base_1", <openmodularturrets:turret_base>, [
    [<ore:ingotIron>, <openmodularturrets:intermediate_regular>, <ore:ingotIron>],
    [<openmodularturrets:intermediate_regular>, <openmodularturrets:intermediate_tiered>, <openmodularturrets:intermediate_regular>],
    [<ore:ingotIron>, <openmodularturrets:intermediate_regular>, <ore:ingotIron>]
]);
RecipeUtil.addShaped("turret_base_2", <openmodularturrets:turret_base:1>, [
    [<ore:ingotSteel>, <openmodularturrets:intermediate_regular>, <ore:ingotSteel>],
    [<openmodularturrets:intermediate_regular>, <openmodularturrets:intermediate_tiered:1>, <openmodularturrets:intermediate_regular>],
    [<ore:ingotSteel>, <openmodularturrets:intermediate_regular>, <ore:ingotSteel>]
]);
RecipeUtil.addShaped("turret_base_3", <openmodularturrets:turret_base:2>, [
    [<ore:ingotDurasteel>, <openmodularturrets:intermediate_regular>, <ore:ingotDurasteel>],
    [<openmodularturrets:intermediate_regular>, <openmodularturrets:intermediate_tiered:2>, <openmodularturrets:intermediate_regular>],
    [<ore:ingotDurasteel>, <openmodularturrets:intermediate_regular>, <ore:ingotDurasteel>]
]);
RecipeUtil.addShaped("turret_base_4", <openmodularturrets:turret_base:3>, [
    [<ore:ingotAeonsteel>, <openmodularturrets:intermediate_regular>, <ore:ingotAeonsteel>],
    [<openmodularturrets:intermediate_regular>, <openmodularturrets:intermediate_tiered:3>, <openmodularturrets:intermediate_regular>],
    [<ore:ingotAeonsteel>, <openmodularturrets:intermediate_regular>, <ore:ingotAeonsteel>]
]); 
RecipeUtil.addShaped("turret_base_5", <openmodularturrets:turret_base:4>, [
    [<ore:ingotChromasteel>, <openmodularturrets:intermediate_regular>, <ore:ingotChromasteel>],
    [<openmodularturrets:intermediate_regular>, <openmodularturrets:intermediate_tiered:4>, <openmodularturrets:intermediate_regular>],
    [<ore:ingotChromasteel>, <openmodularturrets:intermediate_regular>, <ore:ingotChromasteel>]
]);
RecipeUtil.addShaped("gel_torch", <minecraft:torch> * 16, [
    [<ore:gel>],
    [<ore:stickWood>]
]);
RecipeUtil.addShaped("mega_torch", <torchmaster:mega_torch>, [
    [<ore:gel>, <ore:torch>, <ore:gel>],
    [<ore:gemDiamond>, <ore:plankWood>, <ore:gemDiamond>],
    [<ore:ingotGold>, <ore:plankWood>, <ore:ingotGold>]
]);
RecipeUtil.addShaped("flare_lantern", <torchmaster:feral_flare_lantern>, [
    [<ore:blockGlass>, <ore:dustBlaze>, <ore:blockGlass>],
    [<ore:gel>, <ore:rodBlaze>, <ore:gel>],
    [<ore:blockGlass>, <ore:rodBlaze>, <ore:blockGlass>]
]);
RecipeUtil.addShaped("dread_lamp", <torchmaster:dread_lamp>, [
    [<ore:obsidian>, <ore:blockGlass>, <ore:obsidian>],
    [<ore:gel>, <ore:rodBlaze>, <ore:gel>],
    [<ore:obsidian>, <ore:blockGlass>, <ore:obsidian>]
]);
RecipeUtil.addShaped("openblocks_sponge", <openblocks:sponge> * 2, [
    [<ore:slimeball>, <minecraft:sponge>, <ore:slimeball>],
    [<minecraft:sponge>, <ore:slimeball>, <minecraft:sponge>],
    [<ore:slimeball>, <minecraft:sponge>, <ore:slimeball>]
]);
RecipeUtil.addShaped("growth_ring", <actuallyadditions:item_growth_ring>, [
    [<ore:shardCreative>, <minecraft:wheat_seeds>, <ore:shardCreative>],
    [<minecraft:wheat_seeds>, <actuallyadditions:item_misc:6>, <minecraft:wheat_seeds>],
    [<ore:shardCreative>, <minecraft:wheat_seeds>, <ore:shardCreative>]
]);
RecipeUtil.addShaped("efln", <tconstruct:throwball:1> * 4, [
    [<ore:gunpowder>, <ore:dustSulfur>, <ore:gunpowder>],
    [<ore:dustSulfur>, <ore:ingotMeteor>, <ore:dustSulfur>],
    [<ore:gunpowder>, <ore:dustSulfur>, <ore:gunpowder>]
]);
RecipeUtil.addShaped("heal_block", <openblocks:heal>, [
    [<scalinghealth:heartcontainer>, <scalinghealth:heartcontainer>, <scalinghealth:heartcontainer>],
    [<scalinghealth:heartcontainer>, <additions:greedycraft-medkit_super>, <scalinghealth:heartcontainer>],
    [<scalinghealth:heartcontainer>, <scalinghealth:heartcontainer>, <scalinghealth:heartcontainer>]
]);
RecipeUtil.addShaped("openblocks_elevator", <openblocks:elevator>, [
    [<ore:dustRedstone>, <ore:gemDiamond>, <ore:dustRedstone>],
    [<ore:ingotIron>, <ore:enderpearl>, <ore:ingotIron>],
    [<ore:ingotInvar>, <ore:ingotInvar>, <ore:ingotInvar>]
]);
RecipeUtil.addShaped("conjuring_altar", <defiledlands:conjuring_altar>, [
    [null, null, null],
    [<ore:ingotUmbrium>, <ore:blockScarlite>, <ore:ingotUmbrium>],
    [<ore:ingotUmbrium>, <ore:ingotUmbrium>, <ore:ingotUmbrium>]
]);
RecipeUtil.addShaped("twilight_gem_alt", <additions:greedycraft-twilight_gem>, [
    [null, <twilightforest:magic_map_focus>, null],
    [<ore:ingotSteeleaf>, <ore:gemDiamond>, <twilightforest:naga_scale>],
    [null, <ore:ingotKnightmetal>, null]
]);
RecipeUtil.addShaped("aa_dough_water_bucket", <actuallyadditions:item_misc:4>, [
    [<ore:foodFlour>, <ore:foodFlour>, <ore:foodFlour>],
    [<ore:foodFlour>, <minecraft:water_bucket>.transformReplace(<minecraft:bucket>), <ore:foodFlour>], 
    [<ore:foodFlour>, <ore:foodFlour>, <ore:foodFlour>]
]);
RecipeUtil.addShaped("crystal_cluster_brick", <bloodmagic:decorative_brick:3> * 4, [
    [<bloodmagic:decorative_brick:2>, <bloodmagic:decorative_brick:2>],
    [<bloodmagic:decorative_brick:2>, <bloodmagic:decorative_brick:2>]
]);
RecipeUtil.addShaped("auto_gen_1921390605", <extrautils2:teleporter:1>, [
    [<ore:ingotNihilite>, <ore:ingotEthaxium>, <ore:ingotNihilite>],
    [<ore:ingotEthaxium>, <ore:netherStar>, <ore:ingotEthaxium>],
    [<ore:ingotNihilite>, <ore:ingotEthaxium>, <ore:ingotNihilite>]
]);
RecipeUtil.addShaped("final_cuit", <additions:mekaddon-final_control_circuit>, [
    [null, <ore:ingotChromasteel>, null],
    [<ore:alloyFinal>, <ore:circuitUltimate>, <ore:alloyFinal>],
    [null, <ore:ingotChromasteel>, null]
]);
recipes.addShaped(<gct_ores:rainboquartz_block_chiseled>, [
    [<gct_ores:rainboquartz_slab>], [<gct_ores:rainboquartz_slab>]]);
recipes.addShaped(<gct_ores:rainboquartz_stair> * 4, [
    [<gct_ores:rainboquartz_slab>, null, null], [<gct_ores:rainboquartz_slab>, <gct_ores:rainboquartz_slab>, null], 
    [<gct_ores:rainboquartz_slab>, <gct_ores:rainboquartz_slab>, <gct_ores:rainboquartz_slab>]]);
recipes.addShaped(<gct_ores:rainboquartz_slab> * 6, [
    [<gct_ores:rainboquartz_block>, <gct_ores:rainboquartz_block>, <gct_ores:rainboquartz_block>]]);
recipes.addShaped(<gct_ores:stormy_shard>, [
    [<gct_ores:stormy_fragment_large>, <gct_ores:stormy_fragment_large>, <gct_ores:stormy_fragment_large>], 
    [<gct_ores:stormy_fragment_large>, <gct_ores:stormy_fragment_large>, <gct_ores:stormy_fragment_large>], 
    [<gct_ores:stormy_fragment_large>, <gct_ores:stormy_fragment_large>, <gct_ores:stormy_fragment_large>]
    ]);

/* Templates

RecipeUtil.addShaped("", <>, [
    [null, null, null],
    [null, null, null],
    [null, null, null]
]);

RecipeUtil.addShaped("", <>, [
    [],
    [],
    []
]);
*/

