/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 3000

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import mods.aether_legacy.Enchanter;
import mods.aether_legacy.Freezer;

Enchanter.registerEnchantment(<additions:greedycraft-slider_gem_unforked>, <additions:greedycraft-slider_gem>, 200);
Enchanter.registerEnchantment(<gct_mobs:gravity_debris>, <gct_mobs:gravity_scrap> * 4, 2000);

Freezer.registerFreezable(<additions:greedycraft-apollonium_overheat_ingot>, <additions:greedycraft-apollonium_ingot>, 200);