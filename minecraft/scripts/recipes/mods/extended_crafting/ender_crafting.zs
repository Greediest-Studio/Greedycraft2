/*
 * This script is created for the GreedyCraft II modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */
 

import mods.extendedcrafting.EnderCrafting;

EnderCrafting.addShaped(<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:builder_4"}), [
	[null, <ore:nuggetChromasteel>, null], 
	[<ore:nuggetChromasteel>, <gct_ores:blue_print_forge>, <ore:nuggetChromasteel>], 
	[null, <ore:nuggetChromasteel>, null]
]);

EnderCrafting.addShaped(<endreborn:ingot_infused> * 2, [
	[<endexpansion:dark_ingot>, <ore:ingotThallium>, <ore:ingotEndorium>], 
	[<endexpansion:infused_crystal>, <gct_ores:shalloite>, <endexpansion:infused_crystal>], 
	[<ore:ingotEndorium>, <ore:ingotThallium>, <endexpansion:dark_ingot>]
]);