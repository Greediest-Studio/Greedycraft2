/*
 * This script is created for the GreedyCraft Tweaks by 孤梦梦.
 */

#priority 50
#loader crafttweaker reloadable

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.data.IData;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.SmartInterfaceUpdateEvent;
import mods.modularmachinery.Sync;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.SmartInterfaceData;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.FactoryRecipeThread;

MMEvents.onControllerGUIRender("mana_ele" , function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    val map = ctrl.customData.asMap();
    val tier = isNull(map["tier"]) ? 0 : map["tier"].asInt();
    val time = isNull(map["time"]) ? 60 : map["time"].asInt();
    var info as string[] = [
        "§b§l///魔力聚能机监控系统///§r",
        "§e§l当前阶段：" + tier
    ];
    if (tier == 0) {info += "§4§l反应系统尚未启动，请查看jei启动配方";}
    else {info += "§b§l反应系统已启动，请进行阶段12配方循环以产出能源";}
    info += ("§b§l请于" + time + "tick内完成当前阶段配方");

    event.extraInfo = info;
});

//线程
val fyxc = FactoryRecipeThread.createCoreThread("§e反应模块");
val tbxc = FactoryRecipeThread.createCoreThread("§e同步模块");

MachineModifier.setMaxThreads("mana_ele", 0 as int);
MachineModifier.addCoreThread("mana_ele", fyxc);
MachineModifier.addCoreThread("mana_ele", tbxc);
MachineModifier.setMaxParallelism("mana_ele",1);

//function
function tier(event as FactoryRecipeTickEvent) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val map = data.asMap();
    val world = ctrl.world;
    val pos0 = ctrl.pos;
    val post = pos0.getOffset(down , 9).getOffset(west , 2);//泰拉钢
    val posz = pos0.getOffset(down , 9).getOffset(south , 2);//魔力钻石
    val posj = pos0.getOffset(down , 9).getOffset(east , 2);//精灵钢
    val posw = pos0.getOffset(down , 9).getOffset(north , 2);//微光木
    val tier = isNull(map["tier"]) ? 0 : map["tier"].asInt();
    if !(tier == 0) {
        if (tier == 1 && world.getBlock(post).definition.id has "quartzt" && world.getBlock(posz).definition.id has "quartzt" && world.getBlock(posj).definition.id has "quartzt" && world.getBlock(posw).definition.id has "quartzt") {
            map["tier"] = 2;
            map["time"] = 25;
            ctrl.customData = data;
        }
        if (tier == 2 && !(world.getBlock(post).definition.id has "quartzt") && !(world.getBlock(posz).definition.id has "quartzt") && !(world.getBlock(posj).definition.id has "quartzt") && !(world.getBlock(posw).definition.id has "quartzt")) {
            map["tier"] = 1;
            map["time"] = 25;
            ctrl.customData = data;
        }
    }
}

RecipeBuilder.newBuilder("tbmk","mana_ele",20,4)
    .addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
        tier(event);
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        var time = isNull(map["time"]) ? 25 : map["time"].asInt();
        if (time > 0) {
            time -= 1;
            map["time"] = time;
            ctrl.customData = data;
        }
        else {
            time = 0;
            map["time"] = time;
            map["tier"] = 0;
            ctrl.customData = data;
        }
    })
    .addRecipeTooltip("§e同步")
    .setThreadName("§e同步模块")
    .setParallelized(false)
    .build();

RecipeBuilder.newBuilder("cs","mana_ele",20,4)
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        map["tier"] = 2;
        ctrl.customData = data;
    })
    .addItemInput(<minecraft:grass>)
    .setThreadName("§e反应模块")
    .setParallelized(false)
    .build();