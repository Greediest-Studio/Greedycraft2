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
    val levelMap as string[int] = {
        1 : "§a§l基础",
        2 : "§3§l强化",
        3 : "§d§l进阶",
        4 : "§6§l炫光",
        5 : "§b§l终极",
        6 : "§4§l原罪"
    };
    MachineModifier.setMachinePrefix(controller.definition.id.split("_factory_controller")[0].split(":")[1], levelMap[level]);
}

MMEvents.onControllerGUIRender("builder_1", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///基础装配室控制面板///", "§a机器名称：§eLV0 - 基础装配室"];
    event.extraInfo = info;
});
MMEvents.onControllerGUIRender("builder_2", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///强化装配室控制面板///", "§a机器名称：§eLV1 - 强化装配室"];
    event.extraInfo = info;
});
MMEvents.onControllerGUIRender("builder_3", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///进阶装配室控制面板///", "§a机器名称：§eLV2 - 进阶装配室"];
    event.extraInfo = info;
});
MMEvents.onControllerGUIRender("builder_4", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///炫光装配室控制面板///", "§a机器名称：§eLV3 - 炫光装配室"];
    event.extraInfo = info;
});
MMEvents.onControllerGUIRender("builder_5", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///终极装配室控制面板///", "§a机器名称：§eLV4 - 终极装配室"];
    event.extraInfo = info;
});

//LV0
MachineModifier.setMachinePrefix("mek_changer", "§f§l初始");
MachineModifier.setMachinePrefix("vethea_enchanter", "§f§l初始");
MachineModifier.setMachinePrefix("builder_1", "§f§l初始");
MachineModifier.setMachinePrefix("extendable_calculator_subsystem_l4", "§c§lECO");
MachineModifier.setMachinePrefix("extendable_calculator_subsystem_l6", "§c§lECO");
MachineModifier.setMachinePrefix("extendable_calculator_subsystem_l9", "§c§lECO");
MachineModifier.setMachinePrefix("extendable_digital_storage_subsystem_l4", "§c§lECO");
MachineModifier.setMachinePrefix("extendable_digital_storage_subsystem_l6", "§c§lECO");
MachineModifier.setMachinePrefix("extendable_digital_storage_subsystem_l9", "§c§lECO");
MachineModifier.setMachinePrefix("extendable_fabricator_subsystem_l4", "§c§lECO");
MachineModifier.setMachinePrefix("extendable_fabricator_subsystem_l6", "§c§lECO");
MachineModifier.setMachinePrefix("extendable_fabricator_subsystem_l9", "§c§lECO");

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

addBuilderRecipe(<modularmachinery:liquid_converter_factory_controller>,[
    <appliedenergistics2:material:22> * 10,
    <appliedenergistics2:material:23> * 8,
    <appliedenergistics2:material:24> * 12,
    <ore:ingotModularium> * 48,
    <ore:ingotAlubrass> * 32,
    <ore:ingotFlamium> * 16,
    <ore:ingotChillinium> * 16,
    <ore:ingotEnergeticAlloy> * 12,
    <ore:ingotVibrantAlloy> * 8,
    <ore:ingotGelidEnderium> * 8
], 1, 1600);

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

addBuilderRecipe(<modularmachinery:end_forge_factory_controller>, [
    <additions:logic_processor_2> * 8,
    <additions:calculation_processor_2> * 4,
    <additions:engineering_processor_2> * 10,
    <crazyae:material:16> * 4,
    <ore:ingotModularium> * 64,
    <ore:ingotEndorium> * 48,
    <ore:ingotAurorium> * 32,
    <ore:ingotAbyssum> * 32,
    <ore:ingotUru> * 32,
    <ore:ingotEndusium> * 8,
    <ore:endstone> * 64
], 2, 4000);

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
    <ore:ingotDarkice> * 48,
    <ore:ingotMistAlloy> * 32,
    <ore:ingotAeonsteel> * 24,
    <ore:ingotVoid> * 24,
    <ore:ingotPhotonium> * 16,
    <ore:ingotShadowium> * 16,
    <ore:ingotAuraIron> * 12,
    <ore:ingotEnderite> * 8,
    <ore:ingotMythsteel> * 4
], 3, 11200);

