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

MachineModifier.setMaxThreads("elysia_impregnator", 8);
MachineModifier.setInternalParallelism("elysia_impregnator", 4);
MachineModifier.setMaxParallelism("elysia_impregnator", 65536);

MMEvents.onControllerGUIRender("elysia_impregnator", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§e///大型渗透单元控制面板///",
        "§a机器名称：§eELYSIA单元 - 大型渗透单元"
    ];
    event.extraInfo = info;
});

RecipeAdapterBuilder.create("elysia_impregnator", "gctcore:thermal_expansion_transposer")
    .addRecipeTooltip("§d渗透配方支持模块化电容升级，详情请查询“模块化电容”")
    .setMaxThreads(1)
    .build();

RecipeAdapterBuilder.create("elysia_impregnator", "gctcore:nuclearcraft_fluid_infuser")
    .addRecipeTooltip("§d渗透配方支持模块化电容升级，详情请查询“模块化电容”")
    .setMaxThreads(1)
    .build();

RecipeBuilder.newBuilder("sic_compose", "elysia_impregnator", 400)
    .addRecipeTooltip("§d渗透配方支持模块化电容升级，详情请查询“模块化电容”")
    .addItemInput(<ore:fiberSiliconCarbide> * 2)
    .addFluidInput(<liquid:polymethylsilylene_methylene> * 144)
    .addEnergyPerTickInput(2400000)
    .addItemOutput(<nuclearcraft:alloy:14>)
    .setMaxThreads(1)
    .build();

RecipeBuilder.newBuilder("zirfon", "elysia_impregnator", 400)
    .addRecipeTooltip("§d渗透配方支持模块化电容升级，详情请查询“模块化电容”")
    .addItemInput(<ore:sinteredZirconia> * 2)
    .addFluidInput(<liquid:polyphenylene_sulfide> * 144)
    .addEnergyPerTickInput(2400000)
    .addItemOutput(<nuclearcraft:part:19>)
    .setMaxThreads(1)
    .build();