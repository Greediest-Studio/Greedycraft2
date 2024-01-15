/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 3000

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import mods.enderio.SagMill;
import mods.enderio.AlloySmelter;

AlloySmelter.removeRecipe(<thermalfoundation:material:160>);
AlloySmelter.removeRecipe(<enderio:item_alloy_ingot:8>);

SagMill.addRecipe([<additions:greedycraft-time_fragment>, <additions:greedycraft-time_fragment>, <additions:greedycraft-experience_ingot>], [20 as float, 20 as float, 50 as float], <ore:dungeonLootTier1> as IIngredient, "CHANCE_ONLY", 12000, [10 as float, 10 as float, 10 as float]);
SagMill.addRecipe([<additions:greedycraft-time_fragment> * 2, <additions:greedycraft-time_fragment>, <additions:greedycraft-time_fragment>, <additions:greedycraft-experience_ingot> * 3], [10 as float, 30 as float, 30 as float, 50 as float], <ore:dungeonLootTier2> as IIngredient, "CHANCE_ONLY", 30000, [25 as float, 25 as float, 25 as float, 25 as float]);
SagMill.addRecipe([<additions:greedycraft-time_fragment> * 6, <additions:greedycraft-time_fragment> * 4, <additions:greedycraft-time_fragment> * 3, <additions:greedycraft-experience_ingot> * 16], [30 as float, 40 as float, 50 as float, 60 as float], <ore:dungeonLootTier3> as IIngredient, "CHANCE_ONLY", 100000, [100 as float, 100 as float, 100 as float, 100 as float]);

SagMill.addRecipe([<nyx:meteor_dust>], [100 as float], <ore:ingotMeteor> as IIngredient, "CHANCE_ONLY", 600, [100 as float]);
SagMill.addRecipe([<nyx:meteor_dust>], [100 as float], <ore:shardMeteor> as IIngredient, "CHANCE_ONLY", 600, [100 as float]);
SagMill.addRecipe([<nyx:meteor_dust> * 9], [100 as float], <ore:blockMeteor> as IIngredient, "CHANCE_ONLY", 5400, [100 as float]);
SagMill.addRecipe([<additions:greedycraft-purifying_dust> * 8], [100 as float], <botania:specialflower>.withTag({type: "puredaisy"}) as IIngredient, "CHANCE_ONLY", 600, [100 as float]);

