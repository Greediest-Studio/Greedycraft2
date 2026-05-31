/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50
#reloadable

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
import mods.modularmachinery.SmartInterfaceData;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.MachineUpgradeBuilder;
import mods.modularmachinery.MachineUpgradeHelper;
import mods.zenutils.DataUpdateOperation.OVERWRITE;

import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("kabalah_builder", 1);
MachineModifier.setMaxParallelism("kabalah_builder", 1);
MachineModifier.setInternalParallelism("kabalah_builder", 1);

var ainUpgrade as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder("kabalah_builder_ain", "Ain 光环升级", 1, 1);
ainUpgrade.addDescriptions("§b解锁生命树构建器 Ain 光环等级");
ainUpgrade.addCompatibleMachines("kabalah_builder");
ainUpgrade.buildAndRegister();

var sophUpgrade as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder("kabalah_builder_soph", "Soph 光环升级", 1, 1);
sophUpgrade.addDescriptions("§b解锁生命树构建器 Soph 光环等级");
sophUpgrade.addCompatibleMachines("kabalah_builder");
sophUpgrade.buildAndRegister();

var aurUpgrade as MachineUpgradeBuilder = MachineUpgradeBuilder.newBuilder("kabalah_builder_aur", "Aur 光环升级", 1, 1);
aurUpgrade.addDescriptions("§b解锁生命树构建器 Aur 光环等级");
aurUpgrade.addCompatibleMachines("kabalah_builder");
aurUpgrade.buildAndRegister();

MachineUpgradeHelper.addFixedUpgrade(<gct_mobs:kabalah_ring_ain>, "kabalah_builder_ain");
MachineUpgradeHelper.addFixedUpgrade(<gct_mobs:kabalah_ring_soph>, "kabalah_builder_soph");
MachineUpgradeHelper.addFixedUpgrade(<gct_mobs:kabalah_ring_aur>, "kabalah_builder_aur");

MMEvents.onControllerGUIRender("kabalah_builder", function(event as ControllerGUIRenderEvent) {
    var hasAin as bool = event.controller.hasMachineUpgrade("kabalah_builder_ain") || event.controller.hasModifier("kabalah_builder_ain");
    var hasSoph as bool = event.controller.hasMachineUpgrade("kabalah_builder_soph") || event.controller.hasModifier("kabalah_builder_soph");
    var hasAur as bool = event.controller.hasMachineUpgrade("kabalah_builder_aur") || event.controller.hasModifier("kabalah_builder_aur");
    var info as string[] = [
        "§a///生命树构建器控制面板///", 
        "§a机器名称：§eLV4 - 生命树构建器"
    ];
    event.extraInfo = info;
});

MMEvents.onMachinePreTick("kabalah_builder", function(event as MachineTickEvent) {
    if (!event.controller.world.isRemote()) {
        event.controller.customData = event.controller.customData.deepUpdate({manaLoopActive: 0}, OVERWRITE);
    }
});

MachineModifier.addCoreThread("kabalah_builder", FactoryRecipeThread.createCoreThread("魔力环流").addRecipe("mana_circulation"));

RecipeBuilder.newBuilder("mana_circulation", "kabalah_builder", 1)
    .addManaInput(100000)
    .addManaOutput(99999)
    .addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
        if (!event.controller.world.isRemote()) {
            event.controller.customData = event.controller.customData.deepUpdate({manaLoopActive: 1}, OVERWRITE);
        }
    })
    .setThreadName("魔力环流")
    .setParallelized(false)
    .addRecipeTooltip("§b每tick运行一次，用于维持生命树构建器的魔力环流")
    .build();

global kabalahNormalRecipeIndex as int = 0;

