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
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

import scripts.util.machines as MMUtil;

MachineModifier.setMaxThreads("builder_1", 8);
MachineModifier.setMaxThreads("builder_2", 10);
MachineModifier.setMaxThreads("builder_3", 12);
MachineModifier.setMaxThreads("builder_4", 16);
MachineModifier.setMaxThreads("builder_5", 20);
MachineModifier.setInternalParallelism("builder_1", 1);
MachineModifier.setInternalParallelism("builder_2", 1);
MachineModifier.setInternalParallelism("builder_3", 1);
MachineModifier.setInternalParallelism("builder_4", 1);
MachineModifier.setInternalParallelism("builder_5", 1);
MachineModifier.setMaxParallelism("builder_1", 256);
MachineModifier.setMaxParallelism("builder_2", 256);
MachineModifier.setMaxParallelism("builder_3", 256);
MachineModifier.setMaxParallelism("builder_4", 256);
MachineModifier.setMaxParallelism("builder_5", 256);
MachineModifier.addCoreThread("builder_1", FactoryRecipeThread.createCoreThread("能量供给模块"));
MachineModifier.addCoreThread("builder_2", FactoryRecipeThread.createCoreThread("能量供给模块"));
MachineModifier.addCoreThread("builder_3", FactoryRecipeThread.createCoreThread("能量供给模块"));
MachineModifier.addCoreThread("builder_4", FactoryRecipeThread.createCoreThread("能量供给模块"));
MachineModifier.addCoreThread("builder_5", FactoryRecipeThread.createCoreThread("能量供给模块"));

function addBuilderRecipe(controller as IItemStack, inputs as IIngredient[], level as int, basicTick as int) {
    var tick = basicTick;
    for i in level to 6 {
        var builder = RecipeBuilder.newBuilder(controller.definition.id ~ (i as string), "builder_" + i, tick);
        for input in inputs {
            builder.addItemInput(input);
        }
        builder.addEnergyPerTickInput((pow(4, i as double - 1) as int) * 256);
        builder.addFluidPerTickInput(<liquid:redstone> * 10);
        builder.addItemOutput(controller);
        builder.build();
        tick /= 2;
    }
}

MMEvents.onControllerGUIRender("builder_1", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///基础装配室控制面板///", "§a机器名称：§eLV1 - 基础装配室"];
    event.extraInfo = info;
});
MMEvents.onControllerGUIRender("builder_2", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///强化装配室控制面板///", "§a机器名称：§eLV2 - 强化装配室"];
    event.extraInfo = info;
});
MMEvents.onControllerGUIRender("builder_3", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///进阶装配室控制面板///", "§a机器名称：§eLV3 - 进阶装配室"];
    event.extraInfo = info;
});
MMEvents.onControllerGUIRender("builder_4", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///炫光装配室控制面板///", "§a机器名称：§eLV4 - 炫光装配室"];
    event.extraInfo = info;
});
MMEvents.onControllerGUIRender("builder_5", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///终极装配室控制面板///", "§a机器名称：§eLV5 - 终极装配室"];
    event.extraInfo = info;
});

//LV1
addBuilderRecipe(<modularmachinery:durasteel_forge_factory_controller>, [
    <appliedenergistics2:material:22> * 24,
    <appliedenergistics2:material:23> * 24,
    <appliedenergistics2:material:24> * 24,
    <ore:ingotModularium> * 32,
    <ore:ingotVibrantAlloy> * 32,
    <ore:ingotStainlessSteel> * 24,
    <ore:ingotManasteel> * 16,
    <ore:ingotThaumium> * 16,
    <ore:ingotAurorianSteel> * 8,
    <ore:ingotLavaSolid> * 8,
    <ore:ingotKnightslime> * 8,
    <ore:ingotQueenslime> * 4,
    <ore:ingotEmperorslime> * 4
], 1, 8000);

addBuilderRecipe(<modularmachinery:blood_altar_factory_controller>, [
    <appliedenergistics2:material:22> * 10,
    <appliedenergistics2:material:23> * 8,
    <appliedenergistics2:material:24> * 4,
    <ore:ingotModularium> * 24,
    <ore:ingotIron> * 24,
    <ore:ingotGold> * 20,
    <ore:ingotChromium> * 20,
    <ore:ingotBloodInfusedIron> * 8,
    <ore:ingotSentientMetal> * 4
], 1, 2400);

