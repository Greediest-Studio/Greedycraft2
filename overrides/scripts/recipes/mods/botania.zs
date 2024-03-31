/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */

#priority 1250

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import mods.botania.ElvenTrade;
import mods.botania.Apothecary;
import mods.botania.PureDaisy;
import mods.botania.RuneAltar;
import mods.botania.ManaInfusion;
import mods.botanicadds.GaiaPlate;
import mods.botaniatweaks.Agglomeration;
import mods.jei.JEI;

Apothecary.removeRecipe("entropinnyum");
Apothecary.addRecipe(<botania:specialflower>.withTag({type: "entropinnyum"}), [<ore:petalRed>, <ore:petalRed>, <ore:petalGray>, <ore:petalGray>, <ore:petalWhite>, <ore:petalWhite>, <ore:runeWrathB>, <ore:runeChamaelB>]);
Apothecary.removeRecipe("reikarlily");
Apothecary.addRecipe(<botania:specialflower>.withTag({type: "reikarlily"}), [<ore:ingotGaia>, <ore:ingotGaia>, <ore:runeEnvyB>, <ore:runeHanielB>, <ore:runeRaphaelB>, <ore:petalBlue>, <ore:petalCyan>, <ore:petalCyan>, <ore:petalLightBlue>, <ore:petalLightBlue>]);
Apothecary.removeRecipe("orechid");
Apothecary.addRecipe(<botania:specialflower>.withTag({type: "orechid"}), [<ore:petalGray>, <ore:petalGray>, <ore:petalRed>, <ore:petalYellow>, <ore:petalGreen>, <ore:redstoneRoot>, <ore:elvenPixieDust>, <ore:runeGreedB>, <ore:runeMetatronB>, <ore:runeSandalphonB>]);

ElvenTrade.addRecipe([<defiledlands:scarlite>], [<ore:slimeballBlood>, <ore:gemEmerald>, <ore:gemEmerald>]);
ElvenTrade.addRecipe([<actuallyadditions:item_misc:5>], [<ore:gemQuartz>, <ore:coal>]);
ElvenTrade.addRecipe([<actuallyadditions:item_misc:5>], [<ore:gemQuartz>, <ore:charcoal>]);
ElvenTrade.addRecipe([<minecraft:gold_block>], [<ore:shardTime>]);
ElvenTrade.addRecipe([<gct_mobs:alfheim>], [<botania:twigwand>, <extrabotany:cosmetic:8>]);
ElvenTrade.addRecipe([<gct_mobs:dreamwood_log>], [<ore:logWoodLiving>]);
ElvenTrade.addRecipe([<gct_mobs:dreamwood_leaves>], [<ore:treeLeavesLiving>]);
ElvenTrade.addRecipe([<gct_mobs:alf_stone>], [<ore:stoneMana>]);
ElvenTrade.addRecipe([<gct_mobs:alf_cobble_stone>], [<ore:cobblestoneMana>]);
ElvenTrade.addRecipe([<gct_mobs:alf_dirt>], [<ore:dirtMana>]);
ElvenTrade.addRecipe([<gct_mobs:alf_grass>], [<ore:grassMana>]);
ElvenTrade.addRecipe([<gct_mobs:elementium_ore>], [<ore:oreManasteel>, <ore:oreManasteel>]);
ElvenTrade.addRecipe([<treetweaker:dreamwood>], [<treetweaker:livingwood>]);

Apothecary.addRecipe(<additions:greedycraft-bag_of_dyes>, [<ore:petalGreen>, <ore:petalRed>, <ore:petalBlue>, <ore:petalYellow>, <ore:petalGreen>, <ore:petalRed>, <ore:petalBlue>, <ore:petalYellow>]);

PureDaisy.addRecipe(<minecraft:grass>, <minecraft:dirt>, 200);
PureDaisy.addRecipe(<ore:treeLeaves>, <gct_mobs:livingwood_leaves>, 100);
PureDaisy.addRecipe(<ore:treeSapling>, <treetweaker:livingwood>, 1200);

