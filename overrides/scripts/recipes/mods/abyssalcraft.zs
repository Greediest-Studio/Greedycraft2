/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */

#priority 1150

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import mods.abyssalcraft.Transmutator;
import mods.abyssalcraft.CreationRitual;
import mods.abyssalcraft.InfusionRitual;

Transmutator.removeTransmutationOutput(<abyssalcraft:solidlava>);

Transmutator.addFuel(<abyssalcraft:cingot>, 1200);
Transmutator.addFuel(<additions:greedycraft-energy_matter_core>, 600000);
Transmutator.addFuel(<gct_mobs:sanite_ingot>, 2000);
Transmutator.addFuel(<gct_mobs:sanite_block>, 18000);

InfusionRitual.addRitual("abyssalite", 0, -1, 500, false, <abyssalcraft:abyore>,  <minecraft:iron_ore>, [
    <abyssalcraft:shadowshard>, 
    <abyssalcraft:shadowfragment>, 
    <abyssalcraft:shadowshard>, 
    <abyssalcraft:shadowfragment>, 
    <abyssalcraft:shadowshard>, 
    <abyssalcraft:shadowfragment>, 
    <abyssalcraft:shadowshard>, 
    <abyssalcraft:shadowfragment>
] as IIngredient[], false);

InfusionRitual.removeRitual(<abyssalcraft:psdl>);
InfusionRitual.addRitual("dreadland_artifact", 1, -1, 10000, true, <abyssalcraft:psdl>,  <abyssalcraft:ingotblock:1>, [<abyssalcraft:powerstonetracker>, 
    <abyssalcraft:powerstonetracker>, 
    <abyssalcraft:powerstonetracker>, 
    <abyssalcraft:powerstonetracker>, 
    <abyssalcraft:powerstonetracker>, 
    <abyssalcraft:powerstonetracker>, 
    <abyssalcraft:powerstonetracker>, 
    <abyssalcraft:powerstonetracker>
] as IIngredient[], false);

InfusionRitual.addRitual("empty_key1", 4, -1, 10000, false, <gct_ores:door_key_empty>, <abyssalcraft:gatewaykey>, [
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
] as IIngredient[], false);

InfusionRitual.addRitual("empty_key2", 4, -1, 10000, false, <gct_ores:door_key_empty>, <abyssalcraft:gatewaykeydl>, [
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
] as IIngredient[], false);

InfusionRitual.addRitual("empty_key3", 4, -1, 10000, false, <gct_ores:door_key_empty>, <abyssalcraft:gatewaykeyjzh>, [
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
] as IIngredient[], false);

InfusionRitual.addRitual("key_order", 4, 53, 100000, true, <gct_ores:door_key_of_orderland>, <gct_ores:door_key_empty>, [
    <additions:cosmilite_ingot>,
    <gct_ores:ruled_draconium_block>,
    <draconicevolution:chaotic_core>,
    <gct_ores:balanced_matrix_ingot>,
    <gct_ores:everite_block>,
    <gct_ores:balanced_matrix_ingot>,
    <gct_ores:stormy_core>,
    <gct_ores:equipment_witherium_block>
] as IIngredient[], false);

InfusionRitual.addRitual("ancient_mud", 4, 53, 50000, true, <gct_aby:ancientmud>, <minecraft:slime_ball>, [
    <gct_mobs:sanite_block>,
    <abyssalcraft:ingotblock:3>,
    <gct_aby:essenceofdarkerrealm>,
    <gct_aby:essenceofdarkerrealm>,
    <gct_aby:shoggothtancale>,
    <gct_aby:shoggothtancale>,
    <gct_aby:shoggothtancale>,
    <gct_aby:shoggothtancale>
] as IIngredient[], false); 

CreationRitual.addRitual("key_portal", 4, -1, 100010, false, <thebetweenlands:swamp_talisman>, [
    <thebetweenlands:swamp_talisman:1>,
    <gct_ores:door_key_empty>,
    <thebetweenlands:swamp_talisman:2>,
    <gct_ores:door_key_empty>,
    <thebetweenlands:swamp_talisman:3>,
    <gct_ores:door_key_empty>,
    <thebetweenlands:swamp_talisman:4>,
    <gct_ores:door_key_empty>
], true);

InfusionRitual.addRitual("living_fire", 3, -1, 64000, false, <additions:greedycraft-living_fire>, <tiths:ingot_stellarium>, [
    <additions:greedycraft-flamium_ingot>,
    <additions:greedycraft-flamium_ingot>,
    <additions:infernium_ingot>,
    <additions:infernium_ingot>,
    <extrautils2:ingredients:17>,
    <extrautils2:ingredients:17>,
    <additions:moltenium_ingot>,
    <additions:moltenium_ingot>
] as IIngredient[], false);

CreationRitual.addRitual("warped_key", 4, -1, 100010, false, <gct_aby:key_of_warped>, [
    <gct_ores:door_key_empty>,
    <gct_mobs:cthulhurite_ingot>,
    <gct_aby:shoggothtooth>,
    <gct_mobs:cthulhurite_ingot>,
    <gct_ores:door_key_empty>,
    <gct_mobs:cthulhurite_ingot>,
    <gct_aby:shoggothtooth>,
    <gct_mobs:cthulhurite_ingot>
], true);

InfusionRitual.addRitual("warped_key_active", 4, -1, 100010, true, <gct_aby:key_of_warped_active>, <gct_aby:key_of_warped>, [
    <thebetweenlands:spirit_fruit>,
    null,
    null,
    <additions:cosmilite_ingot>,
    null,
    null,
    <gct_ores:balanced_matrix_ingot>
] as IIngredient[], false);

CreationRitual.addRitual("capsule", 3, -1, 90000, false, <gct_aby:solid_pot_energy>, [
    <additions:greedycraft-sanite_ethaxium_capsule>
], true);

InfusionRitual.addRitual("abyssine_ingot", 4, -1, 50000, true, <jaopca:block_blockabyssine>, <gct_ores:balanced_matrix_ingot>, [
    <gct_mobs:azathothium_ingot>,
    <gct_mobs:nyarlathotepium_ingot>,
    <gct_mobs:yogsothothium_ingot>,
    <gct_mobs:shubniggurathium_ingot>,
    <additions:taigaddon-husturite_ingot>,
    <additions:taigaddon-cthughate_ingot>,
    <gct_mobs:cthulhurite_ingot>,
    <gct_ores:balanced_matrix_ingot>
] as IIngredient[], false);

InfusionRitual.removeRitual(<ageofminecraft:fusionasorah>);
InfusionRitual.removeRitual(<ageofminecraft:fusionchagaroth>);
InfusionRitual.removeRitual(<ageofminecraft:fusionjzahar>);
InfusionRitual.removeRitual(<ageofminecraft:fusionsacthoth>);