addBuilderRecipe(<modularmachinery:basic_miner_factory_controller>, [
    <appliedenergistics2:material:22> * 8,
    <appliedenergistics2:material:23> * 4,
    <appliedenergistics2:material:24> * 18,
    <ore:ingotModularium> * 36,
    <ore:ingotSteel> * 24,
    <ore:ingotInvar> * 20,
    <ore:ingotElectrum> * 20,
    <ore:ingotSignalum> * 16,
    <ore:ingotDarkSteel> * 16,
    <ore:ingotConstantan> * 16,
    <ore:ingotRoyalAlloy> * 12,
    <ore:ingotManyullyn> * 8,
    <ore:ingotShadowBar> * 8,
    <ore:ingotBalancite> * 4
], 1, 4800);

addBuilderRecipe(<modularmachinery:exp_power_generator_factory_controller>, [
    <appliedenergistics2:material:22> * 10,
    <appliedenergistics2:material:23> * 10,
    <appliedenergistics2:material:24> * 8,
    <crazyae:material:48> * 2,
    <ore:ingotExperience> * 64,
    <ore:ingotModularium> * 24,
    <ore:ingotElvenElementium> * 16,
    <ore:ingotGermanium> * 8,
    <ore:itemSilicon> * 32
], 1, 3600);

addBuilderRecipe(<modularmachinery:loot_power_generator_factory_controller>, [
    <appliedenergistics2:material:22> * 6,
    <appliedenergistics2:material:23> * 14,
    <appliedenergistics2:material:24> * 8,
    <crazyae:material:48> * 2,
    <ore:ingotBrick> * 64,
    <ore:ingotModularium> * 24,
    <ore:ingotHellite> * 24,
    <ore:ingotAstralStarmetal> * 16,
    <ore:ingotRedstoneAlloy> * 16,
    <ore:ingotFlamium> * 8,
    <ore:ingotChillinium> * 8,
    <ore:itemSilicon> * 32
], 1, 3600);

addBuilderRecipe(<modularmachinery:empowerer_factory_controller>, [
    <appliedenergistics2:material:22> * 8,
    <appliedenergistics2:material:23> * 8,
    <appliedenergistics2:material:24> * 16,
    <crazyae:material:16> * 4,
    <ore:ingotModularium> * 32,
    <ore:gemQuartzBlack> * 32,
    <ore:gemQuartz> * 32,
    <actuallyadditions:item_crystal_empowered> * 4,
    <actuallyadditions:item_crystal_empowered:1> * 4,
    <actuallyadditions:item_crystal_empowered:2> * 4,
    <actuallyadditions:item_crystal_empowered:3> * 4,
    <actuallyadditions:item_crystal_empowered:4> * 4,
    <actuallyadditions:item_crystal_empowered:5> * 4
], 1, 3200);

addBuilderRecipe(<modularmachinery:builder_2_factory_controller>, [
    <additions:logic_processor_2> * 6,
    <additions:calculation_processor_2> * 6,
    <additions:engineering_processor_2> * 6,
    <crazyae:material:16> * 3,
    <crazyae:material:48> * 3,
    <ore:ingotModularium> * 48,
    <ore:ingotDurasteel> * 16,
    <ore:ingotDreadium> * 16,
    <ore:ingotLiquifiedCoralium> * 16,
    <ore:ingotBoundMetal> * 8,
    <ore:ingotMortum> * 6,
    <ore:ingotTerrasteel> * 4,
    <ore:ingotAdamant> * 4,
    <ore:ingotGodslime> * 4
], 1, 2400);

//LV2
addBuilderRecipe(<modularmachinery:gene_builder_factory_controller>, [
    <additions:logic_processor_2> * 8,
    <additions:calculation_processor_2> * 12,
    <additions:engineering_processor_2> * 4,
    <crazyae:material:16> * 4,
    <ore:ingotModularium> * 64,
    <ore:ingotCytosinite> * 16,
    <ore:ingotThyminite> * 16,
    <ore:ingotGuaninite> * 16,
    <ore:ingotAdeninite> * 16,
    <ore:ingotFusionMatrix> * 2,
    <ore:ingotUracilite> * 2,
    <ore:gemCincinnasite> * 64
], 2, 4000);

