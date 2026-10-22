/*
 * This script is created for the GreedyCraft Tweaks by 孤梦梦梦梦
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
import mods.modularmachinery.RecipeAdapterBuilder;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.SmartInterfaceData;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.MachineUpgradeBuilder;
import mods.modularmachinery.MachineUpgradeHelper;

MachineModifier.setMaxThreads("elysia_alloyer", 8);
MachineModifier.setInternalParallelism("elysia_alloyer", 4);
MachineModifier.setMaxParallelism("elysia_alloyer", 65536);

var expandUpgrade as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder("expand_upg", "扩容升级", 1, 1);
expandUpgrade.addDescriptions("§b增强模块化机械的输入端适配能力");
expandUpgrade.buildAndRegister();

MachineUpgradeHelper.addFixedUpgrade(<additions:upgrade_expand>, "expand_upg");

MMEvents.onControllerGUIRender("elysia_alloyer", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§e///大型合金单元控制面板///",
        "§a机器名称：§eELYSIA单元 - 大型合金单元",
        "§a附属模块：" ~ (event.controller.hasModule("advanced") ? "§e升级模块" : "§c无")
    ];
    event.extraInfo = info;
});

//eio合金炉配方
var alloyerAdapter = RecipeAdapterBuilder.create("elysia_alloyer", "enderio:alloy_smelter");
alloyerAdapter.addRecipeTooltip("§d合金配方支持模块化电容升级，详情请查询“模块化电容”");
alloyerAdapter.forInputItemTypes(1)
    .remove()
    .build();
alloyerAdapter.setMaxThreads(1);
alloyerAdapter.build();

// 其他配方
function recipe(recipenum as int, output as IIngredient, input as IIngredient[], RF as int, time as float) {
    val tRF = (RF / time);
    var builder = RecipeBuilder.newBuilder("elysia_alloyer_" + recipenum, "elysia_alloyer", time * 20, 0);
    builder.addEnergyPerTickInput(tRF);
    builder.addItemInputs(input);
    builder.addItemOutput(output);
    builder.addRecipeTooltip("§d合金配方支持模块化电容升级，详情请查询“模块化电容”");
    if (input.length >= 4) {
        builder.addRecipeTooltip("§a该配方需要扩容升级，详情请查询“模块化电容-扩容”");
        builder.addPreCheckHandler(function(event as RecipeCheckEvent) {
            if (!event.controller.hasMachineUpgrade("expand_upg")) {
                event.setFailed("缺少扩容升级！");
            }
        });
    }
    builder.setMaxThreads(1);
    builder.build();
}

recipe(1 , <additions:compressite_ingot> * 2, [<ore:ingotAstronicium> * 2, <ore:ingotRaisium> * 2, <ore:ingotStellarium>], 4000, 10.0f);
recipe(2 , <additions:raisium_ingot> * 3, [<ore:ingotSteamium> * 3, <ore:ingotMagiga> * 8, <ore:ingotImitatium> * 2], 4000, 10.0f);
recipe(3 , <additions:corbite_ingot> * 2, [<ore:ingotDes> * 2, <ore:ingotFlairium> * 2, <ore:ingotOrbadite>], 4000, 10.0f);
recipe(4 , <tiths:ingot_irisia>* 3, [<ore:ingotShadium>, <ore:ingotLunium>, <ore:ingotShadowBar> * 4], 4000, 10.0f);
recipe(5 , <additions:glowing_signalum_ingot>, [<ore:ingotSignalum>, <ore:dustGlowstone> * 4], 1000, 10.0f);
recipe(6 , <tconstruct:ingots:5> * 4, [<ore:ingotAluminium> * 3, <ore:ingotCopper> * 1], 4000, 10.0f);
recipe(7 , <redstonerepository:material:1> * 1, [<ore:ingotEnderium> * 1, <ore:dustCryotheum> * 4], 10000, 10.0f);

recipe(1000 , <gct_additions:sky_alloy_ingot> * 2, [<ore:ingotAetherium>, <ore:ingotCanopium>, <ore:ingotMistium>, <ore:ingotThyminite>], 51200, 10.0f);
recipe(1001 , <gct_additions:fire_alloy_ingot> * 2, [<ore:ingotLavarite>, <ore:ingotPlasmarite>, <ore:ingotBnightium>, <ore:ingotGuaninite>], 51200, 10.0f);
recipe(1002 , <gct_additions:ice_alloy_ingot> * 2, [<ore:ingotSnowingium>, <ore:ingotFreezite>, <ore:ingotOceanium>, <ore:ingotAdeninite>], 51200, 10.0f);
recipe(1003 , <additions:terra_alloy_ingot> * 2, [<ore:ingotCryonium>, <ore:ingotInfernium>, <ore:ingotTitanium>, <ore:ingotCytosinite>], 51200, 10.0f);
recipe(1004 , <additions:balancite_ingot> * 2, [<ore:ingotAqualite>, <ore:ingotAeroite>, <ore:ingotAsgardium>, <ore:ingotIgnite>], 51200, 10.0f);
recipe(1005 , <additions:twilight_crystal_ingot>, [<ore:ingotEden>, <ore:ingotWildwood>, <ore:ingotApalachia>, <ore:ingotSkythern>, <ore:ingotMortum>], 78600, 10.0f);
recipe(1006 , <gct_additions:cthulhurite_ingot> * 2, [<ore:ingotAbyssalnite>, <ore:ingotLiquifiedCoralium>, <ore:ingotDreadium>, <ore:ingotEthaxium>, <ore:ingotSanite>], 78600, 10.0f);
recipe(1007 , <additions:astronicium_ingot> * 2, [<ore:ingotOraclium>, <ore:ingotHalleium>, <ore:ingotHothium>, <ore:ingotTonium>], 51200, 10.0f);
recipe(1008 , <additions:eugardite_ingot> * 4, [<ore:ingotDecurrium> * 3, <ore:ingotPhotonium> * 2, <ore:ingotSolita> * 1, <ore:ingotDullium> * 2], 51200, 10.0f);
recipe(1009 , <additions:eucite_ingot> * 3, [<ore:ingotCelestium>, <ore:ingotKorite>, <ore:ingotMekyum> * 2, <ore:ingotStoron> * 2], 51200, 10.0f);
recipe(1010 , <tiths:ingot_decurrium> * 6, [<ore:ingotEucite> * 3, <ore:ingotCorbite> * 2, <ore:ingotChloroplast> * 2, <ore:ingotIrisia> * 3], 51200, 10.0f);
recipe(1011 , <gct_additions:everite_ingot>, [<ore:ingotTerraAlloy>, <ore:ingotSkyAlloy>, <ore:ingotFireAlloy>, <ore:ingotIceAlloy>], 51200, 10.0f);
recipe(1012 , <plustic:mirioningot> * 4, [<botania:manaresource:4> * 1, <botania:manaresource> * 1, <botania:manaresource:7> * 1, <ore:ingotCobalt> * 1, <minecraft:glass> * 1], 51200, 10.0f);
recipe(1013 , <nuclearcraft:alloy:15> * 16, [<ore:ingotSteel> * 13, <ore:ingotNiobiumTitanium> * 1, <ore:ingotVanadium> * 1, <ore:ingotAluminum> * 1], 51200, 10.0f);
