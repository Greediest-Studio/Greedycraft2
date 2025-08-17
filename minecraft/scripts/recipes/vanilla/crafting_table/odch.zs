/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */

#priority 4000

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import scripts.util.recipes as RecipeUtil;
import scripts.util.lang as LangUtil;

RecipeUtil.addShapeless("odch0001", <botania:manaresource:2>, [<ore:gemManaDiamond>]);
RecipeUtil.addShapeless("odch0002", <botania:quartz:1>, [<ore:gemManaQuartz>]);
RecipeUtil.addShapeless("odch0003", <botanicadds:mana_lapis>, [<ore:gemManaLapis>]);