RuneAltar.addRecipe(<twilightforest:aurora_block> * 32, [<ore:stone>, <quark:rune:*>], 50);
RuneAltar.addRecipe(<twilightforest:castle_rune_brick> * 32, [<ore:brickStone>, <quark:rune:*>, <ore:dyePink>], 50);
RuneAltar.addRecipe(<twilightforest:castle_rune_brick:1> * 32, [<ore:brickStone>, <quark:rune:*>, <ore:dyeLightBlue>], 50);
RuneAltar.addRecipe(<twilightforest:castle_rune_brick:2> * 32, [<ore:brickStone>, <quark:rune:*>, <ore:dyeYellow>], 50);
RuneAltar.addRecipe(<twilightforest:castle_rune_brick:3> * 32, [<ore:brickStone>, <quark:rune:*>, <ore:dyePurple>], 50);
RuneAltar.addRecipe(<botania:manacookie> * 4, [<ore:foodCookie>, <ore:foodCookie>, <ore:foodCookie>, <ore:foodCookie>, <ore:manaPearl>, <ore:manaDiamond>], 3200);
RuneAltar.addRecipe(<additions:botaniaddon-metatron_rune> * 2, [<botania:rune:15>, <botania:rune:13>, <botania:rune:9>, <ore:ingotOrichalcos>, <ore:ingotAsgardium>, <ore:ingotEvilMetal>], 50000);
RuneAltar.addRecipe(<additions:botaniaddon-ratziel_rune> * 2, [<botania:rune:14>, <botania:rune:10>, <botania:rune:12>, <ore:ingotOrichalcos>, <ore:ingotExperience>, <ore:ingotOraclium>], 50000);
RuneAltar.addRecipe(<additions:botaniaddon-zaphkiel_rune> * 2, [<botania:rune:11>, <botania:rune:15>, <botania:rune:13>, <ore:ingotOrichalcos>, <ore:dustTime>, <ore:ingotShadowium>], 50000);
RuneAltar.addRecipe(<additions:botaniaddon-zadkiel_rune> * 2, [<botania:rune:9>, <botania:rune:14>, <botania:rune:10>, <ore:ingotOrichalcos>, <ore:ingotAqualite>, <ore:ingotDecurrium>], 50000);
RuneAltar.addRecipe(<additions:botaniaddon-chamael_rune> * 2, [<botania:rune:12>, <botania:rune:11>, <botania:rune:15>, <ore:ingotOrichalcos>, <ore:ingotHellite>, <ore:dustPyrotheum>], 50000);
RuneAltar.addRecipe(<additions:botaniaddon-michael_rune> * 2, [<botania:rune:13>, <botania:rune:9>, <botania:rune:14>, <ore:ingotOrichalcos>, <ore:dustSpace>, <ore:ingotAstralMetal>], 50000);
RuneAltar.addRecipe(<additions:botaniaddon-haniel_rune> * 2, [<botania:rune:10>, <botania:rune:12>, <botania:rune:11>, <ore:ingotOrichalcos>, <ore:ingotLiquifiedCoralium>, <journey:spawnerbar>], 50000);
RuneAltar.addRecipe(<additions:botaniaddon-raphael_rune> * 2, [<botania:rune:15>, <botania:rune:9>, <botania:rune:10>, <ore:ingotOrichalcos>, <ore:ingotAeroite>, <aether_legacy:ambrosium_shard>], 50000);
RuneAltar.addRecipe(<additions:botaniaddon-gabriel_rune> * 2, [<botania:rune:13>, <botania:rune:14>, <botania:rune:12>, <ore:ingotOrichalcos>, <ore:ingotAurorianSteel>, <ore:ingotManyullyn>], 50000);
RuneAltar.addRecipe(<additions:botaniaddon-sandalphon_rune> * 2, [<botania:rune:11>, <botania:rune:10>, <botania:rune:14>, <ore:ingotOrichalcos>, <ore:ingotEezo>, <ore:ingotTerrax>], 50000);
RuneAltar.addRecipe(<gct_mobs:orichalcos_dreamwood>, [<botania:dreamwood:5>, <ore:ingotOrichalcos>, <ore:ingotEugardite>, <ore:nuggetCosmilite>], 100000);

RuneAltar.removeRecipe(<extrabotany:material:5>);

PureDaisy.removeRecipe(<botania:livingwood>);
PureDaisy.removeRecipe(<botania:livingrock>);
PureDaisy.removeRecipe(<minecraft:cobblestone>);
PureDaisy.removeRecipe(<minecraft:sand>);
PureDaisy.removeRecipe(<minecraft:packed_ice>);
PureDaisy.removeRecipe(<minecraft:obsidian>);

GaiaPlate.remove(<botanicadds:gaiasteel_ingot>);
GaiaPlate.add(<botanicadds:gaiasteel_ingot> * 4, 1000000, [<defiledlands:remorseful_gem>, <botania:manaresource:14>, <botania:manaresource:9>, <minecraft:nether_star>]);

ManaInfusion.removeRecipe(<botania:manacookie>);

