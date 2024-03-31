#priority 3000

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import mods.avaritia.ExtremeCrafting;
import mods.avaritia.Compressor;
import mods.ctintegration.util.RecipePattern;
import mods.extendedcrafting.TableCrafting;

TableCrafting.addShaped(0, <denseneutroncollectors:compressed_neutron_collector>, [
	[null, null, <ore:ingotCoalescenceMatrix>, null, null], 
	[null, <ore:ingotIron>, <avaritia:resource:2>, <ore:ingotIron>, null], 
	[<ore:ingotCoalescenceMatrix>, <avaritia:resource:2>, <avaritia:neutron_collector>, <avaritia:resource:2>, <ore:ingotCoalescenceMatrix>], 
	[null, <ore:ingotIron>, <avaritia:resource:2>, <ore:ingotIron>, null], 
	[null, null, <ore:ingotCoalescenceMatrix>, null, null]
]);
recipes.remove(<cyclicmagic:tool_mount_inverse>);
mods.extendedcrafting.TableCrafting.addShaped(0, <cyclicmagic:tool_mount_inverse>, [
	[<ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>, <minecraft:lead>, null], 
	[<ore:ingotIron>, <ore:ingotIron>, null, null, <minecraft:lead>], 
	[null, null, null, <minecraft:lead>, null], 
	[null, null, <ore:itemLeather>, <minecraft:lead>, <ore:itemLeather>], 
	[null, null, <ore:itemLeather>, <ore:itemLeather>, null]
]);
mods.extendedcrafting.TableCrafting.addShapeless(0, <gct_mobs:primordial_stone> * 24, [<thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <ore:nuggetPrimordial>]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mobs:primordial_vis_receiver>, [
	[null, null, <ore:nuggetAdaminite>, null, null], 
	[null, <ore:nuggetAdaminite>, <ore:ingotPrimordial>, <ore:nuggetAdaminite>, null], 
	[<gct_mobs:primordial_stone>, null, <ore:nuggetAdaminite>, null, <gct_mobs:primordial_stone>], 
	[<gct_mobs:primordial_stone>, <gct_mobs:primordial_stone>, <gct_mobs:primordial_stone>, <gct_mobs:primordial_stone>, <gct_mobs:primordial_stone>], 
	[<gct_mobs:primordial_stone>, <gct_mobs:primordial_stone>, <gct_mobs:primordial_stone>, <gct_mobs:primordial_stone>, <gct_mobs:primordial_stone>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mobs:arcane_vis_receiver>, [
	[null, null, <ore:nuggetMithrillium>, null, null], 
	[null, <ore:nuggetMithrillium>, <ore:ingotVoid>, <ore:nuggetMithrillium>, null], 
	[<thaumcraft:stone_arcane>, null, <ore:nuggetMithrillium>, null, <thaumcraft:stone_arcane>], 
	[<thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>], 
	[<thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mobs:primordial_portal_holder_down>, [
	[<gct_mobs:primordial_stone>, <gct_mobs:primordial_stone>, <gct_mobs:primordial_stone>, <gct_mobs:primordial_stone>, <gct_mobs:primordial_stone>], 
	[<gct_mobs:primordial_stone>, <ore:ingotPrimordial>, null, <ore:ingotPrimordial>, <gct_mobs:primordial_stone>], 
	[<ore:ingotPrimordial>, null, null, null, <ore:ingotPrimordial>], 
	[null, null, null, null, null], 
	[null, null, null, null, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mobs:primordial_portal_holder_up>, [
	[null, null, null, null, null], 
	[null, null, null, null, null], 
	[<ore:ingotPrimordial>, null, null, null, <ore:ingotPrimordial>], 
	[<gct_mobs:primordial_stone>, <ore:ingotPrimordial>, null, <ore:ingotPrimordial>, <gct_mobs:primordial_stone>], 
	[<gct_mobs:primordial_stone>, <gct_mobs:primordial_stone>, <gct_mobs:primordial_stone>, <gct_mobs:primordial_stone>, <gct_mobs:primordial_stone>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_aby:essenceofdarkerrealm>, [
	[null, <ore:ingotSanite>, <gct_aby:shoggothtancale>, <ore:ingotSanite>, null], 
	[<ore:ingotSanite>, <gct_aby:shoggothtancale>, <ore:nuclearShadow>, <gct_aby:shoggothtancale>, <ore:ingotSanite>], 
	[<gct_aby:shoggothtancale>, <ore:nuclearShadow>, <ore:stoneDarkDense>, <ore:nuclearShadow>, <gct_aby:shoggothtancale>], 
	[<ore:ingotSanite>, <gct_aby:shoggothtancale>, <ore:nuclearShadow>, <gct_aby:shoggothtancale>, <ore:ingotSanite>], 
	[null, <ore:ingotSanite>, <gct_aby:shoggothtancale>, <ore:ingotSanite>, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_aby:keyofdark>, [
	[<gct_aby:essenceofdarkrealm>, null, null, <abyssalcraft:oc>, null], 
	[null, <gct_aby:essenceofdarkrealm>, <abyssalcraft:oc>, <abyssalcraft:soulreaper>, <abyssalcraft:oc>], 
	[null, null, <gct_aby:essenceofdarkrealm>, <abyssalcraft:oc>, null], 
	[null, <ore:blockEthaxium>, null, <gct_aby:essenceofdarkrealm>, null], 
	[<ore:blockEthaxium>, null, null, null, <gct_aby:essenceofdarkrealm>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_aby:essenceofdarkrealm>, [
	[null, <ore:gemShadow>, <ore:gemShadow>, <ore:gemShadow>, null], 
	[<ore:gemShadow>, <ore:gemShadow>, <ore:gemShadow>, <ore:gemShadow>, <ore:gemShadow>], 
	[<ore:gemShadow>, <ore:gemShadow>, <ore:gemShadow>, <ore:gemShadow>, <ore:gemShadow>], 
	[<ore:gemShadow>, <ore:gemShadow>, <ore:gemShadow>, <ore:gemShadow>, <ore:gemShadow>], 
	[null, <ore:gemShadow>, <ore:gemShadow>, <ore:gemShadow>, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_aby:sanity_altar>, [
	[<ore:ingotSanite>, null, null, null, <ore:ingotSanite>], 
	[<abyssalcraft:darkstone_brick>, <ore:ingotSanite>, <ore:ingotCthulhurite>, <ore:ingotSanite>, <abyssalcraft:darkstone_brick>], 
	[null, <ore:gemShadow>, <ore:blockSanite>, <ore:gemShadow>, null], 
	[null, null, <abyssalcraft:darkstone_brick>, null, null], 
	[null, null, <ore:gemShadow>, null, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <journey:heartlrg>, [
	[<scalinghealth:heartcontainer>, null, null, null, <scalinghealth:heartcontainer>], 
	[<scalinghealth:heartcontainer>, <scalinghealth:heartcontainer>, <scalinghealth:heartcontainer>, <scalinghealth:heartcontainer>, <scalinghealth:heartcontainer>], 
	[<scalinghealth:heartcontainer>, <ore:ingotBoundMetal>, <journey:heartmed>, <ore:ingotBoundMetal>, <scalinghealth:heartcontainer>], 
	[null, <scalinghealth:heartcontainer>, <ore:ingotBoundMetal>, <scalinghealth:heartcontainer>, null], 
	[null, null, <scalinghealth:heartcontainer>, null, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <journey:heartult>, [
	[<cyclicmagic:heart_food>, null, null, null, <cyclicmagic:heart_food>], 
	[<cyclicmagic:heart_food>, <cyclicmagic:heart_food>, <cyclicmagic:heart_food>, <cyclicmagic:heart_food>, <cyclicmagic:heart_food>], 
	[<cyclicmagic:heart_food>, <ore:ingotCrimsonite>, <journey:heartlrg>, <ore:ingotCrimsonite>, <cyclicmagic:heart_food>], 
	[null, <cyclicmagic:heart_food>, <ore:ingotCrimsonite>, <cyclicmagic:heart_food>, null], 
	[null, null, <cyclicmagic:heart_food>, null, null]
]);
mods.extendedcrafting.TableCrafting.addShapeless(0, <gct_ores:rainboquartz> * 24, [<ore:gemQuartz>, <ore:gemQuartz>, <ore:gemQuartz>, <ore:gemQuartz>, <ore:gemQuartz>, <ore:gemQuartz>, <ore:gemQuartz>, <ore:gemQuartz>, <ore:gemQuartz>, <ore:gemQuartz>, <ore:gemQuartz>, <ore:gemQuartz>, <ore:gemQuartz>, <ore:gemQuartz>, <ore:gemQuartz>, <ore:gemQuartz>, <ore:gemQuartz>, <ore:gemQuartz>, <ore:gemQuartz>, <ore:gemQuartz>, <ore:gemQuartz>, <ore:gemQuartz>, <ore:gemQuartz>, <ore:gemQuartz>, <ore:nuggetChromasteel>]);//虚空世界传送门
mods.extendedcrafting.TableCrafting.addShaped(0, <utilityworlds:portal_void>, [
	[null, null, null, null, null], 
	[null, <ore:coreAwakened>, null, <ore:coreAwakened>, null], 
	[<ore:blockRedstone>, <ore:blockRedstone>, <minecraft:enchanting_table>, <ore:blockRedstone>, <ore:blockRedstone>], 
	[<ore:obsidian>, <ore:blockRedstone>, <ore:blockRedstone>, <ore:blockRedstone>, <ore:obsidian>], 
	[<ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <utilityworlds:portal_garden>, [
	[null, null, null, null, null], 
	[null, <ore:coreAwakened>, null, <ore:coreAwakened>, null], 
	[<ore:blockEmerald>, <ore:blockEmerald>, <minecraft:enchanting_table>, <ore:blockEmerald>, <ore:blockEmerald>], 
	[<ore:obsidian>, <ore:blockEmerald>, <ore:blockEmerald>, <ore:blockEmerald>, <ore:obsidian>], 
	[<ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <journey:heartsen>, [
	[null, null, <ore:ingotDullium>, null, null], 
	[null, <ore:ingotDullium>, <ore:ingotDullium>, <ore:ingotDullium>, null], 
	[<ore:ingotDullium>, <ore:ingotDullium>, <journey:heartult>, <ore:ingotDullium>, <ore:ingotDullium>], 
	[null, <ore:ingotDullium>, <ore:ingotDullium>, <ore:ingotDullium>, null], 
	[null, null, <ore:ingotDullium>, null, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <additions:taigaddon-heaven_gem>, [
	[null, null, <ore:shardHeavengem1>, null, null], 
	[null, null, <ore:ingotDaynight>, null, null], 
	[null, <ore:ingotDaynight>, <ore:ingotDaynight>, <ore:ingotDaynight>, null], 
	[null, null, <ore:ingotDaynight>, null, null], 
	[null, null, <ore:shardHeavengem2>, null, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <additions:greedycraft-everbright_gem>, [
	[null, null, <blue_skies:diopside_block>, null, null], 
	[null, <blue_skies:lunar_stone>, <blue_skies:moonstone>, <blue_skies:lunar_stone>, null], 
	[<blue_skies:turquoise_block>, <blue_skies:moonstone>, <extendedcrafting:material:40>, <blue_skies:moonstone>, <blue_skies:pyrope_block>], 
	[null, <blue_skies:lunar_stone>, <blue_skies:moonstone>, <blue_skies:lunar_stone>, null], 
	[null, null, <blue_skies:charoite_block>, null, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <additions:greedycraft-everdawn_gem>, [
	[null, null, <blue_skies:diopside_block>, null, null], 
	[null, <blue_skies:lunar_stone>, <blue_skies:moonstone>, <blue_skies:lunar_stone>, null], 
	[<blue_skies:turquoise_block>, <blue_skies:moonstone>, <minecraft:nether_star>, <blue_skies:moonstone>, <blue_skies:pyrope_block>], 
	[null, <blue_skies:lunar_stone>, <blue_skies:moonstone>, <blue_skies:lunar_stone>, null], 
	[null, null, <blue_skies:charoite_block>, null, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mobs:everheaven>, [
	[<extendedcrafting:material:48>, <ore:ingotUmbrium>, <extendedcrafting:material:48>, <ore:ingotUmbrium>, <extendedcrafting:material:48>], 
	[<ore:ingotUmbrium>, <ore:ingotDaynight>, <ore:ingotDaynight>, <ore:ingotDaynight>, <ore:ingotUmbrium>], 
	[<extendedcrafting:material:48>, <ore:ingotDaynight>, <ore:gemHeaven>, <ore:ingotDaynight>, <extendedcrafting:material:48>], 
	[<ore:ingotUmbrium>, <ore:ingotDaynight>, <ore:ingotDaynight>, <ore:ingotDaynight>, <ore:ingotUmbrium>], 
	[<extendedcrafting:material:48>, <ore:ingotUmbrium>, <extendedcrafting:material:48>, <ore:ingotUmbrium>, <extendedcrafting:material:48>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mac:atomic_viberator>, [
	[<ore:ingotNeutronium>, <ore:alloyUltimate>, <ore:alloyUltimate>, <ore:alloyUltimate>, <ore:ingotNeutronium>], 
	[<ore:alloyUltimate>, <ore:platePorpezite>, <extendedcrafting:material:2>, <ore:platePorpezite>, <ore:alloyUltimate>], 
	[<ore:alloyUltimate>, <extendedcrafting:material:2>, <ore:circuitFinal>, <extendedcrafting:material:2>, <ore:alloyUltimate>], 
	[<ore:alloyUltimate>, <ore:platePorpezite>, <extendedcrafting:material:2>, <ore:platePorpezite>, <ore:alloyUltimate>], 
	[<ore:ingotNeutronium>, <ore:alloyUltimate>, <ore:alloyUltimate>, <ore:alloyUltimate>, <ore:ingotNeutronium>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mac:atomic_decayer>, [
	[<ore:ingotElectronium>, <ore:sheetHDPE>, <ore:alloyUltimate>, <ore:sheetHDPE>, <ore:ingotElectronium>], 
	[<ore:sheetHDPE>, <ore:platePorpezite>, <ore:ingotNucleum>, <ore:platePorpezite>, <ore:sheetHDPE>], 
	[<ore:alloyUltimate>, <ore:circuitUltimate>, <ore:alloyFinal>, <ore:circuitUltimate>, <ore:alloyUltimate>], 
	[<ore:sheetHDPE>, <ore:platePorpezite>, <ore:ingotNucleum>, <ore:platePorpezite>, <ore:sheetHDPE>], 
	[<ore:ingotElectronium>, <ore:sheetHDPE>, <ore:alloyUltimate>, <ore:sheetHDPE>, <ore:ingotElectronium>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mac:atomic_acider>, [
	[<ore:ingotProtonium>, <ore:sheetHDPE>, <ore:alloyUltimate>, <ore:sheetHDPE>, <ore:ingotProtonium>], 
	[<ore:sheetHDPE>, <ore:platePorpezite>, <ore:circuitUltimate>, <ore:platePorpezite>, <ore:sheetHDPE>], 
	[<ore:alloyUltimate>, <ore:circuitFinal>, <minecraft:bucket>, <ore:circuitFinal>, <ore:alloyUltimate>], 
	[<ore:sheetHDPE>, <ore:platePorpezite>, <ore:circuitUltimate>, <ore:platePorpezite>, <ore:sheetHDPE>], 
	[<ore:ingotProtonium>, <ore:sheetHDPE>, <ore:alloyUltimate>, <ore:sheetHDPE>, <ore:ingotProtonium>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mobs:rune_active_1>, [
	[null, <ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustPhotonium>, null], 
	[<ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustElfsteel>, <ore:dustShadowium>, <ore:dustPhotonium>], 
	[<ore:dustShadowium>, <ore:dustElfsteel>, <ore:runeMetatronB>, <ore:dustElfsteel>, <ore:dustShadowium>], 
	[<ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustElfsteel>, <ore:dustShadowium>, <ore:dustPhotonium>], 
	[null, <ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustPhotonium>, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mobs:rune_active_2>, [
	[null, <ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustPhotonium>, null], 
	[<ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustElfsteel>, <ore:dustShadowium>, <ore:dustPhotonium>], 
	[<ore:dustShadowium>, <ore:dustElfsteel>, <ore:runeRatzielB>, <ore:dustElfsteel>, <ore:dustShadowium>], 
	[<ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustElfsteel>, <ore:dustShadowium>, <ore:dustPhotonium>], 
	[null, <ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustPhotonium>, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mobs:rune_active_3>, [
	[null, <ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustPhotonium>, null], 
	[<ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustElfsteel>, <ore:dustShadowium>, <ore:dustPhotonium>], 
	[<ore:dustShadowium>, <ore:dustElfsteel>, <ore:runeZaphkielB>, <ore:dustElfsteel>, <ore:dustShadowium>], 
	[<ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustElfsteel>, <ore:dustShadowium>, <ore:dustPhotonium>], 
	[null, <ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustPhotonium>, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mobs:rune_active_4>, [
	[null, <ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustPhotonium>, null], 
	[<ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustElfsteel>, <ore:dustShadowium>, <ore:dustPhotonium>], 
	[<ore:dustShadowium>, <ore:dustElfsteel>, <ore:runeZadkielB>, <ore:dustElfsteel>, <ore:dustShadowium>], 
	[<ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustElfsteel>, <ore:dustShadowium>, <ore:dustPhotonium>], 
	[null, <ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustPhotonium>, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mobs:rune_active_5>, [
	[null, <ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustPhotonium>, null], 
	[<ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustElfsteel>, <ore:dustShadowium>, <ore:dustPhotonium>], 
	[<ore:dustShadowium>, <ore:dustElfsteel>, <ore:runeChamaelB>, <ore:dustElfsteel>, <ore:dustShadowium>], 
	[<ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustElfsteel>, <ore:dustShadowium>, <ore:dustPhotonium>], 
	[null, <ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustPhotonium>, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mobs:rune_active_6>, [
	[null, <ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustPhotonium>, null], 
	[<ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustElfsteel>, <ore:dustShadowium>, <ore:dustPhotonium>], 
	[<ore:dustShadowium>, <ore:dustElfsteel>, <ore:runeMichaelB>, <ore:dustElfsteel>, <ore:dustShadowium>], 
	[<ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustElfsteel>, <ore:dustShadowium>, <ore:dustPhotonium>], 
	[null, <ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustPhotonium>, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mobs:rune_active_7>, [
	[null, <ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustPhotonium>, null], 
	[<ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustElfsteel>, <ore:dustShadowium>, <ore:dustPhotonium>], 
	[<ore:dustShadowium>, <ore:dustElfsteel>, <ore:runeHanielB>, <ore:dustElfsteel>, <ore:dustShadowium>], 
	[<ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustElfsteel>, <ore:dustShadowium>, <ore:dustPhotonium>], 
	[null, <ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustPhotonium>, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mobs:rune_active_8>, [
	[null, <ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustPhotonium>, null], 
	[<ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustElfsteel>, <ore:dustShadowium>, <ore:dustPhotonium>], 
	[<ore:dustShadowium>, <ore:dustElfsteel>, <ore:runeRaphaelB>, <ore:dustElfsteel>, <ore:dustShadowium>], 
	[<ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustElfsteel>, <ore:dustShadowium>, <ore:dustPhotonium>], 
	[null, <ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustPhotonium>, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mobs:rune_active_9>, [
	[null, <ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustPhotonium>, null], 
	[<ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustElfsteel>, <ore:dustShadowium>, <ore:dustPhotonium>], 
	[<ore:dustShadowium>, <ore:dustElfsteel>, <ore:runeGabrielB>, <ore:dustElfsteel>, <ore:dustShadowium>], 
	[<ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustElfsteel>, <ore:dustShadowium>, <ore:dustPhotonium>], 
	[null, <ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustPhotonium>, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mobs:rune_active_10>, [
	[null, <ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustPhotonium>, null], 
	[<ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustElfsteel>, <ore:dustShadowium>, <ore:dustPhotonium>], 
	[<ore:dustShadowium>, <ore:dustElfsteel>, <ore:runeSandalphonB>, <ore:dustElfsteel>, <ore:dustShadowium>], 
	[<ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustElfsteel>, <ore:dustShadowium>, <ore:dustPhotonium>], 
	[null, <ore:dustPhotonium>, <ore:dustShadowium>, <ore:dustPhotonium>, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mobs:naturalline>, [
	[<gct_mobs:naturalline_scrap>, <gct_mobs:naturalline_scrap>, <gct_mobs:naturalline_scrap>, <gct_mobs:naturalline_scrap>, <gct_mobs:naturalline_scrap>], 
	[<gct_mobs:naturalline_scrap>, <gct_mobs:naturalline_scrap>, <gct_mobs:naturalline_scrap>, <gct_mobs:naturalline_scrap>, <gct_mobs:naturalline_scrap>], 
	[<gct_mobs:naturalline_scrap>, <gct_mobs:naturalline_scrap>, <gct_mobs:naturalline_scrap>, <gct_mobs:naturalline_scrap>, <gct_mobs:naturalline_scrap>], 
	[<gct_mobs:naturalline_scrap>, <gct_mobs:naturalline_scrap>, <gct_mobs:naturalline_scrap>, <gct_mobs:naturalline_scrap>, <gct_mobs:naturalline_scrap>], 
	[<gct_mobs:naturalline_scrap>, <gct_mobs:naturalline_scrap>, <gct_mobs:naturalline_scrap>, <gct_mobs:naturalline_scrap>, <gct_mobs:naturalline_scrap>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 25}]}), [
	[null, <ore:blockEverite>, <ore:blockEverite>, <ore:blockEverite>, <ore:blockEverite>],
	[<ore:blockEverite>, <minecraft:leather>, <minecraft:leather>, <minecraft:leather>, <ore:blockEverite>],
	[<ore:blockEverite>, <minecraft:leather>, <ore:coreCommand>, <minecraft:leather>, <ore:blockEverite>],
	[<ore:blockEverite>, <minecraft:leather>, <minecraft:leather>, <minecraft:leather>, <ore:blockEverite>],
	[<ore:blockEverite>, <ore:blockEverite>, <ore:blockEverite>, <ore:blockEverite>, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <naturalpledge:holy_symbol>, [
	[null, <ore:ingotBotanical>, <ore:ingotBotanical>, <ore:ingotBotanical>, null], 
	[<ore:ingotBotanical>, <ore:manaString>, <ore:ingotBotanical>, <ore:manaString>, <ore:ingotBotanical>], 
	[null, <ore:ingotOrichalcosReversed>, null, <ore:ingotBotanical>, null], 
	[<ore:ingotOrichalcosReversed>, <gct_mobs:kabalah_ring_aur>, <ore:ingotOrichalcosReversed>, null, null], 
	[null, <ore:ingotOrichalcosReversed>, null, null, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <additions:greedycraft-sanite_ethaxium_capsule> * 16, [
	[null, null, null, null, null], 
	[null, <ore:ingotSanite>, <ore:ingotEthaxium>, <ore:ingotEthaxium>, null], 
	[<ore:ingotSanite>, <ore:ingotEthaxium>, <ore:ingotEthaxium>, <ore:ingotEthaxium>, <ore:ingotEthaxium>], 
	[null, <ore:ingotSanite>, <ore:ingotEthaxium>, <ore:ingotEthaxium>, null], 
	[null, null, null, null, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_aby:essence_of_warped_ruin>, [
	[null, <gct_aby:warped_soul>, <gct_aby:warped_soul>, <gct_aby:warped_soul>, null], 
	[<gct_aby:warped_soul>, <ore:ingotAzathothium>, <ore:stoneAbyssExtended>, <ore:ingotNyarlathotepium>, <gct_aby:warped_soul>], 
	[<gct_aby:warped_soul>, <ore:stoneAbyssExtended>, <ore:stoneAbyssExtended>, <ore:stoneAbyssExtended>, <gct_aby:warped_soul>], 
	[<gct_aby:warped_soul>, <ore:ingotYogsothoth>, <ore:stoneAbyssExtended>, <ore:ingotShubniggurath>, <gct_aby:warped_soul>], 
	[null, <gct_aby:warped_soul>, <gct_aby:warped_soul>, <gct_aby:warped_soul>, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mac:mana_reactor>, [
	[<ore:ingotDurasteel>, <ore:ingotDurasteel>, <ore:ingotMythsteel>, <ore:ingotDurasteel>, <ore:ingotDurasteel>], 
	[<ore:ingotDurasteel>, <botania:pool:3>, <ore:circuitFinal>, <botania:pool:3>, <ore:ingotDurasteel>], 
	[<ore:ingotMythsteel>, <ore:ingotUranium>, <ore:ingotOrichalcos>, <ore:ingotUranium>, <ore:ingotMythsteel>], 
	[<ore:ingotDurasteel>, <botania:pool:3>, <ore:circuitFinal>, <botania:pool:3>, <ore:ingotDurasteel>], 
	[<ore:ingotDurasteel>, <ore:ingotDurasteel>, <ore:ingotMythsteel>, <ore:ingotDurasteel>, <ore:ingotDurasteel>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <gct_mac:pe_collector>, [
	[<abyssalcraft:darkethaxiumbrick>, <ore:ingotSanite>, <ore:ingotCthulhurite>, <ore:ingotSanite>, <abyssalcraft:darkethaxiumbrick>], 
	[<abyssalcraft:darkethaxiumbrick>, <ore:ingotSanite>, <ore:ingotSanite>, <ore:ingotSanite>, <abyssalcraft:darkethaxiumbrick>], 
	[<abyssalcraft:darkethaxiumbrick>, <abyssalcraft:darkethaxiumbrick>, <abyssalcraft:darkethaxiumbrick>, <abyssalcraft:darkethaxiumbrick>, <abyssalcraft:darkethaxiumbrick>], 
	[<abyssalcraft:darkethaxiumbrick>, <ore:ingotSanite>, <ore:ingotSanite>, <ore:ingotSanite>, <abyssalcraft:darkethaxiumbrick>], 
	[<abyssalcraft:darkethaxiumbrick>, <ore:ingotSanite>, <ore:ingotChromasteel>, <ore:ingotSanite>, <abyssalcraft:darkethaxiumbrick>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockparallelcontroller>, [
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>], 
	[<ore:blockModularium>, <modularmachinery:blockcontroller>, <ore:ingotSteel>, <modularmachinery:blockcontroller>, <ore:blockModularium>], 
	[<ore:blockRedstone>, <ore:ingotSteel>, <modularmachinery:blockcontroller>, <ore:ingotSteel>, <ore:blockRedstone>], 
	[<ore:blockModularium>, <modularmachinery:blockcontroller>, <ore:ingotSteel>, <modularmachinery:blockcontroller>, <ore:blockModularium>], 
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockparallelcontroller:1>, [
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>], 
	[<ore:blockModularium>, <modularmachinery:blockparallelcontroller>, <ore:ingotDurasteel>, <modularmachinery:blockparallelcontroller>, <ore:blockModularium>], 
	[<ore:blockRedstone>, <ore:ingotDurasteel>, <modularmachinery:blockcontroller>, <ore:ingotDurasteel>, <ore:blockRedstone>], 
	[<ore:blockModularium>, <modularmachinery:blockparallelcontroller>, <ore:ingotDurasteel>, <modularmachinery:blockparallelcontroller>, <ore:blockModularium>], 
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockparallelcontroller:2>, [
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>], 
	[<ore:blockModularium>, <modularmachinery:blockparallelcontroller:1>, <ore:ingotChromasteel>, <modularmachinery:blockparallelcontroller:1>, <ore:blockModularium>], 
	[<ore:blockRedstone>, <ore:ingotChromasteel>, <modularmachinery:blockcontroller>, <ore:ingotChromasteel>, <ore:blockRedstone>], 
	[<ore:blockModularium>, <modularmachinery:blockparallelcontroller:1>, <ore:ingotChromasteel>, <modularmachinery:blockparallelcontroller:1>, <ore:blockModularium>], 
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockparallelcontroller:3>, [
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>], 
	[<ore:blockModularium>, <modularmachinery:blockparallelcontroller:2>, <ore:ingotFinallium>, <modularmachinery:blockparallelcontroller:2>, <ore:blockModularium>], 
	[<ore:blockRedstone>, <ore:ingotFinallium>, <modularmachinery:blockcontroller>, <ore:ingotFinallium>, <ore:blockRedstone>], 
	[<ore:blockModularium>, <modularmachinery:blockparallelcontroller:2>, <ore:ingotFinallium>, <modularmachinery:blockparallelcontroller:2>, <ore:blockModularium>], 
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockparallelcontroller:4>, [
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>], 
	[<ore:blockModularium>, <modularmachinery:blockparallelcontroller:3>, <ore:ingotElementine>, <modularmachinery:blockparallelcontroller:3>, <ore:blockModularium>], 
	[<ore:blockRedstone>, <ore:ingotElementine>, <modularmachinery:blockcontroller>, <ore:ingotElementine>, <ore:blockRedstone>], 
	[<ore:blockModularium>, <modularmachinery:blockparallelcontroller:3>, <ore:ingotElementine>, <modularmachinery:blockparallelcontroller:3>, <ore:blockModularium>], 
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>]
]);