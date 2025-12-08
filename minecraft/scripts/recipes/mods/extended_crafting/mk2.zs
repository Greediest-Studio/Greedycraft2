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
if (!isNull(itemUtils.getItem("utilityworlds:portal_void"))){
	mods.extendedcrafting.TableCrafting.addShaped(0, itemUtils.getItem("utilityworlds:portal_void"), [
		[null, null, null, null, null], 
		[null, <ore:coreAwakened>, null, <ore:coreAwakened>, null], 
		[<ore:blockRedstone>, <ore:blockRedstone>, <minecraft:enchanting_table>, <ore:blockRedstone>, <ore:blockRedstone>], 
		[<ore:obsidian>, <ore:blockRedstone>, <ore:blockRedstone>, <ore:blockRedstone>, <ore:obsidian>], 
		[<ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>]
	]);
	mods.extendedcrafting.TableCrafting.addShaped(0, itemUtils.getItem("utilityworlds:portal_garden"), [
		[null, null, null, null, null], 
		[null, <ore:coreAwakened>, null, <ore:coreAwakened>, null], 
		[<ore:blockEmerald>, <ore:blockEmerald>, <minecraft:enchanting_table>, <ore:blockEmerald>, <ore:blockEmerald>], 
		[<ore:obsidian>, <ore:blockEmerald>, <ore:blockEmerald>, <ore:blockEmerald>, <ore:obsidian>], 
		[<ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>, <ore:obsidian>]
	]);
}
mods.extendedcrafting.TableCrafting.addShaped(0, <journey:heartsen>, [
	[null, null, <ore:ingotDullium>, null, null], 
	[null, <ore:ingotDullium>, <ore:ingotDullium>, <ore:ingotDullium>, null], 
	[<ore:ingotDullium>, <ore:ingotDullium>, <journey:heartult>, <ore:ingotDullium>, <ore:ingotDullium>], 
	[null, <ore:ingotDullium>, <ore:ingotDullium>, <ore:ingotDullium>, null], 
	[null, null, <ore:ingotDullium>, null, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <additions:heaven_gem>, [
	[null, null, <ore:shardHeavengem1>, null, null], 
	[null, null, <ore:ingotDaynight>, null, null], 
	[null, <ore:ingotDaynight>, <ore:ingotDaynight>, <ore:ingotDaynight>, null], 
	[null, null, <ore:ingotDaynight>, null, null], 
	[null, null, <ore:shardHeavengem2>, null, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <additions:everbright_gem>, [
	[null, null, <blue_skies:diopside_block>, null, null], 
	[null, <blue_skies:lunar_stone>, <blue_skies:moonstone>, <blue_skies:lunar_stone>, null], 
	[<blue_skies:turquoise_block>, <blue_skies:moonstone>, <extendedcrafting:material:40>, <blue_skies:moonstone>, <blue_skies:pyrope_block>], 
	[null, <blue_skies:lunar_stone>, <blue_skies:moonstone>, <blue_skies:lunar_stone>, null], 
	[null, null, <blue_skies:charoite_block>, null, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <additions:everdawn_gem>, [
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
mods.extendedcrafting.TableCrafting.addShaped(0, <additions:sanite_ethaxium_capsule> * 16, [
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
mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockparallelcontroller:5>, [
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>], 
	[<ore:blockModularium>, <modularmachinery:blockparallelcontroller>, <ore:ingotStainlessSteel>, <modularmachinery:blockparallelcontroller>, <ore:blockModularium>], 
	[<ore:blockRedstone>, <ore:ingotStainlessSteel>, <modularmachinery:blockcontroller>, <ore:ingotStainlessSteel>, <ore:blockRedstone>], 
	[<ore:blockModularium>, <modularmachinery:blockcontroller>, <ore:ingotStainlessSteel>, <modularmachinery:blockcontroller>, <ore:blockModularium>], 
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockparallelcontroller:1>, [
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>], 
	[<ore:blockModularium>, <modularmachinery:blockparallelcontroller:5>, <ore:ingotDurasteel>, <modularmachinery:blockparallelcontroller:5>, <ore:blockModularium>], 
	[<ore:blockRedstone>, <ore:ingotDurasteel>, <modularmachinery:blockcontroller>, <ore:ingotDurasteel>, <ore:blockRedstone>], 
	[<ore:blockModularium>, <modularmachinery:blockcontroller>, <ore:ingotDurasteel>, <modularmachinery:blockcontroller>, <ore:blockModularium>], 
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockparallelcontroller:6>, [
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>], 
	[<ore:blockModularium>, <modularmachinery:blockparallelcontroller:1>, <ore:ingotAeonsteel>, <modularmachinery:blockparallelcontroller:1>, <ore:blockModularium>], 
	[<ore:blockRedstone>, <ore:ingotAeonsteel>, <modularmachinery:blockcontroller>, <ore:ingotAeonsteel>, <ore:blockRedstone>], 
	[<ore:blockModularium>, <modularmachinery:blockcontroller>, <ore:ingotAeonsteel>, <modularmachinery:blockcontroller>, <ore:blockModularium>], 
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockparallelcontroller:2>, [
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>], 
	[<ore:blockModularium>, <modularmachinery:blockparallelcontroller:6>, <ore:ingotChromasteel>, <modularmachinery:blockparallelcontroller:6>, <ore:blockModularium>], 
	[<ore:blockRedstone>, <ore:ingotChromasteel>, <modularmachinery:blockcontroller>, <ore:ingotChromasteel>, <ore:blockRedstone>], 
	[<ore:blockModularium>, <modularmachinery:blockcontroller>, <ore:ingotChromasteel>, <modularmachinery:blockcontroller>, <ore:blockModularium>], 
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockparallelcontroller:7>, [
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>], 
	[<ore:blockModularium>, <modularmachinery:blockparallelcontroller:2>, <ore:ingotCosmilite>, <modularmachinery:blockparallelcontroller:2>, <ore:blockModularium>], 
	[<ore:blockRedstone>, <ore:ingotCosmilite>, <modularmachinery:blockcontroller>, <ore:ingotCosmilite>, <ore:blockRedstone>], 
	[<ore:blockModularium>, <modularmachinery:blockcontroller>, <ore:ingotCosmilite>, <modularmachinery:blockcontroller>, <ore:blockModularium>], 
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockparallelcontroller:3>, [
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>], 
	[<ore:blockModularium>, <modularmachinery:blockparallelcontroller:7>, <ore:ingotFinallium>, <modularmachinery:blockparallelcontroller:7>, <ore:blockModularium>], 
	[<ore:blockRedstone>, <ore:ingotFinallium>, <modularmachinery:blockcontroller>, <ore:ingotFinallium>, <ore:blockRedstone>], 
	[<ore:blockModularium>, <modularmachinery:blockcontroller>, <ore:ingotFinallium>, <modularmachinery:blockcontroller>, <ore:blockModularium>], 
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockparallelcontroller:8>, [
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>], 
	[<ore:blockModularium>, <modularmachinery:blockparallelcontroller:3>, <ore:ingotWavite>, <modularmachinery:blockparallelcontroller:3>, <ore:blockModularium>], 
	[<ore:blockRedstone>, <ore:ingotWavite>, <modularmachinery:blockcontroller>, <ore:ingotWavite>, <ore:blockRedstone>], 
	[<ore:blockModularium>, <modularmachinery:blockcontroller>, <ore:ingotWavite>, <modularmachinery:blockcontroller>, <ore:blockModularium>], 
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockparallelcontroller:4>, [
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>], 
	[<ore:blockModularium>, <modularmachinery:blockparallelcontroller:8>, <ore:ingotElementine>, <modularmachinery:blockparallelcontroller:8>, <ore:blockModularium>], 
	[<ore:blockRedstone>, <ore:ingotElementine>, <modularmachinery:blockcontroller>, <ore:ingotElementine>, <ore:blockRedstone>], 
	[<ore:blockModularium>, <modularmachinery:blockcontroller>, <ore:ingotElementine>, <modularmachinery:blockcontroller>, <ore:blockModularium>], 
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>]
]);
mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockparallelcontroller:9>, [
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>], 
	[<ore:blockModularium>, <modularmachinery:blockparallelcontroller:4>, <ore:ingotGreed>, <modularmachinery:blockparallelcontroller:4>, <ore:blockModularium>], 
	[<ore:blockRedstone>, <ore:ingotGreed>, <modularmachinery:blockcontroller>, <ore:ingotGreed>, <ore:blockRedstone>], 
	[<ore:blockModularium>, <modularmachinery:blockcontroller>, <ore:ingotGreed>, <modularmachinery:blockcontroller>, <ore:blockModularium>], 
	[<ore:blockModularium>, <ore:blockModularium>, <ore:blockRedstone>, <ore:blockModularium>, <ore:blockModularium>]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:consciousness_brain_mk1>, [
	[null, <ore:rottenFlesh>, <ore:ingotScientificite>, <ore:rottenFlesh>, null], 
	[<ore:listAllmeatraw>, <gct_aby:ancient_shoggoth_mud>, <ore:heartContainer>, <gct_aby:ancient_shoggoth_mud>, <ore:listAllmeatraw>], 
	[<ore:listAllmeatraw>, <gct_aby:ancient_shoggoth_mud>, <thaumcraft:brain>, <gct_aby:ancient_shoggoth_mud>, <ore:listAllmeatraw>], 
	[<ore:listAllmeatraw>, <gct_aby:ancient_shoggoth_mud>, <ore:ingotFinallium>, <gct_aby:ancient_shoggoth_mud>, <ore:listAllmeatraw>], 
	[null, <ore:rottenFlesh>, <ore:ingotScientificite>, <ore:rottenFlesh>, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:ga_in_p2_press>, [
	[<ore:ingotOsgloglas>, <ore:ingotOsgloglas>, <ore:ingotOsgloglas>, <ore:ingotOsgloglas>, <ore:ingotOsgloglas>], 
	[<ore:ingotOsgloglas>, <crazyae:material:35>, <ore:ingotEugardite>, <crazyae:material:35>, <ore:ingotOsgloglas>], 
	[<ore:ingotOsgloglas>, <ore:ingotEugardite>, <additions:germanium_press>, <ore:ingotEugardite>, <ore:ingotOsgloglas>], 
	[<ore:ingotOsgloglas>, <crazyae:material:35>, <ore:ingotEugardite>, <crazyae:material:35>, <ore:ingotOsgloglas>], 
	[<ore:ingotOsgloglas>, <ore:ingotOsgloglas>, <ore:ingotOsgloglas>, <ore:ingotOsgloglas>, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:logic_press_3>, [
	[<ore:ingotOsgloglas>, <ore:ingotOsgloglas>, <ore:ingotOsgloglas>, <ore:ingotOsgloglas>, <ore:ingotOsgloglas>], 
	[<ore:ingotOsgloglas>, <crazyae:material:35>, <ore:ingotEugardite>, <crazyae:material:35>, <ore:ingotOsgloglas>], 
	[<ore:ingotOsgloglas>, <ore:ingotEugardite>, <additions:logic_press_2>, <ore:ingotEugardite>, <ore:ingotOsgloglas>], 
	[<ore:ingotOsgloglas>, <crazyae:material:35>, <ore:ingotEugardite>, <crazyae:material:35>, <ore:ingotOsgloglas>], 
	[<ore:ingotOsgloglas>, <ore:ingotOsgloglas>, <ore:ingotOsgloglas>, <ore:ingotOsgloglas>, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:engineering_press_3>, [
	[<ore:ingotOsgloglas>, <ore:ingotOsgloglas>, <ore:ingotOsgloglas>, <ore:ingotOsgloglas>, <ore:ingotOsgloglas>], 
	[<ore:ingotOsgloglas>, <crazyae:material:35>, <ore:ingotEugardite>, <crazyae:material:35>, <ore:ingotOsgloglas>], 
	[<ore:ingotOsgloglas>, <ore:ingotEugardite>, <additions:engineering_press_2>, <ore:ingotEugardite>, <ore:ingotOsgloglas>], 
	[<ore:ingotOsgloglas>, <crazyae:material:35>, <ore:ingotEugardite>, <crazyae:material:35>, <ore:ingotOsgloglas>], 
	[<ore:ingotOsgloglas>, <ore:ingotOsgloglas>, <ore:ingotOsgloglas>, <ore:ingotOsgloglas>, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:calculation_press_3>, [
	[<ore:ingotOsgloglas>, <ore:ingotOsgloglas>, <ore:ingotOsgloglas>, <ore:ingotOsgloglas>, <ore:ingotOsgloglas>], 
	[<ore:ingotOsgloglas>, <crazyae:material:35>, <ore:ingotEugardite>, <crazyae:material:35>, <ore:ingotOsgloglas>], 
	[<ore:ingotOsgloglas>, <ore:ingotEugardite>, <additions:calculation_press_2>, <ore:ingotEugardite>, <ore:ingotOsgloglas>], 
	[<ore:ingotOsgloglas>, <crazyae:material:35>, <ore:ingotEugardite>, <crazyae:material:35>, <ore:ingotOsgloglas>], 
	[<ore:ingotOsgloglas>, <ore:ingotOsgloglas>, <ore:ingotOsgloglas>, <ore:ingotOsgloglas>, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:blood_rune_economy>, [
	[<bloodmagic:blood_rune>, <bloodmagic:blood_rune>, <ore:ingotGhostMetal>, <bloodmagic:blood_rune>, <bloodmagic:blood_rune>], 
	[<bloodmagic:blood_rune>, <bloodmagic:blood_rune>, <ore:ingotDullium>, <bloodmagic:blood_rune>, <bloodmagic:blood_rune>], 
	[<ore:ingotGhostMetal>, <ore:ingotDullium>, <additions:slate_7>, <ore:ingotDullium>, <ore:ingotGhostMetal>], 
	[<bloodmagic:blood_rune>, <bloodmagic:blood_rune>, <ore:ingotDullium>, <bloodmagic:blood_rune>, <bloodmagic:blood_rune>], 
	[<bloodmagic:blood_rune>, <bloodmagic:blood_rune>, <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"}).reuse(), <bloodmagic:blood_rune>, <bloodmagic:blood_rune>]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:blood_rune_personal>, [
	[<bloodmagic:blood_rune>, <bloodmagic:blood_rune>, <ore:ingotOraclium>, <bloodmagic:blood_rune>, <bloodmagic:blood_rune>], 
	[<bloodmagic:blood_rune>, <bloodmagic:blood_rune>, <additions:city_defender_medal>, <bloodmagic:blood_rune>, <bloodmagic:blood_rune>], 
	[<ore:ingotOraclium>, <crazyae:material:35>, <additions:slate_7>, <crazyae:material:35>, <ore:ingotOraclium>], 
	[<bloodmagic:blood_rune>, <bloodmagic:blood_rune>, <appliedenergistics2:material:41>, <bloodmagic:blood_rune>, <bloodmagic:blood_rune>], 
	[<bloodmagic:blood_rune>, <bloodmagic:blood_rune>, <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"}).reuse(), <bloodmagic:blood_rune>, <bloodmagic:blood_rune>]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:blood_rune_purify>, [
	[<bloodmagic:blood_rune>, <bloodmagic:blood_rune>, <ore:ingotMana>, <bloodmagic:blood_rune>, <bloodmagic:blood_rune>], 
	[<bloodmagic:blood_rune>, <bloodmagic:blood_rune>, <ore:ingotCosmicNeutronium>, <bloodmagic:blood_rune>, <bloodmagic:blood_rune>], 
	[<ore:ingotMana>, <ore:ingotEthaxium>, <additions:slate_6>, <ore:ingotEthaxium>, <ore:ingotMana>], 
	[<bloodmagic:blood_rune>, <bloodmagic:blood_rune>, <ore:ingotEthaxium>, <bloodmagic:blood_rune>, <bloodmagic:blood_rune>], 
	[<bloodmagic:blood_rune>, <bloodmagic:blood_rune>, <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"}).reuse(), <bloodmagic:blood_rune>, <bloodmagic:blood_rune>]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:blood_rune_thread>, [
	[<bloodmagic:blood_rune>, <bloodmagic:blood_rune>, <ore:ingotDraconiumAwakened>, <bloodmagic:blood_rune>, <bloodmagic:blood_rune>], 
	[<bloodmagic:blood_rune>, <bloodmagic:blood_rune>, <modularmachinery:blockparallelcontroller:1>, <bloodmagic:blood_rune>, <bloodmagic:blood_rune>], 
	[<ore:ingotDraconiumAwakened>, <ore:blockModularium>, <additions:slate_6>, <ore:blockModularium>, <ore:ingotDraconiumAwakened>], 
	[<bloodmagic:blood_rune>, <bloodmagic:blood_rune>, <ore:blockModularium>, <bloodmagic:blood_rune>, <bloodmagic:blood_rune>], 
	[<bloodmagic:blood_rune>, <bloodmagic:blood_rune>, <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"}).reuse(), <bloodmagic:blood_rune>, <bloodmagic:blood_rune>]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:upgrade_efficiency>, [
	[null, <ore:plateZincargentum>, <ore:ingotNiobiumTitanium>, <ore:plateZincargentum>, <ore:plateZincargentum>], 
	[<ore:plateZincargentum>, <ore:ingotNiobiumTitanium>, <ore:plateZincargentum>, <ore:ingotNiobiumTitanium>, <ore:plateZincargentum>], 
	[<ore:plateZincargentum>, <ore:plateZincargentum>, <ore:plateZincargentum>, <ore:plateZincargentum>, <ore:plateZincargentum>], 
	[<ore:plateZincargentum>, <ore:plateZincargentum>, <ore:ingotNiobiumTitanium>, <ore:plateZincargentum>, <ore:plateZincargentum>], 
	[<ore:plateZincargentum>, <ore:ingotNiobiumTitanium>, <ore:modularUpgradeBlank>, <ore:ingotNiobiumTitanium>, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:upgrade_energy>, [
	[null, <ore:plateZincargentum>, <ore:plateZincargentum>, <ore:plateZincargentum>, <ore:plateZincargentum>], 
	[<ore:plateZincargentum>, <ore:plateZincargentum>, <ore:plateZincargentum>, <ore:plateZincargentum>, <ore:plateZincargentum>], 
	[<ore:plateZincargentum>, <ore:plateZincargentum>, <ore:ingotFlux>, <ore:plateZincargentum>, <ore:plateZincargentum>], 
	[<ore:plateZincargentum>, <ore:plateZincargentum>, <ore:plateZincargentum>, <ore:plateZincargentum>, <ore:plateZincargentum>], 
	[<ore:plateZincargentum>, <ore:plateZincargentum>, <ore:modularUpgradeBlank>, <ore:plateZincargentum>, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:upgrade_expand>, [
	[null, <ore:plateZincargentum>, <ore:ingotElfsteel>, <ore:plateZincargentum>, <ore:plateZincargentum>], 
	[<ore:plateZincargentum>, <ore:ingotCrimsonite>, <ore:plateZincargentum>, <ore:ingotTwilightCrystal>, <ore:plateZincargentum>], 
	[<ore:plateZincargentum>, <ore:plateZincargentum>, <ore:plateZincargentum>, <ore:plateZincargentum>, <ore:ingotAscensionite>], 
	[<ore:plateZincargentum>, <ironchest:iron_chest:5>, <ore:plateZincargentum>, <ore:ingotRefinedObsidian>, <ore:plateZincargentum>], 
	[<ore:plateZincargentum>, <ore:plateZincargentum>, <ore:modularUpgradeBlank>, <ore:plateZincargentum>, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:breedum_core>, [
	[<ore:ingotBreedum>, <ore:ingotUracilite>, null, <ore:ingotUracilite>, <ore:ingotBreedum>], 
	[<ore:ingotUracilite>, null, <ore:ingotBalancedMatrix>, null, <ore:ingotUracilite>], 
	[null, <ore:ingotBalancedMatrix>, <ore:blockBreedum>, <ore:ingotBalancedMatrix>, null], 
	[<ore:ingotUracilite>, null, <ore:ingotBalancedMatrix>, null, <ore:ingotUracilite>], 
	[<ore:ingotBreedum>, <ore:ingotUracilite>, null, <ore:ingotUracilite>, <ore:ingotBreedum>]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <gct_ores:senterian_builder_lab>, [
	[<ore:ingotMortum>, <ore:gemGorbite>, <ore:ingotMortum>, <ore:gemGorbite>, <ore:ingotMortum>], 
	[<ore:gemGorbite>, <ore:ingotDullium>, <ore:gemEnderillium>, <ore:ingotDullium>, <ore:gemGorbite>], 
	[<ore:ingotMortum>, <ore:gemEnderillium>, <ore:ingotChromasteel>, <ore:gemEnderillium>, <ore:ingotMortum>], 
	[<ore:gemGorbite>, <ore:ingotDullium>, <ore:gemEnderillium>, <ore:ingotDullium>, <ore:gemGorbite>], 
	[<ore:ingotMortum>, <ore:gemGorbite>, <ore:ingotMortum>, <ore:gemGorbite>, <ore:ingotMortum>]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:valasium_decode_panel>, [
	[null, <ore:ingotValasium>, null, <ore:ingotValasium>, null], 
	[<ore:ingotValasium>, <ore:ingotValasium>, <ore:ingotTrichromadentium>, <ore:ingotValasium>, <ore:ingotValasium>], 
	[null, <ore:ingotTrichromadentium>, null, <ore:ingotTrichromadentium>, null], 
	[<ore:ingotValasium>, <ore:ingotValasium>, <ore:ingotTrichromadentium>, <ore:ingotValasium>, <ore:ingotValasium>], 
	[null, <ore:ingotValasium>, null, <ore:ingotValasium>, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:bauble_source_of_swamp>, [
	[<ore:ingotIzumium>, null, <ore:demonshard>, null, <ore:ingotIzumium>], 
	[null, <ore:ingotIzumium>, <ore:demonshard>, <ore:ingotIzumium>, null], 
	[<ore:demonshard>, <ore:demonshard>, <additions:source_of_swamp>, <ore:demonshard>, <ore:demonshard>], 
	[null, <ore:ingotIzumium>, <ore:demonshard>, <ore:ingotIzumium>, null], 
	[<ore:ingotIzumium>, null, <ore:demonshard>, null, <ore:ingotIzumium>]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <enderutilities:handybag:1>, [
	[null, <ore:itemLeather>, <ore:ingotEnderium>, <ore:itemLeather>, null], 
	[<ore:itemLeather>, <ore:chest>, <enderutilities:enderpart:21>, <ore:chest>, <ore:itemLeather>], 
	[<ore:ingotEnderium>, <enderutilities:enderpart:21>, <ore:ingotEnderite>, <enderutilities:enderpart:21>, <ore:ingotEnderium>], 
	[<ore:itemLeather>, <ore:chest>, <enderutilities:enderpart:21>, <ore:chest>, <ore:itemLeather>], 
	[null, <ore:itemLeather>, <ore:ingotEnderium>, <ore:itemLeather>, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <additions:eco_basic_alloy_ingot> * 2, [
	[null, null, null, null, null], 
	[<ore:ingotCrystallineAlloy>, <ore:ingotManasteel>, <ore:ingotCrystallineAlloy>, <ore:ingotManasteel>, <ore:ingotCrystallineAlloy>], 
	[<ore:ingotIron>, <ore:ingotGold>, <ore:ingotCopper>, <ore:ingotTin>, <ore:ingotOsmium>], 
	[<ore:ingotCrystallineAlloy>, <ore:ingotDraconium>, <ore:ingotCrystallineAlloy>, <ore:ingotDraconium>, <ore:ingotCrystallineAlloy>], 
	[null, null, null, null, null]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <industrialforegoing:mob_slaughter_factory>, [
	[<ore:itemRubber>, <ore:itemRubber>, <ore:gearPorpezite>, <ore:itemRubber>, <ore:itemRubber>], 
	[<ore:itemRubber>, <erebus:jade_sword>, <ore:ingotBreedum>, <erebus:jade_sword>, <ore:itemRubber>], 
	[<ore:gearPorpezite>, <ore:ingotBreedum>, <teslacorelib:machine_case>, <ore:ingotBreedum>, <ore:gearPorpezite>], 
	[<ore:itemRubber>, <erebus:jade_sword>, <ore:ingotBreedum>, <erebus:jade_sword>, <ore:itemRubber>], 
	[<ore:itemRubber>, <ore:itemRubber>, <ore:gearPorpezite>, <ore:itemRubber>, <ore:itemRubber>]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <industrialforegoing:ore_sieve>, [
	[<ore:itemRubber>, <ore:itemRubber>, <ore:barsIron>, <ore:itemRubber>, <ore:itemRubber>], 
	[<ore:itemRubber>, <ore:blockCrystallinePinkSlime>, <teslacorelib:machine_case>, <ore:blockCrystallinePinkSlime>, <ore:itemRubber>], 
	[<ore:barsIron>, <teslacorelib:machine_case>, <ore:circuitDreamic>, <teslacorelib:machine_case>, <ore:barsIron>], 
	[<ore:itemRubber>, <ore:blockCrystallinePinkSlime>, <ore:gearThermallite>, <ore:blockCrystallinePinkSlime>, <ore:itemRubber>], 
	[<ore:itemRubber>, <ore:itemRubber>, <ore:barsIron>, <ore:itemRubber>, <ore:itemRubber>]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <industrialforegoing:ore_washer>, [
	[<ore:itemRubber>, <ore:itemRubber>, <industrialforegoing:meat_feeder>, <ore:itemRubber>, <ore:itemRubber>], 
	[<ore:itemRubber>, <ore:circuitArcane>, <teslacorelib:machine_case>, <ore:circuitArcane>, <ore:itemRubber>], 
	[<industrialforegoing:conveyor:*>, <industrialforegoing:conveyor:*>, <industrialforegoing:conveyor:*>, <industrialforegoing:conveyor:*>, <industrialforegoing:conveyor:*>], 
	[<ore:itemRubber>, <ore:circuitArcane>, <teslacorelib:machine_case>, <ore:circuitArcane>, <ore:itemRubber>], 
	[<ore:itemRubber>, <ore:itemRubber>, <ore:gearTwilit>, <ore:itemRubber>, <ore:itemRubber>]
]);

mods.extendedcrafting.TableCrafting.addShaped(0, <industrialforegoing:ore_fermenter>, [
	[<ore:itemRubber>, <ore:itemRubber>, <ore:barsIron>, <ore:itemRubber>, <ore:itemRubber>], 
	[<ore:itemRubber>, <ore:logWood>, <ore:circuitArcane>, <ore:logWood>, <ore:itemRubber>], 
	[<ore:barsIron>, <ore:circuitArcane>, <ore:gearCreativeAlloy>, <ore:circuitArcane>, <ore:barsIron>], 
	[<ore:itemRubber>, <ore:logWood>, <ore:circuitArcane>, <ore:logWood>, <ore:itemRubber>], 
	[<ore:itemRubber>, <ore:itemRubber>, <ore:barsIron>, <ore:itemRubber>, <ore:itemRubber>]
]);

mods.extendedcrafting.TableCrafting.addShapeless(0, <industrialforegoing:plastic> * 3, [<ore:ingotPolyethersulfone>, <ore:ingotZirfon>, <ore:ingotPolytetrafluoroethene>, <ore:ingotPolymethylsilyleneMethylene>, <ore:sheetHDPE>]);