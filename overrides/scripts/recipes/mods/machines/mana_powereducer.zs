/*
 * This script is created for the GreedyCraft Tweaks by 孤梦梦.
 */

#priority 50
#loader crafttweaker reloadable

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
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.Sync;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;

MachineModifier.setMaxThreads("mana_powereducer", 0);
val hymk = FactoryRecipeThread.createCoreThread("§3§l元始魔力还原模块");
val scmk = FactoryRecipeThread.createCoreThread("§3§l魔力输出模块");
MachineModifier.addCoreThread("mana_powereducer", hymk);
MachineModifier.addCoreThread("mana_powereducer", scmk);

MMEvents.onControllerGUIRender("mana_powereducer", function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val map = data.asMap();
    val mana = isNull(map["mana"]) ? 0 : map["mana"].asInt();
    val maxmana = isNull(map["maxmana"]) ? 1000 : (map["maxmana"].asInt());
    val bx = isNull(map["bx"]) ? ctrl.activeRecipe.maxParallelism : map["bx"].asInt();

    val info as string[] = [
        "§3§l///魔力还原系统///",
        "§3§l当前已缓存魔力: " + mana + "/" + maxmana,
        "§3§l当前最大还原速率(mana/tick): " + (bx * 1000),
        "§3§l自动向中心魔力池输出魔力"
    ];

    event.extraInfo = info;
});

function output(event as FactoryRecipeFinishEvent) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val map = data.asMap();
    val mana = isNull(map["mana"]) ? 0 : map["mana"].asInt();
    val pos = ctrl.pos.up(4);
    val pooldata = ctrl.world.getBlock(pos).data;
    val maxmana = isNull(pooldata.manaCap) ? 1000000 : pooldata.manaCap.asInt();
    val poolmana = isNull(pooldata.mana) ? 0 : pooldata.mana.asInt();
    map["mana"] = amount(mana,poolmana,maxmana,ctrl);
    map["maxmana"] = maxmana;
    ctrl.customData = data;
}

function amount(mana as int,poolmana as int,maxmana as int,ctrl as IMachineController) as int {
    if (mana + poolmana >= maxmana) {
        ctrl.world.setBlockState(ctrl.world.getBlockState(ctrl.pos.up(4)),{manaCap: maxmana, mana: maxmana},ctrl.pos.up(4));
        return mana - maxmana + poolmana;
    }
    else {
        ctrl.world.setBlockState(ctrl.world.getBlockState(ctrl.pos.up(4)),{manaCap: maxmana, mana: mana + poolmana},ctrl.pos.up(4));
        return 0;
    }
}

RecipeBuilder.newBuilder("mana_powereducer_manaoutput","mana_powereducer",20)
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {output(event);})
    .addRecipeTooltip("§3§l向魔力池输出魔力")
    .setThreadName("§3§l魔力输出模块")
    .setParallelized(false)
    .build();

RecipeBuilder.newBuilder("mana_powereducer_liquidedmana", "mana_powereducer", 1)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val mana = isNull(map["mana"]) ? 0 : map["mana"].asInt();
        val maxmana = isNull(map["maxmana"]) ? 1000000 : map["maxmana"].asInt();
        var bx = event.activeRecipe.maxParallelism;
        bx = max(1,(mana + bx * 1000 > maxmana) ? ((maxmana - mana) / 1000) : bx);
        event.activeRecipe.maxParallelism = bx;
        if (mana + bx * 1000 > maxmana) {event.setFailed("§3§l魔力已满");}
    })
    .addEnergyPerTickInput(1000)
    .addFluidInput(<liquid:mana> * 1)
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val mana = isNull(map["mana"]) ? 0 : map["mana"].asInt();
        val maxmana = isNull(map["maxmana"]) ? 1000000 : map["maxmana"].asInt();
        val bx = event.activeRecipe.parallelism;
        map["mana"] = mana + bx * 1000;
        map["bx"] = bx;
        ctrl.customData = data;
    })
    .setThreadName("§3§l元始魔力还原模块")
    .addRecipeTooltip("§3§l将元始魔力还原为魔力")
    .build();