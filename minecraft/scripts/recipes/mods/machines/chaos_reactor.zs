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

//数据接口
MachineModifier.addSmartInterfaceType("chaos_reactor", 
    SmartInterfaceType.create("speed",1.0f)
        .setHeaderInfo("§e///反应速率设置///")
        .setValueInfo("§e///当前反应速率：%.2fx")
        .setNotEqualMessage("§e反应速率非法")
        .setFooterInfo("§e/////////////////")
);

//线程
val ReactThead = FactoryRecipeThread.createCoreThread("混沌能量汲取系统");
val FuelThead = FactoryRecipeThread.createCoreThread("混沌注入系统");
val Coolingdown = FactoryRecipeThread.createCoreThread("混沌调律系统");
val CraftingThead = FactoryRecipeThread.createCoreThread("混沌秩序化系统");
val SpeedThead = FactoryRecipeThread.createCoreThread("混沌同步系统");

MachineModifier.setMaxThreads("chaos_reactor", 0 as int);
MachineModifier.addCoreThread("chaos_reactor", ReactThead);
MachineModifier.addCoreThread("chaos_reactor", FuelThead);
MachineModifier.addCoreThread("chaos_reactor", Coolingdown);
MachineModifier.addCoreThread("chaos_reactor", CraftingThead);
MachineModifier.addCoreThread("chaos_reactor", SpeedThead);
MachineModifier.setMaxParallelism("chaos_reactor",1);

//燃料表
val Fuelmap as float[IOreDictEntry]   = {
    <ore:coreOrdered> : 75000000.0,
    <ore:coreEpic> : 3500000.0,
    <ore:coreSuperior> : 1500000.0
};

//冷却表
val Coolingmap as float[ILiquidStack] = {
    <liquid:water>           : 10.0,
    <liquid:cryotheum>       : 5000.0,
    <liquid:hecryo_liquid>   : 30000.0
};

//控制器信息
MMEvents.onControllerGUIRender("chaos_reactor" , function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    val map = ctrl.customData.asMap();
    val cooling = isNull(map["cool"]) ? 0 : map["cool"].asFloat();
    val fuel = isNull(map["fuel"]) ? 0 : map["fuel"].asFloat();
    val speed = isNull(map["speed"]) ? 1.0f : map["speed"].asFloat();
    var info as string[] = [
        "§a///混沌汲能反应堆控制面板///",
        "§a机器名称：§eLV4 - 混沌汲能反应堆",
        "§a调律强度：§e" + cooling ,
        "§a燃料储备：§e" + fuel + "mL",
        "§a反应速率：§e" + speed + "x",
        "§e提示：调律场降到0时将使燃料全部逸散至混沌"
    ];
    if (fuel <= 10000.0f) {
        info += "§c燃料储备过低！";
    }
    if (cooling <= 10000.0f) {
        info += "§c调律场充能强度过低，混沌能量汲取系统处于亚稳态！";
    }
    event.extraInfo = info;
});

//反应函数
function react(event as FactoryRecipeTickEvent) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val map = data.asMap();
    var speed = isNull(map["speed"]) ? 1 as float : map["speed"].asFloat();
    var cool = isNull(map["cool"]) ? 0.0f : map["cool"].asFloat();
    var fuel = isNull(map["fuel"]) ? 0.0f : map["fuel"].asFloat();
    if (fuel > 0.0f) {
        map["fuel"] = fuel - (speed * 3);
        map["cool"] = cool - (speed * 7);
    }
    else {event.setFailed(false,"燃料不足");}
    ctrl.customData = data;
}

//检查&同步
function check(event as FactoryRecipeStartEvent) {
    val ctrl = event.controller;
    var data = ctrl.customData;
    var map = data.asMap();
    var speedget = ctrl.getSmartInterfaceData("speed");
    var speed = isNull(speedget) ? 1 as float : speedget.value;
    var fuel = isNull(map["fuel"]) ? 0.0f : map["fuel"].asFloat();
    if (speed < 0.0001f || speed > 100000000.0f) {
        speedget.value = 1 as float;
    }
    var cooling as float = isNull(map["cool"]) ? 0.0f : map["cool"].asFloat();
    if (cooling <= 0.0f) {
        map["fuel"] = 0.0f;
    }
    map["speed"] = speed;
    ctrl.customData = data;
} 

