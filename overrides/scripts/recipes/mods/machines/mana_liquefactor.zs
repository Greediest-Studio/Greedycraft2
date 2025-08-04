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

MachineModifier.setMaxThreads("mana_liquefactor", 0);
val srmk = FactoryRecipeThread.createCoreThread("魔力输入模块");
val scmk = FactoryRecipeThread.createCoreThread("魔力液化模块");
MachineModifier.addCoreThread("mana_liquefactor", srmk);
MachineModifier.addCoreThread("mana_liquefactor", scmk);

MMEvents.onControllerGUIRender("mana_liquefactor", function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val map = data.asMap();
    val mana = isNull(map["mana"]) ? 0 : map["mana"].asInt();
    val maxmana = isNull(map["maxmana"]) ? 1000000 : map["maxmana"].asInt();
    val bx = isNull(map["bx"]) ? ctrl.activeRecipe.maxParallelism : map["bx"].asInt();

    val info as string[] = [
        "§a///魔力液化机控制面板///",
        "§a魔力缓存：§e" + mana + "/" + maxmana,
        "§a魔力产出：§e" + bx + "mB每1tick",
        "§a自动从中心魔力池输入魔力"
    ];

    event.extraInfo = info;
});

function input(event as FactoryRecipeFinishEvent) {
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
        ctrl.world.setBlockState(ctrl.world.getBlockState(ctrl.pos.up(4)),{manaCap: maxmana, mana: (poolmana - (maxmana - mana))},ctrl.pos.up(4));
        return maxmana;
    }
    else {
        ctrl.world.setBlockState(ctrl.world.getBlockState(ctrl.pos.up(4)),{manaCap: maxmana, mana: 0},ctrl.pos.up(4));
        return mana + poolmana;
    }
}

RecipeBuilder.newBuilder("mana_liquefactor_manainput","mana_liquefactor",20)
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {input(event);})
    .addRecipeTooltip("§3向控制器缓存添加魔力")
    .setThreadName("魔力输入模块")
    .setParallelized(false)
    .build();

RecipeBuilder.newBuilder("mana_liquefactor_liquidedmana", "mana_liquefactor", 1)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val mana = isNull(map["mana"]) ? 0 : map["mana"].asInt();
        var bx = event.activeRecipe.maxParallelism;
        bx = (min(mana / 1000,bx) > 0) ? min(mana / 1000,bx) : 1;
        event.activeRecipe.maxParallelism = bx;
        if (mana - bx * 1000 <= 0) {event.setFailed("魔力不足");}
    })
    .addEnergyPerTickInput(1000)
    .addFluidOutput(<liquid:mana> * 1)
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val mana = isNull(map["mana"]) ? 0 : map["mana"].asInt();
        val bx = event.activeRecipe.parallelism;
        map["mana"] = mana - bx * 1000;
        map["bx"] = bx;
        ctrl.customData = data;
    })
    .setThreadName("魔力液化模块")
    .addRecipeTooltip("§3液化已缓存魔力")
    .build();