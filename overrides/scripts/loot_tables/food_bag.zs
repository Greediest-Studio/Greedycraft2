/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */

#priority 72

import loottweaker.vanilla.loot.LootTables;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import loottweaker.vanilla.loot.Conditions;
import loottweaker.vanilla.loot.Functions;
import loottweaker.LootTweaker;

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;  

import scripts.util.loot_tables as LootUtil;

val foodTable = LootTweaker.newTable("loottweaker:food_bag_loot_table");
var foodTableMainPool = foodTable.addPool("main", 6, 14, 0, 0);
for ingredient in foodList {
    for item in ingredient.items {
        if (item.metadata != 32767) {
            foodTableMainPool.addItemEntry(item, 1, 1, [Functions.setCount(1, 4)], []);
        }
    }
}