ManaInfusion.addInfusion(<gct_mobs:mana_stone>, <ore:stone>, 1000);
ManaInfusion.addInfusion(<gct_mobs:mana_cobble_stone>, <ore:cobblestone>, 1000);
ManaInfusion.addInfusion(<gct_mobs:mana_dirt>, <ore:dirt>, 1000);
ManaInfusion.addInfusion(<gct_mobs:mana_grass>, <ore:grass>, 1000);
ManaInfusion.addInfusion(<botania:livingwood>, <gct_mobs:livingwood_log>, 0);
ManaInfusion.addInfusion(<botania:dreamwood>, <gct_mobs:dreamwood_log>, 0);
ManaInfusion.addInfusion(<additions:botaniaddon-manasteel_ore>, <ore:oreIron>, 8000);
ManaInfusion.addInfusion(<additions:botaniaddon-manadiamond_ore>, <ore:oreDiamond>, 20000);
ManaInfusion.addInfusion(<additions:botaniaddon-manaquartz_ore>, <ore:oreQuartz>, 500);
ManaInfusion.addInfusion(<additions:botaniaddon-manalapis_ore>, <ore:oreLapis>, 10000);
ManaInfusion.addInfusion(<thermalfoundation:material:136>, <ore:ingotSilver>, 4000);
ManaInfusion.addInfusion(<thermalfoundation:storage:8>, <ore:blockSilver>, 36000);
ManaInfusion.addInfusion(<additions:botaniaddon-holium_ingot>, <ore:ingotGold>, 5000);
ManaInfusion.addInfusion(<additions:botaniaddon-holium_block>, <ore:blockGold>, 45000);
ManaInfusion.addInfusion(<additions:botaniaddon-mana_firestone>, <ore:gemFirestone>, 90000);

Agglomeration.addRecipe(<additions:botaniaddon-elfsteel_ingot>, [<botania:manaresource:7>, <botania:manaresource:9>, <botania:manaresource:8>], 1000000, 0xED339A, 0xE67800, <botanicadds:dreamrock>, <botanicadds:mana_lapis_block>, <botanicadds:dreamrock>, null, null, null);
Agglomeration.addRecipe(<additions:botaniaddon-mythsteel_ingot>, [<ore:ingotTerrasteel>, <ore:ingotElfsteel>, <ore:ingotGaiasteel>], 3000000, 0x54ff05, 0xffffcb, <minecraft:quartz_block>, <extrabotany:blockphotonium>, <minecraft:quartz_block>, null, null, null);
Agglomeration.addRecipe(<gct_mobs:holysteel_ingot>, [<ore:ingotHolium>, <ore:ingotAsgardium>, <ore:ingotSky>], 50000, 0xcb5151, 0xfffaa9, <naturesaura:infused_iron_block>, <jaopca:block_blocksky>, <naturesaura:infused_iron_block>, null, null, null);
Agglomeration.addRecipe(<additions:greedycraft-yeet>, [<thebetweenlands:rock_snot_pearl>, <thebetweenlands:items_misc:56>, <thebetweenlands:items_misc:52>, <thebetweenlands:items_misc:53>, <thebetweenlands:items_misc:54>, <thebetweenlands:items_misc:55>, <thebetweenlands:items_misc:57>, <thebetweenlands:glowing_goop>, <thebetweenlands:chiromaw_barb>], 1000000, 0x321818, 0xf1e2e6, <thebetweenlands:slimy_dirt>, <thebetweenlands:slimy_dirt>, <thebetweenlands:slimy_dirt>, null, null, null);

for input in pureDaisyTransmutations {
    var output as IItemStack = pureDaisyTransmutations[input];
    PureDaisy.addRecipe(input, output);
}

JEI.addDescription(<gct_mobs:kabalah_ring_aur>,
    "§f使用§c生命树构建器§f合成：",
    "§b需求能量环：§e无",
    "§b王冠位：§e激活的王冠符文",
    "§b智慧位：§e激活的智慧符文",
    "§b理解位：§e激活的理解符文",
    "§b慈悲位：§e激活的慈悲符文",
    "§b严格位：§e激活的严格符文",
    "§b美丽位：§e激活的美丽符文",
    "§b胜利位：§e激活的胜利符文",
    "§b光辉位：§e激活的光辉符文",
    "§b基础位：§e激活的基础符文",
    "§b王国位：§e激活的王国符文"
);
JEI.addDescription(<gct_mobs:elf_passes>,
    "§f使用§c生命树构建器§f合成：",
    "§b需求能量环：§eAur",
    "§b王冠位：§e源质钢聚合板",
    "§b智慧位：§e源质钢聚合板",
    "§b理解位：§e源质钢聚合板",
    "§b慈悲位：§e源质钢聚合板",
    "§b严格位：§e源质钢聚合板",
    "§b美丽位：§e奥利哈刚聚合板",
    "§b胜利位：§e源质钢聚合板",
    "§b光辉位：§e源质钢聚合板",
    "§b基础位：§e源质钢聚合板",
    "§b王国位：§e空"
);
JEI.addDescription(<additions:greedycraft-twilit_ingot>, "§f合成方式请查询§c暮晶块");
JEI.addDescription(<gct_mobs:earth_ingot>, "§f使用§c神圣钢锭§f右击激活的地缚祭坛结构以合成§c大地之锭");