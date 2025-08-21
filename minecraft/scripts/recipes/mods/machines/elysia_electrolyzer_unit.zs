/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

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

MachineModifier.setMaxThreads("elysia_electrolyzer", 8);
MachineModifier.setInternalParallelism("elysia_electrolyzer", 4);
MachineModifier.setMaxParallelism("elysia_electrolyzer", 65536);

MMEvents.onControllerGUIRender("elysia_electrolyzer", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§e///大型电解单元控制面板///",
        "§a机器名称：§eELYSIA单元 - 大型电解单元"
    ];
    event.extraInfo = info;
});

RecipeAdapterBuilder.create("elysia_electrolyzer", "nuclearcraft:electrolyzer")
    .addRecipeTooltip("§d电解配方支持模块化电容升级，详情请查询“模块化电容”")
    .build();