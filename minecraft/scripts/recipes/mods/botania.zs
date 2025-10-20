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
import mods.godagglomerationplate.GodAgglomeration;
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
ElvenTrade.addRecipe([<gct_mobs:alf_sand>], [<ore:sand>]);

Apothecary.addRecipe(<additions:bag_of_dyes>, [<ore:petalGreen>, <ore:petalRed>, <ore:petalBlue>, <ore:petalYellow>, <ore:petalGreen>, <ore:petalRed>, <ore:petalBlue>, <ore:petalYellow>]);

//新植魔花
Apothecary.addRecipe("blood_hydroangeas", [<ore:petalBlue>, <ore:petalCyan>, <ore:petalCyan>, <botania:dye:3>, <forge:bucketfilled>.withTag({FluidName: "blood", Amount: 1000}), <ore:petalRed>, <ore:petalBrown>]);
    recipes.addShapeless("blood_hydroangeas_float", <botania:floatingspecialflower>.withTag({type : "blood_hydroangeas"}), [<botania:specialflower>.withTag({type: "blood_hydroangeas"}), <botania:miniisland:*>]);
Apothecary.addRecipe("remove_difficulty", [<scalinghealth:crystalshard>, <ore:gemAmethyst>, <ore:petalGreen>, <ore:petalPurple>]);
    recipes.addShapeless("remove_difficulty_float", <botania:floatingspecialflower>.withTag({type: "remove_difficulty"}), [<botania:specialflower>.withTag({type: "remove_difficulty"}), <botania:miniisland:*>]);
Apothecary.addRecipe("add_difficulty", [<scalinghealth:crystalshard>, <ore:ingotGold>, <ore:petalGreen>, <ore:petalYellow>, <additions:ratziel_rune>]);
    recipes.addShapeless("add_difficulty_float", <botania:floatingspecialflower>.withTag({type: "add_difficulty"}), [<botania:specialflower>.withTag({type: "add_difficulty"}), <botania:miniisland:*>]);
Apothecary.addRecipe("bread_fanatic", [<botania:blacklotus>, <minecraft:bread>, <botania:specialflower>.withTag({type: "endoflame"}), <ore:petalGreen>, <botania:rune:2>]);
    recipes.addShapeless("bread_fanatic_float", <botania:floatingspecialflower>.withTag({type: "bread_fanatic"}), [<botania:specialflower>.withTag({type: "bread_fanatic"}), <botania:miniisland:*>]);
Apothecary.addRecipe("lightning", [<botanicadds:rune_energy>, <botania:specialflower>.withTag({type: "reikarlily"}), <minecraft:potion>.withTag({Potion: "potioncore:lightning"}), <botania:shimmerrock>, <ore:petalPink>, <ore:petalPurple>]);
    recipes.addShapeless("lightning_float", <botania:floatingspecialflower>.withTag({type: "lightning"}), [<botania:specialflower>.withTag({type: "lightning"}), <botania:miniisland:*>]);
Apothecary.addRecipe("agricultural", [<minecraft:hay_block>, <ore:ingotBotanicalAwakened>, <minecraft:hay_block>, <ore:petalYellow>, <ore:petalLime>, <additions:ratziel_rune>, <additions:raphael_rune>, <minecraft:wooden_hoe>, <minecraft:carrot>, <minecraft:potato>, <minecraft:beetroot>]);
    recipes.addShapeless("agricultural_float", <botania:floatingspecialflower>.withTag({type: "agricultural"}), [<botania:specialflower>.withTag({type: "agricultural"}), <botania:miniisland:*>]);
Apothecary.addRecipe("running_machine", [<minecraft:heavy_weighted_pressure_plate>, <ore:petalGray>, <ore:petalGreen>, <ore:petalLime>, <ore:ingotGaiasteel>]);
    recipes.addShapeless("running_machine_float", <botania:floatingspecialflower>.withTag({type: "running_machine"}), [<botania:specialflower>.withTag({type: "running_machine"}), <botania:miniisland:*>]);