//添加
function addfuel(event as FactoryRecipeFinishEvent,amount as float) {
    val ctrl = event.controller;
    var data = ctrl.customData;
    var map = data.asMap();
    val fuel = map["fuel"].asFloat();
    map["fuel"] = fuel + amount;
    ctrl.customData = data;
}

function addcool(event as FactoryRecipeFinishEvent,amount as float) {
    val ctrl = event.controller;
    var data = ctrl.customData;
    var map = data.asMap();
    var cool = isNull(map["cool"]) ? 0.0f : map["cool"].asFloat();
    map["cool"] = cool + amount;
    ctrl.customData = data;
}

var r as int = 1;
for fuel , amount in Fuelmap {
    RecipeBuilder.newBuilder("fueladd" + r ,"chaos_reactor",10,1)
        .addItemInput(fuel)
        .addPreCheckHandler(function(event as RecipeCheckEvent) {
            val ctrl = event.controller;
            var data = ctrl.customData;
            var map = data.asMap();
            val fuel = isNull(map["fuel"]) ? 0.0f : map["fuel"].asFloat();
            if (fuel > 1000000000.0f) {event.setFailed("燃料储备已满");}
        })
        .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
            addfuel(event,amount);
        })
        .addRecipeTooltip("§e为混沌注入系统增加" ~ amount ~ "§e点燃料值")
        .setThreadName("混沌注入系统")
        .build();
    r += 1;
}

for cool , amount in Coolingmap {
    RecipeBuilder.newBuilder("cooladd" + r ,"chaos_reactor",5,2)
        .addFluidInput(cool * 50)
        .addPreCheckHandler(function(event as RecipeCheckEvent) {
            val ctrl = event.controller;
            var data = ctrl.customData;
            var map = data.asMap();
            val cool = isNull(map["cool"]) ? 1.0f : map["cool"].asFloat();
            if (cool > 1000000000.0f) {event.setFailed("调律场充能已满");}
        })
        .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
            addcool(event,amount);
        })
        .addRecipeTooltip("§e为混沌调律系统增加" ~ amount ~ "§e点充能值")
        .setThreadName("混沌调律系统")
        .build();
    r += 1;
}

//写入速度&判断
RecipeBuilder.newBuilder("speedwrite","chaos_reactor",20,4)
    .addSmartInterfaceDataInput("speed",0.00001,100000000.0)
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        check(event);
    })
    .addRecipeTooltip("§e同步秩序与混沌")
    .setThreadName("混沌同步系统")
    .setParallelized(false)
    .build();

//反应
RecipeBuilder.newBuilder("chaosreacting","chaos_reactor",2000,0)
    .addItemInput(<mekanism:configurator>).setChance(0.0f)
    .addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
        react(event);
    })
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        val thread = event.factoryRecipeThread;
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val num = isNull(map["speed"]) ? 1.0f : map["speed"];
        thread.addPermanentModifier("rf", RecipeModifierBuilder.create("modularmachinery:energy", "output", num, 1, false).build());
        Sync.addSyncTask(function(){
            val ctrl = event.controller;
            val world = ctrl.world;
            val cpos = ctrl.pos;
            val pos = cpos.getOffset(down , 4);
        });
    })
    .addFactoryFinishHandler(function (event as FactoryRecipeFinishEvent) {
        Sync.addSyncTask(function(){
            val ctrl = event.controller;
            val world = ctrl.world;
            val cpos = ctrl.pos;
            val pos = cpos.getOffset(down , 4);
        });
    })
    .addEnergyPerTickOutput(10000000)
    .addRecipeTooltip("§e1倍产出")
    .setThreadName("混沌能量汲取系统")
    .build();