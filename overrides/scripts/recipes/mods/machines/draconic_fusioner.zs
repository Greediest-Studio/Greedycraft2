/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50
#crafttweaker reloadable
#reloadable

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
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("draconic_fusioner", 1);
MachineModifier.setMaxParallelism("draconic_fusioner", 256);
MachineModifier.setInternalParallelism("draconic_fusioner", 1);

MMEvents.onMachinePreTick("draconic_fusioner", function(event as MachineTickEvent) {
    var controller = event.controller;
    if (controller.getBlocksInPattern(<additions:basic_fusion_core>) == 1) {
        event.controller.customData = {level : 0 as int};
    } else if (controller.getBlocksInPattern(<additions:wyvern_fusion_core>) == 1) {
        event.controller.customData = {level : 1 as int};
    } else if (controller.getBlocksInPattern(<additions:draconic_fusion_core>) == 1) {
        event.controller.customData = {level : 2 as int};
    } else if (controller.getBlocksInPattern(<additions:chaotic_fusion_core>) == 1) {
        event.controller.customData = {level : 3 as int};
    } else if (controller.getBlocksInPattern(<gct_ores:ordered_fusion_core>) == 1) {
        event.controller.customData = {level : 4 as int};
    } else {
        event.controller.customData = {level : -1 as int};
    }
});

$expand IMachineController$ getFusionLevel() as int {
    if (!isNull(this.customData.level)) {
        return this.customData.level as int;
    } else {
        return -1;
    }
}

RecipeAdapterBuilder.create("draconic_fusioner", "draconicevolution:fusion_crafting_basic")
    .addPreTickHandler(function(event as RecipeTickEvent) {
        if (event.controller.getFusionLevel() < 0) {
            event.setFailed(true, "注入核心等级不足！");
        }
    })
    .addRecipeTooltip("§d核心等级：基础")
    .build();

RecipeAdapterBuilder.create("draconic_fusioner", "draconicevolution:fusion_crafting_wyvern")
    .addPreTickHandler(function(event as RecipeTickEvent) { 
        if (event.controller.getFusionLevel() < 1) {
            event.setFailed(true, "注入核心等级不足！");
        }
    })
    .addRecipeTooltip("§d核心等级：飞龙")
    .build();

RecipeAdapterBuilder.create("draconic_fusioner", "draconicevolution:fusion_crafting_draconic")
    .addPreTickHandler(function(event as RecipeTickEvent) {
        if (event.controller.getFusionLevel() < 2) {
            event.setFailed(true, "注入核心等级不足！");
        }
    })
    .addRecipeTooltip("§d核心等级：神龙")
    .build();

RecipeAdapterBuilder.create("draconic_fusioner", "draconicevolution:fusion_crafting_chaotic")
    .addPreTickHandler(function(event as RecipeTickEvent) {
        if (event.controller.getFusionLevel() < 3) {
            event.setFailed(true, "注入核心等级不足！");
        }
    })
    .addRecipeTooltip("§d核心等级：混沌")
    .build();
