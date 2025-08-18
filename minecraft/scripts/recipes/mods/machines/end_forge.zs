/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50
#crafttweaker reloadable
#reloadable

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.world.IWorld;
import crafttweaker.entity.IEntityItem;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.RecipeTickEvent;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("end_forge", 8);
MachineModifier.setMaxParallelism("end_forge", 256);
MachineModifier.setInternalParallelism("end_forge", 1);
MachineModifier.addCoreThread("end_forge", FactoryRecipeThread.createCoreThread("能量输入模块"));
MachineModifier.addCoreThread("end_forge", FactoryRecipeThread.createCoreThread("末影锻造模块#1"));
MachineModifier.addCoreThread("end_forge", FactoryRecipeThread.createCoreThread("末影锻造模块#2"));
MachineModifier.addCoreThread("end_forge", FactoryRecipeThread.createCoreThread("末影锻造模块#3"));
MachineModifier.addCoreThread("end_forge", FactoryRecipeThread.createCoreThread("末影锻造模块#4"));

$expand IMachineController$getFuelCount() as int {
    if (!isNull(this.customData.fuelCount)) {
        return this.customData.fuelCount as int;
    } else {
        this.customData = this.customData.update({fuelCount : 0 as int});
        return 0;
    }
}

$expand IMachineController$setFuelCount(num as int) {
    this.customData = this.customData.update({fuelCount : num as int});
}

$expand IMachineController$addFuelCount(num as int) {
    this.setFuelCount(this.getFuelCount() + num);
}

$expand IMachineController$removeFuelCount(num as int) {
    var remove as int = num > this.getFuelCount() ? this.getFuelCount() : num;
    this.setFuelCount(this.getFuelCount() - remove);
}

val fuelList as int[IItemStack] = {
    <thermalfoundation:material:770> : 1,
    <minecraft:ender_pearl> : 4,
    <tiths:ender_crevice_shard> : 6,
    <divinerpg:ender_shards> : 2,
    <divinerpg:ender_stone> : 20,
    <avaritia:endest_pearl> : 4000,
    <additions:harcadium_ingot> : 16,
    <additions:harcadium_block> : 160,
    <endreborn:item_end_essence> : 4,
    <charm:ender_pearl_block> : 40,
    <actuallyadditions:block_misc:6> : 20
};

MMEvents.onControllerGUIRender("end_forge", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///末影冶炼炉控制面板///",
        "§a机器名称：§eLV2 - 末影冶炼炉",
        "§a末影能量：§e" + event.controller.getFuelCount() + "/1000000"
    ];
    event.extraInfo = info;
});

for fuel in fuelList {
    RecipeBuilder.newBuilder("end_forge_fuel_" + fuel.definition.id, "end_forge", 1)
        .addItemInput(fuel)
        .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
            var parallelism as int = event.activeRecipe.parallelism;
            event.controller.addFuelCount(fuelList[fuel] as int * parallelism);
        })
        .addRecipeTooltip("§e为冶炼炉提供" + fuelList[fuel] + "点末影能量")
        .setMaxThreads(1)
        .setThreadName("能量输入模块")
        .build();
}

function addEndForgeRecipe(output as IItemStack, inputs as IIngredient[], energy as int, time as int) {
    var recipe = RecipeBuilder.newBuilder("end_forge_recipe_" + output.definition.id + output.metadata, "end_forge", time);
    recipe.addDimensionInput(1);
    for item in inputs {
        recipe.addItemInput(item);
    }
    recipe.addItemOutput(output);
    recipe.addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
        var parallelism as int = event.activeRecipe.parallelism;
        if (event.controller.getFuelCount() < energy * parallelism) {
            event.preventProgressing("末影能量不足！需要至少" + energy * parallelism + "点");
        }
    });
    recipe.addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        var parallelism as int = event.activeRecipe.parallelism;
        event.controller.removeFuelCount(energy * parallelism);
    });
    recipe.addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        if (event.factoryRecipeThread.isCoreThread) {
            event.canceled = true;
        }
    });
    recipe.addRecipeTooltip("§a需要" + energy + "点末影能量");
    recipe.setThreadName("末影锻造模块#1");
    recipe.setThreadName("末影锻造模块#2");
    recipe.setThreadName("末影锻造模块#3");
    recipe.setThreadName("末影锻造模块#4");
    recipe.build();
}

MMEvents.onMachinePreTick("end_forge", function(event as MachineTickEvent) {
    if (event.controller.getFuelCount() > 1000000) {
        event.controller.setFuelCount(1000000);
    }
});

addEndForgeRecipe(<additions:endest_steel_ingot>, [<ore:ingotDarkice> * 2, <ore:ingotEnderite> * 2, <ore:dustEnderium> * 2], 200, 400);
addEndForgeRecipe(<additions:ender_light>, [<ore:ingotEndestSteel> * 2, <ore:dustDraconiumChaotic> * 9, <moretcon:repitem:2> * 2], 300, 600);
addEndForgeRecipe(<additions:enderite_ingot>, [<ore:gemResonantDebris> * 3, <ore:dustIridium> * 4], 40, 80);