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

val oeEnchantId = <enchantment:oeintegration:oreexcavation>.id as int;

////////////////////////////////
//                            //
//    Shapeless   Recipes     //
//                            //
////////////////////////////////

recipes.remove(<gct_ores:chaos_shard_block>);
recipes.addShaped(<gct_ores:chaos_shard_block> * 1, [[<draconicevolution:chaos_shard:0>, <draconicevolution:chaos_shard:0>, <draconicevolution:chaos_shard:0>], [<draconicevolution:chaos_shard:0>, <draconicevolution:chaos_shard:0>, <draconicevolution:chaos_shard:0>],[<draconicevolution:chaos_shard:0>, <draconicevolution:chaos_shard:0>, <draconicevolution:chaos_shard:0>]]);
recipes.remove(<draconicevolution:chaos_shard:0>);
recipes.addShaped(<draconicevolution:chaos_shard:0> * 9, [[<gct_ores:chaos_shard_block>, null, null], [null, null, null],[null, null, null]]);
recipes.remove(<gct_ores:stormy_shard_block>);
recipes.addShaped(<gct_ores:stormy_shard_block> * 1, [[<gct_ores:stormy_shard>, <gct_ores:stormy_shard>, <gct_ores:stormy_shard>], [<gct_ores:stormy_shard>, <gct_ores:stormy_shard>, <gct_ores:stormy_shard>],[<gct_ores:stormy_shard>, <gct_ores:stormy_shard>, <gct_ores:stormy_shard>]]);
recipes.remove(<gct_ores:stormy_shard>);
recipes.addShaped(<gct_ores:stormy_shard> * 9, [[<gct_ores:stormy_shard_block>, null, null], [null, null, null],[null, null, null]]);

recipes.addShapeless(<botania:dreamwood:1> * 4, [<gct_mobs:dreamwood_log>]);
recipes.addShapeless(<gct_mobs:reversed_dreamwood_plank> * 4, [<gct_mobs:reversed_dreamwood_log>]);
recipes.addShapeless(<botania:manaresource:5> * 32, [<gct_mobs:gaia_heart>]);

recipes.addShapeless(<additions:godlikeum_essence>, [<ore:essenceExtremium>,<ore:essenceExtremium>,<ore:essenceExtremium>,<ore:essenceExtremium>,<ore:essenceExtremium>,<ore:essenceExtremium>]);
recipes.addShapeless(<additions:extremium_essence> * 4, [<ore:essenceGodlikeum>]);
recipes.addShapeless(<mysticalagradditions:insanium> * 4, [<ore:essenceExtremium>]);
recipes.addShapeless(<additions:extremium_essence>, [<ore:essenceInsanium>,<ore:essenceInsanium>,<ore:essenceInsanium>,<ore:essenceInsanium>,<ore:essenceInsanium>,<ore:essenceInsanium>]);

recipes.addShapeless(<thebetweenlands:slimy_dirt>, [<thebetweenlands:swamp_dirt>,<thebetweenlands:sludge_ball>,<minecraft:slime>,<thebetweenlands:items_plant_drop:1>]);

recipes.addShapeless(<additions:godslime_slimeball>, [<minecraft:slime_ball>,<betterslimes:blue_slime>,<betterslimes:red_slime>,<betterslimes:yellow_slime>,<betterslimes:purple_slime>,<betterslimes:black_slime>,<tconstruct:edible:1>,<tconstruct:edible:2>,<tconstruct:edible:4>]);

