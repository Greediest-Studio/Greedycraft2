/*
 * This script is created for the GreedyCraft Tweaks by 咕咕咕.
 */

/*
#priority 50
#loader crafttweaker reloadable

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;

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

import mods.zenutils.DataUpdateOperation.OVERWRITE;
import mods.zenutils.DataUpdateOperation.MERGE;



//数据接口
MachineModifier.addSmartInterfaceType("chaos_reactor", 
    SmartInterfaceType.create("speed",1)
    .setHeaderInfo("§e///反应速率设置///")
    .setValueInfo("§e///当前反应速率：%.2fx")
    .setNotEqualMessage("你家反应速率能填负的？（恼")
    .setFooterInfo("§e/////////////////")
);

//线程
val ReactThead = FactoryRecipeThread.createCoreThread("混沌能量汲取系统");
val FuelThead = FactoryRecipeThread.createCoreThread("混沌注入系统");
val Coolingdown = FactoryRecipeThread.createCoreThread("混沌调律系统");
val CraftingThead = FactoryRecipeThread.createCoreThread("混沌秩序化系统");

MachineModifier.setMaxThreads("chaos_reactor",0);
MachineModifier.addCoreThread("chaos_reactor",ReactThead);
MachineModifier.addCoreThread("chaos_reactor",FuelThead);
MachineModifier.addCoreThread("chaos_reactor",Coolingdown);
MachineModifier.addCoreThread("chaos_reactor",CraftingThead);

//燃料表
//basicfuel = 10 as int;
val Fuelmap  = {
    <ore:coreOrdered> : 1000000,
    <ore:coreEpic> : 500000,
    <ore:coreSuperior> : 300000
};

//冷却表
//basiccool = 100 as int;
val Coolingmap as int[ILiquidStack] = {
    <liquid:water>           : 1000,
    <liquid:cryotheum>       : 10000,
    <liquid:hecryo_liquid>   : 100000
};

//控制器信息
MMEvents.onControllerGUIRender("chaos_reactor",function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    val map = ctrl.customData.asMap();
    var cooling = isNull(map["cool"]) ? 0 as float : map["cool"].asFloat();
    var fuel = isNull(map["fuel"]) ? 0 as float : map["fuel"].asFloat();
    var speed = isNull(map["speed"]) ? 1 as float : map["speed"].asFloat();
    var info as string[] = [
        "§e///混沌反应监控系统///",
        "§e调律场充能强度：" + cooling ,
        "§e燃料储备：" + fuel ,
        "§e当前反应速率：" + speed ,
        "§e提示：调律场降到0时将使燃料全部逸散至混沌"
    ];
    if (fuel <= 10000){
        info += "§4燃料储备过低";
    }
    if (fuel <= 10000){
        info += "§4警告：调律场充能强度过低,混沌能量汲取系统处于亚稳态";
    }
    event.extraInfo = info;
});

//反应函数
function reactingchecker(event as FactoryRecipeTickEvent) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val map = data.asMap();
    val cooling = isNull(map["cool"]) ? 0 : map["cool"].asFloat();
    if ctrl.isWorking && cooling <=5000 {
        map["fuel"] = 0;
        ctrl.customData.deepUpdate(data,OVERWRITE);
    }
}

function reacting(event as FactoryRecipeTickEvent) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val map = data.asMap();
    val cooling = isNull(map["cool"]) ? 0 : map["cool"].asFloat();
    val fuel = isNull(map["fuel"]) ? 0 : map["fuel"].asFloat();
    val speed = isNull(map["speed"]) ? 1 : map["speed"].asFloat();
    if (fuel >= 5000 && fuel >= speed * 5) {
        map["fuel"] = fuel - (speed * 10);
        map["cool"] = cooling - (speed * 100);
        ctrl.customData.deepUpdate(data,OVERWRITE);
    }
}

function start(event as FactoryRecipeStartEvent) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val map = data.asMap();
    val theard = event.factoryRecipeThread;
    val speeddata = ctrl.getSmartInterfaceData("speed");
    var speed = isNull(speeddata) ? 1 : speeddata.value;
    theard.addPermanentModifier("ReactThead",RecipeModifierBuilder.create("modularmachinery:energy", "output", speed, 1, false).build());
    map["speed"] = speed;
    ctrl.customData.deepUpdate(data,OVERWRITE);
}

//添加燃料&冷却剂
function addfuel(ctrl as IMachineController, amount as float) {
    val data = ctrl.customData;
    val map = data.asMap();
    val fueldata = map["fuel"].asFloat();
    val fuel = isNull(map["fuel"]) ? 0 as float : fueldata;
    map["fuel"] = fuel + amount;
    ctrl.customData.deepUpdate(data,OVERWRITE);
}

function addcool(ctrl as IMachineController, amount as float) {
    val data = ctrl.customData;
    val map = data.asMap();
    val cooldata = map["cool"].asFloat();
    val cool = isNull(map["cool"]) ? 0 as float : cooldata;
    map["cool"] = cool + amount;
    ctrl.customData.deepUpdate(data,OVERWRITE);
}

//检查燃料
function fuelchecker(map as IData[string]) as bool {
    val Fuel = isNull(map["fuel"]) ? 0 : map["fuel"].asFloat();
    return Fuel >= 2000;
}

//燃料&冷却剂配方
var r = 1 as int;
for fuel ,amount in Fuelmap {
    RecipeBuilder.newBuilder("addfuel" + r , "chaos_reactor" , 1 , 2 ,false)
        .addItemInput(fuel)
        .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
            addfuel(event.controller,amount);
        })
        .addRecipeTooltip("§e增加" + amount + "§e点燃料值")
        .setMaxThreads(1)
        .setThreadName("混沌注入系统")
        .build();
    r += 1;
}

for cool ,amount in Coolingmap {
    RecipeBuilder.newBuilder("addcool" + r,"chaos_reactor", 1, 3, false)
        .addFluidInput(cool * 100)
        .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
            addcool(event.controller,amount);
        })
        .addRecipeTooltip("§e为调律场增加" + amount + "§e点充能")
        .setMaxThreads(1)
        .setThreadName("混沌调律系统")
        .build();
    r += 1;
}

//反应配方
RecipeBuilder.newBuilder("ele", "chaos_reactor", 1, 1)
    .addSmartInterfaceDataInput("speed",0,10000000000)
    .addPostCheckHandler(function(event as RecipeCheckEvent){
        val map = event.controller.customData.asMap();
        if(!fuelchecker(map)){
            event.setFailed("§4燃料过少");
            return;
        }
    })
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent){
        start(event);
    })
    .addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent){
        reactingchecker(event);
    })
    .addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent){
        reacting(event);
    })
    .addRecipeTooltip("§e此为速率为1时产出")
    .addEnergyPerTickOutput(100000)
    .setMaxThreads(1)
    .setThreadName("混沌能量汲取系统")
    .build();
*/