Apothecary.addRecipe("quest", [<ftbquests:book>, <ore:petalLime>, <ore:petalGreen>, <botania:fertilizer>, <botania:cosmetic:31>]);
    recipes.addShapeless("quest_float", <botania:floatingspecialflower>.withTag({type: "quest"}), [<botania:specialflower>.withTag({type: "quest"}), <botania:miniisland:*>]);
Apothecary.addRecipe("mirror", [<astralsorcery:itemcraftingcomponent:3>, <botania:prism>, <endreborn:item_world_mirror>, <cfm:mirror>, <ore:petalBlue>, <ore:petalLightBlue>]);
    recipes.addShapeless("mirror_float", <botania:floatingspecialflower>.withTag({type: "mirror"}), [<botania:specialflower>.withTag({type: "mirror"}), <botania:miniisland:*>]);
Apothecary.addRecipe("eat_iron", [<forge:bucketfilled>.withTag({FluidName: "iron", Amount: 1000}), <betterslimes:yellow_slime>, <betterslimes:yellow_slime>, <candymod:gummy:2>, <candymod:gummy:2>, <ore:petalYellow>, <ore:petalYellow>, <openblocks:golden_eye>.withTag({})]);
    recipes.addShapeless("eat_iron_float", <botania:floatingspecialflower>.withTag({type: "eat_iron"}), [<botania:specialflower>.withTag({type: "eat_iron"}), <botania:miniisland:*>]);
Apothecary.addRecipe("cow", [<sakura:foodset:10>, <xlfoodmod:beef_stew>, <xlfoodmod:crescent_roll>, <xlfoodmod:kebab>, <xlfoodmod:hamburger>, <ore:petalBlack>, <ore:petalWhite>, <ore:petalYellow>]);
    recipes.addShapeless("cow_float", <botania:floatingspecialflower>.withTag({type: "cow"}), [<botania:specialflower>.withTag({type: "cow"}), <botania:miniisland:*>]);
Apothecary.addRecipe("thaumaura", [<ore:petalPink>, <ore:petalPink>, <ore:petalPurple>, <ore:ingotAurune>, <ore:ingotMithrillium>, <ore:runeHanielB>, <ore:runeGabrielB>, <ore:runeSandalphonB>]);
    recipes.addShapeless("thaumaura_float", <botania:floatingspecialflower>.withTag({type: "thaumaura"}), [<botania:specialflower>.withTag({type: "thaumaura"}), <botania:miniisland:*>]);

PureDaisy.addRecipe(<minecraft:grass>, <minecraft:dirt>, 200);
PureDaisy.addRecipe(<ore:treeLeaves>, <gct_mobs:livingwood_leaves>, 100);
PureDaisy.addRecipe(<ore:treeSapling>, <treetweaker:livingwood>, 1200);

