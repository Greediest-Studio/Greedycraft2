/*
 * This script is created for the GreedyCraft Tweaks by 孤梦梦梦梦.
 */

#priority 100
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
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.SmartInterfaceUpdateEvent;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.SmartInterfaceData;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.FactoryRecipeThread;

val shmk1 = FactoryRecipeThread.createCoreThread("§a腐蚀意志实化模块");
val shmk2 = FactoryRecipeThread.createCoreThread("§e破坏意志实化模块");
val shmk3 = FactoryRecipeThread.createCoreThread("§4复仇意志实化模块");
val shmk4 = FactoryRecipeThread.createCoreThread("§b坚毅意志实化模块");
val xsmk = FactoryRecipeThread.createCoreThread("§3恶魔意志吸收模块");
val qhmk = FactoryRecipeThread.createCoreThread("§3恶魔意志歧化模块");

MachineModifier.setMaxThreads("demon_will_crafter", 0 as int);
MachineModifier.addCoreThread("demon_will_crafter", shmk1);
MachineModifier.addCoreThread("demon_will_crafter", shmk2);
MachineModifier.addCoreThread("demon_will_crafter", shmk3);
MachineModifier.addCoreThread("demon_will_crafter", shmk4);
MachineModifier.addCoreThread("demon_will_crafter", xsmk);
MachineModifier.addCoreThread("demon_will_crafter", qhmk);

MMEvents.onControllerGUIRender("demon_will_crafter" , function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    val map = ctrl.customData.asMap();
    val ysemyz = isNull(map["ysemyz"]) ? 0.0f : map["ysemyz"].asFloat();
    val fsemyz = isNull(map["fsemyz"]) ? 0.0f : map["fsemyz"].asFloat();
    val phemyz = isNull(map["phemyz"]) ? 0.0f : map["phemyz"].asFloat();
    val fcemyz = isNull(map["fcemyz"]) ? 0.0f : map["fcemyz"].asFloat();
    val jyemyz = isNull(map["jyemyz"]) ? 0.0f : map["jyemyz"].asFloat();
    //val sl = isNull(map["sl"]) ? 0.0f : map["sl"].asFloat();

    var info as string[] = [
        "§3///恶魔意志监测器///",
        "§3已储备原生恶魔意志：" + ysemyz ,
        "§a已储备腐蚀恶魔意志：" + fsemyz ,
        "§e已储备破坏恶魔意志：" + phemyz ,
        "§4已储备复仇恶魔意志：" + fcemyz ,
        "§b已储备坚毅恶魔意志：" + jyemyz 
        //"§3恶魔意志歧化速率" + sl + "§3©/t"
    ];

    event.extraInfo = info;
});

RecipeBuilder.newBuilder("emyzsh1","demon_will_crafter",20,0)
    .addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
        val ctrl = event.controller;
        val map = ctrl.customData.asMap();
        val bx = event.activeRecipe.parallelism;
        val emyz = isNull(map["fsemyz"]) ? 0.0f : map["fsemyz"].asFloat();
        if (emyz < (25.0f * bx)) {event.setFailed(false,"§4恶魔意志不足");}
    })
    .addItemInput(<bloodmagic:item_demon_crystal:1>).setChance(0.0f)
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val bx = event.activeRecipe.parallelism;
        var emyz = isNull(map["fsemyz"]) ? 0.0f : map["fsemyz"].asFloat();
        map["fsemyz"] = emyz - (25.0f * bx);
        ctrl.customData = data;
    })
    .addItemOutput(<bloodmagic:item_demon_crystal:1>)
    .addRecipeTooltip("§e消耗25点§a腐蚀意志")
    .setThreadName("§a腐蚀意志实化模块")
    .build();

RecipeBuilder.newBuilder("emyzsh2","demon_will_crafter",20,1)
    .addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
        val ctrl = event.controller;
        val map = ctrl.customData.asMap();
        val bx = event.activeRecipe.parallelism;
        val emyz = isNull(map["phemyz"]) ? 0.0f : map["phemyz"].asFloat();
        if (emyz < (25.0f * bx)) {event.setFailed(false,"§4恶魔意志不足");}
    })
    .addItemInput(<bloodmagic:item_demon_crystal:2>).setChance(0.0f)
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val bx = event.activeRecipe.parallelism;
        var emyz = isNull(map["phemyz"]) ? 0.0f : map["phemyz"].asFloat();
        map["phemyz"] = emyz - (25.0f * bx);
        ctrl.customData = data;
    })
    .addItemOutput(<bloodmagic:item_demon_crystal:2>)
    .addRecipeTooltip("§e消耗25点§e破坏意志")
    .setThreadName("§e破坏意志实化模块")
    .build();

