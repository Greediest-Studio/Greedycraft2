/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.RecipeTickEvent;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("crimson_extractor", 1);
MachineModifier.setMaxParallelism("crimson_extractor", 4096);
MachineModifier.setInternalParallelism("crimson_extractor", 1);

MMEvents.onControllerGUIRender("crimson_extractor", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///血腥汲取器控制面板///", "§a机器名称：§eLV5 - 血腥汲取器"];
    event.extraInfo = info;
});

function addCrimsonExtractorRecipe(output as IItemStack, input as IItemStack, blood as int) {
    var recipe = RecipeBuilder.newBuilder(input.definition.id + "_" + input.metadata + "_extraction", "crimson_extractor", 20 * blood);
    recipe.addItemInput(input);
    recipe.addItemInput(<additions:crimson_token>).setChance(0.0f);
    recipe.addItemOutput(output);
    recipe.addFluidOutput(<liquid:ichor> * blood);
    recipe.addEnergyPerTickInput(120000);
    recipe.build();
}

addCrimsonExtractorRecipe(<additions:aqualite_ingot>, <additions:dyaquarium_ingot>, 30);
addCrimsonExtractorRecipe(<minecraft:iron_ingot>, <bloodarsenal:base_item:4>, 1);
addCrimsonExtractorRecipe(<minecraft:diamond>, <bloodarsenal:blood_diamond>, 2);
addCrimsonExtractorRecipe(<minecraft:glowstone>, <bloodarsenal:blood_infused_glowstone>, 1);
addCrimsonExtractorRecipe(<minecraft:log>, <bloodarsenal:blood_infused_wooden_log>, 1);
addCrimsonExtractorRecipe(<thaumcraft:fabric>, <crimsonrevelations:crimson_fabric>, 5);
addCrimsonExtractorRecipe(<thaumcraft:fabric>, <additions:crimson_fabric_enhanced>, 50);
addCrimsonExtractorRecipe(<additions:purified_murderite_ingot>, <additions:murderite_ingot>, 200);