RuneAltar.addRecipe(<twilightforest:aurora_block> * 32, [<ore:stone>, <quark:rune:*>], 50);
RuneAltar.addRecipe(<twilightforest:castle_rune_brick> * 32, [<ore:brickStone>, <quark:rune:*>, <ore:dyePink>], 50);
RuneAltar.addRecipe(<twilightforest:castle_rune_brick:1> * 32, [<ore:brickStone>, <quark:rune:*>, <ore:dyeLightBlue>], 50);
RuneAltar.addRecipe(<twilightforest:castle_rune_brick:2> * 32, [<ore:brickStone>, <quark:rune:*>, <ore:dyeYellow>], 50);
RuneAltar.addRecipe(<twilightforest:castle_rune_brick:3> * 32, [<ore:brickStone>, <quark:rune:*>, <ore:dyePurple>], 50);
RuneAltar.addRecipe(<botania:manacookie> * 4, [<ore:foodCookie>, <ore:foodCookie>, <ore:foodCookie>, <ore:foodCookie>, <ore:manaPearl>, <ore:manaDiamond>], 3200);
RuneAltar.addRecipe(<additions:metatron_rune> * 2, [<botania:rune:15>, <botania:rune:13>, <botania:rune:9>, <ore:ingotOrichalcos>, <ore:ingotAsgardium>, <ore:ingotEvilMetal>], 50000);
RuneAltar.addRecipe(<additions:ratziel_rune> * 2, [<botania:rune:14>, <botania:rune:10>, <botania:rune:12>, <ore:ingotOrichalcos>, <ore:ingotExperience>, <ore:ingotOraclium>], 50000);
RuneAltar.addRecipe(<additions:zaphkiel_rune> * 2, [<botania:rune:11>, <botania:rune:15>, <botania:rune:13>, <ore:ingotOrichalcos>, <ore:dustTime>, <ore:ingotShadowium>], 50000);
RuneAltar.addRecipe(<additions:zadkiel_rune> * 2, [<botania:rune:9>, <botania:rune:14>, <botania:rune:10>, <ore:ingotOrichalcos>, <ore:ingotAqualite>, <ore:ingotDecurrium>], 50000);
RuneAltar.addRecipe(<additions:chamael_rune> * 2, [<botania:rune:12>, <botania:rune:11>, <botania:rune:15>, <ore:ingotOrichalcos>, <ore:ingotHellite>, <ore:dustPyrotheum>], 50000);
RuneAltar.addRecipe(<additions:michael_rune> * 2, [<botania:rune:13>, <botania:rune:9>, <botania:rune:14>, <ore:ingotOrichalcos>, <ore:dustSpace>, <ore:ingotAstralMetal>], 50000);
RuneAltar.addRecipe(<additions:haniel_rune> * 2, [<botania:rune:10>, <botania:rune:12>, <botania:rune:11>, <ore:ingotOrichalcos>, <ore:ingotLiquifiedCoralium>, <journey:spawnerbar>], 50000);
RuneAltar.addRecipe(<additions:raphael_rune> * 2, [<botania:rune:15>, <botania:rune:9>, <botania:rune:10>, <ore:ingotOrichalcos>, <ore:ingotAeroite>, <aether_legacy:ambrosium_shard>], 50000);
RuneAltar.addRecipe(<additions:gabriel_rune> * 2, [<botania:rune:13>, <botania:rune:14>, <botania:rune:12>, <ore:ingotOrichalcos>, <ore:ingotAurorianSteel>, <ore:ingotManyullyn>], 50000);
RuneAltar.addRecipe(<additions:sandalphon_rune> * 2, [<botania:rune:11>, <botania:rune:10>, <botania:rune:14>, <ore:ingotOrichalcos>, <ore:ingotEezo>, <ore:ingotTerrax>], 50000);
RuneAltar.addRecipe(<gct_mobs:orichalcos_dreamwood>, [<botania:dreamwood:5>, <ore:ingotOrichalcos>, <ore:ingotEugardite>, <ore:nuggetCosmilite>], 100000);
RuneAltar.addRecipe(<botaniverse:morerune> * 2, [<ore:runeWaterB>, <ore:runeAirB>, <ore:runeFireB>, <ore:runeEarthB>, <ore:ingotShadowium>], 100000);
RuneAltar.addRecipe(<botaniverse:morerune:1> * 2, [<ore:runeSpringB>, <ore:runeSummerB>, <ore:runeAutumnB>, <ore:runeWinterB>, <ore:ingotLavarite>], 200000);
RuneAltar.addRecipe(<botaniverse:morerune:2> * 3, [<ore:runeGreedB>, <ore:runePrideB>, <ore:runeWrathB>, <ore:runeEnvyB>, <ore:runeSlothB>, <ore:runeLustB>, <ore:runeGluttonyB>, <ore:ingotBnightium>], 400000);
RuneAltar.addRecipe(<botaniverse:morerune:3> * 4, [<ore:runeMetatronB>, <ore:runeRatzielB>, <ore:runeZaphkielB>, <ore:runeZadkielB>, <ore:runeChamaelB>, <ore:runeMichaelB>, <ore:runeHanielB>, <ore:runeRaphaelB>, <ore:runeGabrielB>, <ore:runeSandalphonB>, <ore:ingotEverite>], 750000);