addBuilderRecipe(<modularmachinery:auto_soul_forge_factory_controller>, [
    <additions:logic_processor_2> * 4,
    <additions:calculation_processor_2> * 12,
    <additions:engineering_processor_2> * 4,
    <crazyae:material:17> * 4,
    <ore:ingotModularium> * 48,
    <ore:ingotBloodInfusedIron> * 32,
    <ore:ingotSentientMetal> * 24,
    <ore:ingotDemonicMetal> * 24,
    <ore:ingotEvilMetal> * 16,
    <ore:ingotBoundMetal> * 8,
    <bloodmagic:demon_crucible>,
    <bloodmagic:demon_crystallizer>
], 2, 2400);

addBuilderRecipe(<modularmachinery:mana_powereducer_factory_controller>, [
    <additions:logic_processor_2> * 2,
    <additions:calculation_processor_2> * 8,
    <additions:engineering_processor_2> * 8,
    <crazyae:material:17> * 2,
    <ore:ingotModularium> * 32,
    <ore:ingotManasteel> * 32,
    <ore:ingotElvenElementium> * 24,
    <ore:ingotMithril> * 24,
    <ore:ingotHolium> * 24,
    <ore:ingotTerrasteel> * 8,
    <ore:ingotElfsteel> * 4,
    <ore:ingotGaiasteel> * 2
], 2, 2800);

addBuilderRecipe(<modularmachinery:mana_liquefactor_factory_controller>, [
    <additions:logic_processor_2> * 8,
    <additions:calculation_processor_2> * 2,
    <additions:engineering_processor_2> * 8,
    <crazyae:material:17> * 2,
    <ore:ingotModularium> * 32,
    <ore:ingotManasteel> * 32,
    <ore:ingotElvenElementium> * 24,
    <ore:ingotMithril> * 24,
    <ore:ingotHolium> * 24,
    <ore:ingotTerrasteel> * 8,
    <ore:ingotGaia> * 4,
    <ore:ingotGaiasteel> * 2
], 2, 2800);

addBuilderRecipe(<modularmachinery:draconic_fusioner_factory_controller>, [
    <additions:logic_processor_2> * 12,
    <additions:calculation_processor_2> * 12,
    <additions:engineering_processor_2> * 16,
    <crazyae:material:48> * 6,
    <ore:ingotModularium> * 128,
    <ore:ingotDraconium> * 96,
    <ore:ingotWitherium> * 96,
    <ore:ingotDraconiumAwakened> * 32,
    <ore:ingotWitheriumRelifed> * 32,
    <ore:ingotEndSteel> * 16,
    <ore:ingotElectronium> * 4,
    <ore:endstone> * 64
], 2, 10000);

addBuilderRecipe(<modularmachinery:flux_melter_factory_controller>, [
    <additions:logic_processor_2> * 4,
    <additions:calculation_processor_2> * 6,
    <additions:engineering_processor_2> * 6,
    <crazyae:material:48> * 8,
    <ore:ingotModularium> * 48,
    <ore:ingotOsgloglas> * 32,
    <ore:ingotElectrumFlux> * 32,
    <ore:ingotGlowingSignalum> * 28,
    <ore:ingotGelidEnderium> * 24,
    <ore:ingotNihilite> * 20,
    <ore:ingotAeonsteel> * 12,
    <ore:ingotDurasteel> * 4
], 2, 2800);

addBuilderRecipe(<modularmachinery:flux_reducer_factory_controller>, [
    <additions:logic_processor_2> * 6,
    <additions:calculation_processor_2> * 4,
    <additions:engineering_processor_2> * 6,
    <crazyae:material:48> * 8,
    <ore:ingotModularium> * 48,
    <ore:ingotOsgloglas> * 32,
    <ore:ingotElectrumFlux> * 32,
    <ore:ingotGlowingSignalum> * 28,
    <ore:ingotGelidEnderium> * 24,
    <ore:ingotSolarium> * 20,
    <ore:ingotAeonsteel> * 12,
    <ore:ingotDurasteel> * 4
], 2, 2800);

