#priority 3000

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.mods.ILoadedMods;

import mods.avaritia.ExtremeCrafting;
import mods.avaritia.Compressor;
import mods.ctintegration.util.RecipePattern;
import mods.extendedcrafting.TableCrafting;
import mods.extendedcrafting.CombinationCrafting;

CombinationCrafting.addRecipe(<additions:twilit_block> * 1, 2000000000, 8388608, <gct_ores:balanced_matrix_ingot>, [
    <ore:ingotFierymetal>,
    <ore:ingotFierymetal>,
    <ore:ingotFierymetal>,
    <ore:ingotFierymetal>,
    <ore:ingotKnightmetal>,
    <ore:ingotKnightmetal>,
    <ore:ingotKnightmetal>,
    <ore:ingotKnightmetal>,
    <ore:ingotTwilightCrystal>,
    <ore:ingotTwilightCrystal>,
    <ore:ingotTwilightCrystal>,
    <ore:ingotTwilightCrystal>,
    <ore:ingotPenguinite>,
    <ore:ingotPenguinite>,
    <ore:ingotPenguinite>,
    <ore:ingotPenguinite>,
    <ore:ingotIronwood>,
    <ore:ingotIronwood>,
    <ore:ingotIronwood>,
    <ore:ingotIronwood>,
    <ore:gemTwilightRefined>,
    <ore:gemTwilightRefined>,
    <ore:gemTwilightRefined>,
    <ore:gemTwilightRefined>,
    <moretcon:repitem:6>,
    <moretcon:repitem:6>,
    <moretcon:repitem:6>,
    <moretcon:repitem:6>,
    <ore:ingotBalancedMatrix>
]);

CombinationCrafting.addRecipe(<additions:upgrade_multidim>, 1638400000, 4194304, <additions:finallium_block>, [
    <ore:modularUpgradeDimOverworld>,
    <ore:modularUpgradeDimNether>,
    <ore:modularUpgradeDimEnd>
]);