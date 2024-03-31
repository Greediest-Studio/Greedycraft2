/*
 * This script is created for the GreedyCraft modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */

import mods.naturesaura.Altar;
import mods.naturesaura.TreeRitual;

TreeRitual.addRecipe("fabric_of_nature", <minecraft:sapling>, <additions:greedycraft-fabric_of_nature>, 200, [
    <naturesaura:sky_ingot>,
    <naturesaura:infused_iron_block>,
    <additions:greedycraft-daynight_ingot>,
    <additions:greedycraft-twilight_crystal_ingot>,
    <naturesaura:sky_ingot>,
    <naturesaura:infused_iron_block>,
    <additions:greedycraft-daynight_ingot>,
    <additions:greedycraft-twilight_crystal_ingot>
]);

TreeRitual.addRecipe("token_emotion", <minecraft:sapling>, <additions:greedycraft-token_emotion>, 60, [
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
    <additions:greedycraft-fusion_matrix_block>,
    <botania:manaresource:3>,
    <botania:manaresource:3>,
    <additions:greedycraft-token_emotion>,
    <additions:greedycraft-terra_alloy_block>,
    <botania:manaresource:3>,
    <botania:manaresource:3>,
    <additions:greedycraft-token_emotion>,
]);