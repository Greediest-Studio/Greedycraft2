/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50

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

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.SmartInterfaceData;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.MachineUpgradeBuilder;
import mods.modularmachinery.MachineUpgradeHelper;

MachineModifier.setMaxThreads("elysia_etcher", 8);
MachineModifier.setInternalParallelism("elysia_etcher", 4);
MachineModifier.setMaxParallelism("elysia_etcher", 65536);

var upgradeMK2 as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder("etcher_mk2_upg", "2级蚀刻升级", 1, 1);
upgradeMK2.addDescriptions("§b令ELYSIA蚀刻单元可以刻蚀2级电路板");
upgradeMK2.addCompatibleMachines("elysia_etcher");
upgradeMK2.buildAndRegister();

var upgradeMK3 as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder("etcher_mk3_upg", "3级蚀刻升级", 1, 1);
upgradeMK3.addDescriptions("§b令ELYSIA蚀刻单元可以刻蚀3级电路板");
upgradeMK3.addCompatibleMachines("elysia_etcher");
upgradeMK3.buildAndRegister();

MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_etcher_mk2>, "etcher_mk2_upg");
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_etcher_mk3>, "etcher_mk3_upg");

MMEvents.onControllerGUIRender("elysia_etcher", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§e///大型蚀刻单元控制面板///",
        "§a机器名称：§eELYSIA单元 - 大型蚀刻单元"
    ];
    event.extraInfo = info;
});

function addEtcherRecipe(output as IItemStack, inputs as IItemStack[], level as int) {
    if (level == 1) {
        var builder = RecipeBuilder.newBuilder(output.definition.id + "_" + output.metadata + "_etcher_recipe", "elysia_etcher", 100);
        for input in inputs {
            builder.addInput(input);
        }
        builder.addOutput(output);
        builder.addEnergyPerTickInput(200);
        builder.addRecipeTooltip("§d蚀刻配方支持模块化电容升级，详情请查询“模块化电容”");
        builder.build();
    } else if (level == 2) {
        var builder = RecipeBuilder.newBuilder(output.definition.id + "_" + output.metadata + "_etcher_recipe", "elysia_etcher", 200);
        for input in inputs {
            builder.addInput(input);
        }
        builder.addOutput(output);
        builder.addEnergyPerTickInput(400);
        builder.addRecipeTooltip("§d蚀刻配方支持模块化电容升级，详情请查询“模块化电容”");
        builder.addRecipeTooltip("§a该配方需要蚀刻升级，详情请查询“模块化电容-蚀刻2”");
        builder.addPreCheckHandler(function(event as RecipeCheckEvent) {
            if (!event.controller.hasMachineUpgrade("etcher_mk2_upg")) {
                event.setFailed("缺少2级蚀刻升级！");
            }
        });
        builder.build();
    } else if (level == 3) {
        var builder = RecipeBuilder.newBuilder(output.definition.id + "_" + output.metadata + "_etcher_recipe", "elysia_etcher", 300);
        for input in inputs {
            builder.addInput(input);
        }
        builder.addOutput(output);
        builder.addEnergyPerTickInput(800);
        builder.addRecipeTooltip("§d蚀刻配方支持模块化电容升级，详情请查询“模块化电容”");
        builder.addRecipeTooltip("§a该配方需要3级蚀刻升级，详情请查询“模块化电容-蚀刻3”");
        builder.addPreCheckHandler(function(event as RecipeCheckEvent) {
            if (!event.controller.hasMachineUpgrade("etcher_mk3_upg")) {
                event.setFailed("缺少3级蚀刻升级！");
            }
        });
        builder.build();
    }
}

addEtcherRecipe(<appliedenergistics2:material:22>, [<minecraft:gold_ingot>, <minecraft:redstone>, <appliedenergistics2:material:5>], 1);
addEtcherRecipe(<appliedenergistics2:material:23>, [<appliedenergistics2:material:10>, <minecraft:redstone>, <appliedenergistics2:material:5>], 1);
addEtcherRecipe(<appliedenergistics2:material:24>, [<minecraft:diamond>, <minecraft:redstone>, <appliedenergistics2:material:5>], 1);
addEtcherRecipe(<threng:material:6>, [<threng:material:5>, <minecraft:redstone>, <appliedenergistics2:material:5>], 1);
addEtcherRecipe(<threng:material:14>, [<threng:material:13>, <minecraft:redstone>, <appliedenergistics2:material:5>], 1);
addEtcherRecipe(<crazyae:material:16>, [<appliedenergistics2:material:22>, <appliedenergistics2:material:6>, <appliedenergistics2:material:24>], 1);
addEtcherRecipe(<crazyae:material:48>, [<crazyae:material:16>, <appliedenergistics2:material:6>, <crazyae:fluixilized_block>], 1);
addEtcherRecipe(<additions:wireless_processor>, [<additions:germanium_ingot>, <minecraft:redstone>, <appliedenergistics2:material:5>], 2);
addEtcherRecipe(<additions:logic_processor_2>, [<thermalfoundation:material:134>, <minecraft:redstone>, <additions:germanium_ingot>], 2);
addEtcherRecipe(<additions:calculation_processor_2>, [<actuallyadditions:item_crystal:4>, <minecraft:redstone>, <additions:germanium_ingot>], 2);
addEtcherRecipe(<additions:engineering_processor_2>, [<defiledlands:scarlite>, <minecraft:redstone>, <additions:germanium_ingot>], 2);
addEtcherRecipe(<additions:logic_processor_3>, [<additions:porpezite_ingot>, <minecraft:redstone>, <additions:gallium_indium_phosphide>], 3);
addEtcherRecipe(<additions:calculation_processor_3>, [<avaritia:resource:1>, <minecraft:redstone>, <additions:gallium_indium_phosphide>], 3);
addEtcherRecipe(<additions:engineering_processor_3>, [<nuclearcraft:gem:1>, <minecraft:redstone>, <additions:gallium_indium_phosphide>], 3);