addBuilderRecipe(<modularmachinery:abyss_ceremony_executant_factory_controller>, [
    <additions:logic_processor_2> * 16,
    <additions:calculation_processor_2> * 8,
    <additions:engineering_processor_2> * 4,
    <additions:wireless_processor> * 4,
    <crazyae:material:17> * 6,
    <ore:ingotModularium> * 64,
    <ore:ingotEthaxiumBrick> * 64,
    <ore:ingotAbyssalnite> * 64,
    <ore:ingotLiquifiedCoralium> * 48,
    <ore:ingotDreadium> * 24,
    <ore:ingotEthaxium> * 16,
    <ore:gemShadow> * 16
], 3, 5200);

addBuilderRecipe(<modularmachinery:advanced_miner_factory_controller>, [
    <additions:logic_processor_2> * 12,
    <additions:calculation_processor_2> * 6,
    <additions:engineering_processor_2> * 30,
    <ore:ingotModularium> * 72,
    <ore:ingotStainlessSteel> * 48,
    <ore:ingotShadium> * 32,
    <ore:ingotLunium> * 32,
    <ore:ingotVibranium> * 32,
    <ore:ingotValyrium> * 32,
    <ore:ingotTerrax> * 24,
    <ore:ingotGenite> * 16,
    <ore:ingotNetherite> * 8,
    <ore:ingotEnderite> * 6,
    <ore:ingotAetherite> * 4
], 3, 6000);

addBuilderRecipe(<modularmachinery:gas_centrifuge_factory_controller>, [
    <additions:logic_processor_2> * 10,
    <additions:calculation_processor_2> * 18,
    <additions:engineering_processor_2> * 10,
    <crazyae:material:16> * 8,
    <crazyae:material:48> * 8,
    <threng:material:6> * 8,
    <ore:ingotGraphite> * 64,
    <ore:ingotModularium> * 56,
    <ore:ingotOsgloglas> * 48,
    <ore:ingotStellarAlloy> * 32,
    <ore:ingotMistAlloy> * 16,
    <ore:ingotBlackholeAlloy> * 4
], 3, 4800);

addBuilderRecipe(<modularmachinery:unitcell_builder_factory_controller>, [
    <additions:logic_processor_2> * 16,
    <additions:calculation_processor_2> * 12,
    <additions:engineering_processor_2> * 10,
    <crazyae:material:48> * 12,
    <crazyae:material:17> * 8,
    <ore:ingotModularium> * 64,
    <ore:ingotDraconium> * 48,
    <ore:ingotWitherium> * 48,
    <ore:ingotVibranium> * 48,
    <ore:ingotEnergeticAlloy> * 32,
    <ore:ingotMirion> * 16,
    <ore:ingotAstralMetal> * 2
], 3, 3600);

addBuilderRecipe(<modularmachinery:fallen_star_factory_controller>, [
    <additions:logic_processor_2> * 12,
    <additions:calculation_processor_2> * 24,
    <additions:engineering_processor_2> * 20,
    <crazyae:material:17> * 12,
    <ore:ingotModularium> * 72,
    <ore:ingotIgnite> * 64,
    <ore:ingotAstralStarmetal> * 64,
    <ore:ingotBloodInfusedIron> * 64,
    <ore:ingotSentientMetal> * 16,
    <ore:ingotBoundMetal> * 8,
    <ore:ingotAstralMetal> * 8,
    <ore:ingotStellarAlloy> * 8
], 3, 3600);

addBuilderRecipe(<modularmachinery:thermal_evaporation_plant_factory_controller>, [
    <additions:logic_processor_2> * 8,
    <additions:calculation_processor_2> * 12,
    <additions:engineering_processor_2> * 18,
    <crazyae:material:48> * 4,
    <threng:material:14> * 4,
    <ore:ingotOsmium> * 64,
    <ore:ingotModularium> * 48,
    <ore:ingotManganeseSteel> * 48,
    <ore:ingotDurasteel> * 24,
    <ore:ingotGraphite> * 24,
], 3, 4000);

