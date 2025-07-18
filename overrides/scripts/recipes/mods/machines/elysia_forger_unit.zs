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
import mods.modularmachinery.SmartInterfaceType;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;

MachineModifier.setMaxThreads("elysia_forger", 1);
MachineModifier.setInternalParallelism("elysia_forger", 4);
MachineModifier.setMaxParallelism("elysia_forger", 65536);

MachineModifier.addSmartInterfaceType("elysia_forger", SmartInterfaceType.create("模式", 0));

RecipeAdapterBuilder.create("elysia_forger", "thermalexpansion:compactor_plate")
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        if (event.controller.getSmartInterfaceData("模式").value != 0) {
            event.setFailed("智能输入接口传入的模式数值不匹配！");
        }
    })
    .addRecipeTooltip("§d铸造配方支持模块化电容升级，详情请查询“模块化电容”")
    .addRecipeTooltip("§e需求智能数据接口数值：0")
    .build();

RecipeAdapterBuilder.create("elysia_forger", "thermalexpansion:compactor_gear")
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        if (event.controller.getSmartInterfaceData("模式").value != 1) {
            event.setFailed("智能输入接口传入的模式数值不匹配！");
        }
    })
    .addRecipeTooltip("§d铸造配方支持模块化电容升级，详情请查询“模块化电容”")
    .addRecipeTooltip("§e需求智能数据接口数值：1")
    .build();