/*
 * This script is created for the GreedyCraft II modpack by mc_Edwin.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 1400

import crafttweaker.item.IItemStack;

import mods.jei.JEI;
import mods.randomtweaker.jei.IJeiPanel;
import mods.randomtweaker.jei.IJeiUtils;
import mods.randomtweaker.jei.IJeiRecipe;

var poison_conversionJEI as IJeiPanel = JEI.createJei("poison_conversion", "狼蛛毒素转化");
poison_conversionJEI.setModid("erebus");
poison_conversionJEI.setIcon(<minecraft:spawn_egg>.withTag({EntityTag: {id: "erebus:erebus.tarantula_mini_boss"}}));
poison_conversionJEI.addRecipeCatalyst(<minecraft:spawn_egg>.withTag({EntityTag: {id: "erebus:erebus.tarantula_mini_boss"}}));
poison_conversionJEI.setBackground(IJeiUtils.createBackground(0, 0, 128, 128, "randomtweaker:textures/gui/poison_conversion.png"));
poison_conversionJEI.addSlot(IJeiUtils.createItemSlot("input", 10, 10, true, true));
poison_conversionJEI.addSlot(IJeiUtils.createItemSlot("output", 40, 16, false, true));
poison_conversionJEI.register();

function createPoisonConversionJEI(output as IItemStack, input as IItemStack) {
    var recipe as IJeiRecipe = JEI.createJeiRecipe("poison_conversion");
    recipe.addInput(input);
    recipe.addOutput(output);
    recipe.build();
}

createPoisonConversionJEI(<additions:evilblood_slime_block>, <tconstruct:slime:3>);
createPoisonConversionJEI(<jaopca:block.terrasteel_poisonous>, <botania:storage:1>);
createPoisonConversionJEI(<additions:petrified_ironwood_block>, <twilightforest:block_storage>);