addBuilderRecipe(<modularmachinery:arcane_compressor_factory_controller>, [
    <additions:logic_processor_2> * 12,
    <additions:calculation_processor_2> * 24,
    <additions:engineering_processor_2> * 20,
    <crazyae:material:17> * 16,
    <crazyae:material:16> * 12,
    <ore:ingotModularium> * 72,
    <ore:ingotThaumium> * 64,
    <ore:ingotVoid> * 32,
    <ore:ingotPrimordial> * 8,
    <ore:ingotMithrillium> * 4,
    <thaumcraft:stone_arcane> * 64,
    <gct_mobs:primordial_stone> * 16
], 3, 4000);

addBuilderRecipe(<modularmachinery:neutron_activator_factory_controller>, [
    <additions:logic_processor_2> * 8,
    <additions:calculation_processor_2> * 16,
    <additions:engineering_processor_2> * 32,
    <crazyae:material:16> * 8,
    <crazyae:material:48> * 4,
    <ore:ingotModularium> * 64,
    <ore:ingotLithium> * 64,
    <ore:ingotSteel> * 48,
    <ore:ingotStainlessSteel> * 36,
    <ore:ingotDurasteel> * 16,
    <ore:ingotOsgloglas> * 12
], 3, 3200);

addBuilderRecipe(<modularmachinery:builder_4_factory_controller>, [
    <additions:logic_processor_2> * 48,
    <additions:calculation_processor_2> * 48,
    <additions:engineering_processor_2> * 48,
    <crazyae:material:16> * 16,
    <crazyae:material:48> * 16,
    <crazyae:material:17> * 16,
    <additions:wireless_processor> * 16,
    <ore:ingotModularium> * 128,
    <ore:ingotAstronicium> * 24,
    <ore:ingotChromasteel> * 16,
    <ore:ingotDraconiumChaotic> * 16,
    <ore:ingotWitheriumStormy> * 16,
    <ore:ingotCthulhurite> * 16,
    <ore:ingotAstralMetal> * 16,
    <ore:ingotSky> * 12,
    <ore:ingotBlackholeAlloy> * 8,
    <ore:ingotOrichalcos> * 4
], 3, 2400);

//LV4
addBuilderRecipe(<modularmachinery:aura_crafter_factory_controller>, [
    <additions:logic_processor_2> * 36,
    <additions:calculation_processor_2> * 48,
    <additions:engineering_processor_2> * 18,
    <crazyae:material:17> * 32,
    <threng:material:14> * 16,
    <additions:wireless_processor> * 16,
    <ore:ingotModularium> * 108,
    <ore:ingotAuraIron> * 64,
    <ore:ingotSky> * 48,
    <ore:ingotAlumite> * 48,
    <ore:ingotEarth> * 32,
    <naturesaura:infused_stone> * 48
], 4, 2800);

addBuilderRecipe(<modularmachinery:impetus_forge_factory_controller>, [
    <additions:logic_processor_2> * 28,
    <additions:calculation_processor_2> * 36,
    <additions:engineering_processor_2> * 30,
    <crazyae:material:17> * 32,
    <crazyae:material:16> * 24,
    <threng:material:6> * 12,
    <ore:ingotModularium> * 128,
    <ore:ingotThaumium> * 64,
    <ore:ingotVoid> * 48,
    <ore:ingotMithrillium> * 12,
    <ore:ingotPrimordial> * 12,
    <ore:ingotEldritchSteel> * 12,
    <ore:ingotAdaminite> * 4,
    <ore:ingotPrimordialExtended> * 2,
    <ore:ingotCosmilite> * 2,
    <thaumcraft:stone_eldritch_tile> * 72
], 4, 3000);

addBuilderRecipe(<modularmachinery:chaos_reactor_factory_controller>, [
    <additions:logic_processor_3> * 18,
    <additions:calculation_processor_3> * 24,
    <additions:engineering_processor_3> * 16,
    <crazyae:material:48> * 64,
    <ore:ingotModularium> * 128,
    <ore:ingotDraconium> * 128,
    <ore:ingotDraconiumAwakened> * 64,
    <ore:ingotDraconiumChaotic> * 32,
    <ore:ingotChaoticMetal> * 4,
    <ore:ingotCosmilite> * 2,
    <ore:ingotFlux> * 2
], 4, 8000);

