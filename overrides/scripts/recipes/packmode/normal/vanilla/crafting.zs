/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */ 

#priority 40

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

val removedRecipes as IIngredient[] = [
    <minecraft:enchanting_table>,
];

for ingredient in removedRecipes {
    recipes.remove(ingredient);
}

// Shaped

recipes.addShaped("auto_gen_-1702953212", <minecraft:enchanting_table>, [
    [null, <minecraft:book>, null],
    [<minecraft:diamond_block>, <minecraft:wool:14>, <minecraft:diamond_block>],
    [<additions:compressed_experience_block>, <additions:compressed_experience_block>, <additions:compressed_experience_block>]
]);

recipes.addShaped("auto_gen_-1971544957", <additions:blueprint>, [
    [<ore:dyeLightBlue>, <ore:dyeLightBlue>, <ore:dyeLightBlue>],
    [<ore:dyeLightBlue>, <ore:pattern>, <ore:dyeLightBlue>],
    [<ore:dyeLightBlue>, <ore:dyeLightBlue>, <ore:dyeLightBlue>]
]);

recipes.addShaped("auto_gen_-226107769", <additions:twilight_gem>, [
    [<ore:treeSapling>, <botania:fertilizer>, <ore:treeSapling>],
    [<ore:dustDiamond>, <thaumcraft:salis_mundus>, <ore:dustDiamond>],
    [<ore:treeSapling>, <ore:manaDiamond>, <ore:treeSapling>]
]);

recipes.addShaped("auto_gen_-1473452503", <additions:twilight_shield>, [
    [<twilightforest:ironwood_ingot>, <twilightforest:knightmetal_ingot>, <twilightforest:ironwood_ingot>],
    [<twilightforest:fiery_ingot>, <twilightforest:alpha_fur>, <twilightforest:fiery_ingot>],
    [null, <twilightforest:carminite>, null]
]);

// Shapeless

recipes.addShapeless("auto_gen_-1155325776", <additions:blueprint_shuriken>, [<additions:blueprint>, <ore:alloyElite>]);
