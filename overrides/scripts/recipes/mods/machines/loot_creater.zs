/*
 * This script is created for the GreedyCraft Tweaks by 咕咕咕.
 */

#priority 50
#loader crafttweaker reloadable

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.RecipeAdapterBuilder;
//import mods.modularmachinery.SmartInterfaceUpdateEvent;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.SmartInterfaceData;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.FactoryRecipeThread;

import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("loot_creater", 0);
val r1 = FactoryRecipeThread.createCoreThread("§1注入模块");
val r2 = FactoryRecipeThread.createCoreThread("§1概率同步模块");
val r3 = FactoryRecipeThread.createCoreThread("§1模拟模块");

MachineModifier.addCoreThread("loot_creater", r1);
MachineModifier.addCoreThread("loot_creater", r2);
MachineModifier.addCoreThread("loot_creater", r3);

MMEvents.onControllerGUIRender("loot_creater", function(event as ControllerGUIRenderEvent) {
    val ctrl as IMachineController = event.controller;
    val data as IData = ctrl.customData;
    val map as IData[string] = data.asMap();
    val energy as float = isNull(map["energy"]) ? 0.0 as float : map["energy"] as float;
    var mathe as float = Math.max(0.00f,((-0.09 as float * ((Math.sqrt(273.0d * energy as double))as float-(0.09f * energy as float * energy as float)+20.0 * energy as float+ 20.0f)+117.5f)) as float);
    mathe = Math.min(100.00f,mathe);
    var info as string[] = ["§e///战利品制造机监控系统///",
    "§e当前能量值：" + energy,
    "§e当前基底消耗概率：" + mathe + "%",
    "§e消耗概率计算公式：117.5-0.09((273x)^0.5-0.09x^2+20x+20)",
    //"§e其中x为当前能量值，消耗概率小于0的部分取绝对值后1：1转化为产率增加倍数",
    "§e推荐能量区间[113，118]"];
    event.extraInfo = info;
});

//设置概率
function chanceupload(event as RecipeCheckEvent) {
    val ctrl as IMachineController = event.controller;
    val data as IData = ctrl.customData;
    val map as IData[string] = data.asMap();
    var energy as float = isNull(map["energy"]) ? 0.00 as float : map["energy"] as float;
    var mathe as float = Math.max(0.00f,((-0.09 as float * ((Math.sqrt(273.0d * energy as double))as float-(0.09f * energy as float * energy as float)+20.0 * energy as float+ 20.0f)+117.5f)) as float);
    var chance as float = mathe as float;
    map["chance"] = chance;
    ctrl.customData = data;
}

MMEvents.onMachinePostTick("loot_creater", function(event as MachineTickEvent) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val map = data.asMap();
    val chance = isNull(map["chance"]) ? 1.00 as float : map["chance"] as float;
    ctrl.addPermanentModifier("efficiency", RecipeModifierBuilder.create("modularmachinery:item", "input", chance, 1, true).build());
});
//添减能量

function energycheck(event as RecipeCheckEvent, change as float) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val map = data.asMap();
    var energy as float = isNull(map["energy"]) ? 0.0 as float : map["energy"] as float;
    if energy < change {
        event.setFailed("§e能量不足");
    }
}

function energychange(event as FactoryRecipeStartEvent, change as float) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val map = data.asMap();
    var energy as float = isNull(map["energy"]) ? 0.0 as float : map["energy"] as float;
    if energy >= change {
        energy -= change;
        map["energy"] = energy;
        ctrl.customData = data;
    }
}

RecipeBuilder.newBuilder("chanceupload", "loot_creater", 10, 1)
    .addPostCheckHandler(function(event as RecipeCheckEvent) {
        chanceupload(event);
    })
    .addRecipeTooltip("§e///概率同步///")
    .setThreadName("§1概率同步模块")
    .build();

RecipeBuilder.newBuilder("addenergy" , "loot_creater" , 200 ,0)
    .addItemInput(<bloodmagic:slate:4>)
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        energychange(event,-50.0f);
    })
    .setThreadName("§1注入模块")
    .addRecipeTooltip("§2增加50.0点能量(石板也受概率影响)")
    .build();

RecipeBuilder.newBuilder("gaia1" , "loot_creater" , 500, 2)
    .addPostCheckHandler(function(event as RecipeCheckEvent) {
        energycheck(event,2.0f);
    })
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        energychange(event,2.0f);
    })
    .setThreadName("§1模拟模块")
    .addFluidInput(<liquid:lifeessence> * 10000)
    .addItemInput(<botania:manaresource:4> * 16)
    .addEnergyPerTickInput(10000)
    .addRecipeTooltip("§2消耗2.0点能量")
    .addItemOutput(<botania:manaresource:5> * 8)
    .build();

RecipeBuilder.newBuilder("gaia2" , "loot_creater" , 700, 2)
    .addPostCheckHandler(function(event as RecipeCheckEvent) {
        energycheck(event,2.5f);
    })
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        energychange(event,2.5f);
    })
    .setThreadName("§1模拟模块")
    .addFluidInput(<liquid:lifeessence> * 25000)
    .addItemInput(<botania:manaresource:14> * 16)
    .addEnergyPerTickInput(20000)
    .addRecipeTooltip("§2消耗2.5点能量")
    .addItemOutput(<botania:manaresource:5> * 16)
    .addItemOutput(<botania:dice>)
    .build();