addBuilderRecipe(<modularmachinery:stratified_precipitator_factory_controller>, [
    <additions:logic_processor_3> * 12,
    <additions:calculation_processor_3> * 12,
    <additions:engineering_processor_3> * 20,
    <crazyae:material:16> * 32,
    <threng:material:6> * 24,
    <ore:ingotModularium> * 108,
    <ore:ingotZirconiumMolybdenum> * 96,
    <ore:ingotOsgloglas> * 64,
    <ore:ingotExtreme> * 48,
    <ore:ingotThermoconducting> * 48,
    <ore:ingotPorpezite> * 32,
    <ore:ingotScientificite> * 4,
    <ore:ingotThermallite> * 4
], 4, 4000);

addBuilderRecipe(<modularmachinery:cosmic_forge_factory_controller>, [
    <additions:logic_processor_2> * 64,
    <additions:calculation_processor_2> * 64,
    <additions:engineering_processor_2> * 64,
    <ore:ingotModularium> * 128,
    <ore:ingotPorpezite> * 64,
    <ore:ingotEverite> * 32,
    <ore:ingotDraconiumChaotic> * 32,
    <ore:ingotWitheriumStormy> * 32,
    <ore:ingotChromasteel> * 24,
    <ore:ingotDarkice> * 24,
    <ore:ingotStarAlloy> * 16,
    <ore:ingotCompressite> * 12,
    <ore:itemRedMatter> * 24,
    <ore:blockCommand> * 2
], 4, 12800);

addBuilderRecipe(<modularmachinery:final_forge_factory_controller>, [
    <additions:logic_processor_3> * 24,
    <additions:calculation_processor_3> * 24,
    <additions:engineering_processor_3> * 24,
    <ore:ingotModularium> * 256,
    <ore:ingotCthulhurite> * 128,
    <ore:ingotZirconiumMolybdenum> * 64,
    <ore:ingotDraconiumRuled> * 32,
    <ore:ingotWitheriumEquipment> * 32,
    <ore:ingotCosmilite> * 24,
    <ore:ingotImpetusite> * 16,
    <ore:ingotDisasterMetal> * 16,
    <ore:ingotBalancedMatrix> * 16,
    <ore:ingotScientificite> * 4,
    <ore:ingotCreativeAlloy> * 4,
    <ore:itemPurpleMatter> * 2
], 4, 14400);

addBuilderRecipe(<modularmachinery:bright_altar_factory_controller>, [
    <additions:logic_processor_3> * 16,
    <additions:calculation_processor_3> * 32,
    <additions:engineering_processor_3> * 8,
    <crazyae:material:17> * 16,
    <ore:ingotModularium> * 96,
    <ore:ingotNasalum> * 48,
    <ore:ingotLunarine> * 48,
    <ore:ingotAstralMetal> * 36,
    <ore:ingotEugardite> * 8,
    <additions:astral_gem_01>,
    <additions:astral_gem_02>,
    <additions:astral_gem_03>,
    <additions:astral_gem_04>,
    <additions:astral_gem_05>,
    <additions:astral_gem_06>,
    <additions:astral_gem_07>,
    <additions:astral_gem_08>,
    <additions:astral_gem_09>,
    <additions:astral_gem_10>,
    <additions:astral_gem_11>,
    <additions:astral_gem_12>
], 4, 16000);

addBuilderRecipe(<modularmachinery:builder_5_factory_controller>, [
    <additions:logic_processor_3> * 20,
    <additions:calculation_processor_3> * 20,
    <additions:engineering_processor_3> * 20,
    <crazyae:material:16> * 32,
    <crazyae:material:17> * 32,
    <crazyae:material:48> * 32,
    <additions:wireless_processor> * 32,
    <threng:material:14> * 24,
    <ore:ingotModularium> * 180,
    <ore:ingotCompressite> * 40,
    <ore:ingotCosmilite> * 32,
    <ore:ingotBalancedMatrix> * 16,
    <ore:ingotFinallium> * 12,
    <ore:ingotAbyssine> * 4,
    <ore:ingotZodiacite> * 4,
    <ore:ingotBotanicalAwakened> * 4,
    <ore:ingotAurune> * 4,
    <ore:ingotCreativeAlloy> * 4,
    <ore:ingotPruified> * 4
], 4, 2400);

