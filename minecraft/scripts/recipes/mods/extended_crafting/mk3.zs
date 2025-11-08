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

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:scientificite_mirror>, [
	[null, null, null, <ore:ingotCreativeAlloy>, null, null, null], 
	[null, null, <ore:ingotCosmilite>, <ore:blockGlass>, <ore:ingotCosmilite>, null, null], 
	[null, <ore:ingotCrystalMatrix>, <ore:blockGlass>, <ore:ingotScientificite>, <ore:blockGlass>, <ore:ingotCrystalMatrix>, null], 
	[null, <ore:ingotCrystalMatrix>, <ore:ingotScientificite>, <ore:circuitArcane>, <ore:ingotScientificite>, <ore:ingotCrystalMatrix>, null], 
	[null, <ore:ingotCrystalMatrix>, <ore:blockGlass>, <ore:ingotScientificite>, <ore:blockGlass>, <ore:ingotCrystalMatrix>, null], 
	[null, null, <ore:ingotCosmilite>, <ore:blockGlass>, <ore:ingotCosmilite>, null, null], 
	[null, null, null, <ore:ingotCreativeAlloy>, null, null, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:balance_core> * 2, [
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
	[null, null, null, <ore:nuggetEverite>, null, null, null], 
	[null, null, <ore:nuggetEverite>, <ore:nuggetEverite>, <ore:nuggetEverite>, null, null], 
	[null, <ore:nuggetEverite>, <ore:ingotGold>, <ore:nuggetEverite>, <ore:ingotGold>, <ore:nuggetEverite>, null], 
	[<ore:nuggetEverite>, <ore:nuggetEverite>, <ore:nuggetEverite>, <ore:ingotOrichalcos>, <ore:nuggetEverite>, <ore:nuggetEverite>, <ore:nuggetEverite>], 
	[null, <ore:nuggetEverite>, <ore:ingotGold>, <ore:nuggetEverite>, <ore:ingotGold>, <ore:nuggetEverite>, null], 
	[null, null, <ore:nuggetEverite>, <ore:nuggetEverite>, <ore:nuggetEverite>, null, null], 
	[null, null, null, <ore:nuggetEverite>, null, null, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mobs:elementium_fusionplate>, [
	[null, null, null, <ore:nuggetEverite>, null, null, null], 
	[null, null, <ore:nuggetEverite>, <ore:nuggetEverite>, <ore:nuggetEverite>, null, null], 
	[null, <ore:nuggetEverite>, <ore:ingotGold>, <ore:nuggetEverite>, <ore:ingotGold>, <ore:nuggetEverite>, null], 
	[<ore:nuggetEverite>, <ore:nuggetEverite>, <ore:nuggetEverite>, <ore:ingotElementium>, <ore:nuggetEverite>, <ore:nuggetEverite>, <ore:nuggetEverite>], 
	[null, <ore:nuggetEverite>, <ore:ingotGold>, <ore:nuggetEverite>, <ore:ingotGold>, <ore:nuggetEverite>, null], 
	[null, null, <ore:nuggetEverite>, <ore:nuggetEverite>, <ore:nuggetEverite>, null, null], 
	[null, null, null, <ore:nuggetEverite>, null, null, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mobs:manasteel_fusionplate>, [
	[null, null, null, <ore:nuggetEverite>, null, null, null], 
	[null, null, <ore:nuggetEverite>, <ore:nuggetEverite>, <ore:nuggetEverite>, null, null], 
	[null, <ore:nuggetEverite>, <ore:ingotGold>, <ore:nuggetEverite>, <ore:ingotGold>, <ore:nuggetEverite>, null], 
	[<ore:nuggetEverite>, <ore:nuggetEverite>, <ore:nuggetEverite>, <ore:ingotManasteel>, <ore:nuggetEverite>, <ore:nuggetEverite>, <ore:nuggetEverite>], 
	[null, <ore:nuggetEverite>, <ore:ingotGold>, <ore:nuggetEverite>, <ore:ingotGold>, <ore:nuggetEverite>, null], 
	[null, null, <ore:nuggetEverite>, <ore:nuggetEverite>, <ore:nuggetEverite>, null, null], 
	[null, null, null, <ore:nuggetEverite>, null, null, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:betweenland_rune>, [
	[null, null, null, null, <ore:ingotOrichalcos>, <ore:ingotBalancedMatrix>, null], 
	[<ore:ingotBalancedMatrix>, <ore:blockEugardite>, <ore:ingotOrichalcos>, <ore:ingotOrichalcos>, <ore:blockEugardite>, <ore:blockEugardite>, null], 
	[<ore:ingotOrichalcos>, <ore:blockEugardite>, <ore:blockCorbite>, <ore:blockEucite>, <ore:blockCorbite>, <ore:ingotOrichalcos>, null], 
	[null, <ore:ingotOrichalcos>, <ore:blockEucite>, <ore:blockCosmilite>, <ore:blockEucite>, <ore:ingotOrichalcos>, null], 
	[null, <ore:ingotOrichalcos>, <ore:blockCorbite>, <ore:blockEucite>, <ore:blockCorbite>, <ore:blockEugardite>, <ore:ingotOrichalcos>], 
	[null, <ore:blockEugardite>, <ore:blockEugardite>, <ore:ingotOrichalcos>, <ore:ingotOrichalcos>, <ore:blockEugardite>, <ore:ingotBalancedMatrix>], 
	[null, <ore:ingotBalancedMatrix>, <ore:ingotOrichalcos>, null, null, null, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:gloomy_passport>, [
	[null, null, <ore:ingotDullium>, <ore:ingotDullium>, <ore:ingotDullium>, null, null], 
	[<ore:ingotDullium>, <ore:ingotDullium>, <ore:ingotWigthium>, <ore:gemDark>, <ore:gemDark>, <ore:ingotDullium>, <ore:ingotDullium>], 
	[<ore:ingotDullium>, <ore:gemDark>, <ore:ingotWigthium>, <ore:ingotWigthium>, <ore:ingotCrimsonite>, <ore:gemDark>, <ore:ingotDullium>], 
	[<ore:ingotDullium>, <ore:gemDark>, <ore:ingotWigthium>, <additions:slate_7>, <ore:ingotWigthium>, <ore:gemDark>, <ore:ingotDullium>], 
	[null, <ore:ingotDullium>, <ore:ingotCrimsonite>, <ore:ingotWigthium>, <ore:ingotWigthium>, <ore:ingotDullium>, null], 
	[null, <ore:ingotDullium>, <ore:ingotDullium>, <ore:gemDark>, <ore:ingotWigthium>, <ore:ingotDullium>, null], 
	[null, null, null, <ore:ingotDullium>, null, null, null]
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

mods.extendedcrafting.TableCrafting.addShaped(0, <gct_aby:abyss_wand>, [
	[null, null, null, null, <gct_aby:shoggoth_complex_crystal>, <ore:ingotAdaminite>, <abyssalcraft:oc>], 
	[null, null, null, null, <ore:ingotAdaminite>, <abyssalcraft:oc>, <ore:ingotAdaminite>], 
	[null, null, null, <gct_aby:shoggoth_complex_crystal>, <ore:ingotAbyssine>, <ore:ingotAdaminite>, <gct_aby:shoggoth_complex_crystal>], 
	[null, null, <gct_aby:shoggoth_complex_crystal>, <ore:ingotFinallium>, <gct_aby:shoggoth_complex_crystal>, null, null], 
	[null, <gct_aby:shoggoth_complex_crystal>, <thaumicrestoration:block_crystal>.withTag({aspect: "cthulhu"}), <gct_aby:shoggoth_complex_crystal>, null, null, null], 
	[<gct_aby:shoggoth_complex_crystal>, <thaumicrestoration:block_crystal>.withTag({aspect: "cthulhu"}), <gct_aby:shoggoth_complex_crystal>, null, null, null, null], 
	[<thaumicrestoration:block_crystal>.withTag({aspect: "cthulhu"}), <gct_aby:shoggoth_complex_crystal>, null, null, null, null, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:modular_dimensional_magnifier>, [
	[null, null, null, <ore:blockGlassOrange>, <ore:nuggetDimesium>, <ore:ingotDimesium>, <ore:nuggetDimesium>], 
	[null, null, null, <ore:blockGlassOrange>, <ore:ingotDimesium>, <ore:blockDimesium>, <ore:ingotDimesium>], 
	[null, null, null, <ore:blockGlassOrange>, <ore:nuggetDimesium>, <ore:ingotDimesium>, <ore:nuggetDimesium>], 
	[null, null, null, <ore:rodBninz>, <ore:blockGlassOrange>, <ore:blockGlassOrange>, <ore:blockGlassOrange>], 
	[null, null, <ore:rodBligtz>, null, null, null, null], 
	[null, <ore:rodBthdz>, null, null, null, null, null], 
	[<ore:rodBnatuz>, null, null, null, null, null, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:upgrade_output>, [
	[null, null, <ore:ingotNiobiumTitanium>, <ore:ingotNiobiumTitanium>, <ore:plateZincargentum>, <ore:plateZincargentum>, <ore:plateZincargentum>], 
	[null, <ore:modularUpgradeEnergy>, <ore:ingotPorpezite>, <ore:ingotPorpezite>, <ore:ingotPorpezite>, <ore:ingotCrystalMatrix>, <ore:plateZincargentum>], 
	[<ore:ingotNiobiumTitanium>, <ore:ingotPorpezite>, <ore:ingotCrystalMatrix>, <ore:ingotPorpezite>, <ore:ingotCrystalMatrix>, <ore:ingotPorpezite>, <ore:plateZincargentum>], 
	[<ore:ingotNiobiumTitanium>, <ore:ingotPorpezite>, <ore:ingotPorpezite>, <ore:blockFlux>, <ore:ingotPorpezite>, <ore:ingotPorpezite>, <ore:ingotNiobiumTitanium>], 
	[<ore:plateZincargentum>, <ore:ingotPorpezite>, <ore:ingotCrystalMatrix>, <ore:ingotPorpezite>, <ore:ingotCrystalMatrix>, <ore:ingotPorpezite>, <ore:ingotNiobiumTitanium>], 
	[<ore:plateZincargentum>, <ore:ingotCrystalMatrix>, <ore:ingotPorpezite>, <ore:ingotPorpezite>, <ore:ingotPorpezite>, <ore:modularUpgradeEnergy>, null], 
	[<ore:plateZincargentum>, <ore:plateZincargentum>, <ore:plateZincargentum>, <ore:ingotNiobiumTitanium>, <ore:ingotNiobiumTitanium>, null, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:brain_container>, [
	[<ore:ingotFinallium>, <ore:barsIron>, <ore:barsIron>, <ore:barsIron>, <ore:barsIron>, <ore:barsIron>, <ore:ingotFinallium>], 
	[<ore:barsIron>, <ore:blockGlassHardened>, <ore:circuitDreamic>, <ore:circuitArcane>, <ore:circuitDreamic>, <ore:blockGlassHardened>, <ore:barsIron>], 
	[<ore:barsIron>, <ore:blockSanite>, <ore:blockGlassHardened>, <ore:blockGlassHardened>, <ore:blockGlassHardened>, <ore:blockSanite>, <ore:barsIron>], 
	[<ore:barsIron>, <ore:blockSanite>, <ore:ingotAbyssine>, <additions:consciousness_brain_mk1>, <ore:ingotAbyssine>, <ore:blockSanite>, <ore:barsIron>], 
	[<ore:barsIron>, <ore:blockSanite>, <ore:blockGlassHardened>, <ore:blockGlassHardened>, <ore:blockGlassHardened>, <ore:blockSanite>, <ore:barsIron>], 
	[<ore:barsIron>, <ore:blockGlassHardened>, <ore:circuitDreamic>, <thermaldynamics:duct_16:7>, <ore:circuitDreamic>, <ore:blockGlassHardened>, <ore:barsIron>], 
	[<ore:ingotFinallium>, <ore:barsIron>, <ore:barsIron>, <thermaldynamics:duct_16:7>, <ore:barsIron>, <ore:barsIron>, <ore:ingotFinallium>]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:final_scythe>, [
	[null, null, <ore:ingotFinallium>, <ore:ingotFinallium>, <ore:ingotFinallium>, <ore:ingotUndead>, null], 
	[<ore:ingotEugardite>, <ore:ingotEugardite>, null, null, <ore:ingotUndead>, <ore:ingotGhostMetal>, <ore:ingotUndead>], 
	[null, null, null, null, <bloodarsenal:base_item:1>, <ore:ingotUndead>, null], 
	[null, null, null, <bloodarsenal:base_item:1>, null, null, null], 
	[null, null, <bloodarsenal:base_item:1>, null, null, null, null], 
	[null, <bloodarsenal:base_item:1>, null, null, null, null, null], 
	[<bloodarsenal:base_item:1>, null, null, null, null, null, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <gct_ores:finallium_container>, [
	[<gct_ores:shalloite_block>, <gct_ores:shalloite_block>, null, <ore:ingotOrderedMetal>, null, <gct_ores:shalloite_block>, <gct_ores:shalloite_block>], 
	[<gct_ores:shalloite_block>, <additions:dragonbone_block_mixed>, <additions:dragonbone_block_mixed>, <ore:ingotFinallium>, <additions:dragonbone_block_mixed>, <additions:dragonbone_block_mixed>, <gct_ores:shalloite_block>], 
	[null, <additions:dragonbone_block_mixed>, <gct_ores:shalloite_block>, <ore:stoneOrdered>, <gct_ores:shalloite_block>, <additions:dragonbone_block_mixed>, null], 
	[<ore:ingotOrderedMetal>, <ore:ingotFinallium>, <ore:stoneOrdered>, <additions:dragonbone_block_mixed>, <ore:stoneOrdered>, <ore:ingotFinallium>, <ore:ingotOrderedMetal>], 
	[null, <additions:dragonbone_block_mixed>, <gct_ores:shalloite_block>, <ore:stoneOrdered>, <gct_ores:shalloite_block>, <additions:dragonbone_block_mixed>, null], 
	[<gct_ores:shalloite_block>, <additions:dragonbone_block_mixed>, <additions:dragonbone_block_mixed>, <ore:ingotFinallium>, <additions:dragonbone_block_mixed>, <additions:dragonbone_block_mixed>, <gct_ores:shalloite_block>], 
	[<gct_ores:shalloite_block>, <gct_ores:shalloite_block>, null, <ore:ingotOrderedMetal>, null, <gct_ores:shalloite_block>, <gct_ores:shalloite_block>]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:order_wand>, [
	[null, null, <ore:ingotStarAlloy>, <ore:ingotStarAlloy>, null, null, <ore:ingotStarAlloy>], 
	[null, null, null, null, <ore:coreEpic>, <ore:ingotPruified>, null], 
	[null, null, null, null, <ore:ingotArimite>, <ore:coreOrdered>, <ore:ingotStarAlloy>], 
	[null, null, <ore:blockPhotonium>, <ore:ingotStarAlloy>, null, null, <ore:ingotStarAlloy>], 
	[null, <additions:matter_block>, <ore:stoneOrdered>, <ore:blockShadowium>, null, <ore:ingotStarAlloy>, null], 
	[null, <ore:blockPhotonium>, <additions:matter_block>, null, null, null, null], 
	[<ore:blockPhotonium>, null, null, null, null, null, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockmepatternmirrorimage>, [
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockModularium>, <ore:ingotBalancedMatrix>, <ore:blockModularium>, <ore:blockModularium>, <ore:blockModularium>], 
	[<ore:blockModularium>, <appliedenergistics2:material:52>, <appliedenergistics2:material:52>, <crazyae:fluixilized_block>, <appliedenergistics2:material:52>, <appliedenergistics2:material:52>, <ore:blockModularium>], 
	[<ore:blockModularium>, <appliedenergistics2:material:52>, <crazyae:fluixilized_block>, <ore:ingotIvorium>, <crazyae:fluixilized_block>, <appliedenergistics2:material:52>, <ore:blockModularium>], 
	[<ore:ingotBalancedMatrix>, <crazyae:fluixilized_block>, <ore:ingotIvorium>, <ore:ingotScientificite>, <ore:ingotIvorium>, <crazyae:fluixilized_block>, <ore:ingotBalancedMatrix>], 
	[<ore:blockModularium>, <appliedenergistics2:material:52>, <crazyae:fluixilized_block>, <ore:ingotIvorium>, <crazyae:fluixilized_block>, <appliedenergistics2:material:52>, <ore:blockModularium>], 
	[<ore:blockModularium>, <appliedenergistics2:material:52>, <appliedenergistics2:material:52>, <crazyae:fluixilized_block>, <appliedenergistics2:material:52>, <appliedenergistics2:material:52>, <ore:blockModularium>], 
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockModularium>, <ore:ingotBalancedMatrix>, <ore:blockModularium>, <ore:blockModularium>, <ore:blockModularium>]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:eye_of_rules>, [
	[null, null, <ore:ingotCosmilite>, <ore:ingotCosmilite>, <ore:ingotCosmilite>, null, null], 
	[null, <ore:ingotCosmilite>, <ore:ingotFinallium>, <ore:scaleDragonOrder>, <ore:scaleDragonOrder>, <ore:ingotCosmilite>, null], 
	[<ore:ingotCosmilite>, <ore:ingotFinallium>, <abyssalcraft:eoa>, <ore:ingotFinallium>, <ore:scaleDragonOrder>, <ore:scaleDragonOrder>, <ore:ingotCosmilite>], 
	[<ore:ingotCosmilite>, <ore:scaleDragonOrder>, <ore:ingotFinallium>, <ore:scaleDragonOrder>, <ore:scaleDragonOrder>, <ore:scaleDragonOrder>, <ore:ingotCosmilite>], 
	[<ore:ingotCosmilite>, <ore:scaleDragonOrder>, <ore:scaleDragonOrder>, <ore:scaleDragonOrder>, <ore:scaleDragonOrder>, <ore:scaleDragonOrder>, <ore:ingotCosmilite>], 
	[null, <ore:ingotCosmilite>, <ore:scaleDragonOrder>, <ore:scaleDragonOrder>, <ore:scaleDragonOrder>, <ore:ingotCosmilite>, null], 
	[null, null, <ore:ingotCosmilite>, <ore:ingotCosmilite>, <ore:ingotCosmilite>, null, null]
]);