RecipeBuilder.newBuilder("gaia3" , "loot_creater" , 850, 2)
    .addPostCheckHandler(function(event as RecipeCheckEvent) {
        energycheck(event,3.0f);
    })
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        energychange(event,3.0f);
    })
    .setThreadName("§1模拟模块")
    .addFluidInput(<liquid:lifeessence> * 50000)
    .addItemInput(<extrabotany:material:6> * 8)
    .addEnergyPerTickInput(50000)
    .addRecipeTooltip("§2消耗3.0点能量")
    .addItemOutput(<extrabotany:treasurebox> * 1)
    .build();

RecipeBuilder.newBuilder("gaia3ex" , "loot_creater" , 850, 2)
    .addPostCheckHandler(function(event as RecipeCheckEvent) {
        energycheck(event,3.0f);
    })
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        energychange(event,3.0f);
    })
    .setThreadName("§1模拟模块")
    .addFluidInput(<liquid:lifeessence> * 100000)
    .addItemInput(<extrabotany:material:6> * 1)
    .addItemInput(<gct_mobs:gaia_heart> * 1).setChance(0.0)
    .addEnergyPerTickInput(75000)
    .addRecipeTooltip("§2消耗3.0点能量")
    .addItemOutput(<extrabotany:treasurebox> * 1)
    .addItemOutput(<gct_mobs:gaia_heart> * 1)
    .addItemOutput(<gct_mobs:gaia_heart> * 1).setChance(0.5)
    .build();


RecipeBuilder.newBuilder("kiana" , "loot_creater" , 900, 2)
    .addPostCheckHandler(function(event as RecipeCheckEvent) {
        energycheck(event,3.0f);
    })
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        energychange(event,3.0f);
    })
    .setThreadName("§1模拟模块")
    .addFluidInput(<liquid:lifeessence> * 100000)
    .addItemInput(<extrabotany:material:9> * 8)
    .addEnergyPerTickInput(100000)
    .addRecipeTooltip("§2消耗3.0点能量")
    .addItemOutput(<extrabotany:treasurebox> * 1)
    .addItemOutput(<extrabotany:specialbag> * 3)
    .build();

RecipeBuilder.newBuilder("kianaex" , "loot_creater" , 900, 2)
    .addPostCheckHandler(function(event as RecipeCheckEvent) {
        energycheck(event,7.0f);
    })
    .addFluidInput(<liquid:lifeessence> * 250000)
    .addItemInput(<extrabotany:material:9> * 1)
    .addItemInput(<gct_ores:ordered_core> * 1).setChance(0.0)
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        energychange(event,7.0f);
    })
    .setThreadName("§1模拟模块")
    .addEnergyPerTickInput(200000)
    .addRecipeTooltip("§2消耗7.0点能量")
    .addItemOutput(<extrabotany:treasurebox> * 1)
    .addItemOutput(<extrabotany:specialbag> * 3)
    .addItemOutput(<additions:botaniaddon-kianate_ingot> * 1)
    .addItemOutput(<additions:botaniaddon-kianate_ingot> * 1).setChance(0.5)
    .build();

RecipeBuilder.newBuilder("chaos" , "loot_creater" , 1500, 2)
    .addPostCheckHandler(function(event as RecipeCheckEvent) {
        energycheck(event,15.0f);
    })
    .addFluidInput(<liquid:lifeessence> * 1000000)
    .addItemInput(<tconevo:metal_block:2> * 1)
    .addEnergyPerTickInput(1000000)
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        energychange(event,15.0f);
    })
    .setThreadName("§1模拟模块")
    .addRecipeTooltip("§2消耗15.0点能量")
    .addItemOutput(<draconicevolution:chaos_shard> * 10)
    .addItemOutput(<contenttweaker:chaos_heart> * 3)
    .build();

RecipeBuilder.newBuilder("storm" , "loot_creater" , 1750, 2)
    .addPostCheckHandler(function(event as RecipeCheckEvent) {
        energycheck(event,25.0f);
    })
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        energychange(event,25.0f);
    })
    .setThreadName("§1模拟模块")
    .addFluidInput(<liquid:lifeessence> * 2500000)
    .addItemInput(<gct_ores:creepy_witherstorm_doll> * 1)
    .addEnergyPerTickInput(2500000)
    .addRecipeTooltip("§2消耗25.0点能量")
    .addItemOutput(<gct_ores:stormy_shard> * 10)
    .addItemOutput(<ageofminecraft:withered_nether_star> * 5)
    .build();

RecipeBuilder.newBuilder("blackstone" , "loot_creater" , 500, 2)
    .addPostCheckHandler(function(event as RecipeCheckEvent) {
        energycheck(event,10.0f);
    })
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        energychange(event,10.0f);
    })
    .setThreadName("§1模拟模块")
    .addFluidInput(<liquid:lifeessence> * 250000)
    .addItemInput(<gct_ores:senterian_builder_lab> * 1)
    .addEnergyPerTickInput(250000)
    .addRecipeTooltip("§2消耗10.0点能量")
    .addItemOutput(<additions:greedycraft-dullium_ingot> * 32)
    .build();