RuneAltar.removeRecipe(<extrabotany:material:5>);
RuneAltar.removeRecipe(<botaniverse:morerune>);
RuneAltar.removeRecipe(<botaniverse:morerune:1>);
RuneAltar.removeRecipe(<botaniverse:morerune:2>);
RuneAltar.removeRecipe(<botaniverse:morerune:3>);

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
ManaInfusion.addInfusion(<additions:manasteel_ore>, <ore:oreIron>, 8000);
ManaInfusion.addInfusion(<additions:manadiamond_ore>, <ore:oreDiamond>, 20000);
ManaInfusion.addInfusion(<additions:manaquartz_ore>, <ore:oreQuartz>, 500);
ManaInfusion.addInfusion(<additions:manalapis_ore>, <ore:oreLapis>, 10000);
ManaInfusion.addInfusion(<thermalfoundation:material:136>, <ore:ingotSilver>, 4000);
ManaInfusion.addInfusion(<thermalfoundation:storage:8>, <ore:blockSilver>, 36000);
ManaInfusion.addInfusion(<additions:holium_ingot>, <ore:ingotGold>, 5000);
ManaInfusion.addInfusion(<additions:holium_block>, <ore:blockGold>, 45000);
ManaInfusion.addInfusion(<additions:mana_firestone>, <ore:gemFirestone>, 90000);
ManaInfusion.addInfusion(<gct_mobs:mana_leaves>, <ore:treeLeaves>, 1000);
ManaInfusion.addInfusion(<gct_mobs:mana_log>, <ore:logWood>, 1000);

Agglomeration.addRecipe(<additions:elfsteel_ingot>, [<botania:manaresource:7>, <botania:manaresource:9>, <botania:manaresource:8>], 1000000, 0xED339A, 0xE67800, <botanicadds:dreamrock>, <botanicadds:mana_lapis_block>, <botanicadds:dreamrock>, null, null, null);
Agglomeration.addRecipe(<additions:mythsteel_ingot>, [<ore:ingotTerrasteel>, <ore:ingotElfsteel>, <ore:ingotGaiasteel>], 3000000, 0x54ff05, 0xffffcb, <minecraft:quartz_block>, <extrabotany:blockphotonium>, <minecraft:quartz_block>, null, null, null);
Agglomeration.addRecipe(<gct_mobs:holysteel_ingot>, [<ore:ingotHolium>, <ore:ingotAsgardium>, <ore:ingotSky>], 50000, 0xcb5151, 0xfffaa9, <naturesaura:infused_iron_block>, <additions:sky_block>, <naturesaura:infused_iron_block>, null, null, null);
Agglomeration.addRecipe(<additions:yeet>, [<thebetweenlands:rock_snot_pearl>, <thebetweenlands:items_misc:56>, <thebetweenlands:items_misc:52>, <thebetweenlands:items_misc:53>, <thebetweenlands:items_misc:54>, <thebetweenlands:items_misc:55>, <thebetweenlands:items_misc:57>, <thebetweenlands:glowing_goop>, <thebetweenlands:chiromaw_barb>], 1000000, 0x321818, 0xf1e2e6, <thebetweenlands:slimy_dirt>, <thebetweenlands:slimy_dirt>, <thebetweenlands:slimy_dirt>, null, null, null);
Agglomeration.addRecipe(<elementalend:earth_eye>, [<botanicadds:gaia_shard>, <ore:pearlEnderEye>, <botania:manaresource:5>], 100000, 0x82be74, 0x07c020, <botania:storage>, <minecraft:mycelium>, <botania:storage>, <minecraft:iron_block>, <minecraft:dirt:1>, <minecraft:iron_block>);

