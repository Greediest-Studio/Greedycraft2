/*
 * This script is created for the GreedyCraft modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */

import mods.naturesaura.Altar;
import mods.naturesaura.TreeRitual;

TreeRitual.addRecipe("fabric_of_nature", <minecraft:sapling>, <additions:fabric_of_nature>, 200, [
    <naturesaura:sky_ingot>,
    <naturesaura:infused_iron_block>,
    <additions:daynight_ingot>,
    <additions:twilight_crystal_ingot>,
    <naturesaura:sky_ingot>,
    <naturesaura:infused_iron_block>,
    <additions:daynight_ingot>,
    <additions:twilight_crystal_ingot>
]);

TreeRitual.addRecipe("token_emotion", <minecraft:sapling>, <additions:token_emotion>, 60, [
    <naturesaura:token_joy>,
    <naturesaura:token_fear>,
    <naturesaura:token_anger>,
    <naturesaura:token_sorrow>,
    <naturesaura:token_euphoria>,
    <naturesaura:token_terror>,
    <naturesaura:token_rage>,
    <naturesaura:token_grief>
]);

TreeRitual.addRecipe("eb_altar", <minecraft:sapling>, <gct_mobs:earthbound_altar>, 200, [
    <additions:fusion_matrix_block>,
    <botania:manaresource:3>,
    <botania:manaresource:3>,
    <additions:token_emotion>,
    <additions:terra_alloy_block>,
    <botania:manaresource:3>,
    <botania:manaresource:3>,
    <additions:token_emotion>,
]);