AlloySmelter.addRecipe(<modularmachinery:itemmodularium> * 2, [<ore:ingotIron>, <ore:ingotBronze>, <ore:dustRedstone>], 2000, 10.0f);
AlloySmelter.addRecipe(<modularmachinery:itemmodularium> * 2, [<ore:ingotConductiveIron>, <ore:ingotBronze>], 2000, 10.0f);
AlloySmelter.addRecipe(<tconevo:material> * 2, [<ore:ingotAdamant>, <ore:ingotManyullyn> * 2, <ore:ingotEnderium> * 2], 7500, 30.0f);
AlloySmelter.addRecipe(<additions:netherite_ingot>, [<ore:gemAncientDebris> * 4, <ore:ingotGold> * 4], 6000, 50.0f);
AlloySmelter.addRecipe(<additions:greedycraft-enderite_ingot>, [<ore:gemResonantDebris> * 4, <ore:ingotIridium> * 4], 6000, 50.0f);
AlloySmelter.addRecipe(<additions:stainless_steel_ingot> * 4, [<ore:ingotManganeseSteel> * 4, <ore:ingotNickel>, <ore:ingotChromium>], 4000, 12.0f);
AlloySmelter.addRecipe(<additions:manganese_steel_ingot> * 2, [<ore:ingotSteel> * 2, <ore:ingotManganese>], 1200, 4.0f);
AlloySmelter.addRecipe(<enderio:item_alloy_ingot:8> * 2, [<ore:obsidian>, <ore:ingotDarkSteel> * 2, <ore:enderpearl>], 800, 2.0f);
AlloySmelter.addRecipe(<taiga:terrax_ingot> * 2, [<ore:ingotKarmesine>, <ore:ingotJauxum>, <ore:ingotOvium>], 2000, 10.0f); 
AlloySmelter.addRecipe(<taiga:triberium_ingot>, [<ore:ingotTiberium> * 5, <ore:ingotBasalt>], 2000, 10.0f);
AlloySmelter.addRecipe(<taiga:triberium_ingot>, [<ore:ingotTiberium> * 5, <ore:ingotDilithium> * 2], 2000, 10.0f);
AlloySmelter.addRecipe(<taiga:fractum_ingot> * 2, [<ore:ingotTriberium> * 3, <ore:blockObsidian> * 3, <ore:ingotAbyssum>], 2000, 10.0f);
AlloySmelter.addRecipe(<taiga:violium_ingot> * 2, [<ore:ingotAurorium> * 3, <ore:ingotArdite> * 2], 2000, 10.0f);
AlloySmelter.addRecipe(<taiga:proxii_ingot> * 3, [<ore:ingotPrometheum> * 3, <ore:ingotPalladium> * 3, <ore:ingotEezo>], 2000, 10.0f);
AlloySmelter.addRecipe(<taiga:tritonite_ingot> * 2, [<ore:ingotCobalt> * 3, <ore:ingotTerrax> * 2], 2000, 10.0f);
AlloySmelter.addRecipe(<taiga:ignitz_ingot> * 2, [<ore:ingotArdite> * 2, <ore:ingotTerrax> * 2, <ore:ingotOsram>], 2000, 10.0f);
AlloySmelter.addRecipe(<taiga:imperomite_ingot> * 2, [<ore:ingotDuranite> * 3, <ore:ingotPrometheum>, <ore:ingotAbyssum>], 2000, 10.0f);
AlloySmelter.addRecipe(<taiga:solarium_ingot> * 2, [<ore:ingotNucleum>, <ore:ingotUru> * 2, <ore:ingotValyrium> * 2], 2000, 10.0f);
AlloySmelter.addRecipe(<taiga:nihilite_ingot>, [<ore:ingotVibranium>, <ore:ingotSolarium>], 2000, 10.0f);
AlloySmelter.addRecipe(<taiga:adamant_ingot> * 3, [<ore:ingotVibranium>, <ore:ingotSolarium>, <ore:ingotIox> * 3], 2000, 10.0f);
AlloySmelter.addRecipe(<gct_ores:densite_ingot>, [<ore:ingotOsram>, <ore:ingotSeismum>], 2000, 10.0f);
AlloySmelter.addRecipe(<taiga:dyonite_ingot> * 3, [<ore:ingotTriberium> * 3, <ore:ingotFractum>, <ore:ingotDensite>], 2000, 10.0f);
AlloySmelter.addRecipe(<taiga:nucleum_ingot> * 3, [<ore:ingotProxii> * 3, <ore:ingotAbyssum>, <ore:ingotOsram>], 2000, 10.0f);
AlloySmelter.addRecipe(<taiga:nucleum_ingot> * 3, [<ore:ingotImperomite> * 3, <ore:ingotOsram>, <ore:ingotEezo>], 2000, 10.0f);
AlloySmelter.addRecipe(<taiga:nucleum_ingot> * 3, [<ore:ingotNiob> * 3, <ore:ingotEezo>, <ore:ingotAbyssum>], 2000, 10.0f);
AlloySmelter.addRecipe(<taiga:lumix_ingot>, [<ore:ingotPalladium>, <ore:ingotTerrax>], 2000, 10.0f);
AlloySmelter.addRecipe(<taiga:seismum_ingot> * 4, [<ore:blockObsidian> * 4, <ore:ingotTriberium> * 2, <ore:ingotEezo>], 2000, 10.0f);
AlloySmelter.addRecipe(<taiga:astrium_ingot> * 2, [<ore:ingotTerrax> * 3, <ore:ingotAurorium> * 2], 2000, 10.0f);
AlloySmelter.addRecipe(<taiga:niob_ingot> * 3, [<ore:ingotPalladium> * 3, <ore:ingotDuranite>, <ore:ingotOsram>], 2000, 10.0f);
AlloySmelter.addRecipe(<taiga:yrdeen_ingot> * 3, [<ore:ingotUru> * 3, <ore:ingotValyrium> * 3, <ore:ingotOsram>], 2000, 10.0f);
AlloySmelter.addRecipe(<taiga:yrdeen_ingot> * 3, [<ore:ingotUru> * 3, <ore:ingotValyrium> * 3, <ore:ingotEezo>], 2000, 10.0f);
AlloySmelter.addRecipe(<taiga:yrdeen_ingot> * 3, [<ore:ingotUru> * 3, <ore:ingotValyrium> * 3, <ore:ingotAbyssum>], 2000, 10.0f);
AlloySmelter.addRecipe(<gct_ores:reditrite_ingot> * 4, [<ore:ingotOsram> * 2, <ore:ingotObsidiorite> * 9], 2000, 10.0f);
AlloySmelter.addRecipe(<gct_ores:reditrite_ingot> * 4, [<ore:ingotOsram> * 2, <ore:blockObsidiorite>], 2000, 10.0f);
AlloySmelter.addRecipe(<taiga:iox_ingot> * 1, [<ore:ingotEezo> * 2, <ore:ingotAbyssum> * 2, <ore:ingotReditrite> * 4], 2000, 10.0f);
AlloySmelter.addRecipe(<taiga:obsidiorite_ingot>, [<ore:blockObsidian>, <ore:ingotMeteorite>], 2000, 10.0f);
AlloySmelter.addRecipe(<extendedcrafting:material> * 1, [<ore:ingotIron>, <ore:ingotCosmicNeutronium>], 1000, 10.0f);
AlloySmelter.addRecipe(<divinerpg:shadow_bar>, [<ore:ingotRupee>, <ore:ingotRealmite>], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:heavenite_ingot>, [<ore:ingotUru> * 3, <ore:ingotLighteum> * 2, <ore:ingotStripium> * 3], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:ghostite_ingot>, [<ore:ingotValyrium>, <ore:ingotManarium>], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:waringlium_ingot> * 3, [<ore:ingotSwinium> * 2, <ore:ingotStripium> * 2, <ore:blockObsidian> * 6], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:tierite_ingot> * 2, [<ore:ingotCloudite> * 3, <ore:ingotTerrax> * 3, <ore:ingotVibranium> * 2], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:cheatieum_ingot> * 2, [<ore:ingotMangisite> * 2, <ore:ingotGhostite>, <ore:ingotManyullyn> * 3], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:idiessite_ingot>, [<ore:ingotSoilium> * 3, <ore:ingotHeavenite>, <ore:ingotAdamant>], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:moltenium_ingot> * 2, [<ore:ingotOsram> * 4, <ore:ingotHeavenite> * 2, <ore:ingotDimesium>], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:ranglium_ingot>, [<ore:ingotIdiessite>, <ore:ingotCheatieum>, <ore:ingotCloudite>], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:godiarite_ingot> * 3, [<ore:ingotAdamant> * 3, <ore:ingotTogrium> * 2, <ore:ingotYoggleseum> * 2], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:rainite_ingot> * 3, [<ore:ingotRanglium> * 2, <ore:ingotIdiessite> * 2, <ore:ingotOneo> * 3], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:panloeseum_ingot> * 3, [<ore:ingotGhostite> * 4, <ore:ingotBreakium>], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:typhoonite_ingot> * 2, [<ore:ingotMoltenium> * 2, <ore:ingotGodiarite> * 2, <ore:ingotXenidium>], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:fallenium_ingot> * 2, [<ore:ingotVanadium> * 2, <ore:ingotGallium> * 3, <ore:ingotFenzium> * 2], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:phoenixite_ingot> * 2, [<ore:ingotFenzium> * 3, <ore:ingotDawnium> * 2], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:depthite_ingot> * 3, [<ore:ingotRainite> * 2, <ore:ingotBreakium> * 4, <ore:ingotGallium> * 2], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:lovaquite_ingot> * 2, [<ore:ingotFallenium> * 2, <ore:ingotMolybdenum> * 2, <ore:ingotLosessium>], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:rangolarite_ingot> * 2, [<ore:ingotPhoenixite> * 3, <ore:ingotDepthite>], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:clearite_ingot> * 3, [<ore:ingotIndium> * 2, <ore:ingotSissidium> * 2, <ore:ingotTyphoonite> * 2], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:wefenium_ingot> * 2, [<ore:ingotLovaquite> * 3, <ore:ingotTtwo> * 2, <ore:ingotTierite>], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:errorite_ingot> * 3, [<ore:ingotAntimony> * 2, <ore:ingotCirclium> * 3, <ore:ingotRangolarite> * 4], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:numbereum_ingot> * 2, [<ore:ingotRapesesium> * 2, <ore:ingotWefenium> * 3], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:babyrite_ingot> * 3, [<ore:ingotGold> * 7, <ore:ingotRubium> * 2, <ore:ingotClearite>], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:leadite_ingot> * 3, [<ore:ingotCirclium> * 2, <ore:ingotTechnetium>, <ore:ingotFallenium> * 6], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:martisite_ingot> * 3, [<ore:ingotCestium> * 4, <ore:ingotLeadite> * 3, <ore:ingotNumbereum> * 3], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:flashite_ingot> * 3, [<ore:ingotFraxinium> * 2, <ore:ingotTreasurite> * 2, <ore:ingotErrorite> * 2], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:overlaite_ingot>, [<ore:ingotMartisite>, <ore:ingotClearite>], 2000, 10.0f);
AlloySmelter.addRecipe(<plustic:osgloglasingot>, [<ore:ingotOsmium>, <ore:ingotRefinedGlowstone>, <ore:ingotRefinedObsidian>], 2000, 10.0f);
AlloySmelter.addRecipe(<nuclearcraft:alloy:16> * 2, [<ore:ingotZirconium>, <ore:ingotMolybdenum>], 2000, 10.0f);
AlloySmelter.addRecipe(<additions:eioaddon-clock_alloy_ingot> * 2, [<ore:dustTime>, <ore:ingotMelodicAlloy> * 2, <divinerpg:mysterious_clock>], 10000, 60.0f);
AlloySmelter.addRecipe(<additions:eioaddon-twilit_alloy_ingot> * 3, [<twilightforest:torchberries> * 6, <ore:ingotBlackholeAlloy> * 1, <ore:ingotApocalypsium> * 2], 500000, 150.0f);
AlloySmelter.addRecipe(<additions:eioaddon-mist_alloy_ingot>, [<ore:ingotMelodicAlloy> * 2, <ore:ingotCrystallineAlloy>, <abyssalcraft:stone:6> * 4], 25000, 55.0f);
AlloySmelter.addRecipe(<additions:eioaddon-sharpen_alloy_ingot> * 2, [<ore:ingotMistAlloy>, <ore:ingotStellarAlloy> * 2, <gct_ores:rainboquartz> * 6], 125000, 240.0f);
AlloySmelter.addRecipe(<additions:eioaddon-killer_alloy_ingot> * 3, [<ore:ingotTwilitAlloy>, <ore:ingotEvilMetal> * 4, <ore:ingotFlamium> * 3], 400000, 200.0f);
AlloySmelter.addRecipe(<additions:eioaddon-curse_alloy_ingot>, [<ore:ingotDarkSteel> * 5, <ore:ingotSoulium> * 3, <ore:ingotBlackholeAlloy>], 350000, 180.0f);
AlloySmelter.addRecipe(<additions:eioaddon-blackhole_alloy_ingot> * 2, [<ore:ingotStellarAlloy>, <draconicevolution:chaos_shard:1> * 4, <ore:ingotVoid>], 300000, 200.0f);
AlloySmelter.addRecipe(<additions:eioaddon-creative_alloy_ingot> * 2, [<ore:ingotBlackholeAlloy> * 2, <ore:ingotBalancedMatrix>, <ore:shardCreative>], 1000000, 1000.0f);
AlloySmelter.addRecipe(<tconevo:material> * 2, [<ore:ingotManyullyn> * 2, <ore:ingotAdamant>, <ore:ingotEnderium> * 2], 50000, 20.0f);
AlloySmelter.addRecipe(<additions:greedycraft-daynight_ingot>, [<ore:ingotFalsite>, <ore:ingotVentium>, <ore:ingotHorizonite>], 5000, 10.0f);
AlloySmelter.addRecipe(<additions:mekaddon-porpezite_ingot> * 2, [<ore:ingotRuthenium>, <ore:ingotRhodium>, <ore:ingotPalladium> * 3], 4000, 10.0f);
AlloySmelter.addRecipe(<plustic:osmiridiumingot> * 2, [<ore:ingotOsmium>, <ore:ingotIridium>], 2000, 10.0f);
AlloySmelter.addRecipe(<nuclearcraft:alloy:12> * 2, [<ore:ingotZirconium> * 2, <ore:ingotTin>], 2000, 10.0f);
AlloySmelter.addRecipe(<moretcon:ingotirradium> * 2, [<ore:ingotIridium>, <ore:ingotRadium>], 4000, 10.0f);
AlloySmelter.addRecipe(<additions:greedycraft-blueprint_laser_gun>, [<ore:ingotPhotonium>, <additions:greedycraft-blueprint>, <ore:ingotCrystalMatrix>], 800000, 400.0f);
AlloySmelter.addRecipe(<additions:greedycraft-blueprint_ring>, [<ore:ingotValkyrie>, <additions:greedycraft-blueprint>, <ore:ingotEverite>], 1600000, 600.0f);
AlloySmelter.addRecipe(<additions:greedycraft-ascensionite_ingot> * 2, [<ore:ingotLimonite> * 4, <ore:ingotRosite> * 2, <ore:ingotEmberstone> * 1], 4000, 10.0f);

SagMill.removeRecipe(<minecraft:coal>);
SagMill.removeRecipe(<actuallyadditions:block_misc:2>);
SagMill.addRecipe([<actuallyadditions:item_dust:7> * 4], [100 as float], <ore:blockQuartzBlack> as IIngredient, "CHANCE_ONLY", 400, [100 as float]);
