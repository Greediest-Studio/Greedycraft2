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
import mods.modularmachinery.ControllerMode;
import mods.modularmachinery.FactoryRecipeThread;

MachineModifier.setMaxThreads("elysia_forger", 8);
MachineModifier.setInternalParallelism("elysia_forger", 4);
MachineModifier.setMaxParallelism("elysia_forger", 65536);

MachineModifier.addControllerMode("elysia_forger",
    ControllerMode.create("模式", 0)
        .addMode(0, "板材模式")
        .addMode(1, "齿轮模式")
        .setControllerButtonVisible(true)
        .setControllerButtonTooltip(
            "§e按下按钮切换运行模式",
            "§a当前模式：§f%s"
        )
);

MMEvents.onControllerGUIRender("elysia_forger", function(event as ControllerGUIRenderEvent) {
    var mode as int = event.controller.getControllerMode("模式");
    var info as string[] = [
        "§e///大型铸造单元控制面板///",
        "§a机器名称：§eELYSIA单元 - 大型铸造单元",
        "§a当前模式：§f" ~ (mode == 0 ? "板材模式" : "齿轮模式")
    ];
    event.extraInfo = info;
});

RecipeAdapterBuilder.create("elysia_forger", "thermalexpansion:compactor_plate")
    .addModeSelect("模式", 0)
    .addRecipeTooltip("§d铸造配方支持模块化电容升级，详情请查询“模块化电容”")
    .addRecipeTooltip("§e需求模式：板材模式")
    .setMaxThreads(1)
    .build();

RecipeAdapterBuilder.create("elysia_forger", "thermalexpansion:compactor_gear")
    .addModeSelect("模式", 1)
    .addRecipeTooltip("§d铸造配方支持模块化电容升级，详情请查询“模块化电容”")
    .addRecipeTooltip("§e需求模式：齿轮模式")
    .setMaxThreads(1)
    .build();