addBuilderRecipe(<modularmachinery:reverser_factory_controller>, [
    <additions:logic_processor_3> * 16,
    <additions:calculation_processor_3> * 8,
    <additions:engineering_processor_3> * 12,
    <crazyae:material:17> * 24,
    <crazyae:material:16> * 24,
    <ore:ingotModularium> * 96,
    <ore:ingotElementium> * 64,
    <ore:ingotLiquifiedCoralium> * 64,
    <ore:ingotTerrasteel> * 48,
    <ore:ingotOrichalcos> * 32,
    <ore:ingotEthaxium> * 32,
    <ore:gemNaturalline> * 24,
    <botanicadds:dreamrock> * 64
], 4, 3000);

addBuilderRecipe(<modularmachinery:astral_collector_factory_controller>, [
    <additions:logic_processor_3> * 4,
    <additions:calculation_processor_3> * 6,
    <additions:engineering_processor_3> * 4,
    <crazyae:material:17> * 4,
    <additions:wireless_processor> * 2,
    <ore:ingotModularium> * 32,
    <ore:ingotNasalum> * 4,
    <ore:ingotLunarine> * 4,
    <ore:ingotChromasteel> * 2,
    <ore:ingotAstralMetal> * 2,
    <ore:gemAquamarineStarlight> * 4,
    <astralsorcery:itemtunedcelestialcrystal> * 4
], 4, 1000);

addBuilderRecipe(<modularmachinery:matrix_balancer_factory_controller>, [
    <additions:logic_processor_2> * 36,
    <additions:calculation_processor_2> * 36,
    <additions:engineering_processor_2> * 36,
    <crazyae:material:16> * 12,
    <threng:material:14> * 12,
    <ore:ingotModularium> * 128,
    <ore:ingotFusionMatrix> * 64,
    <ore:ingotCheatieum> * 16,
    <ore:ingotClearite> * 16,
    <ore:ingotDepthite> * 16,
    <ore:ingotErrorite> * 16,
    <ore:ingotGodiarite> * 16,
    <ore:ingotMartisite> * 16,
    <ore:ingotNumbereum> * 16,
    <ore:ingotRainite> * 16,
    <ore:ingotFlashite> * 16,
    <ore:ingotOverlaite> * 16
], 4, 3000);

addBuilderRecipe(<modularmachinery:entropy_reverse_factory_controller>, [
    <additions:logic_processor_3> * 10,
    <additions:calculation_processor_3> * 8,
    <additions:engineering_processor_3> * 24,
    <crazyae:material:16> * 8,
    <threng:material:6> * 8,
    <ore:ingotModularium> * 96,
    <ore:ingotBalancite> * 64,
    <ore:ingotFireAlloy> * 48,
    <ore:ingotIceAlloy> * 48,
    <ore:ingotChaoticMetal> * 4
], 4, 4000);

addBuilderRecipe(<modularmachinery:loot_creater_factory_controller>, [
    <additions:logic_processor_2> * 16,
    <additions:calculation_processor_2> * 48,
    <additions:engineering_processor_2> * 24,
    <crazyae:material:16> * 16,
    <crazyae:material:48> * 8,
    <ore:ingotModularium> * 80,
    <ore:ingotHellite> * 64,
    <ore:ingotDreadium> * 64,
    <ore:ingotSoularium> * 32,
    <ore:ingotEverite> * 16,
    <ore:ingotLegendite> * 16,
    <ore:gemSunBoss> * 24,
    <ore:gemValkyrieBoss> * 24,
    <ore:soulSliderBoss> * 24
], 4, 4400);

addBuilderRecipe(<modularmachinery:pe_collector_factory_controller>, [
    <additions:logic_processor_2> * 20,
    <additions:calculation_processor_2> * 32,
    <additions:engineering_processor_2> * 32,
    <crazyae:material:16> * 12,
    <crazyae:material:17> * 16,
    <ore:ingotModularium> * 64,
    <ore:ingotAbyssalnite> * 64,
    <ore:ingotLiquifiedCoralium> * 48,
    <ore:ingotDreadium> * 32,
    <ore:ingotEthaxium> * 24,
    <ore:ingotCthulhurite> * 12,
    <ore:ingotPorpezite> * 8,
    <ore:nuclearShadow> * 24
], 4, 3600);

