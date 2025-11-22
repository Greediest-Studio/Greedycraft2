/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */


#priority 1250
#modloaded projecte

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import mods.actuallyadditions.AtomicReconstructor;
import mods.actuallyadditions.BallOfFur;
import mods.actuallyadditions.Empowerer;

AtomicReconstructor.addRecipe(<thermalfoundation:material:893> * 4, <extrautils2:ingredients>, 4000);
AtomicReconstructor.addRecipe(<thermalfoundation:material:894>, <minecraft:glowstone_dust>, 1500);
AtomicReconstructor.addRecipe(<thermalfoundation:material:895>, <minecraft:ender_pearl>, 2000);
AtomicReconstructor.addRecipe(<appliedenergistics2:material:1>, <appliedenergistics2:material>, 1500);
AtomicReconstructor.addRecipe(<tofucraft:material:25>, <tofucraft:material:18>, 2500);
AtomicReconstructor.addRecipe(<thaumicwonders:primordial_grain>, <tconevo:metal:22>, 12000);
AtomicReconstructor.addRecipe(<moretcon:oregravitonium> * 4, <moretcon:oregravitoniumdense>, 2000);

BallOfFur.addReturn(<additions:reward_ticket_common>, 1);

Empowerer.addRecipe(<additions:ebony_and_lvory>, <draconicevolution:wyvern_core>, <moretcon:ingotebonite>, <defiledlands:remorseful_gem>, <additions:ivorium_ingot>, <naturesaura:aura_bottle>.withTag({stored_type: "naturesaura:nether"}), 33554432, 200);
Empowerer.addRecipe(<additions:upgrade_dim_overworld>, <additions:upgrade_blank>, <additions:conduct_gear>, <additions:stainless_steel_block>, <additions:lock_of_space>, <draconicevolution:draconic_core>, 131072, 200);
Empowerer.addRecipe(<additions:upgrade_dim_nether>, <additions:upgrade_blank>, <journey:blazierorb>, <additions:netherite_block>, <additions:lock_of_space>, <draconicevolution:draconic_core>, 131072, 200);
Empowerer.addRecipe(<additions:upgrade_dim_end>, <additions:upgrade_blank>, <divinerpg:horde_horn>,<additions:enderite_block>, <additions:lock_of_space>, <draconicevolution:draconic_core>, 131072, 200);
Empowerer.addRecipe(<contenttweaker:bauble_horseshoe_balloon>, <minecraft:string>, <bountifulbaubles:trinketballoon>, <minecraft:slime_ball>, <bountifulbaubles:trinketluckyhorseshoe>, <minecraft:slime_ball>, 65536, 100);