RecipeBuilder.newBuilder("emyzsh3","demon_will_crafter",20,2)
    .addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
        val ctrl = event.controller;
        val map = ctrl.customData.asMap();
        val bx = event.activeRecipe.parallelism;
        val emyz = isNull(map["fcemyz"]) ? 0.0f : map["fcemyz"].asFloat();
        if (emyz < (25.0f * bx)) {event.setFailed(false,"§4恶魔意志不足");}
    })
    .addItemInput(<bloodmagic:item_demon_crystal:3>).setChance(0.0f)
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val bx = event.activeRecipe.parallelism;
        var emyz = isNull(map["fcemyz"]) ? 0.0f : map["fcemyz"].asFloat();
        map["fcemyz"] = emyz - (25.0f * bx);
        ctrl.customData = data;
    })
    .addItemOutput(<bloodmagic:item_demon_crystal:3>)
    .addRecipeTooltip("§e消耗25点§4复仇意志")
    .setThreadName("§4复仇意志实化模块")
    .build();

RecipeBuilder.newBuilder("emyzsh4","demon_will_crafter",20,3)
    .addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
        val ctrl = event.controller;
        val map = ctrl.customData.asMap();
        val bx = event.activeRecipe.parallelism;
        val emyz = isNull(map["jyemyz"]) ? 0.0f : map["jyemyz"].asFloat();
        if (emyz < (25.0f * bx)) {event.setFailed(false,"§4恶魔意志不足");}
    })
    .addItemInput(<bloodmagic:item_demon_crystal:4>).setChance(0.0f)
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val bx = event.activeRecipe.parallelism;
        var emyz = isNull(map["jyemyz"]) ? 0.0f : map["jyemyz"].asFloat();
        map["jyemyz"] = emyz - (25.0f * bx);
        ctrl.customData = data;
    })
    .addItemOutput(<bloodmagic:item_demon_crystal:4>)
    .addRecipeTooltip("§e消耗25点§b坚毅意志")
    .setThreadName("§b坚毅意志实化模块")
    .build();

RecipeBuilder.newBuilder("emyzqh","demon_will_crafter",100,5)
    .addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val ysemyz = isNull(map["ysemyz"]) ? 0.0f : map["ysemyz"].asFloat();
        val fsemyz = isNull(map["fsemyz"]) ? 0.0f : map["fsemyz"].asFloat();
        val phemyz = isNull(map["phemyz"]) ? 0.0f : map["phemyz"].asFloat();
        val fcemyz = isNull(map["fcemyz"]) ? 0.0f : map["fcemyz"].asFloat();
        val jyemyz = isNull(map["jyemyz"]) ? 0.0f : map["jyemyz"].asFloat();
        val bx = event.activeRecipe.parallelism;
        if (ysemyz < 2.0f * bx) {event.setFailed(false,"§4原生恶魔意志不足");}
        else {
            map["ysemyz"] = ysemyz - 2.0f * bx;
            map["fsemyz"] = fsemyz + 1.0f * bx;
            map["phemyz"] = phemyz + 1.0f * bx;
            map["fcemyz"] = fcemyz + 1.0f * bx;
            map["jyemyz"] = jyemyz + 1.0f * bx;
            ctrl.customData = data;
        }
    })
    .addRecipeTooltip(["§l每并行每tick2点原生意志","§l转换为4种意志各1点"])
    .setThreadName("§3恶魔意志歧化模块")
    .build();

RecipeBuilder.newBuilder("emyzxs","demon_will_crafter",50,5)
    .addItemInput(<bloodmagic:item_demon_crystal>)
    .addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val ysemyz = isNull(map["ysemyz"]) ? 0.0f : map["ysemyz"].asFloat();
        val bx = event.activeRecipe.parallelism;
        map["ysemyz"] = ysemyz + 1.0f * bx;
        ctrl.customData = data;
    })
    .addRecipeTooltip("§l添加50点原生恶魔意志")
    .setThreadName("§3恶魔意志吸收模块")
    .build();

RecipeBuilder.newBuilder("emyzxs1","demon_will_crafter",100,5)
    .addItemInput(<ore:blockSentientMetal>).setChance(0.05f)
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val ysemyz = isNull(map["ysemyz"]) ? 0.0f : map["ysemyz"].asFloat();
        val bx = event.activeRecipe.parallelism;
        map["ysemyz"] = ysemyz + 0.1f * bx;
        ctrl.customData = data;
    })
    .addRecipeTooltip("§l每并行完成配方添加0.1点原生恶魔意志")
    .setThreadName("§3恶魔意志吸收模块")
    .build();

RecipeBuilder.newBuilder("emyzxs2","demon_will_crafter",1,5)
    .addItemInput(<tconevo:metal_block:5>).setChance(0.0f)
    .addWillInput("DEFAULT",1,0,10000000)
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val ysemyz = isNull(map["ysemyz"]) ? 0.0f : map["ysemyz"].asFloat();
        val bx = event.activeRecipe.parallelism;
        map["ysemyz"] = ysemyz + 1.0f * bx;
        ctrl.customData = data;
    })
    .addRecipeTooltip("§l添加区块内原生恶魔意志")
    .setThreadName("§3恶魔意志吸收模块")
    .build();