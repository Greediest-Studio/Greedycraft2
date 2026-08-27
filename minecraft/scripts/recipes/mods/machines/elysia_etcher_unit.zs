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

MachineModifier.addSmartInterfaceType("elysia_etcher", SmartInterfaceType.create("模式", 0));

var upgradeMK2 as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder("etcher_mk2_upg", "2级蚀刻升级", 1, 1);
upgradeMK2.addDescriptions("§b令ELYSIA蚀刻单元可以刻蚀2级电路板");
upgradeMK2.addCompatibleMachines("elysia_etcher");
upgradeMK2.buildAndRegister();

var upgradeMK3 as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder("etcher_mk3_upg", "3级蚀刻升级", 1, 1);
upgradeMK3.addDescriptions("§b令ELYSIA蚀刻单元可以刻蚀3级电路板");
upgradeMK3.addCompatibleMachines("elysia_etcher");
upgradeMK3.buildAndRegister();

var upgradeMK4 as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder("etcher_mk4_upg", "4级蚀刻升级", 1, 1);
upgradeMK4.addDescriptions("§b使ELYSIA蚀刻单元可以刻蚀4级电路板");
upgradeMK4.addCompatibleMachines("elysia_etcher");
upgradeMK4.buildAndRegister();

MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_etcher_mk2>, "etcher_mk2_upg");
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_etcher_mk3>, "etcher_mk3_upg");
MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_etcher_mk4>, "etcher_mk4_upg");

