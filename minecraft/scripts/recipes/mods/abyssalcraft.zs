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
import mods.abyssalcraft.Rituals;
import mods.abyssalcraft.necronomicon.internal;
import mods.abyssalcraft.Materializer;
import mods.acremnanttweaker.Remnant;

Remnant.addTrade("butcher", <additions:abyss_remnant_coin> * 15, <abyssalcraft:dreadcloth> * 8, <additions:nefrath_cloth> * 2);
Remnant.addTrade("blacksmith", <additions:abyss_remnant_coin> * 15, <abyssalcraft:shadowgem> * 8, <additions:remnant_gem>);
Remnant.addTrade("librarian", <additions:remnant_data>, <abyssalcraft:eldercoin> * 25, <additions:remnant_data> * 3);

Transmutator.removeTransmutationOutput(<abyssalcraft:solidlava>);

Transmutator.addTransmutation(<gct_additions:reserved_reserver>, <gct_additions:reserver>, 3.0f);
Transmutator.addTransmutation(<additions:reversed_orichalcos>, <extrabotany:material:1>, 1.0f);

Transmutator.addFuel(<abyssalcraft:cingot>, 1200);
Transmutator.addFuel(<additions:energy_matter_core>, 600000);
Transmutator.addFuel(<gct_additions:sanite_ingot>, 2000);
Transmutator.addFuel(<gct_additions:sanite_block>, 18000);

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

InfusionRitual.addRitual("empty_key1", 4, -1, 10000, false, <gct_additions:door_key_empty>, <abyssalcraft:gatewaykey>, [
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
] as IIngredient[], false);

InfusionRitual.addRitual("empty_key2", 4, -1, 10000, false, <gct_additions:door_key_empty>, <abyssalcraft:gatewaykeydl>, [
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
] as IIngredient[], false);

InfusionRitual.addRitual("empty_key3", 4, -1, 10000, false, <gct_additions:door_key_empty>, <abyssalcraft:gatewaykeyjzh>, [
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
    <projecte:item.pe_matter>,
] as IIngredient[], false);

InfusionRitual.addRitual("key_order", 4, 53, 100000, true, <gct_additions:door_key_of_orderland>, <gct_additions:door_key_empty>, [
    <additions:cosmilite_ingot>,
    <gct_additions:ruled_draconium_block>,
    <draconicevolution:chaotic_core>,
    <gct_additions:balanced_matrix_ingot>,
    <gct_additions:everite_block>,
    <gct_additions:balanced_matrix_ingot>,
    <gct_additions:stormy_core>,
    <gct_additions:equipment_witherium_block>
] as IIngredient[], false);

InfusionRitual.addRitual("ancient_mud", 4, 53, 50000, true, <gct_additions:ancientmud>, <minecraft:slime_ball>, [
    <gct_additions:sanite_block>,
    <abyssalcraft:ingotblock:3>,
    <gct_additions:essenceofdarkerrealm>,
    <gct_additions:essenceofdarkerrealm>,
    <gct_additions:shoggothtancale>,
    <gct_additions:shoggothtancale>,
    <gct_additions:shoggothtancale>,
    <gct_additions:shoggothtancale>
] as IIngredient[], false); 

CreationRitual.addRitual("key_portal", 4, -1, 100010, false, <thebetweenlands:swamp_talisman>, [
    <thebetweenlands:swamp_talisman:1>,
    <gct_additions:door_key_empty>,
    <thebetweenlands:swamp_talisman:2>,
    <gct_additions:door_key_empty>,
    <thebetweenlands:swamp_talisman:3>,
    <gct_additions:door_key_empty>,
    <thebetweenlands:swamp_talisman:4>,
    <gct_additions:door_key_empty>
], true);

InfusionRitual.addRitual("living_fire", 3, -1, 64000, false, <additions:living_fire>, <tiths:ingot_stellarium>, [
    <additions:flamium_ingot>,
    <additions:flamium_ingot>,
    <additions:infernium_ingot>,
    <additions:infernium_ingot>,
    <extrautils2:ingredients:17>,
    <extrautils2:ingredients:17>,
    <additions:moltenium_ingot>,
    <additions:moltenium_ingot>
] as IIngredient[], false);

