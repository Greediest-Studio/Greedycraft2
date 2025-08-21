/*
 * This script is created for the GreedyCraft Tweaks by 咕咕咕.
 */

#priority 50

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

import scripts.util.machines as MMUtil;

MachineModifier.setMaxThreads("elysia_melter", 8);
MachineModifier.setInternalParallelism("elysia_melter", 4);
MachineModifier.setMaxParallelism("elysia_melter", 65536);

MMEvents.onControllerGUIRender("elysia_melter", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§e///大型熔化单元控制面板///",
        "§a机器名称：§eELYSIA单元 - 大型熔化单元"
    ];
    event.extraInfo = info;
});

RecipeAdapterBuilder.create("elysia_melter", "nuclearcraft:melter")
    .addRecipeTooltip("§d熔化配方支持模块化电容升级，详情请查询“模块化电容”")
    .build();