addBuilderRecipe(<modularmachinery:arcane_melter_factory_controller>, [
    <additions:logic_processor_3> * 16,
    <additions:calculation_processor_3> * 8,
    <additions:engineering_processor_3> * 20,
    <crazyae:material:16> * 8,
    <crazyae:material:17> * 20,
    <threng:material:6> * 16,
    <ore:ingotModularium> * 128,
    <ore:ingotBrass> * 128,
    <ore:ingotVoid> * 64,
    <ore:ingotStellarAlloy> * 48,
    <ore:ingotMithrillium> * 16,
    <ore:ingotPrimordial> * 12,
    <ore:ingotPrimordialExtended> * 2
], 4, 4000);

addBuilderRecipe(<modularmachinery:arcane_matrix_factory_controller>, [
    <additions:logic_processor_2> * 32,
    <additions:calculation_processor_2> * 16,
    <additions:engineering_processor_2> * 24,
    <crazyae:material:17> * 20,
    <threng:material:14> * 20,
    <ore:ingotModularium> * 128,
    <ore:ingotThaumium> * 128,
    <ore:ingotHellite> * 96,
    <ore:ingotVoid> * 64,
    <ore:ingotMithrillium> * 16,
    <ore:ingotAdamant> * 8,
    <gct_mobs:primordial_stone> * 64
], 4, 1200);

//LV5

addBuilderRecipe(<modularmachinery:dimensional_miner_factory_controller>, [
    <additions:logic_processor_3> * 24,
    <additions:calculation_processor_3> * 12,
    <additions:engineering_processor_3> * 48,
    <ore:ingotModularium> * 192,
    <ore:ingotChromasteel> * 48,
    <ore:ingotAstronicium> * 32,
    <ore:ingotEugardite> * 32,
    <ore:ingotAdamantium> * 32,
    <ore:ingotCthulhurite> * 32,
    <ore:ingotOverlaite> * 32,
    <ore:ingotFlashite> * 32,
    <ore:ingotEverite> * 32,
    <ore:ingotDeusiotium> * 24,
    <ore:ingotDraconiumRuled> * 16,
    <ore:ingotWitheriumEquipment> * 16,
    <ore:ingotBalancedMatrix> * 8
], 5, 9000);

addBuilderRecipe(<modularmachinery:aspect_crafter_factory_controller>, [
    <additions:logic_processor_3> * 16,
    <additions:calculation_processor_3> * 28,
    <additions:engineering_processor_3> * 32,
    <threng:material:6> * 32,
    <crazyae:material:17> * 24,
    <ore:ingotModularium> * 128,
    <ore:ingotAlubrass> * 128,
    <ore:ingotBrass> * 100,
    <ore:ingotPrimordial> * 32,
    <ore:ingotPrimordialExtended> * 8,
    <ore:ingotHexacite> * 2,
    <ore:ingotCursium> * 2,
    <ore:ingotAbyssine> * 2
], 5, 2400);

addBuilderRecipe(<modularmachinery:biotechnic_computer_factory_controller>, [
    <additions:logic_processor_3> * 48,
    <additions:calculation_processor_3> * 32,
    <additions:engineering_processor_3> * 16,
    <crazyae:material:16> * 16,
    <crazyae:material:48> * 16,
    <threng:material:6> * 16,
    <ore:ingotModularium> * 160,
    <ore:ingotSanite> * 96,
    <ore:ingotZincargentum> * 96,
    <ore:ingotIzumium> * 64,
    <ore:ingotSoultine> * 48,
    <ore:ingotBalancedMatrix> * 16,
    <ore:ingotAbyssine> * 2,
    <ore:ingotFinallium> * 2,
    <gct_ores:shalloite> * 108
], 5, 8000);

addBuilderRecipe(<modularmachinery:crimson_extractor_factory_controller>, [
    <additions:logic_processor_3> * 42,
    <additions:calculation_processor_3> * 24,
    <additions:engineering_processor_3> * 24,
    <crazyae:material:16> * 24,
    <crazyae:material:17> * 16,
    <ore:ingotModularium> * 128,
    <ore:ingotThaumium> * 128,
    <ore:ingotVoid> * 128,
    <ore:ingotBloodInfusedIron> * 128,
    <ore:ingotPrimordial> * 64,
    <ore:ingotMithrillium> * 48,
    <ore:ingotEldritchSteel> * 48,
    <ore:ingotHexacite> * 12,
    <ore:ingotMurderite> * 2,
    <ore:ingotCursium> * 2,
    <crimsonrevelations:embellished_crimson_fabric> * 24
], 5, 5500);