CreationRitual.addRitual("warped_key", 4, -1, 100010, false, <gct_additions:key_of_warped>, [
    <gct_additions:door_key_empty>,
    <gct_additions:cthulhurite_ingot>,
    <gct_additions:shoggothtooth>,
    <gct_additions:cthulhurite_ingot>,
    <gct_additions:door_key_empty>,
    <gct_additions:cthulhurite_ingot>,
    <gct_additions:shoggothtooth>,
    <gct_additions:cthulhurite_ingot>
], true);

InfusionRitual.addRitual("warped_key_active", 4, -1, 100010, true, <gct_additions:key_of_warped_active>, <gct_additions:key_of_warped>, [
    <thebetweenlands:spirit_fruit>,
    null,
    null,
    <additions:cosmilite_ingot>,
    null,
    null,
    <gct_additions:balanced_matrix_ingot>
] as IIngredient[], false);

CreationRitual.addRitual("capsule", 3, -1, 90000, false, <gct_additions:solid_pot_energy>, [
    <additions:sanite_ethaxium_capsule>
], true);

InfusionRitual.addRitual("abyssine_ingot", 4, -1, 50000, true, <additions:abyssine_block>, <gct_additions:balanced_matrix_ingot>, [
    <gct_additions:azathothium_ingot>,
    <gct_additions:nyarlathotepium_ingot>,
    <gct_additions:yogsothothium_ingot>,
    <gct_additions:shubniggurathium_ingot>,
    <additions:husturite_ingot>,
    <additions:cthughate_ingot>,
    <gct_additions:cthulhurite_ingot>,
    <gct_additions:balanced_matrix_ingot>
] as IIngredient[], false);

InfusionRitual.addRitual("eye_of_abyss", 4, -1, 100000, true, <gct_additions:eye_of_abyss>, <additions:awakened_eye>, [
    <abyssalcraft:essence>,
    <abyssalcraft:essence:1>,
    <abyssalcraft:essence:2>,
    <gct_additions:essenceofdarkrealm>,
    <gct_additions:essenceofdarkerrealm>,
    <gct_additions:essence_of_warped_ruin>,
    <gct_additions:finallium_ingot>,
    <thaumadditions:adaminite_fabric>
] as IIngredient[], false);

InfusionRitual.addRitual("void_eye", 2, -1, 10000, false, <elementalend:void_eye>, <minecraft:ender_eye>, [
    <abyssalcraft:stone>,
    <abyssalcraft:cingot>,
    <abyssalcraft:stone>,
    <abyssalcraft:dreadiumingot>,
    <abyssalcraft:stone>,
    <abyssalcraft:cingot>,
    <abyssalcraft:stone>,
    <abyssalcraft:dreadiumingot>
] as IIngredient[], false);

InfusionRitual.removeRitual(<ageofminecraft:fusionasorah>);
InfusionRitual.removeRitual(<ageofminecraft:fusionchagaroth>);
InfusionRitual.removeRitual(<ageofminecraft:fusionjzahar>);
InfusionRitual.removeRitual(<ageofminecraft:fusionsacthoth>);
InfusionRitual.removeRitual(<abyssalcraft:dhelmet>);
InfusionRitual.removeRitual(<abyssalcraft:dplate>);
InfusionRitual.removeRitual(<abyssalcraft:dlegs>);
InfusionRitual.removeRitual(<abyssalcraft:dboots>);
InfusionRitual.removeRitual(<abyssalcraft:depthshelmet>);
InfusionRitual.removeRitual(<abyssalcraft:depthsplate>);
InfusionRitual.removeRitual(<abyssalcraft:depthslegs>);
InfusionRitual.removeRitual(<abyssalcraft:depthsboots>);

Rituals.removeRitual("changeRitual");