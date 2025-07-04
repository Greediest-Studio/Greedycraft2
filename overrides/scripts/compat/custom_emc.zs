
/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */

#priority 25000

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import mods.ctintegration.projecte.EMCManager;

val emcMapping as long[IIngredient] = {
    <akashictome:tome:0> : 0 as long,
    <theoneprobe:probenote:0> : 0 as long,
    <draconicevolution:info_tablet:0> : 0 as long,
    <cyclicmagic:tool_trade:0> : 0 as long,
    <abyssalcraft:necronomicon:0> : 0 as long,
    <actuallyadditions:item_booklet:0> : 0 as long,
    <aether_legacy:lore_book:0> : 0 as long,
    <xnet:xnet_manual:0> : 0 as long,
    <thermalfoundation:tome_lexicon:0> : 0 as long,
    <rftools:rftools_manual:0> : 0 as long,
    <rftoolscontrol:rftoolscontrol_manual:0> : 0 as long,
    <solcarrot:food_book:0> : 0 as long,
    <spiceoflife:bookfoodjournal:0> : 0 as long,
    <tconstruct:book:0> : 0 as long,
    <thaumcraft:thaumonomicon:0> : 0 as long,
    <rftools:rftools_shape_manual:0> : 0 as long,
    <openblocks:info_book:0> : 0 as long,
    <hammercore:manual:0> : 0 as long,
    <ftbquests:book:0> : 0 as long,
    <forestry:catalogue:0> : 0 as long,
    <forestry:book_forester:0> : 0 as long,
    <extrautils2:book:0> : 0 as long,
    <cookingforblockheads:recipe_book:2> : 0 as long,
    <cookingforblockheads:recipe_book:1> : 0 as long,
    <cookingforblockheads:recipe_book:0> : 0 as long,
    <conarm:book:0> : 0 as long,
    <cfm:item_recipe_book:0> : 0 as long,
    <botania:lexicon:0> : 0 as long,
    <scalinghealth:crystalshard:0> : 0 as long,
    <additions:infinity_block_block_block:0> : 9223372036854775807 as long,
    <avaritia:resource:6> : 2147483647 as long,
    <avaritia:block_resource:1> : 19327352823 as long,
    <botania:specialflower:0> : 2500 as long,
    <additions:poop:0> : 114514 as long,
    <enderio:block_exit_rail:0> : 0 as long,
    <minecraft:rail:0> : 0 as long,
    <minecraft:activator_rail:0> : 0 as long,
    <minecraft:golden_rail:0> : 0 as long,
    <minecraft:detector_rail:0> : 0 as long,
    <minecraft:skull:2> : 1024 as long,
    <minecraft:skull:4> : 1024 as long,
    <minecraft:skull:0> : 1024 as long,
    <minecraft:skull:1> : 12933 as long,
    <enderio:block_enderman_skull:2> : 2048 as long,
    <enderio:block_enderman_skull:0> : 2048 as long,
    <minecraft:skull:3> : 32 as long,
    <additions:lucky_clover:0> : 0 as long,
    <redstonearsenal:material:32> : 1500 as long,
    <minecraft:dragon_breath:0> : 0 as long,
    <mysticalagriculture:wither_skeleton_essence:0> : 1600 as long,
    <mysticalagriculture:wither_skeleton_seeds:0> : 4200 as long,
    <mysticalagriculture:diamond_seeds:0> : 3000 as long,
    <mysticalagriculture:emerald_seeds:0> : 4800 as long,
    <mysticalagriculture:emerald_essence:0> : 0 as long,
    <mysticalagriculture:diamond_essence:0> : 0 as long,
    <mysticalagriculture:crafting:37> : 0 as long,
    <mysticalagriculture:crafting:36> : 0 as long,
    <mysticalagriculture:crafting:35> : 0 as long,
    <mysticalagriculture:crafting:34> : 0 as long,
    <mysticalagriculture:crafting:4> : 0 as long,
    <mysticalagriculture:crafting:3> : 0 as long,
    <mysticalagriculture:crafting:2> : 0 as long,
    <mysticalagriculture:crafting:1> : 0 as long,
    <mysticalagriculture:crafting:0> : 0 as long,
    <mysticalagriculture:crafting:33> : 0 as long,
    <mysticalagriculture:storage:0> : 0 as long,
    <mysticalagriculture:storage:1> : 0 as long,
    <mysticalagriculture:storage:2> : 0 as long,
    <mysticalagriculture:storage:3> : 0 as long,
    <mysticalagriculture:storage:4> : 0 as long,
    <mysticalagradditions:insanium:0> : 0 as long,
    <mysticalagradditions:insanium:2> : 0 as long,
    <mysticalagradditions:insanium:3> : 0 as long,
    <mysticalagriculture:crafting:41> : 0 as long,
    <mysticalagriculture:crafting:40> : 0 as long,
    <mysticalagriculture:crafting:42> : 0 as long,
    <mysticalagriculture:crafting:43> : 0 as long,
    <mysticalagriculture:crafting:44> : 0 as long,
    <mysticalagriculture:ingot_storage:3> : 0 as long,
    <mysticalagriculture:ingot_storage:4> : 0 as long,
    <mysticalagriculture:ingot_storage:5> : 0 as long,
    <mysticalagriculture:ingot_storage:2> : 0 as long,
    <mysticalagriculture:ingot_storage:1> : 0 as long,
    <avaritia:resource:5> : 0 as long,
    <additions:lucky_clover:0> : 500 as long,
    <patchouli:guide_book:0> : 0 as long,
    <draconicevolution:chaos_shard:0> : 10000000 as long,
    <draconicevolution:draconic_ingot:0> : 200000 as long,
    <mysticalagradditions:awakened_draconium_seeds:0> : 0 as long,
    <mysticalagradditions:awakened_draconium_essence:0> : 0 as long,
    <mysticalagradditions:dragon_egg_essence:0> : 0 as long,
    <mysticalagradditions:nether_star_essence:0> : 0 as long,
    <minecraft:leather:0> : 256 as long,
    <draconicevolution:awakened_core:0> : 3500000 as long,
    <draconicevolution:crafting_injector:2> : 2500000 as long,
    <tconevo:metal:5> : 4500000 as long,
    <draconicevolution:chaotic_core:0> : 40000000 as long,
    <tconevo:metal:10> : 80000000 as long,
    <tconevo:metal:0> : 750000 as long,
    <draconicevolution:draconic_block:0> : 1800000 as long,
    <additions:dragon_soul:0> : 0 as long,
    <additions:wither_soul:0> : 0 as long,
    <avaritia:resource:2> : 1024 as long,
    <additions:experience_ingot:0> : 900 as long,
    <additions:raw_human_meat:0> : 42 as long,
    <additions:cooked_human_meat:0> : 56 as long,
    <minecraft:diamond:0> : 4096 as long,
    <minecraft:emerald:0> : 6000 as long,
    <minecraft:gold_ingot:0> : 1024 as long,
    <minecraft:iron_ingot:0> : 128 as long,
    <avaritia:infinity_pickaxe:0> : 0 as long,
    <avaritia:infinity_shovel:0> : 0 as long,
    <avaritia:infinity_axe:0> : 0 as long,
    <avaritia:infinity_hoe:0> : 0 as long,
    <botania_tweaks:compressed_tiny_potato_8:0> : 0 as long,
    <natura:blaze_rail:0> : 0 as long,
    <natura:blaze_rail_golden:0> : 0 as long,
    <natura:blaze_rail_activator:0> : 0 as long,
    <natura:blaze_rail_detector:0> : 0 as long,
    <tconstruct:wood_rail:0> : 0 as long,
    <tconstruct:wood_rail_trapdoor:0> : 0 as long,
    <draconicevolution:dragon_heart:0> : 450000 as long,
    <botania_tweaks:compressed_tiny_potato_7:0> : 0 as long,
    <botania_tweaks:compressed_tiny_potato_6:0> : 0 as long,
    <botania_tweaks:compressed_tiny_potato_5:0> : 0 as long,
    <botania_tweaks:compressed_tiny_potato_4:0> : 0 as long,
    <botania_tweaks:compressed_tiny_potato_3:0> : 0 as long,
    <botania_tweaks:compressed_tiny_potato_2:0> : 0 as long,
    <botania_tweaks:compressed_tiny_potato_1:0> : 0 as long,
    <botania:tinypotato:0> : 0 as long,
    <additions:city_defender_medal:0> : 40000 as long,
    <fluxnetworks:flux:0> : 80 as long,
    <minecraft:name_tag:0> : 1038 as long,
    <quark:biotite:0> : 600 as long,
    <netherex:amethyst_crystal:0> : 500 as long,
    <actuallyadditions:item_misc:5> : 256 as long,
    <cyclicmagic:heart_food:0> : 0 as long,
    <taiga:basalt_block:0> : 128 as long,
    <taiga:tiberium_ore:0> : 128 as long,
    <taiga:prometheum_ore:0> : 3000 as long,
    <taiga:duranite_ore:0> : 1500 as long,
    <taiga:valyrium_ore:0> : 12800 as long,
    <taiga:vibranium_ore:0> : 7500 as long,
    <taiga:karmesine_ore:0> : 2500 as long,
    <taiga:ovium_ore:0> : 2500 as long,
    <taiga:jauxum_ore:0> : 2500 as long,
    <taiga:palladium_ore:0> : 1200 as long,
    <taiga:uru_ore:0> : 1350 as long,
    <taiga:osram_ore:0> : 1500 as long,
    <taiga:eezo_ore:0> : 900 as long,
    <taiga:abyssum_ore:0> : 3000 as long,
    <taiga:meteorite_block:0> : 250 as long,
    <taiga:obsidiorite_block:0> : 250 as long,
    <taiga:obsidioritecobble_block:0> : 250 as long,
    <taiga:meteoritecobble_block:0> : 250 as long,
    <tconevo:material:0> : 131072 as long,
    <forge:bucketfilled:0> : 0 as long,
    <additions:infernium_ingot:0> : 75000 as long,
    <additions:titanium_ingot:0> : 240000 as long,
    <additions:cryonium_ingot:0> : 45000 as long,
    <biomesoplenty:gem:0> : 2048 as long,
    <biomesoplenty:gem:7> : 2048 as long,
    <biomesoplenty:gem:5> : 2048 as long,
    <biomesoplenty:gem:3> : 2048 as long,
    <biomesoplenty:gem:4> : 2048 as long,
    <tconevo:metal:20> : 300000 as long,
    <additions:cytosinite_ingot:0> : 20000 as long,
    <additions:terra_alloy_ingot:0> : 200000 as long,
    <thaumadditions:mithminite_ingot:0> : 262144 as long,
    <additions:shadowium_ingot:0> : 12000 as long,
    <additions:aeroite_ingot:0> : 2500 as long,
    <additions:asgardium_ingot:0> : 4000 as long,
    <thermalfoundation:material:160> : 3200 as long,
    <additions:ignite_ingot> : 3200 as long,
    <botania:manaresource:4> : 7200 as long,
    <additions:chromium_ingot:0> : 8000 as long,
    <additions:stainless_steel_ingot:0> : 7200 as long,
    <additions:protonium_ingot:0> : 42000000 as long,
    <additions:electronium_ingot:0> : 250000 as long,
    <additions:strange_matter:0> : 800000 as long,
    <appliedenergistics2:material:6> : 0 as long,
    <compactmachines3:psd:0> : 0 as long,
    <defiledlands:scarlite:0> : 4096 as long,
    <defiledlands:umbrium_ingot:0> : 128 as long,
    <minecraft:spawn_egg:0> : 0 as long,
    <guideapi:bloodmagic-guide:0> : 0 as long,
    <guideapi:bloodarsenal-guide:0> : 0 as long,
    <bloodmagic:sanguine_book:0> : 0 as long,
    <additions:aqualite_ingot:0> : 5200 as long,
    <tconevo:metal:25> : 6666 as long,
    <mysticalagriculture:fertilized_essence:0> : 0 as long,
    <tinkersaether:valkyrie_ingot:0> : 6666 as long,
    <additions:manganese_ingot:0> : 3200 as long,
    <additions:manganese_steel_ingot:0> : 4800 as long,
    <thermalfoundation:material:136> : 3000 as long,
    <bloodmagic:blood_shard:1> : 12048 as long,
    <additions:crimsonite_ingot:0> : 10240 as long,
    <thermalfoundation:fertilizer:0> : 0 as long,
    <thermalfoundation:fertilizer:1> : 0 as long,
    <thermalfoundation:fertilizer:2> : 0 as long,
    <projectex:stone_table> : 0 as long,
    <projecte:transmutation_table> : 0 as long,
    <projectex:energy_link:*> : 0 as long,
    <appliedenergistics2:material:47> : 0 as long,
    <appliedenergistics2:material:48> : 0 as long,
    <projectex:personal_link> : 0 as long,
    <additions:cosmilite_ingot:0> : 0 as long,
    <additions:aeonsteel_ingot:0> : 0 as long,
    <additions:durasteel_ingot:0> : 0 as long,
    <additions:chromasteel_ingot:0> : 0 as long,
    <additions:netherite_ingot:0> : 160000 as long,
    <extrautils2:compressedcobblestone:*> : 0 as long,
    <extrautils2:compresseddirt:*> : 0 as long,
    <extrautils2:compressedsand:*> : 0 as long,
    <extrautils2:compressedgravel:*> : 0 as long,
    <extrautils2:compressednetherrack:*> : 0 as long,
    <thaumcraft:primordial_pearl:*> : 0 as long,
    <minecraft:gunpowder> : 24 as long,
    <draconicevolution:draconium_ingot> : 8192 as long,
    <draconicevolution:draconium_block> : 73728 as long,
    <draconicevolution:nugget> : 910 as long,
    <additions:energy_matter_core> : 25000000 as long 
};

for ingredient, value in emcMapping {
    EMCManager.setIngredientEMC(ingredient, value);
}

EMCManager.mapEMC();
