/*
 * This script is created for the GreedyCraft Tweaks by 孤梦.
 */

#priority 0

import crafttweaker.world.IWorld;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.block.IBlock;
import crafttweaker.block.IBlockDefinition;
import crafttweaker.world.IBlockPos;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.data.IData;
import crafttweaker.util.Math;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;

MachineModifier.setMaxThreads("elysia_reactor", 8);
MachineModifier.setInternalParallelism("elysia_reactor", 4);
MachineModifier.setMaxParallelism("elysia_reactor", 65536);

MMEvents.onControllerGUIRender("elysia_reactor", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§e///大型反应单元控制面板///",
        "§a机器名称：§eELYSIA单元 - 大型反应单元"
    ];
    event.extraInfo = info;
});

RecipeAdapterBuilder.create("elysia_reactor", "nuclearcraft:chemical_reactor")
    .addRecipeTooltip("§d化学反应配方支持模块化电容升级，详情请查询“模块化电容”")
    .build();