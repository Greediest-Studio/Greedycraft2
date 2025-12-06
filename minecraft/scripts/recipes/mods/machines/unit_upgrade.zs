/*
 * This script is created for the GreedyCraft Tweaks by 孤梦梦梦梦 & mc_Edwin.
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

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineUpgradeBuilder;
import mods.modularmachinery.MachineUpgradeHelper;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeModifier;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.MachineEvent;
import mods.modularmachinery.MachineUpgrade;

//速率 并行
static capacitors as int[][IItemStack] = {
    <additions:upgrade_stainless_steel> : [2, 8],
    <additions:upgrade_durasteel> : [3, 24],
    <additions:upgrade_aeonsteel> : [4, 64],
    <additions:upgrade_chromasteel> : [6, 192],
    <additions:upgrade_cosmilite> : [8, 512],
    <additions:upgrade_finallium> : [10, 1536],
    <additions:upgrade_wavite> : [12, 4096]
};

static name as string[IItemStack] = {
    <additions:upgrade_stainless_steel> : "不锈钢单元升级",
    <additions:upgrade_durasteel> : "耐钢单元升级",
    <additions:upgrade_aeonsteel> : "恒钢单元升级",
    <additions:upgrade_chromasteel> : "炫钢单元升级",
    <additions:upgrade_cosmilite> : "寰宇单元升级",
    <additions:upgrade_finallium> : "终焉单元升级",
    <additions:upgrade_wavite> : "波动单元升级"
};

for capacitorlist in capacitors {
    MachineUpgradeBuilder.newBuilder(capacitorlist.definition.id + capacitorlist.metadata as string + "_upg", name[capacitorlist], 1, 1)
        .addDescriptions("§b降低ELYSIA单元配方处理时间至1/" + capacitors[capacitorlist][0] as string)
        .addDescriptions("§b增加ELYSIA单元到" + capacitors[capacitorlist][1] as string + "条并行")
        .addModifier(false, capacitorlist.definition.id, RecipeModifierBuilder.create("modularmachinery:duration", "input", 1.0f / (capacitors[capacitorlist][0] as float), 1, false).build())
        .addPreRecipeCheckHandler(function(event as MachineEvent, upgrade as MachineUpgrade) {
            if (!isNull(event.controller.activeRecipe)) {
                event.controller.activeRecipe.maxParallelism = capacitors[capacitorlist][1] as int;
            }
        })
        .addCompatibleMachines("elysia_alloyer")
        .addCompatibleMachines("elysia_crusher")
        .addCompatibleMachines("elysia_forger")
        .addCompatibleMachines("elysia_liquefier")
        .addCompatibleMachines("elysia_melter")
        .addCompatibleMachines("elysia_pyrolyzer")
        .addCompatibleMachines("elysia_reactor")
        .addCompatibleMachines("elysia_smelter")
        .addCompatibleMachines("elysia_solidifier")
        .addCompatibleMachines("elysia_vaporizer")
        .addCompatibleMachines("elysia_centrifuge")
        .addCompatibleMachines("elysia_electrolyzer")
        .addCompatibleMachines("elysia_grinder")
        .buildAndRegister();

    MachineUpgradeHelper.addFixedUpgrade(capacitorlist, capacitorlist.definition.id + capacitorlist.metadata as string + "_upg");
}