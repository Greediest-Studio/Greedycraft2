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
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MMEvents;
import mods.ctutils.utils.Math;

import mods.modularmachinery.GeoMachineModel;
import mods.modularmachinery.ControllerModelAnimationEvent;

import scripts.util.machines as MMUtil;

MachineModifier.setMaxParallelism("gene_builder", 65536);
MachineModifier.setInternalParallelism("gene_builder", 1);
MachineModifier.setMaxThreads("gene_builder", 1);

mods.modularmachinery.GeoMachineModel.registerGeoMachineModel(
    "gene_constructor",
    "modularmachinery:geo/gene_constructor.geo.json",
    "modularmachinery:textures/model/gene_constructor.png",
    "modularmachinery:animations/gene_constructor.animation.json"
);

mods.modularmachinery.MachineModifier.setMachineGeoModel("gene_builder", "gene_constructor");

MMEvents.onControllerModelAnimation("gene_builder", function(event as ControllerModelAnimationEvent) {
    var ctrl = event.controller;
    if (ctrl.isWorking) {
        event.setAnimation("animation.gene_constructor.working", true);
    } else {
        event.setAnimation("animation.gene_constructor.idle", true);
    }
});

RecipeBuilder.newBuilder("genite_build", "gene_builder", 1000, 0)
    .addItemInput(<additions:cytosinite_ingot>)
    .addItemInput(<additions:thyminite_ingot>)
    .addItemInput(<additions:guaninite_ingot>)
    .addItemInput(<additions:adeninite_ingot>)
    .addEnergyPerTickInput(1150)
    .addItemOutput(<gct_ores:genite_ingot>)
    .build();

MMEvents.onControllerGUIRender("gene_builder", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///基因构造机控制面板///",
        "§a机器名称：§eLV2 - 基因构造机",
    ];
    info += ("§a附属模块：" ~ (event.controller.hasModule("advanced") ? "§e升级模块" : "§c无"));
    event.extraInfo = info;
});
