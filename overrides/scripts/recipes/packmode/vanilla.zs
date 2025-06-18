/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */

#priority 40

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

import scripts.util.recipes as RecipeUtil;

RecipeUtil.addModeRecipe("mm_upgrade_t4", <modularmachinery:blockcasing:5>, [
    [<ore:blockChromasteel>, <ore:ingotModularium>, <ore:blockChromasteel>],
    [<ore:ingotModularium>, <modularmachinery:blockcasing:3>, <ore:ingotModularium>],
    [<ore:blockChromasteel>, <ore:ingotModularium>, <ore:blockChromasteel>]
]);

RecipeUtil.addModeRecipe("mm_upgrade_t3", <modularmachinery:blockcasing:3>, [
    [<ore:blockAeonsteel>, <ore:ingotModularium>, <ore:blockAeonsteel>],
    [<ore:ingotModularium>, <modularmachinery:blockcasing:2>, <ore:ingotModularium>],
    [<ore:blockAeonsteel>, <ore:ingotModularium>, <ore:blockAeonsteel>]
]);

RecipeUtil.addModeRecipe("mm_upgrade_t2", <modularmachinery:blockcasing:2>, [
    [<ore:blockDurasteel>, <ore:ingotModularium>, <ore:blockDurasteel>],
    [<ore:ingotModularium>, <modularmachinery:blockcasing:1>, <ore:ingotModularium>],
    [<ore:blockDurasteel>, <ore:ingotModularium>, <ore:blockDurasteel>]
]);

RecipeUtil.addModeRecipe("mm_upgrade_t1", <modularmachinery:blockcasing:1>, [
    [<ore:blockStainlessSteel>, <ore:ingotModularium>, <ore:blockStainlessSteel>],
    [<ore:ingotModularium>, <modularmachinery:blockcasing:4>, <ore:ingotModularium>],
    [<ore:blockStainlessSteel>, <ore:ingotModularium>, <ore:blockStainlessSteel>]
]);