MMEvents.onControllerGUIRender("elysia_etcher", function(event as ControllerGUIRenderEvent) {
    var hasRuneModule = event.controller.hasModule("rune");
    var hasAdvancedModule = event.controller.hasModule("advanced");
    var ModuleList as string[] = [];
    if (hasRuneModule) ModuleList += "§e符文模块";
    if (hasAdvancedModule) ModuleList += "§e升级模块";
    if (ModuleList.length == 0) ModuleList += "§c无";
    var showModule as string = "";
    for Module in ModuleList {
        if (Module != ModuleList[0]) {
            showModule = showModule + " " + Module;
        } else {
            showModule = Module;
        }
    }
    var info as string[] = [
        "§e///大型蚀刻单元控制面板///",
        "§a机器名称：§eELYSIA单元 - 大型蚀刻单元",
        "§a附属模块：" + showModule
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
        builder.setMaxThreads(1);
        builder.addSmartInterfaceDataInput("模式", 0);
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
        builder.setMaxThreads(1);
        builder.addSmartInterfaceDataInput("模式", 0);
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
        builder.setMaxThreads(1);
        builder.addSmartInterfaceDataInput("模式", 0);
        builder.build();
    } else if (level == 4) {
        var builder = RecipeBuilder.newBuilder(output.definition.id + "_" + output.metadata + "_etcher_recipe", "elysia_etcher", 400);
        for input in inputs {
            builder.addInput(input);
        }
        builder.addOutput(output);
        builder.addEnergyPerTickInput(1600);
        builder.addRecipeTooltip("§d蚀刻配方支持模块化电容升级，详情请查询“模块化电容”");
        builder.addRecipeTooltip("§a该配方需要4级蚀刻升级，详情请查询“模块化电容-蚀刻4”");
        builder.addPreCheckHandler(function(event as RecipeCheckEvent) {
            if (!event.controller.hasMachineUpgrade("etcher_mk4_upg")) {
                event.setFailed("缺少4级蚀刻升级！");
            }
        });
        builder.setMaxThreads(1);
        builder.addSmartInterfaceDataInput("模式", 0);
        builder.build();
    }
}

addEtcherRecipe(<appliedenergistics2:material:22>, [<minecraft:gold_ingot>, <minecraft:redstone>, <appliedenergistics2:material:5>], 1);
addEtcherRecipe(<appliedenergistics2:material:23>, [<appliedenergistics2:material:10>, <minecraft:redstone>, <appliedenergistics2:material:5>], 1);
addEtcherRecipe(<appliedenergistics2:material:24>, [<minecraft:diamond>, <minecraft:redstone>, <appliedenergistics2:material:5>], 1);
addEtcherRecipe(<cells:overclocked_processor>, [<cells:compressed_calculation_print>, <appliedenergistics2:material:6>, <cells:compressed_silicon_print>], 1);
addEtcherRecipe(<cells:overclocked_processor:1>, [<cells:compressed_engineering_print>, <appliedenergistics2:material:6>, <cells:compressed_silicon_print>], 1);
addEtcherRecipe(<cells:overclocked_processor:2>, [<cells:compressed_logic_print>, <appliedenergistics2:material:6>, <cells:compressed_silicon_print>], 1);
addEtcherRecipe(<cells:singularity_processor>, [<cells:compressed_calculation_print:3>, <avaritia:resource:4>, <cells:compressed_silicon_print:3>], 1);
addEtcherRecipe(<cells:singularity_processor:1>, [<cells:compressed_engineering_print:3>, <avaritia:resource:4>, <cells:compressed_silicon_print:3>], 1);
addEtcherRecipe(<cells:singularity_processor:2>, [<cells:compressed_logic_print:3>, <avaritia:resource:4>, <cells:compressed_silicon_print:3>], 1);
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
addEtcherRecipe(<additions:logic_processor_4>, [<moretcon:ingotirradium>, <minecraft:redstone>, <additions:cadmium_chalcogenide_ingot>], 4);
addEtcherRecipe(<additions:calculation_processor_4>, [<additions:arimite_ingot>, <minecraft:redstone>, <additions:cadmium_chalcogenide_ingot>], 4);
addEtcherRecipe(<additions:engineering_processor_4>, [<additions:gemundyingember>, <minecraft:redstone>, <additions:cadmium_chalcogenide_ingot>], 4);

function addInscriberRecipe(output as IItemStack, input as IIngredient, level as int) {
    var builder = RecipeBuilder.newBuilder(output.definition.id + "_" + output.metadata + "_inscriber_recipe", "elysia_etcher", 60);
    builder.addInput(input)
        .addOutput(output)
        .addEnergyPerTickInput(800)
        .addRecipeTooltip("§d蚀刻配方支持模块化电容升级，详情请查询“模块化电容”")
        .setMaxThreads(1)
        .addSmartInterfaceDataInput("模式", 1);
    if (level > 1) {
        builder.addRecipeTooltip("§a该配方需要" + level + "级蚀刻升级，详情请查询“模块化电容-蚀刻" + level + "”");
        builder.addPreCheckHandler(function(event as RecipeCheckEvent) {
            if (!event.controller.hasMachineUpgrade("etcher_mk" + level + "_upg")) {
                event.setFailed("缺少" + level + "级蚀刻升级！");
            }
        });
    }
    builder.build();
}

addInscriberRecipe(<appliedenergistics2:material:20>, <ore:itemSilicon>, 1);
addInscriberRecipe(<appliedenergistics2:material:16>, <ore:crystalPureFluix>, 1);
addInscriberRecipe(<appliedenergistics2:material:17>, <ore:gemDiamond>, 1);
addInscriberRecipe(<appliedenergistics2:material:18>, <ore:ingotGold>, 1);
addInscriberRecipe(<additions:germanium_plate>, <ore:ingotGermanium>, 2);
addInscriberRecipe(<additions:calculation_circuit_printed_2>, <ore:crystalEmeraldic>, 2);
addInscriberRecipe(<additions:engineering_circuit_printed_2>, <ore:gemRuby>, 2);
addInscriberRecipe(<additions:logic_circuit_printed_2>, <ore:ingotPlatinum>, 2);
addInscriberRecipe(<additions:ga_in_p2_plate>, <ore:ingotGalliumIndiumPhosphide>, 3);
addInscriberRecipe(<additions:calculation_circuit_printed_3>, <ore:ingotCrystalMatrix>, 3);
addInscriberRecipe(<additions:engineering_circuit_printed_3>, <ore:gemBoronNitride>, 3);
addInscriberRecipe(<additions:logic_circuit_printed_3>, <ore:ingotPorpezite>, 3);
addInscriberRecipe(<additions:cadmium_chalcogenide_plate>, <ore:ingotCadmiumChalcogenide>, 4);
addInscriberRecipe(<additions:calculation_circuit_printed_4>, <ore:ingotArimite>, 4);
addInscriberRecipe(<additions:engineering_circuit_printed_4>, <ore:gemUndyingEmber>, 4);
addInscriberRecipe(<additions:logic_circuit_printed_4>, <ore:ingotIrradium>, 4);

function addManaRuneRecipe(output as IItemStack, id as int, level as int, input as IIngredient) {
    val catalystList as IIngredient[] = [
        <ore:dustManasteel>,
        <ore:dustElvenElementium>,
        <ore:dustTerrasteel>,
        <ore:dustOrichalcos>,
        <ore:dustOriginalSteel>
    ];

    RecipeBuilder.newBuilder("rune_etcher_recipe_" + level + "_" + id, "elysia_etcher", 100)
        .addItemInput(catalystList[level]).setChance(0.0f)
        .addItemInput(<ore:runeEmptyB> * 4)
        .addItemInput(input)
        .addItemOutput(output * 4)
        .addEnergyPerTickInput(800)
        .addRecipeTooltip("§d蚀刻配方支持模块化电容升级，详情请查询“模块化电容”")
        .addRecipeTooltip("§a需要模块：符文模块")
        .setMaxThreads(1)
        .withModule(["rune"])
        .addSmartInterfaceDataInput("模式", 2)
        .build();
}

addManaRuneRecipe(<botania:rune:8>, 1, 0, <ore:manaPearl>);
addManaRuneRecipe(<botanicadds:rune_tp>, 2, 0, <actuallyadditions:block_misc:6>);
addManaRuneRecipe(<botanicadds:rune_energy>, 3, 0, <ore:blockRedstone>);

addManaRuneRecipe(<botania:rune:0>, 1, 1, <ore:sugarcane>);
addManaRuneRecipe(<botania:rune:1>, 2, 1, <ore:ingotBrickNether>);
addManaRuneRecipe(<botania:rune:2>, 3, 1, <ore:blockCoal>);
addManaRuneRecipe(<botania:rune:3>, 4, 1, <ore:feather>);

addManaRuneRecipe(<botania:rune:4>, 1, 2, <ore:treeSapling>);
addManaRuneRecipe(<botania:rune:5>, 2, 2, <ore:slimeball>);
addManaRuneRecipe(<botania:rune:6>, 3, 2, <ore:spiderEye>);
addManaRuneRecipe(<botania:rune:7>, 4, 2, <minecraft:snow>);

addManaRuneRecipe(<botania:rune:9>, 1, 3, <minecraft:saddle>);
addManaRuneRecipe(<botania:rune:10>, 2, 3, <ore:foodChocolate>);
addManaRuneRecipe(<botania:rune:11>, 3, 3, <ore:gemDiamond>);
addManaRuneRecipe(<botania:rune:12>, 4, 3, <ore:bed>);
addManaRuneRecipe(<botania:rune:13>, 5, 3, <ore:rodBlaze>);
addManaRuneRecipe(<botania:rune:14>, 6, 3, <ore:pearlEnderEye>);
addManaRuneRecipe(<botania:rune:15>, 7, 3, <ore:nuggetNetherStar>);

addManaRuneRecipe(<additions:asgard_rune>, 1, 4, <ore:ingotSkyAlloy>);
addManaRuneRecipe(<additions:vanaheim_rune>, 2, 4, <ore:ingotTerraAlloy>);
addManaRuneRecipe(<additions:alfheim_rune>, 3, 4, <ore:soulBotanical>);
addManaRuneRecipe(<additions:midgard_rune>, 4, 4, <ore:compressed4xDirt>);
addManaRuneRecipe(<additions:jotunheim_rune>, 5, 4, <ore:eyeCyclops>);
addManaRuneRecipe(<additions:nidavellir_rune>, 6, 4, <ore:ingotDullium>);
addManaRuneRecipe(<additions:muspelheim_rune>, 7, 4, <ore:ingotFireAlloy>);
addManaRuneRecipe(<additions:niflheim_rune>, 8, 4, <ore:ingotIceAlloy>);
addManaRuneRecipe(<additions:helheim_rune>, 9, 4, <ore:gemRemorseful>);
addManaRuneRecipe(<additions:ginnunga_rune>, 10, 4, <minecraft:golden_apple:1>);