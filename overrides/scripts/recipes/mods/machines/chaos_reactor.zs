/*
 * This script is created for the GreedyCraft Tweaks by 咕咕咕.
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
val ReactThead = FactoryRecipeThread.createCoreThread("§e混沌能量汲取系统");
val FuelThead = FactoryRecipeThread.createCoreThread("§e混沌注入系统");
val Coolingdown = FactoryRecipeThread.createCoreThread("§e混沌调律系统");
val CraftingThead = FactoryRecipeThread.createCoreThread("§e混沌秩序化系统");
val SpeedThead = FactoryRecipeThread.createCoreThread("§e混沌同步系统");

MachineModifier.setMaxThreads("chaos_reactor", 0 as int);
MachineModifier.addCoreThread("chaos_reactor", ReactThead);
MachineModifier.addCoreThread("chaos_reactor", FuelThead);
MachineModifier.addCoreThread("chaos_reactor", Coolingdown);
MachineModifier.addCoreThread("chaos_reactor", CraftingThead);
MachineModifier.addCoreThread("chaos_reactor", SpeedThead);
MachineModifier.setMaxParallelism("chaos_reactor",1);

//燃料表
val Fuelmap as float[IOreDictEntry]   = {
    <ore:coreOrdered> : 1000000.0,
    <ore:coreEpic> : 500000.0,
    <ore:coreSuperior> : 300000.0
};

//冷却表
val Coolingmap as float[ILiquidStack] = {
    <liquid:water>           : 250.0,
    <liquid:cryotheum>       : 10000.0,
    <liquid:hecryo_liquid>   : 100000.0
};

//控制器信息
MMEvents.onControllerGUIRender("chaos_reactor" , function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    val map = ctrl.customData.asMap();
    val cooling = isNull(map["cool"]) ? 0 : map["cool"].asFloat();
    val fuel = isNull(map["fuel"]) ? 0 : map["fuel"].asFloat();
    val speed = isNull(map["speed"]) ? 1.0f : map["speed"].asFloat();
    var info as string[] = [
        "§e///混沌反应监控系统///",
        "§e调律场充能强度：" + cooling ,
        "§e燃料储备：" + fuel + "§emL",
        "§e当前反应速率：" + speed + "§ex",
        "§e提示：调律场降到0时将使燃料全部逸散至混沌"
    ];
    if (fuel <= 10000.0f) {
        info += "§4燃料储备过低";
    }
    if (cooling <= 10000.0f) {
        info += "§4警告：调律场充能强度过低，混沌能量汲取系统处于亚稳态";
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
        map["fuel"] = fuel - (speed * 2);
        map["cool"] = cool - (speed * 5);
    }
    else {event.setFailed(false,"§4燃料不足");}
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
        .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
            addfuel(event,amount);
        })
        .addRecipeTooltip("§e为混沌注入系统增加" ~ amount ~ "§e点燃料值")
        .setThreadName("§e混沌注入系统")
        .build();
    r += 1;
}

for cool , amount in Coolingmap {
    RecipeBuilder.newBuilder("cooladd" + r ,"chaos_reactor",5,2)
        .addFluidInput(cool * 50)
        .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
            addcool(event,amount);
        })
        .addRecipeTooltip("§e为混沌调律系统增加" ~ amount ~ "§e点充能值")
        .setThreadName("§e混沌调律系统")
        .build();
    r += 1;
}

//写入速度&判断
RecipeBuilder.newBuilder("speedwrite","chaos_reactor",20,4)
    .addSmartInterfaceDataInput("speed", 0.0001, 100000000)
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        check(event);
    })
    .addRecipeTooltip("§e同步秩序与混沌")
    .setThreadName("§e混沌同步系统")
    .setParallelized(false)
    .build();

//反应
RecipeBuilder.newBuilder("chaosreacting","chaos_reactor",2000,0)
    .addItemInput(<mekanism:configurator>).setChance(0.0f)
    .addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
        react(event);
    })
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        Sync.addSyncTask(function(){
            val ctrl = event.controller;
            val world = ctrl.world;
            val cpos = ctrl.pos;
            val pos = cpos.getOffset(down , 4);
            if (!world.remote) {
                world.setBlockState(<blockstate:draconicevolution:reactor_core>,{BCManagedData: {reactorState: 5 as byte, reactableFuel: 1000.0,explosionCountdown:2147483647,temperature:9000.0}},pos);
            }
        });
    })
    .addFactoryFinishHandler(function (event as FactoryRecipeFinishEvent) {
        Sync.addSyncTask(function(){
            val ctrl = event.controller;
            val world = ctrl.world;
            val cpos = ctrl.pos;
            val pos = cpos.getOffset(down , 4);
            if (!world.remote) {
                world.setBlockState(<blockstate:draconicevolution:energy_storage_core>,pos);
            }
        });
    })
    .addEnergyPerTickOutput(10000000)
    .addRecipeTooltip("§e1倍产出")
    .setThreadName("§e混沌能量汲取系统")
    .build();