RecipeUtil.addShapeless("godslime_mud", <additions:slimy_mud_god>, 
    [<ore:slimeballGod>, <ore:slimeballGod>, <ore:slimeballGod>, <ore:slimeballGod>, <ore:sandAlf>, <ore:dirtAlf>]
);
RecipeUtil.addShapeless("silicon_gem_1to4", <appliedenergistics2:material:5> * 4,
    [<ore:ingotSilicon>]
);
RecipeUtil.addShapeless("silicon_ingot_4to1", <additions:silicon_ingot>,
    [<ore:itemSilicon>, <ore:itemSilicon>, <ore:itemSilicon>, <ore:itemSilicon>]
);
RecipeUtil.addShapeless("carbon_ingot_4to1", <additions:carbon_ingot>, 
    [<ore:dustGraphite>, <ore:dustGraphite>, <ore:dustGraphite>, <ore:dustGraphite>]
);
RecipeUtil.addShapeless("carbon_ingot_1to4", <nuclearcraft:dust:8> * 4,
    [<ore:ingotCarbon>]
);
RecipeUtil.addShapeless("star_1", <additions:canopy_star>, 
    [<additions:broken_canopy_star>, <additions:canopy_seed>]
);
RecipeUtil.addShapeless("star_2", <additions:end_star>, 
    [<additions:broken_end_star>, <additions:end_seed>]
);
RecipeUtil.addShapeless("star_3", <additions:ice_star>, 
    [<additions:broken_ice_star>, <additions:ice_seed>]
);
RecipeUtil.addShapeless("vethea_crafting_table", <minecraft:crafting_table> * 1,
    [<ore:logWoodVethea>]
);
RecipeUtil.addShapeless("web_to_string", <minecraft:string> * 2,
    [<minecraft:web>]
);
RecipeUtil.addShapeless("encyclopedia", omnipedia,
    [<akashictome:tome>]
);
RecipeUtil.addShapeless("thermal_shapeless_1", <thermalfoundation:material:2051>,
    [<minecraft:blaze_powder>,<thermalfoundation:material:2049>]
);
RecipeUtil.addShapeless("thermal_shapeless_2", <thermalfoundation:material:2053>,
    [<minecraft:blaze_powder>,<minecraft:blaze_powder>,<minecraft:stone>]
);
RecipeUtil.addShapeless("thermal_shapeless_3", <thermalfoundation:material:25>,
    [<aether_legacy:golden_ring>]
);
RecipeUtil.addShapeless("thermal_shapeless_4", <thermalfoundation:material:24>,
    [<aether_legacy:iron_ring>]
);
RecipeUtil.addShapeless("rotleather", <minecraft:leather>,
    [<minecraft:rotten_flesh>,<minecraft:rotten_flesh>,<minecraft:rotten_flesh>,<minecraft:rotten_flesh>]
);
RecipeUtil.addShapeless("oebook", <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5 as short, id: 78}]}),
    [<oeintegration:excavatemodifier>, <oeintegration:excavatemodifier>, <oeintegration:excavatemodifier>, <oeintegration:excavatemodifier>, <oeintegration:excavatemodifier>, <minecraft:book>]
);
RecipeUtil.addShapeless("auto_gen_1334582590", <avaritia:block_resource:1> * 64,
    [<additions:infinity_block_block>]
);
RecipeUtil.addShapeless("auto_gen_-702569552", <additions:infinity_block_block> * 64,
    [<additions:infinity_block_block_block>]
);
RecipeUtil.addShapeless("auto_gen_163670440", <ftbquests:lootcrate>.withTag({type:"loot_level_1"}),
    [<additions:reward_ticket_common>]
);
RecipeUtil.addShapeless("auto_gen_1701963744", <ftbquests:lootcrate>.withTag({type:"loot_level_2"}),
    [<additions:reward_ticket_rare>]
);
RecipeUtil.addShapeless("auto_gen_-1818409148", <ftbquests:lootcrate>.withTag({type:"loot_level_3"}),
    [<additions:reward_ticket_epic>]
);
RecipeUtil.addShapeless("auto_gen_-86832743", <ftbquests:lootcrate>.withTag({type:"loot_level_4"}),
    [<additions:reward_ticket_legendary>]
);
RecipeUtil.addShapeless("auto_gen_747705352", <thermalfoundation:material:199>,
    [<projecte:item.pe_philosophers_stone>.transformReplace(<projecte:item.pe_philosophers_stone>), <ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>]
);
RecipeUtil.addShapeless("auto_gen_1647035237", <thermalfoundation:material:133>,
    [<ore:ingotCopper>, <ore:ingotCopper>, <ore:ingotCopper>, <ore:ingotCopper>, <ore:ingotCopper>, <projecte:item.pe_philosophers_stone>.transformReplace(<projecte:item.pe_philosophers_stone>)]
);
RecipeUtil.addShapeless("auto_gen_104947165", <thermalfoundation:material:134>,
    [<projecte:item.pe_philosophers_stone>.transformReplace(<projecte:item.pe_philosophers_stone>), <ore:ingotGold>, <ore:ingotGold>, <ore:ingotGold>, <ore:ingotGold>, <ore:ingotGold>]
);
RecipeUtil.addShapeless("auto_gen_1862248730", <minecraft:potion>.withTag({Potion: "minecraft:luck"}),
    [<minecraft:glass_bottle>, <additions:lucky_clover>]
);
RecipeUtil.addShapeless("auto_gen_288981592", <minecraft:crafting_table> * 4,
    [<ore:logWood>, <ore:logWood>, <ore:logWood>, <ore:logWood>]
);
RecipeUtil.addShapeless("auto_gen_-1694793471", <minecraft:potion>.withTag({Potion: "minecraft:water"}),
    [<minecraft:glass_bottle>, <minecraft:water_bucket>.transformReplace(<minecraft:water_bucket>)]
);
RecipeUtil.addShapeless("auto_gen_-865558598", <minecraft:dragon_breath>,
    [<minecraft:glass_bottle>, <ore:skullEnderDragon>.transformReplace(<minecraft:skull:5>)]
);
RecipeUtil.addShapeless("auto_gen_-340562326", <minecraft:spawn_egg>.withTag({EntityTag: {id: "abyssalcraft:chagaroth"}}),
    [<abyssalcraft:dreadaltartop>.transformReplace(<abyssalcraft:dreadaltartop>), <abyssalcraft:dreadaltarbottom>.transformReplace(<abyssalcraft:dreadaltarbottom>), <abyssalcraft:dreadshard>]
);
RecipeUtil.addShapeless("auto_gen_1565439995", <scalinghealth:heartdust> * 9,
    [<scalinghealth:crystalshard>]
);
RecipeUtil.addShapeless("auto_gen_522430280", <scalinghealth:crystalshard>,
    [<scalinghealth:heartdust>, <scalinghealth:heartdust>, <scalinghealth:heartdust>, <scalinghealth:heartdust>, <scalinghealth:heartdust>, <scalinghealth:heartdust>, <scalinghealth:heartdust>, <scalinghealth:heartdust>, <scalinghealth:heartdust>]
);
RecipeUtil.addShapeless("auto_gen_-1180907112", <scalinghealth:crystalshard> * 9,
    [<scalinghealth:heartcontainer>]
);
RecipeUtil.addShapeless("auto_gen_1296047035", <minecraft:splash_potion>.withTag({CustomPotionEffects:[{Duration:2400,Id:1,Amplifier:49},{Duration:2400,Id:3,Amplifier:49},{Duration:2400,Id:5,Amplifier:49},{Id:6,Amplifier:28},{Duration:2400,Id:8,Amplifier:49},{Duration:2400,Id:10,Amplifier:31},{Duration:2400,Id:11,Amplifier:4},{Duration:2400,Id:12},{Duration:2400,Id:13},{Duration:2400,Id:14},{Duration:2400,Id:16},{Duration:2400,Id:21,Amplifier:49},{Duration:2400,Id:22,Amplifier:49},{Id:23,Amplifier:119},{Duration:2400,Id:26,Amplifier:49},{Duration:2400,Id:28}],CustomPotionColor:16648959,display:{Lore:[LangUtil.translate("greedycraft.misc.draconic_potion.tooltip")],Name:LangUtil.translate("greedycraft.misc.draconic_potion.name")}}),
    [<minecraft:glass_bottle>, <additions:dragon_soul>, <ore:shardCreative>, <ore:shardCreative>]
);
RecipeUtil.addShapeless("auto_gen_-2147158797", <minecraft:splash_potion>.withTag({CustomPotionEffects:[{Duration:2400,Id:2,Amplifier:49},{Duration:2400,Id:4,Amplifier:49},{Id:7,Amplifier:28},{Duration:2400,Id:9},{Duration:2400,Id:15},{Duration:2400,Id:17,Amplifier:49},{Duration:2400,Id:18,Amplifier:49},{Duration:2400,Id:19,Amplifier:4},{Duration:2400,Id:20,Amplifier:2},{Duration:2400,Id:24},{Duration:2400,Id:25,Amplifier:49},{Duration:2400,Id:27,Amplifier:49}],CustomPotionColor:0,display:{Lore:[LangUtil.translate("greedycraft.misc.blight_potion.tooltip")],Name:LangUtil.translate("greedycraft.misc.blight_potion.name")}}),
    [<minecraft:glass_bottle>, <additions:wither_soul>, <ore:shardCreative>, <ore:shardCreative>]
);
RecipeUtil.addShapeless("auto_gen_269849607", <additions:experience_block> * 9,
    [<additions:compressed_experience_block>]
);
RecipeUtil.addShapeless("auto_gen_680300395", <additions:experience_ingot> * 9,
    [<additions:experience_block>]
);
RecipeUtil.addShapeless("auto_gen_198647556", <additions:experience_nugget> * 9,
    [<additions:experience_ingot>]
);
RecipeUtil.addShapeless("auto_gen_1353175347", <additions:experience_nugget>,
    [<mysticalagriculture:xp_droplet>]
);
RecipeUtil.addShapeless("auto_gen_-1011385798", <minecraft:crafting_table>,
    [<tconstruct:tooltables>]
);
RecipeUtil.addShapeless("auto_gen_741775353", <thermalfoundation:material:135>,
    [<projecte:item.pe_philosophers_stone>.transformReplace(<projecte:item.pe_philosophers_stone>), <ore:ingotPlatinum>, <ore:ingotPlatinum>, <ore:ingotPlatinum>, <ore:ingotPlatinum>]
);
RecipeUtil.addShapeless("auto_gen_1102737540", <actuallyadditions:item_misc:20>,
    [<enderio:item_broken_spawner>]
);
RecipeUtil.addShapeless("auto_gen_21729634", <minecraft:tallgrass:1>,
    [<biomesoplenty:plant_0:1>]
);
RecipeUtil.addShapeless("auto_gen_1318457067", <minecraft:tallgrass:1>,
    [<biomesoplenty:plant_0>]
);
RecipeUtil.addShapeless("auto_gen_1910785345", <additions:death_counter>,
    [<tconstruct:pattern>, <minecraft:bone>]
);
RecipeUtil.addShapeless("ma_essence_0", <mysticalagriculture:crafting:1>,
    [<mysticalagriculture:crafting>, <mysticalagriculture:crafting>, <mysticalagriculture:crafting>, <mysticalagriculture:crafting>, <mysticalagriculture:crafting>, <mysticalagriculture:crafting>]
);
RecipeUtil.addShapeless("ma_essence_1", <mysticalagriculture:crafting:2>,
    [<mysticalagriculture:crafting:1>, <mysticalagriculture:crafting:1>, <mysticalagriculture:crafting:1>, <mysticalagriculture:crafting:1>, <mysticalagriculture:crafting:1>, <mysticalagriculture:crafting:1>]
);
RecipeUtil.addShapeless("ma_essence_2", <mysticalagriculture:crafting:3>,
    [<mysticalagriculture:crafting:2>, <mysticalagriculture:crafting:2>, <mysticalagriculture:crafting:2>, <mysticalagriculture:crafting:2>, <mysticalagriculture:crafting:2>, <mysticalagriculture:crafting:2>]
);
RecipeUtil.addShapeless("ma_essence_3", <mysticalagriculture:crafting:4>,
    [<mysticalagriculture:crafting:3>, <mysticalagriculture:crafting:3>, <mysticalagriculture:crafting:3>, <mysticalagriculture:crafting:3>, <mysticalagriculture:crafting:3>, <mysticalagriculture:crafting:3>]
);
RecipeUtil.addShapeless("ma_essence_4", <mysticalagradditions:insanium>,
    [<mysticalagriculture:crafting:4>, <mysticalagriculture:crafting:4>, <mysticalagriculture:crafting:4>, <mysticalagriculture:crafting:4>, <mysticalagriculture:crafting:4>, <mysticalagriculture:crafting:4>]
);
RecipeUtil.addShapeless("ma_essence_0_rev", <mysticalagriculture:crafting> * 4, 
    [<mysticalagriculture:crafting:1>]
);
RecipeUtil.addShapeless("ma_essence_1_rev", <mysticalagriculture:crafting:1> * 4,
    [<mysticalagriculture:crafting:2>]
);
RecipeUtil.addShapeless("ma_essence_2_rev", <mysticalagriculture:crafting:2> * 4, 
    [<mysticalagriculture:crafting:3>]
);
RecipeUtil.addShapeless("ma_essence_3_rev", <mysticalagriculture:crafting:3> * 4, 
    [<mysticalagriculture:crafting:4>]
);
RecipeUtil.addShapeless("ma_essence_4_rev", <mysticalagriculture:crafting:4> * 4, 
    [<mysticalagradditions:insanium>]
);
RecipeUtil.addShapeless("auto_gen_271729765", <mysticalagriculture:crafting:33>,
    [<mysticalagriculture:crafting:32>, <mysticalagriculture:crafting>, <mysticalagriculture:crafting>, <mysticalagriculture:crafting>, <mysticalagriculture:crafting>]
);
RecipeUtil.addShapeless("auto_gen_2055027330", <mysticalagriculture:crafting:34>,
    [<mysticalagriculture:crafting:32>, <mysticalagriculture:crafting:1>, <mysticalagriculture:crafting:1>, <mysticalagriculture:crafting:1>, <mysticalagriculture:crafting:1>]
);
RecipeUtil.addShapeless("auto_gen_1970110023", <mysticalagriculture:crafting:35>,
    [<mysticalagriculture:crafting:32>, <mysticalagriculture:crafting:2>, <mysticalagriculture:crafting:2>, <mysticalagriculture:crafting:2>, <mysticalagriculture:crafting:2>]
);
RecipeUtil.addShapeless("auto_gen_1885192716", <mysticalagriculture:crafting:36>,
    [<mysticalagriculture:crafting:32>, <mysticalagriculture:crafting:3>, <mysticalagriculture:crafting:3>, <mysticalagriculture:crafting:3>, <mysticalagriculture:crafting:3>]
);
RecipeUtil.addShapeless("auto_gen_1800275409", <mysticalagriculture:crafting:37>,
    [<mysticalagriculture:crafting:32>, <mysticalagriculture:crafting:4>, <mysticalagriculture:crafting:4>, <mysticalagriculture:crafting:4>, <mysticalagriculture:crafting:4>]
);
RecipeUtil.addShapeless("auto_gen_-1248999641", <mysticalagradditions:insanium:2>,
    [<mysticalagriculture:crafting:32>, <mysticalagradditions:insanium>, <mysticalagradditions:insanium>, <mysticalagradditions:insanium>, <mysticalagradditions:insanium>]
);
RecipeUtil.addShapeless("auto_gen_-1317989727", <astralsorcery:blockmarble:6> * 3,
    [<ore:stoneMarble>, <ore:stoneMarble>, <ore:stoneMarble>]
);
RecipeUtil.addShapeless("auto_gen_1877622542", <astralsorcery:blockmarble>,
    [<ore:stoneMarble>]
);
RecipeUtil.addShapeless("auto_gen_303589427", <quark:marble>,
    [<ore:stoneMarble>]
);
RecipeUtil.addShapeless("auto_gen_-739881408", <chisel:marble2:7>,
    [<ore:stoneMarble>]
);
RecipeUtil.addShapeless("auto_gen_-880073734", <forge:bucketfilled>,
    [<forge:bucketfilled>.withTag({ForgeCaps:{"astralsorcery:cap_item_amulet_holder":{}},tag:{FluidName:"resin",Amount:1000}})]
);
RecipeUtil.addShapeless("auto_gen_-983697411", <forge:bucketfilled>,
    [<forge:bucketfilled>.withTag({ForgeCaps:{"astralsorcery:cap_item_amulet_holder":{}},tag:{FluidName:"binnie.resin",Amount:1000}})]
);
RecipeUtil.addShapeless("auto_gen_-628920196", <minecraft:experience_bottle>,
    [<minecraft:glass_bottle>, <actuallyadditions:item_crystal_empowered:1>]
);
RecipeUtil.addShapeless("auto_gen_-2041446050", <storagedrawers:upgrade_creative> * 32,
    [<storagedrawers:upgrade_template>, <ore:shardCreative>]
);
RecipeUtil.addShapeless("auto_gen_-2041446051", <storagedrawers:upgrade_creative>,
    [<storagedrawers:upgrade_template>, <draconicevolution:awakened_core>]
);
RecipeUtil.addShapeless("auto_gen_-60414065", <mysticalagradditions:insanium> * 9,
    [<ore:blockInsaniumEssence>]
);
RecipeUtil.addShapeless("auto_gen_1844726144", <mysticalagriculture:crafting:4> * 9,
    [<ore:blockSupremiumEssence>]
);
RecipeUtil.addShapeless("auto_gen_1323422212", <mysticalagriculture:crafting:3> * 9,
    [<ore:blockSuperiumEssence>]
);
RecipeUtil.addShapeless("auto_gen_662804194", <mysticalagriculture:crafting:2> * 9,
    [<ore:blockIntermediumEssence>]
);
RecipeUtil.addShapeless("auto_gen_1137610693", <mysticalagriculture:crafting:1> * 9,
    [<ore:blockPrudentiumEssence>]
);
RecipeUtil.addShapeless("auto_gen_-163727312", <mysticalagriculture:crafting> * 9,
    [<ore:blockInferiumEssence>]
);
RecipeUtil.addShapeless("auto_gen_-1028255111", <appliedenergistics2:material:36>,
    [<appliedenergistics2:material:35>, <appliedenergistics2:material:35>, <appliedenergistics2:material:35>, <appliedenergistics2:material:35>]
);
RecipeUtil.addShapeless("auto_gen_-1168410344", <appliedenergistics2:material:37>,
    [<appliedenergistics2:material:36>, <appliedenergistics2:material:36>, <appliedenergistics2:material:36>, <appliedenergistics2:material:36>]
);
RecipeUtil.addShapeless("auto_gen_-1308565577", <appliedenergistics2:material:38>,
    [<appliedenergistics2:material:37>, <appliedenergistics2:material:37>, <appliedenergistics2:material:37>, <appliedenergistics2:material:37>]
);
RecipeUtil.addShapeless("pack_guide_book", <patchouli:guide_book>.withTag({"patchouli:book":"patchouli:greedycraft_guide_book"}),
    [<ore:stickWood>, <ore:stickWood>, <ore:stickWood>]
);
RecipeUtil.addShapeless("auto_gen_-1966891614", <quark:black_ash>,
    [<darkutils:material>]
);
RecipeUtil.addShapeless("auto_gen_2033568330", <enderio:item_material:63>,
    [<quark:black_ash>]
);
RecipeUtil.addShapeless("auto_gen_254615916", <quark:black_ash>,
    [<enderio:item_material:63>]
);
RecipeUtil.addShapeless("auto_gen_-2112645397", <quark:black_ash>,
    [<netherex:wither_dust>]
);
RecipeUtil.addShapeless("auto_gen_1194975689", <netherex:wither_dust>,
    [<quark:black_ash>]
);
RecipeUtil.addShapeless("auto_gen_-1387251411", <netherex:wither_dust>,
    [<darkutils:material>]
);
RecipeUtil.addShapeless("auto_gen_932948151", <netherex:wither_dust>,
    [<enderio:item_material:63>]
);
RecipeUtil.addShapeless("auto_gen_455125292", <tconevo:material> * 9,
    [<ore:blockFusionMatrix>]
);
RecipeUtil.addShapeless("auto_gen_330301095", <additions:infernium_ingot> * 9,
    [<additions:infernium_block>]
);
RecipeUtil.addShapeless("auto_gen_193347573", <additions:infernium_nugget> * 9,
    [<additions:infernium_ingot>]
);
RecipeUtil.addShapeless("unlock_chest", <additions:tower_chest_unlocked>,
    [<additions:tower_chest>, <additions:tower_chest_key>.anyDamage().transformDamage(1)]
);
RecipeUtil.addShapeless("stone", <additions:pebble>,
    [<ore:rocks>]
);
RecipeUtil.addShapeless("twig", <minecraft:stick>,
    [<ore:twigs>]
);
RecipeUtil.addShapeless("auto_gen_-1599197603", <additions:grass_string>,
    [<ore:plantFibre>, <ore:plantFibre>, <ore:plantFibre>]
);
RecipeUtil.addShapeless("auto_gen_-689226972", <additions:crude_hatchet>,
    [<ore:pebble>, <ore:string>, <ore:stickWood>]
);
RecipeUtil.addShapeless("auto_gen_-1342866062", <twilightforest:magic_map_focus>,
    [<twilightforest:raven_feather>, <twilightforest:torchberries>]
);
RecipeUtil.addShapeless("sand_to_glass", <minecraft:glass>,
    [<ore:sand>, <additions:fake_philosopher_stone>.transformReplace(<additions:fake_philosopher_stone>)]
);
RecipeUtil.addShapeless("stick", <minecraft:stick>,
    [<ore:twigs>]
);
RecipeUtil.addShapeless("earth_talisman", <mowziesmobs:earth_talisman>,
    [<ore:dirt>, <ore:shardCreative>, <ore:shardCreative>]
);
RecipeUtil.addShapeless("auto_gen_-518845405", <additions:cryonium_ingot> * 9,
    [<ore:blockCryonium>]
);
RecipeUtil.addShapeless("sea_oat2", <harvestcraft:oatsitem>,
    [<biomesoplenty:double_plant:3>]
);
RecipeUtil.addShapeless("sapling", <minecraft:stick>,
    [<ore:treeSapling>]
);
RecipeUtil.addShapeless("cattail", <additions:plant_fibre>,
    [<ore:plantCattail>]
);
RecipeUtil.addShapeless("firework", <minecraft:fireworks>,
    [<minecraft:fire_charge>, <ore:paper>, <ore:gunpowder>]
);
RecipeUtil.addShapeless("frame_alt_2", <rftools:machine_frame>,
    [<thermalexpansion:frame>]
);
RecipeUtil.addShapeless("frame_alt_2_reverse", <thermalexpansion:frame>,
    [<rftools:machine_frame>]
);
RecipeUtil.addShapeless("terra_alloy_block_rev", <additions:terra_alloy_ingot> * 9,
    [<ore:blockTerraAlloy>]
);
RecipeUtil.addShapeless("cytosinite_block_rev", <additions:cytosinite_ingot> * 9,
    [<ore:blockCytosinite>]
);
RecipeUtil.addShapeless("auto_gen_1193453886", <tconstruct:cast>.withTag({PartType:"tconstruct:arrow_shaft"}),
    [<tconstruct:arrow_shaft>, <ore:ingotGold>, <ore:ingotGold>]
);
RecipeUtil.addShapeless("astral_metal_block_rev", <additions:astral_metal_ingot> * 9,
    [<ore:blockAstralMetal>]
);
RecipeUtil.addShapeless("cosmilite_block_rev", <additions:cosmilite_ingot> * 9,
    [<ore:blockCosmilite>]
);
RecipeUtil.addShapeless("titanium_ingot_rev", <additions:titanium_nugget> * 9,
    [<ore:ingotTitanium>]
);
RecipeUtil.addShapeless("titanium_block_rev", <additions:titanium_ingot> * 9,
    [<ore:blockTitanium>]
);
RecipeUtil.addShapeless("netherite_block_rev", <additions:netherite_ingot> * 9,
    [<ore:blockNetherite>]
);
RecipeUtil.addShapeless("tofu_gem_1", <tofucraft:material:26>,
    [<tofucraft:mineral_soymilk>, <tofucraft:mineral_soymilk>, <tofucraft:nigari>]
);
RecipeUtil.addShapeless("tofu_gem_2", <tofucraft:material:27>,
    [<tofucraft:mineral_soymilk>, <tofucraft:mineral_soymilk>, <tofucraft:nigari>, <forge:bucketfilled>.withTag({FluidName: "soymilk_hell", Amount: 1000})]
);
RecipeUtil.addShapeless("stainless_steel_rev", <additions:stainless_steel_ingot> * 9,
    [<ore:blockStainlessSteel>]
);
RecipeUtil.addShapeless("terrestrial_artifact", <biomesoplenty:terrestrial_artifact>,
    [<ore:gemRuby>, <ore:gemTopaz>, <ore:gemAmber>, <ore:gemPeridot>, <ore:gemMalachite>, <ore:gemSapphire>, <ore:gemTanzanite>, <ore:gemAmethyst>, <ore:gemScarlite>]
);
RecipeUtil.addShapeless("protonium_rev", <additions:protonium_ingot> * 9,
    [<ore:blockProtonium>]
);
RecipeUtil.addShapeless("electronium_rev", <additions:electronium_ingot> * 9,
    [<ore:blockElectronium>]
);
RecipeUtil.addShapeless("neutronium_combination", <avaritia:resource:4> * 2,
    [<ore:ingotProtonium>, <ore:ingotElectronium>]
);
RecipeUtil.addShapeless("neutronium_block_combination", <avaritia:block_resource> * 2,
    [<ore:blockProtonium>, <ore:blockElectronium>]
);
RecipeUtil.addShapeless("rotten_flesh_block_1", <charm:rotten_flesh_block>,
    [<thaumcraft:flesh_block>]
);
RecipeUtil.addShapeless("rotten_flesh_block_2", <thaumcraft:flesh_block>,
    [<charm:rotten_flesh_block>]
);
RecipeUtil.addShapeless("maid_token", <touhou_little_maid:gashapon_coin>,
    [<touhou_little_maid:gashapon_coin>]
);
RecipeUtil.addShapeless("crimsonite_rev", <additions:crimsonite_ingot> * 9,
    [<ore:blockCrimsonite>]
);
RecipeUtil.addShapeless("black_quartz_block", <actuallyadditions:block_misc:2>,
    [<ore:gemQuartzBlack>, <ore:gemQuartzBlack>, <ore:gemQuartzBlack>, <ore:gemQuartzBlack>]
);
RecipeUtil.addShapeless("forestry_resource_2", <magicbees:resource:2> * 4,
    [<ore:itemBiomassRich>, <ore:itemBiomassRich>, <ore:itemBiomassRich>, <ore:itemBiomassRich>]
);
RecipeUtil.addShapeless("advanced_coil", <actuallyadditions:item_misc:8>,
    [<actuallyadditions:item_misc:7>, <ore:ingotDurasteel>]
);
RecipeUtil.addShapeless("clear_rock_crystal_nbt", <astralsorcery:itemrockcrystalsimple>,
    [<astralsorcery:itemtunedrockcrystal>]
);
RecipeUtil.addShapeless("clear_rock_crystal_nbt_1", <astralsorcery:itemrockcrystalsimple>,
    [<astralsorcery:itemrockcrystalsimple>]
);
RecipeUtil.addShapeless("solarium_star", <additions:solarium_star>,
    [<additions:broken_solarium_star>, <additions:solar_seed>]
);
RecipeUtil.addShapeless("slimeball_convert", <minecraft:slime_ball>,
    [<ore:slimeball>]
);
RecipeUtil.addShapeless("openblocks_elevator_rotating", <openblocks:elevator_rotating>,
    [<openblocks:elevator:*>, <minecraft:compass>]
);
RecipeUtil.addShapeless("flax_to_string", <minecraft:string> * 2,
    [<harvestcraft:flaxitem>, <harvestcraft:flaxitem>, <harvestcraft:flaxitem>]
);
RecipeUtil.addShapeless("obsidian_boots_normal", <randomthings:obsidianwaterwalkingboots>,
    [<randomthings:waterwalkingboots>, <randomthings:obsidianskull>]
);
RecipeUtil.addShapeless("lava_wader_normal", <randomthings:lavawader>,
    [<randomthings:obsidianwaterwalkingboots>, <randomthings:lavacharm>]
);
RecipeUtil.addShapeless("aa_dough", <actuallyadditions:item_misc:4>,
    [<ore:foodFlour>, <liquid:water> * 125]
);
RecipeUtil.addShapeless("rev_medal_pioneer", <additions:ordinary_medal> * 9,
    [<additions:pioneer_medal>]
);
RecipeUtil.addShapeless("rev_medal_greedy", <additions:pioneer_medal> * 9,
    [<additions:greedy_medal>]
);
RecipeUtil.addShapeless("rev_tome_1", <additions:ancient_tome_page> * 9,
    [<additions:ancient_tome>]
);
RecipeUtil.addShapeless("rev_tome_0", <additions:ancient_tome_fragment> * 9,
    [<additions:ancient_tome_page>]
);
RecipeUtil.addShapeless("gold_medal_rev", <additions:bounty_hunter_medal_silver> * 9,
    [<additions:bounty_hunter_medal>]
);
RecipeUtil.addShapeless("silver_medal_rev", <additions:bounty_hunter_medal_bronze> * 9,
    [<additions:bounty_hunter_medal_silver>]
);
RecipeUtil.addShapeless("essence_super_0", <mysticalagriculture:storage:1>,
    [<mysticalagriculture:master_infusion_crystal>, <mysticalagriculture:storage>, <mysticalagriculture:storage>, <mysticalagriculture:storage>, <mysticalagriculture:storage>, <mysticalagriculture:storage>]
);
RecipeUtil.addShapeless("essence_super_1", <mysticalagriculture:storage:2>,
    [<mysticalagriculture:master_infusion_crystal>, <mysticalagriculture:storage:1>, <mysticalagriculture:storage:1>, <mysticalagriculture:storage:1>, <mysticalagriculture:storage:1>, <mysticalagriculture:storage:1>]
);
RecipeUtil.addShapeless("essence_super_2", <mysticalagriculture:storage:3>,
    [<mysticalagriculture:master_infusion_crystal>, <mysticalagriculture:storage:2>, <mysticalagriculture:storage:2>, <mysticalagriculture:storage:2>, <mysticalagriculture:storage:2>, <mysticalagriculture:storage:2>]
);
RecipeUtil.addShapeless("essence_super_3", <mysticalagriculture:storage:4>,
    [<mysticalagriculture:master_infusion_crystal>, <mysticalagriculture:storage:3>, <mysticalagriculture:storage:3>, <mysticalagriculture:storage:3>, <mysticalagriculture:storage:3>, <mysticalagriculture:storage:3>]
);
RecipeUtil.addShapeless("essence_super_4", <mysticalagradditions:storage>,
    [<mysticalagriculture:master_infusion_crystal>, <mysticalagriculture:storage:4>, <mysticalagriculture:storage:4>, <mysticalagriculture:storage:4>, <mysticalagriculture:storage:4>, <mysticalagriculture:storage:4>]
);
RecipeUtil.addShapelessOf("rock_crystal_compress", <astralsorcery:blockcustomore:0>,
    <astralsorcery:itemrockcrystalsimple>, 9
);
RecipeUtil.addShapeless("manacell256k", <crazyae:mana_cell_256k>, 
    [<appliedenergistics2:material:39>,<crazyae:material:22>]
);
RecipeUtil.addShapeless("mana_speed_card", <crazyae:upgrade:2>,
    [<appliedenergistics2:material:28>, <crazyae:material:35>]
);
RecipeUtil.addShapeless("ancient_tome_9x", <additions:ancient_tome> * 9,
    [<additions:ancient_collection>]
);
RecipeUtil.addShapeless("nonenium_essence", <additions:nonenium_essence>,
    [<additions:godlikeum_essence>, <additions:godlikeum_essence>, <additions:godlikeum_essence>, <additions:godlikeum_essence>, <additions:godlikeum_essence>, <additions:godlikeum_essence>]
);
RecipeUtil.addShapeless("nonenium_essence_reverse", <additions:godlikeum_essence> * 4,
    [<additions:nonenium_essence>]
);
RecipeUtil.addShapeless("extremium_ingot_essence", <additions:extremium_ingot>, 
    [<ore:ingotBaseEssence>, <ore:essenceExtremium>, <ore:essenceExtremium>, <ore:essenceExtremium>, <ore:essenceExtremium>]
);
RecipeUtil.addShapeless("godlikeum_ingot_essence", <additions:godlikeum_ingot>, 
    [<ore:ingotBaseEssence>, <ore:essenceGodlikeum>, <ore:essenceGodlikeum>, <ore:essenceGodlikeum>, <ore:essenceGodlikeum>]
);
RecipeUtil.addShapeless("nonenium_ingot_essence", <additions:nonenium_ingot>, 
    [<ore:ingotBaseEssence>, <ore:essenceNonenium>, <ore:essenceNonenium>, <ore:essenceNonenium>, <ore:essenceNonenium>]
);
RecipeUtil.addShapeless("pe_block", <gct_aby:solid_pot_energy>, 
    [<additions:pe_ingot>, <additions:pe_ingot>, <additions:pe_ingot>, <additions:pe_ingot>, <additions:pe_ingot>, <additions:pe_ingot>, <additions:pe_ingot>, <additions:pe_ingot>, <additions:pe_ingot>]
);
RecipeUtil.addShapeless("sanite_block", <gct_mobs:sanite_block>, 
    [<gct_mobs:sanite_ingot>, <gct_mobs:sanite_ingot>, <gct_mobs:sanite_ingot>, <gct_mobs:sanite_ingot>, <gct_mobs:sanite_ingot>, <gct_mobs:sanite_ingot>, <gct_mobs:sanite_ingot>, <gct_mobs:sanite_ingot>, <gct_mobs:sanite_ingot>]
);
RecipeUtil.addShapeless("shoggoth_tancale_soup", <gct_aby:shoggoth_tancale_soup>, 
    [<minecraft:bowl>, <gct_aby:shoggothtancale>, <gct_aby:shoggothtancale>, <gct_aby:shoggothtancale>]
);
RecipeUtil.addShapeless("quicksilver", <thaumcraft:quicksilver>, 
    [<ore:ingotMercury>]
);
RecipeUtil.addShapeless("quicksilver_reverse", <additions:mercury_ingot>,
    [<ore:gemMercury>]
);
RecipeUtil.addShapeless("ant_emperor_bait", <additions:ant_emperor_bait>,
    [<erebus:materials:37>, <erebus:materials:37>, <erebus:materials:37>, <erebus:materials:37>, <ore:dustAurune>, <ore:dustAurune>, <ore:gemHermaphroditic>, <ore:gemHermaphroditic>, <additions:erebus_complex>]
);
