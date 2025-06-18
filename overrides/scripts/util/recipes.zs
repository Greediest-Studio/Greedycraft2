/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */

#priority 32010

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

function addShaped(name as string, output as IItemStack, recipe as IIngredient[][]) {
    // TODO: Handle shaped recipe here

    recipes.addShaped(name, output, recipe);
}

function addShapeless(name as string, output as IItemStack, recipe as IIngredient[]) {
    // TODO: Handle shapeless recipe here

    recipes.addShapeless(name, output, recipe);
}

function addShapelessOf(name as string, output as IItemStack, ingredient as IIngredient, count as int) {
    var recipe as IIngredient[] = [];
    for i in 0 to count {
        recipe += ingredient;
    }
    addShapeless(name, output, recipe);
}

function remove(output as IIngredient) {
    // TODO: Handle removed recipe here

    recipes.remove(output * 1);
}

function removeByRecipeName(recipeName as string) {
    // TODO: Handle removed recipe here
    
    recipes.removeByRecipeName(recipeName);
}

function removeAndAdd(name as string, output as IItemStack, recipe as IIngredient[][]) {
    remove(output);
    addShaped(name, output, recipe);
}

function removeAndAddShapeless(name as string, output as IItemStack, recipe as IIngredient[]) {
    remove(output);
    addShapeless(name, output, recipe);
}

function addModeRecipe(name as string, output as IItemStack, normalRecipe as IIngredient[][]) {
        addShaped(name, output, normalRecipe);
}

function addCompressingRecipe(original as IItemStack, compressed as IItemStack) {
    recipes.addShaped(original.definition.id.replace(":", "_") + "_compress", compressed, [
        [original, original, original],
        [original, original, original],
        [original, original, original]
    ] as IIngredient[][]);
    recipes.addShapeless(original.definition.id.replace(":", "_") + "_decompress", original * 9, [compressed] as IIngredient[]);
}

function addDyeingRecipe(name as string, input as IIngredient, output as IItemStack, reversedOrder as bool) {
    for i in 0 to 16 {
        if (reversedOrder) {
            addShapeless(name + "_" + i, output.withDamage(15 - i), [input, dyeList[i]]);
        } else {
            addShapeless(name + "_" + i, output.withDamage(i), [input, dyeList[i]]);
        }
    }
}