//Units
addBuilderRecipe(<modularmachinery:elysia_alloyer_factory_controller>, [
    <gct_ores:blue_print_empty> * 32,
    <ore:ingotModularium> * 64,
    <enderio:block_enhanced_alloy_smelter> * 4,
    <enderio:block_alloy_smelter> * 16,
    <enderio:block_simple_alloy_smelter> * 32
], 1, 3200);

addBuilderRecipe(<modularmachinery:elysia_centrifuge_factory_controller>, [
    <gct_ores:blue_print_empty> * 32,
    <ore:ingotModularium> * 64,
    <plustic:centrifuge> * 16,
    <thermalexpansion:machine:10>.withTag({Level : 4 as byte}) * 16
], 1, 3200);

addBuilderRecipe(<modularmachinery:elysia_crusher_factory_controller>, [
    <gct_ores:blue_print_empty> * 32,
    <ore:ingotModularium> * 64,
    <enderio:block_sag_mill> * 8,
    <enderio:block_simple_sag_mill> * 16,
    <thermalexpansion:machine:1>.withTag({Level : 4 as byte}) * 16
], 1, 3200);

addBuilderRecipe(<modularmachinery:elysia_electrolyzer_factory_controller>, [
    <gct_ores:blue_print_empty> * 32,
    <ore:ingotModularium> * 64,
    <mekanism:machineblock2:4> * 16,
    <nuclearcraft:electrolyzer> * 16
], 1, 3200);

addBuilderRecipe(<modularmachinery:elysia_forger_factory_controller>, [
    <gct_ores:blue_print_empty> * 32,
    <ore:ingotModularium> * 64,
    <thermalexpansion:machine:5>.withTag({Level : 4 as byte}) * 16,
    <nuclearcraft:pressurizer> * 16
], 1, 3200);

addBuilderRecipe(<modularmachinery:elysia_liquefier_factory_controller>, [
    <gct_ores:blue_print_empty> * 32,
    <ore:ingotModularium> * 64,
    <aether_legacy:freezer> * 16,
    <thermalexpansion:machine:14>.withTag({Level : 4 as byte}) * 16
], 1, 3200);

addBuilderRecipe(<modularmachinery:elysia_melter_factory_controller>, [
    <gct_ores:blue_print_empty> * 32,
    <ore:ingotModularium> * 64,
    <thermalexpansion:machine:6>.withTag({Level : 4 as byte}) * 16,
    <nuclearcraft:melter> * 16
], 1, 3200);

addBuilderRecipe(<modularmachinery:elysia_pyrolyzer_factory_controller>, [
    <gct_ores:blue_print_empty> * 32,
    <ore:ingotModularium> * 64,
    <tcomplement:high_oven_controller> * 16,
    <mekanism:basicblock:14> * 16
], 1, 3200);

addBuilderRecipe(<modularmachinery:elysia_reactor_factory_controller>, [
    <gct_ores:blue_print_empty> * 32,
    <ore:ingotModularium> * 64,
    <nuclearcraft:chemical_reactor> * 16,
    <mekanism:machineblock2:2> * 16
], 1, 3200);

addBuilderRecipe(<modularmachinery:elysia_solidifier_factory_controller>, [
    <gct_ores:blue_print_empty> * 32,
    <ore:ingotModularium> * 64,
    <nuclearcraft:supercooler> * 16,
    <nuclearcraft:ingot_former> * 16
], 1, 3200);

addBuilderRecipe(<modularmachinery:elysia_vaporizer_factory_controller>, [
    <gct_ores:blue_print_empty> * 32,
    <ore:ingotModularium> * 64,
    <tcomplement:melter> * 32,
    <tcomplement:melter:8> * 32 
], 1, 3200);

addBuilderRecipe(<modularmachinery:elysia_smelter_factory_controller>, [
    <gct_ores:blue_print_empty> * 32,
    <ore:ingotModularium> * 64,
    <thermalexpansion:machine>.withTag({Level : 4 as byte}) * 32,
    <tconstruct:seared_furnace_controller> * 32
], 1, 3200);