GodAgglomeration.addRecipe(<gct_mobs:botanical_ingot_awakened> * 2, [
    <ore:ingotBotanical>,
    <ore:ingotRosium>,
    <ore:ingotChrysanthemium>,
    <ore:ingotDandelionium>,
    <ore:ingotMyosotisium>,
    <ore:ingotBegonium>,
    <ore:ingotCarnationium>,
    <ore:ingotKianate>,
    <ore:ingotBalancedMatrix>
], 40000000, 0xe8d26c, 0x7eb98c, <additions:elfsteel_block>, <jaopca:block.mythsteel>, <additions:elfsteel_block>, null, null);
GodAgglomeration.addRecipe(<gct_mobs:begonium_ingot>, [
    <ore:runeMetatronB>,
    <ore:runeRatzielB>,
    <ore:runeZaphkielB>,
    <ore:runeZadkielB>,
    <ore:runeChamaelB>,
    <ore:heartGaia>,
    <ore:ingotBotanical>,
    <ore:blockDiamondSakura>,
    <ore:blockMana>
], 8000000, 0xe8d26c, 0xffb7ff, <additions:elfsteel_block>, <jaopca:block.mythsteel>, <additions:elfsteel_block>, null, null);
GodAgglomeration.addRecipe(<gct_mobs:carnationium_ingot>, [
    <ore:runeMetatronB>,
    <ore:runeZaphkielB>,
    <ore:runeChamaelB>,
    <ore:runeHanielB>,
    <ore:runeGabrielB>,
    <ore:heartGaia>,
    <ore:ingotBotanical>,
    <ore:blockPhotonium>,
    <ore:blockMana>
], 8000000, 0xe8d26c, 0xffffff, <additions:elfsteel_block>, <jaopca:block.mythsteel>, <additions:elfsteel_block>, null, null);
GodAgglomeration.addRecipe(<gct_mobs:chrysanthemium_ingot>, [
    <ore:runeMichaelB>,
    <ore:runeHanielB>,
    <ore:runeRaphaelB>,
    <ore:runeGabrielB>,
    <ore:runeSandalphonB>,
    <ore:heartGaia>,
    <ore:ingotBotanical>,
    <ore:blockValkyrie>,
    <ore:blockMana>
], 8000000, 0xe8d26c, 0xffffff, <additions:elfsteel_block>, <jaopca:block.mythsteel>, <additions:elfsteel_block>, null, null);
GodAgglomeration.addRecipe(<gct_mobs:myosotisium_ingot>, [
    <ore:runeRatzielB>,
    <ore:runeZadkielB>,
    <ore:runeMichaelB>,
    <ore:runeRaphaelB>,
    <ore:runeSandalphonB>,
    <ore:heartGaia>,
    <ore:ingotBotanical>,
    <ore:blockShadowium>,
    <ore:blockMana>
], 8000000, 0xe8d26c, 0xa07bff, <additions:elfsteel_block>, <jaopca:block.mythsteel>, <additions:elfsteel_block>, null, null);
GodAgglomeration.addRecipe(<gct_mobs:dandelionium_ingot>, [
    <ore:runeMetatronB>,
    <ore:runeZadkielB>,
    <ore:runeHanielB>,
    <ore:runeSandalphonB>,
    <ore:runeZaphkielB>,
    <ore:heartGaia>,
    <ore:ingotBotanical>,
    <ore:blockBalancite>,
    <ore:blockMana>
], 8000000, 0xe8d26c, 0xcff2f9, <additions:elfsteel_block>, <jaopca:block.mythsteel>, <additions:elfsteel_block>, null, null);
GodAgglomeration.addRecipe(<gct_mobs:rosium_ingot>, [
    <ore:runeRatzielB>,
    <ore:runeChamaelB>,
    <ore:runeRaphaelB>,
    <ore:runeMichaelB>,
    <ore:runeGabrielB>,
    <ore:heartGaia>,
    <ore:ingotBotanical>,
    <ore:blockScarlite>,
    <ore:blockMana>
], 8000000, 0xe8d26c, 0xff2c45, <additions:elfsteel_block>, <jaopca:block.mythsteel>, <additions:elfsteel_block>, null, null);


for input in pureDaisyTransmutations {
    var output as IItemStack = pureDaisyTransmutations[input];
    PureDaisy.addRecipe(input, output);
}