addBuilderRecipe(<modularmachinery:organic_infuser_factory_controller>, [
    <additions:logic_processor_2> * 4,
    <additions:calculation_processor_2> * 4,
    <additions:engineering_processor_2> * 13,
    <crazyae:material:16> * 4,
    <crazyae:material:48> * 2,
    <ore:ingotModularium> * 64,
    <ore:ingotInferium> * 32,
    <ore:ingotPrudentium> * 24,
    <ore:ingotIntermedium> * 16,
    <ore:ingotSuperium> * 8,
    <ore:ingotSupremium> * 4,
    <ore:ingotInsanium> * 2,
    <ore:gemApatite> * 128
], 2, 3600);

addBuilderRecipe(<modularmachinery:matrix_fusioner_factory_controller>, [
    <additions:logic_processor_2> * 6,
    <additions:calculation_processor_2> * 6,
    <additions:engineering_processor_2> * 6,
    <crazyae:material:16> * 4,
    <threng:material:14> * 4,
    <ore:ingotModularium> * 64,
    <ore:ingotTerrax> * 16,
    <ore:ingotTiberium> * 16,
    <ore:ingotFractum> * 16,
    <ore:ingotViolium> * 16,
    <ore:ingotDyonite> * 16,
    <ore:ingotLumix> * 16,
    <ore:ingotNiob> * 16,
    <ore:ingotNihilite> * 16,
    <ore:ingotFusionMatrix> * 4
], 2, 3000);

addBuilderRecipe(<modularmachinery:air_collector_factory_controller>, [
    <additions:logic_processor_2> * 8,
    <additions:calculation_processor_2> * 6,
    <additions:engineering_processor_2> * 4,
    <crazyae:material:48> * 6,
    <crazyae:material:16> * 4,
    <ore:ingotModularium> * 48,
    <ore:ingotOsgloglas> * 32,
    <ore:ingotOsmiridium> * 32,
    <ore:ingotLeadPlatinum> * 24,
    <ore:ingotAlumite> * 24,
    <ore:ingotManyullyn> * 24,
    <ore:latticeDiamond> * 8
], 2, 4000);

addBuilderRecipe(<modularmachinery:aeonsteel_forge_factory_controller>, [
    <additions:logic_processor_2> * 18,
    <additions:calculation_processor_2> * 18,
    <additions:engineering_processor_2> * 18,
    <ore:ingotModularium> * 48,
    <ore:ingotOsgloglas> * 32,
    <ore:ingotDurasteel> * 24,
    <ore:ingotGenite> * 24,
    <ore:ingotFusionMatrix> * 16,
    <ore:ingotTerrasteel> * 12,
    <ore:ingotBoundMetal> * 12,
    <ore:ingotEndusium> * 12,
    <ore:ingotValkyrie> * 8,
    <ore:ingotNetherite> * 4
], 2, 9600);

addBuilderRecipe(<modularmachinery:builder_3_factory_controller>, [
    <additions:logic_processor_2> * 12,
    <additions:calculation_processor_2> * 12,
    <additions:engineering_processor_2> * 12,
    <crazyae:material:16> * 8,
    <crazyae:material:48> * 8,
    <additions:wireless_processor> * 8,
    <ore:ingotModularium> * 64,
    <ore:ingotAeonsteel> * 16,
    <ore:ingotDraconiumAwakened> * 16,
    <ore:ingotWitheriumRelifed> * 16,
    <ore:ingotWyvernMetal> * 12,
    <ore:ingotFallenMetal> * 12,
    <ore:ingotGenite> * 8,
    <ore:ingotFusionMatrix> * 8,
    <ore:ingotElfsteel> * 4,
    <ore:ingotEndestSteel> * 4
], 2, 2400);

//LV3
addBuilderRecipe(<modularmachinery:chromasteel_forge_factory_controller>, [
    <additions:logic_processor_2> * 32,
    <additions:calculation_processor_2> * 32,
    <additions:engineering_processor_2> * 32,
    <ore:ingotModularium> * 72,
    <ore:ingotMistAlloy> * 32,
    <ore:ingotAeonsteel> * 24,
    <ore:ingotVoid> * 24,
    <ore:ingotPhotonium> * 16,
    <ore:ingotShadowium> * 16,
    <ore:ingotAuraIron> * 12,
    <ore:ingotEnderite> * 8,
    <ore:ingotCrimsonite> * 4,
    <ore:ingotMythsteel> * 4
], 3, 11200);