RecipeBuilder.newBuilder("destroyer" , "loot_creater" , 500, 2)
    .addPostCheckHandler(function(event as RecipeCheckEvent) {
        energycheck(event,5.0f);
    })
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        energychange(event,5.0f);
    })
    .setThreadName("§1模拟模块")
    .addFluidInput(<liquid:lifeessence> * 10000)
    .addItemInput(<defiledlands:calling_stone> * 1)
    .addEnergyPerTickInput(10000)
    .addRecipeTooltip("§2消耗5.0点能量")
    .addItemOutput(<defiledlands:essence_destroyer> * 16)
    .build();

RecipeBuilder.newBuilder("mourner" , "loot_creater" , 750, 2)
    .addPostCheckHandler(function(event as RecipeCheckEvent) {
        energycheck(event,5.0f);
    })
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        energychange(event,5.0f);
    })
    .setThreadName("§1模拟模块")
    .addFluidInput(<liquid:lifeessence> * 50000)
    .addItemInput(<defiledlands:idol_sorrow> * 1)
    .addEnergyPerTickInput(50000)
    .addRecipeTooltip("§2消耗5.0点能量")
    .addItemOutput(<defiledlands:essence_mourner> * 16)
    .build();

RecipeBuilder.newBuilder("rod" , "loot_creater" , 200, 2)
    .addPostCheckHandler(function(event as RecipeCheckEvent) {
        energycheck(event,0.5f);
    })
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        energychange(event,0.5f);
    })
    .setThreadName("§1模拟模块")
    .addFluidInput(<liquid:lifeessence> * 250000)
    .addEnergyPerTickInput(100000)
    .addItemInput(<jaopca:gear.thermallite> * 1)
    .addRecipeTooltip("§2消耗0.5点能量")
    .addItemOutput(<gct_mobs:bthdz_rod> * 32)
    .addItemOutput(<gct_mobs:bligtz_rod> * 32)
    .addItemOutput(<gct_mobs:bninz_rod> * 32)
    .addItemOutput(<gct_mobs:bnatuz_rod> * 32)
    .addItemOutput(<thermalfoundation:material:2048> * 32)
    .addItemOutput(<thermalfoundation:material:2050> * 32)
    .addItemOutput(<thermalfoundation:material:2052> * 32)
    .addItemOutput(<minecraft:blaze_rod> * 32)
    .build();

RecipeBuilder.newBuilder("betwnite" , "loot_creater" , 250,2)
    .addPostCheckHandler(function(event as RecipeCheckEvent) {
        energycheck(event,2.0f);
    })
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        energychange(event,2.0f);
    })
    .setThreadName("§1模拟模块")
    .addFluidInput(<liquid:lifeessence> * 100000)
    .addItemInput(<jaopca:block.betwnite> * 1)
    .addEnergyPerTickInput(50000)
    .addRecipeTooltip("§2消耗2.0点能量")
    .addItemOutput(<additions:greedycraft-rotiron_scrap> * 16)
    .addItemOutput(<additions:greedycraft-dirtshape> * 8)
    .addItemOutput(<additions:greedycraft-bone_shard> * 8)
    .addItemOutput(<thebetweenlands:sap_spit> * 8)
    .build();

RecipeBuilder.newBuilder("twilit" , "loot_creater" , 250, 2)
    .addPostCheckHandler(function(event as RecipeCheckEvent) {
        energycheck(event,1.0f);
    })
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        energychange(event,1.0f);
    })
    .setThreadName("§1模拟模块")
    .addFluidInput(<liquid:lifeessence> * 100000)
    .addItemInput(<jaopca:block.twilit> * 1)
    .addEnergyPerTickInput(50000)
    .addRecipeTooltip("§2消耗1.0点能量")
    .addItemOutput(<divinerpg:arcanium> * 16)
    .addItemOutput(<additions:greedycraft-eden_ingot> * 8)
    .addItemOutput(<additions:greedycraft-wildwood_ingot> * 8)
    .addItemOutput(<additions:greedycraft-apalachia_ingot> * 8)
    .addItemOutput(<additions:greedycraft-skythern_ingot> * 8)
    .addItemOutput(<additions:greedycraft-mortum_ingot> * 8)
    .build();

RecipeBuilder.newBuilder("blacksun" , "loot_creater" , 250, 2)
    .addPostCheckHandler(function(event as RecipeCheckEvent) {
        energycheck(event,10.0f);
    })
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        energychange(event,10.0f);
    })
    .setThreadName("§1模拟模块")
    .addFluidInput(<liquid:lifeessence> * 50000)
    .addItemInput(<additions:bloody-gloomy_passport> * 1)
    .addEnergyPerTickInput(50000)
    .addRecipeTooltip("§2消耗10.0点能量")
    .addItemOutput(<additions:bloody-darkest_core> * 16)
    .build();