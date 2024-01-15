#priority 3000

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import mods.avaritia.ExtremeCrafting;
import mods.avaritia.Compressor;
import mods.ctintegration.util.RecipePattern;
import mods.extendedcrafting.TableCrafting;

TableCrafting.addShaped(0, <denseneutroncollectors:double_compressed_neutron_collector>, [
	[null, null, <ore:ingotProtonium>, <ore:ingotProtonium>, <ore:ingotProtonium>, null, null], 
	[null, <ore:ingotIron>, <ore:nuggetCosmicNeutronium>, <ore:nuggetCosmicNeutronium>, <ore:nuggetCosmicNeutronium>, <ore:ingotIron>, null], 
	[<ore:ingotProtonium>, <ore:nuggetCosmicNeutronium>, <ore:ingotIron>, <ore:nuggetCosmicNeutronium>, <ore:ingotIron>, <ore:nuggetCosmicNeutronium>, <ore:ingotProtonium>], 
	[<ore:ingotProtonium>, <ore:nuggetCosmicNeutronium>, <ore:nuggetCosmicNeutronium>, <denseneutroncollectors:compressed_neutron_collector>, <ore:nuggetCosmicNeutronium>, <ore:nuggetCosmicNeutronium>, <ore:ingotProtonium>], 
	[<ore:ingotProtonium>, <ore:nuggetCosmicNeutronium>, <ore:ingotIron>, <ore:nuggetCosmicNeutronium>, <ore:ingotIron>, <ore:nuggetCosmicNeutronium>, <ore:ingotProtonium>], 
	[null, <ore:ingotIron>, <ore:nuggetCosmicNeutronium>, <ore:nuggetCosmicNeutronium>, <ore:nuggetCosmicNeutronium>, <ore:ingotIron>, null], 
	[null, null, <ore:ingotProtonium>, <ore:ingotProtonium>, <ore:ingotProtonium>, null, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <extendedcrafting:storage:3>, [
	[<avaritia:resource>, <ore:ingotSignalum>, <ore:ingotSignalum>, <extendedcrafting:material:7>, <ore:ingotSignalum>, <ore:ingotSignalum>, <avaritia:resource>], 
	[<ore:ingotSignalum>, <avaritia:resource>, <ore:ingotLumium>, <ore:ingotLumium>, <ore:ingotLumium>, <avaritia:resource>, <ore:ingotSignalum>], 
	[<ore:ingotSignalum>, <ore:ingotLumium>, <avaritia:resource>, <avaritia:resource>, <avaritia:resource>, <ore:ingotLumium>, <ore:ingotSignalum>], 
	[<avaritia:resource>, <ore:ingotLumium>, <avaritia:resource>, <ore:blockFusionMatrix>, <avaritia:resource>, <ore:ingotLumium>, <avaritia:resource>], 
	[<ore:ingotSignalum>, <ore:ingotLumium>, <avaritia:resource>, <avaritia:resource>, <avaritia:resource>, <ore:ingotLumium>, <ore:ingotSignalum>], 
	[<ore:ingotSignalum>, <avaritia:resource>, <ore:ingotLumium>, <ore:ingotLumium>, <ore:ingotLumium>, <avaritia:resource>, <ore:ingotSignalum>], 
	[<avaritia:resource>, <ore:ingotSignalum>, <ore:ingotSignalum>, <extendedcrafting:material:7>, <ore:ingotSignalum>, <ore:ingotSignalum>, <avaritia:resource>]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <twilightforest:giant_obsidian>, [
	[<ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, null], 
	[<ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, null], 
	[<ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, null], 
	[<ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, null], 
	[<ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, null], 
	[<ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, null], 
	[<ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, null], 
	[<ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, null], 
	[null, null, null, null, null, null, null, null, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <twilightforest:giant_cobblestone>, [
	[<ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, null], 
	[<ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, null], 
	[<ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, null], 
	[<ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, null], 
	[<ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, null], 
	[<ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, null], 
	[<ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, null], 
	[<ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>, null], 
	[null, null, null, null, null, null, null, null, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <twilightforest:giant_log>, [
	[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, null], 
	[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, null], 
	[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, null], 
	[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, null], 
	[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, null], 
	[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, null], 
	[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, null], 
	[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, <ore:plankWood>, null], 
	[null, null, null, null, null, null, null, null, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <twilightforest:giant_leaves>, [
	[<ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, null], 
	[<ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, null], 
	[<ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, null], 
	[<ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, null], 
	[<ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, null], 
	[<ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, null], 
	[<ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, null], 
	[<ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, <ore:treeLeaves>, null], 
	[null, null, null, null, null, null, null, null, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:mekaddon-scientificite_mirror>, [
	[null, null, null, <ore:ingotCreativeAlloy>, null, null, null], 
	[null, null, <ore:ingotCosmilite>, <ore:blockGlass>, <ore:ingotCosmilite>, null, null], 
	[null, <ore:ingotCrystalMatrix>, <ore:blockGlass>, <ore:ingotScientificite>, <ore:blockGlass>, <ore:ingotCrystalMatrix>, null], 
	[null, <ore:ingotCrystalMatrix>, <ore:ingotScientificite>, <ore:circuitArcane>, <ore:ingotScientificite>, <ore:ingotCrystalMatrix>, null], 
	[null, <ore:ingotCrystalMatrix>, <ore:blockGlass>, <ore:ingotScientificite>, <ore:blockGlass>, <ore:ingotCrystalMatrix>, null], 
	[null, null, <ore:ingotCosmilite>, <ore:blockGlass>, <ore:ingotCosmilite>, null, null], 
	[null, null, null, <ore:ingotCreativeAlloy>, null, null, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:mekaddon-balance_core> * 2, [
	[null, null, <ore:ingotDullium>, <thermalexpansion:florb>, <ore:ingotDullium>, null, null], 
	[null, <thermalexpansion:florb>, <ore:ingotDullium>, <ore:ingotGelidEnderium>, <ore:ingotDullium>, <thermalexpansion:florb>, null], 
	[<ore:ingotDullium>, <ore:ingotDullium>, <ore:ingotDecurrium>, <ore:ingotDecurrium>, <ore:ingotDecurrium>, <ore:ingotDullium>, <ore:ingotDullium>], 
	[<thermalexpansion:florb>, <ore:ingotGelidEnderium>, <ore:ingotDecurrium>, <ore:ingotBalancedMatrix>, <ore:ingotDecurrium>, <ore:ingotGelidEnderium>, <thermalexpansion:florb>], 
	[<ore:ingotDullium>, <ore:ingotDullium>, <ore:ingotDecurrium>, <ore:ingotDecurrium>, <ore:ingotDecurrium>, <ore:ingotDullium>, <ore:ingotDullium>], 
	[null, <thermalexpansion:florb>, <ore:ingotDullium>, <ore:ingotGelidEnderium>, <ore:ingotDullium>, <thermalexpansion:florb>, null], 
	[null, null, <ore:ingotDullium>, <thermalexpansion:florb>, <ore:ingotDullium>, null, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mobs:kabalah_builder_block>, [
	[<botania:livingrock:4>, <botania:livingrock:4>, <botania:livingrock:4>, <ore:logWoodDream>, <botania:livingrock:4>, <botania:livingrock:4>, <botania:livingrock:4>], 
	[<botania:livingrock:4>, <ore:blockGaia>, <ore:ingotOrichalcos>, <ore:ingotOrichalcos>, <ore:ingotOrichalcos>, <ore:blockGaia>, <botania:livingrock:4>], 
	[<botania:livingrock:4>, <ore:ingotOrichalcos>, <ore:blockGaia>, <botania:pool:3>, <ore:blockGaia>, <ore:ingotOrichalcos>, <botania:livingrock:4>], 
	[<ore:logWoodDream>, <ore:ingotOrichalcos>, <botania:pool:3>, <ore:blockCrimsonite>, <botania:pool:3>, <ore:ingotOrichalcos>, <ore:logWoodDream>], 
	[<botania:livingrock:4>, <ore:ingotOrichalcos>, <ore:blockGaia>, <botania:pool:3>, <ore:blockGaia>, <ore:ingotOrichalcos>, <botania:livingrock:4>], 
	[<botania:livingrock:4>, <ore:blockGaia>, <ore:ingotOrichalcos>, <ore:ingotOrichalcos>, <ore:ingotOrichalcos>, <ore:blockGaia>, <botania:livingrock:4>], 
	[<botania:livingrock:4>, <botania:livingrock:4>, <botania:livingrock:4>, <ore:logWoodDream>, <botania:livingrock:4>, <botania:livingrock:4>, <botania:livingrock:4>]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mobs:orichalcos_fusionplate>, [
	[null, null, null, <ore:nuggetFusionMatrix>, null, null, null], 
	[null, null, <ore:nuggetFusionMatrix>, <ore:nuggetFusionMatrix>, <ore:nuggetFusionMatrix>, null, null], 
	[null, <ore:nuggetFusionMatrix>, <ore:ingotGold>, <ore:nuggetFusionMatrix>, <ore:ingotGold>, <ore:nuggetFusionMatrix>, null], 
	[<ore:nuggetFusionMatrix>, <ore:nuggetFusionMatrix>, <ore:nuggetFusionMatrix>, <ore:ingotOrichalcos>, <ore:nuggetFusionMatrix>, <ore:nuggetFusionMatrix>, <ore:nuggetFusionMatrix>], 
	[null, <ore:nuggetFusionMatrix>, <ore:ingotGold>, <ore:nuggetFusionMatrix>, <ore:ingotGold>, <ore:nuggetFusionMatrix>, null], 
	[null, null, <ore:nuggetFusionMatrix>, <ore:nuggetFusionMatrix>, <ore:nuggetFusionMatrix>, null, null], 
	[null, null, null, <ore:nuggetFusionMatrix>, null, null, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mobs:elementium_fusionplate>, [
	[null, null, null, <ore:nuggetFusionMatrix>, null, null, null], 
	[null, null, <ore:nuggetFusionMatrix>, <ore:nuggetFusionMatrix>, <ore:nuggetFusionMatrix>, null, null], 
	[null, <ore:nuggetFusionMatrix>, <ore:ingotGold>, <ore:nuggetFusionMatrix>, <ore:ingotGold>, <ore:nuggetFusionMatrix>, null], 
	[<ore:nuggetFusionMatrix>, <ore:nuggetFusionMatrix>, <ore:nuggetFusionMatrix>, <ore:ingotElementium>, <ore:nuggetFusionMatrix>, <ore:nuggetFusionMatrix>, <ore:nuggetFusionMatrix>], 
	[null, <ore:nuggetFusionMatrix>, <ore:ingotGold>, <ore:nuggetFusionMatrix>, <ore:ingotGold>, <ore:nuggetFusionMatrix>, null], 
	[null, null, <ore:nuggetFusionMatrix>, <ore:nuggetFusionMatrix>, <ore:nuggetFusionMatrix>, null, null], 
	[null, null, null, <ore:nuggetFusionMatrix>, null, null, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mobs:manasteel_fusionplate>, [
	[null, null, null, <ore:nuggetFusionMatrix>, null, null, null], 
	[null, null, <ore:nuggetFusionMatrix>, <ore:nuggetFusionMatrix>, <ore:nuggetFusionMatrix>, null, null], 
	[null, <ore:nuggetFusionMatrix>, <ore:ingotGold>, <ore:nuggetFusionMatrix>, <ore:ingotGold>, <ore:nuggetFusionMatrix>, null], 
	[<ore:nuggetFusionMatrix>, <ore:nuggetFusionMatrix>, <ore:nuggetFusionMatrix>, <ore:ingotManasteel>, <ore:nuggetFusionMatrix>, <ore:nuggetFusionMatrix>, <ore:nuggetFusionMatrix>], 
	[null, <ore:nuggetFusionMatrix>, <ore:ingotGold>, <ore:nuggetFusionMatrix>, <ore:ingotGold>, <ore:nuggetFusionMatrix>, null], 
	[null, null, <ore:nuggetFusionMatrix>, <ore:nuggetFusionMatrix>, <ore:nuggetFusionMatrix>, null, null], 
	[null, null, null, <ore:nuggetFusionMatrix>, null, null, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:greedycraft-betweenland_rune>, [
	[null, null, null, null, <ore:ingotOrichalcos>, <ore:ingotBalancedMatrix>, null], 
	[<ore:ingotBalancedMatrix>, <ore:blockEugardite>, <ore:ingotOrichalcos>, <ore:ingotOrichalcos>, <ore:blockEugardite>, <ore:blockEugardite>, null], 
	[<ore:ingotOrichalcos>, <ore:blockEugardite>, <ore:blockCorbite>, <ore:blockEucite>, <ore:blockCorbite>, <ore:ingotOrichalcos>, null], 
	[null, <ore:ingotOrichalcos>, <ore:blockEucite>, <ore:blockCosmilite>, <ore:blockEucite>, <ore:ingotOrichalcos>, null], 
	[null, <ore:ingotOrichalcos>, <ore:blockCorbite>, <ore:blockEucite>, <ore:blockCorbite>, <ore:blockEugardite>, <ore:ingotOrichalcos>], 
	[null, <ore:blockEugardite>, <ore:blockEugardite>, <ore:ingotOrichalcos>, <ore:ingotOrichalcos>, <ore:blockEugardite>, <ore:ingotBalancedMatrix>], 
	[null, <ore:ingotBalancedMatrix>, <ore:ingotOrichalcos>, null, null, null, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <naturalpledge:spell_focus>, [
	[null, null, <ore:blockMana>, <ore:blockTerrasteel>, <ore:blockMana>, null, null], 
	[null, <ore:blockMana>, <ore:ingotBotanicalAwakened>, <ore:ingotBotanicalAwakened>, <ore:ingotBotanicalAwakened>, <ore:blockMana>, null], 
	[null, <ore:blockTerrasteel>, <ore:ingotBotanicalAwakened>, <ore:ingotBotanicalAwakened>, <ore:ingotBotanicalAwakened>, <ore:blockTerrasteel>, null], 
	[null, <ore:blockMana>, <ore:ingotBotanicalAwakened>, <ore:ingotBotanicalAwakened>, <ore:ingotBotanicalAwakened>, <ore:blockMana>, null], 
	[null, null, <ore:blockMana>, <ore:blockTerrasteel>, <ore:blockMana>, null, null], 
	[null, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, null], 
	[null, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:bloody-gloomy_passport>, [
	[null, null, <ore:ingotDullium>, <ore:ingotDullium>, <ore:ingotDullium>, null, null], 
	[<ore:ingotDullium>, <ore:ingotDullium>, <ore:ingotWigthium>, <ore:dustDark>, <ore:dustDark>, <ore:ingotDullium>, <ore:ingotDullium>], 
	[<ore:ingotDullium>, <ore:dustDark>, <ore:ingotWigthium>, <ore:ingotWigthium>, <ore:ingotCrimsonite>, <ore:dustDark>, <ore:ingotDullium>], 
	[<ore:ingotDullium>, <ore:dustDark>, <ore:ingotWigthium>, <additions:bloody-slate_7>, <ore:ingotWigthium>, <ore:dustDark>, <ore:ingotDullium>], 
	[null, <ore:ingotDullium>, <ore:ingotCrimsonite>, <ore:ingotWigthium>, <ore:ingotWigthium>, <ore:ingotDullium>, null], 
	[null, <ore:ingotDullium>, <ore:ingotDullium>, <ore:dustDark>, <ore:ingotWigthium>, <ore:ingotDullium>, null], 
	[null, null, null, <ore:ingotDullium>, null, null, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mac:impetus_forge>, [
	[<ore:plateVoid>, <ore:plateVoid>, <ore:plateVoid>, <ore:plateVoid>, <ore:plateVoid>, <ore:plateVoid>, <ore:plateVoid>], 
	[<ore:plateVoid>, <ore:ingotInfernium>, <ore:ingotInfernium>, <ore:ingotInfernium>, <ore:ingotInfernium>, <ore:ingotInfernium>, <ore:plateVoid>], 
	[<ore:plateVoid>, <ore:ingotInfernium>, <thaumicaugmentation:material:3>, <thaumicaugmentation:material:5>, <thaumicaugmentation:material:3>, <ore:ingotInfernium>, <ore:plateVoid>], 
	[<ore:plateVoid>, <ore:ingotCosmilite>, <thaumicaugmentation:material:5>, <ore:ingotPrimordialExtended>, <thaumicaugmentation:material:5>, <ore:ingotCosmilite>, <ore:plateVoid>], 
	[<ore:plateVoid>, <ore:ingotInfernium>, <thaumicaugmentation:material:3>, <thaumicaugmentation:material:5>, <thaumicaugmentation:material:3>, <ore:ingotInfernium>, <ore:plateVoid>], 
	[<ore:plateVoid>, <ore:ingotInfernium>, <ore:ingotInfernium>, <ore:ingotInfernium>, <ore:ingotInfernium>, <ore:ingotInfernium>, <ore:plateVoid>], 
	[<ore:plateVoid>, <ore:plateVoid>, <ore:plateVoid>, <ore:plateVoid>, <ore:plateVoid>, <ore:plateVoid>, <ore:plateVoid>]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <gct_aby:soul_stealer_scroll>, [
	[null, null, null, null, null, null, null], 
	[<ore:ingotSanite>, null, null, null, null, null, <ore:ingotSanite>], 
	[<ore:ingotAbyssalnite>, <ore:ingotAbyssalnite>, <ore:ingotAbyssalnite>, <ore:ingotAbyssalnite>, <ore:ingotAbyssalnite>, <ore:ingotAbyssalnite>, <ore:ingotAbyssalnite>], 
	[<ore:ingotAbyssalnite>, <ore:ingotCthulhurite>, <ore:gemValonite>, <gct_aby:essence_of_warped_ruin>, <ore:gemValonite>, <ore:ingotCthulhurite>, <ore:ingotAbyssalnite>], 
	[<ore:ingotAbyssalnite>, <ore:ingotAbyssalnite>, <ore:ingotAbyssalnite>, <ore:ingotAbyssalnite>, <ore:ingotAbyssalnite>, <ore:ingotAbyssalnite>, <ore:ingotAbyssalnite>], 
	[<ore:ingotSanite>, null, null, null, null, null, <ore:ingotSanite>], 
	[null, null, null, null, null, null, null]
]);

mods.extendedcrafting.TableCrafting.addShapeless(0, <gct_ores:shalloite> * 48, [<ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:gemEnderBiotite>, <ore:nuggetFinallium>]);

mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mac:stratified_precipitator>, [
	[null, <ore:ingotZirconiumMolybdenum>, <ore:ingotZirconiumMolybdenum>, <ore:ingotZirconiumMolybdenum>, <ore:ingotZirconiumMolybdenum>, <ore:ingotZirconiumMolybdenum>, null], 
	[<ore:ingotZirconiumMolybdenum>, <actuallyadditions:block_misc:9>, <mist:filter_coal>, <mist:filter_coal>, <mist:filter_coal>, <actuallyadditions:block_misc:9>, <ore:ingotZirconiumMolybdenum>], 
	[<ore:ingotZirconiumMolybdenum>, <actuallyadditions:block_misc:9>, <ore:latticeDiamond>, <ore:latticeDiamond>, <ore:latticeDiamond>, <actuallyadditions:block_misc:9>, <ore:ingotZirconiumMolybdenum>], 
	[<ore:ingotZirconiumMolybdenum>, <actuallyadditions:block_misc:9>, <mist:filter_coal>, <ore:circuitFinal>, <mist:filter_coal>, <actuallyadditions:block_misc:9>, <ore:ingotZirconiumMolybdenum>], 
	[<ore:ingotZirconiumMolybdenum>, <actuallyadditions:block_misc:9>, <ore:latticeDiamond>, <ore:latticeDiamond>, <ore:latticeDiamond>, <actuallyadditions:block_misc:9>, <ore:ingotZirconiumMolybdenum>], 
	[<ore:ingotZirconiumMolybdenum>, <actuallyadditions:block_misc:9>, <mist:filter_coal>, <mist:filter_coal>, <mist:filter_coal>, <actuallyadditions:block_misc:9>, <ore:ingotZirconiumMolybdenum>], 
	[null, <ore:ingotZirconiumMolybdenum>, <ore:ingotZirconiumMolybdenum>, <ore:ingotZirconiumMolybdenum>, <ore:ingotZirconiumMolybdenum>, <ore:ingotZirconiumMolybdenum>, null]
]);