addBuilderRecipe(<modularmachinery:elysia_grinder_factory_controller>, [
    <gct_ores:blue_print_empty> * 32,
    <ore:ingotModularium> * 64,
    <tcomplement:alloy_tank> * 32,
    <nuclearcraft:salt_mixer> * 32
], 1, 3200);

addBuilderRecipe(<modularmachinery:elysia_polymer_factory_controller>, [
    <gct_ores:blue_print_empty> * 32,
    <ore:ingotModularium> * 64,
    <mekanism:machineblock2:10> * 32,
    <avaritia:neutron_collector> * 32
], 1, 3200);

addBuilderRecipe(<modularmachinery:elysia_etcher_factory_controller>, [
    <gct_ores:blue_print_empty> * 32,
    <ore:ingotModularium> * 64,
    <ae2stuff:inscriber> * 32,
    <threng:etcher> * 32
], 1, 3200);

addBuilderRecipe(<modularmachinery:factory_4x_factory_controller>, [
    <gct_ores:blue_print_forge> * 32,
    <ore:ingotModularium> * 64,
    <mekanism:machineblock2:3> * 16,
    <mekanism:machineblock:9> * 16,
    <mekanism:machineblock:3> * 16,
    <mekanism:machineblock> * 16,
    <mekanism:machineblock:10> * 16,
    <mekanism:tierinstaller:3> * 64
], 1, 3200);

addBuilderRecipe(<modularmachinery:factory_5x_factory_controller>, [
    <gct_ores:blue_print_forge> * 48,
    <ore:ingotModularium> * 72,
    <mekanism:machineblock2:6> * 32,
    <mekanism:machineblock2:7> * 32,
    <mekanism:machineblock2:8> * 32,
    <mekanism:tierinstaller:3> * 64
], 1, 3200);

addBuilderRecipe(<modularmachinery:factory_atomic_acider_factory_controller>, [
    <gct_ores:blue_print_forge> * 32,
    <ore:ingotModularium> * 48,
    <ore:ingotPorpezite> * 48,
    <ore:ingotProtonium> * 12,
    <ore:circuitFinal> * 4,
    <ore:circuitArcane>
], 1, 2400);

addBuilderRecipe(<modularmachinery:factory_atomic_vibrator_factory_controller>, [
    <gct_ores:blue_print_forge> * 32,
    <ore:ingotModularium> * 48,
    <ore:ingotPorpezite> * 48,
    <ore:ingotNeutronium> * 12,
    <ore:circuitFinal> * 4,
    <ore:circuitArcane>
], 1, 2400);

addBuilderRecipe(<modularmachinery:factory_atomic_decayer_factory_controller>, [
    <gct_ores:blue_print_forge> * 32,
    <ore:ingotModularium> * 48,
    <ore:ingotPorpezite> * 48,
    <ore:ingotElectronium> * 12,
    <ore:circuitFinal> * 4,
    <ore:circuitArcane>
], 1, 2400);

addBuilderRecipe(<modularmachinery:factory_arcanic_infuser_factory_controller>, [
    <gct_ores:blue_print_forge> * 48,
    <ore:ingotModularium> * 64,
    <ore:ingotVoid> * 64,
    <ore:ingotOrichalcosReversed> * 24,
    <ore:ingotAurune> * 12,
    <ore:ingotPrimordialExtended> * 8,
    <ore:circuitArcane> * 2,
    <ore:circuitDreamic>
], 1, 3000);

addBuilderRecipe(<modularmachinery:factory_arcanic_brewer_factory_controller>, [
    <gct_ores:blue_print_forge> * 48,
    <ore:ingotModularium> * 64,
    <ore:ingotSentientMetal> * 64,
    <ore:ingotDarkest> * 24,
    <ore:ingotMithrillium> * 12,
    <ore:ingotAdaminite> * 8,
    <ore:circuitArcane> * 2,
    <ore:circuitDreamic>
], 1, 3000);

addBuilderRecipe(<modularmachinery:factory_arcanic_astrallizer_factory_controller>, [
    <gct_ores:blue_print_forge> * 48,
    <ore:ingotModularium> * 64,
    <ore:ingotAstralMetal> * 64,
    <ore:ingotWigthium> * 24,
    <ore:ingotGhostMetal> * 12,
    <ore:gemHoshine> * 8,
    <ore:circuitArcane> * 2,
    <ore:circuitDreamic>
], 1, 3000);