function createKabalahBuilderNormalRecipe(
    output as IItemStack,
    slot1 as IItemStack,
    slot2 as IItemStack,
    slot3 as IItemStack,
    slot4 as IItemStack,
    slot5 as IItemStack,
    slot6 as IItemStack,
    slot7 as IItemStack,
    slot8 as IItemStack,
    slot9 as IItemStack,
    slot10 as IItemStack,
    level as int
) as void {
    var recipeName as string = "kabalah_normal_" + kabalahNormalRecipeIndex;
    kabalahNormalRecipeIndex += 1;

    var builder = RecipeBuilder.newBuilder(recipeName, "kabalah_builder", 200)
        .addPreCheckHandler(function(event as RecipeCheckEvent) {
            if (level >= 1 && !event.controller.hasMachineUpgrade("kabalah_builder_aur")) {
                event.setFailed("需要 Aur 光环升级");
                return;
            }
            if (level >= 2 && !event.controller.hasMachineUpgrade("kabalah_builder_soph")) {
                event.setFailed("需要 Soph 光环升级（且同时拥有 Aur）");
                return;
            }
            if (level >= 3 && !event.controller.hasMachineUpgrade("kabalah_builder_ain")) {
                event.setFailed("需要 Ain 光环升级（且同时拥有 Soph、Aur）");
            }
        })
        .addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
            if (isNull(event.controller.customData.manaLoopActive) || event.controller.customData.manaLoopActive.asInt() != 1) {
                event.preventProgressing("魔力环流未正常运行");
            }
        })
        .addItemOutput(output)
        .addRecipeTooltip("§a需要的能量环等级：§e" + (level == 0 ? "无" : (level == 1 ? "Aur" : (level == 2 ? "Soph Aur" : "Ain Soph Aur"))))
        .setParallelized(false);

    if (!isNull(slot1)) {builder.addItemInput(slot1);}
    if (!isNull(slot2)) {builder.addItemInput(slot2);}
    if (!isNull(slot3)) {builder.addItemInput(slot3);}
    if (!isNull(slot4)) {builder.addItemInput(slot4);}
    if (!isNull(slot5)) {builder.addItemInput(slot5);}
    if (!isNull(slot6)) {builder.addItemInput(slot6);}
    if (!isNull(slot7)) {builder.addItemInput(slot7);}
    if (!isNull(slot8)) {builder.addItemInput(slot8);}
    if (!isNull(slot9)) {builder.addItemInput(slot9);}
    if (!isNull(slot10)) {builder.addItemInput(slot10);}

    builder.build();
}

global KabalahBuilderRecipeList as IItemStack[][IItemStack][int] = {
    0 : {
        <gct_mobs:kabalah_ring_aur> : [
            <gct_mobs:rune_active_1>,
            <gct_mobs:rune_active_2>,
            <gct_mobs:rune_active_3>,
            <gct_mobs:rune_active_4>,
            <gct_mobs:rune_active_5>,
            <gct_mobs:rune_active_6>,
            <gct_mobs:rune_active_7>,
            <gct_mobs:rune_active_8>,
            <gct_mobs:rune_active_9>,
            <gct_mobs:rune_active_10>
        ]
    },
    1 : {
        <gct_mobs:elf_passes> * 2 : [
            <gct_mobs:elementium_fusionplate>,
            <gct_mobs:elementium_fusionplate>,
            <gct_mobs:elementium_fusionplate>,
            <gct_mobs:elementium_fusionplate>,
            <gct_mobs:elementium_fusionplate>,
            <gct_mobs:elementium_fusionplate>,
            <gct_mobs:elementium_fusionplate>,
            <gct_mobs:elementium_fusionplate>,
            <gct_mobs:orichalcos_fusionplate>,
            null
        ],
        <additions:plate_of_emberlight> : [
            <gct_mobs:botanical_ingot_awakened>,
            <gct_mobs:botanical_ingot_awakened>,
            <additions:ascensionite_ingot>,
            <additions:ascensionite_ingot>,
            <additions:ascensionite_ingot>,
            <additions:purified_murderite_ingot>,
            <additions:purified_murderite_ingot>,
            <additions:purified_murderite_ingot>,
            <additions:purified_murderite_ingot>,
            <additions:gemundyingember>
        ]
    },
    2 : {

    },
    3 : {

    }
};

for level in KabalahBuilderRecipeList.keys {
    for output in KabalahBuilderRecipeList[level].keys {
        var inputs as IItemStack[] = KabalahBuilderRecipeList[level][output];
        createKabalahBuilderNormalRecipe(
            output,
            inputs[0],
            inputs[1],
            inputs[2],
            inputs[3],
            inputs[4],
            inputs[5],
            inputs[6],
            inputs[7],
            inputs[8],
            inputs[9],
            level
        );
    }
}

