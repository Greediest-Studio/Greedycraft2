/*
 * This script is created for the GreedyCraft Tweaks by 咕咕咕.
 */

#priority 1000
#loader crafttweaker reloadable

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
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
import mods.modularmachinery.RecipeTickEvent;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.SmartInterfaceData;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.FactoryRecipeThread;

import mods.jei.JEI;


/*
{astralsorcery: {constellationName: "astralsorcery.constellation.mineralis", 
                trait: "astralsorcery.constellation.vorux",
                crystalProperties: {collectiveCapability: 100, 
                                                    size: 900, 
                                                    fract: 0, 
                                                    purity: 100, 
                                                    sizeOverride: -1
                                    }
                    }
    }
*/

JEI.addDescription(<modularmachinery:crystal_changer_factory_controller>,[
    "§e共鸣星座对应ID：",
    "§e无：0",//0
    "§e晶金座：1",
    "§e圣芒座：2",
    "§e虚御座：3",
    "§e非攻座：4",
    "§e时钟座：5",
    "§e遁甲座：6",
    "§e唤生座：7",
    "§e天炉座：8",
    "§e牧夫座：9",
    "§e生息座：10",
    "§e南极座：11",
    "§e解离座：12",
    " ",
    "§e修饰星座对应ID：",
    "§e无：0",
    "§e贪狼座：1",
    "§e避役座：2",
    "§e寒冰座：3",
    "§e振变座：4"
]);
<modularmachinery:crystal_changer_factory_controller>.addTooltip("§e星座ID请查看JEI");

//控制器信息
MMEvents.onControllerGUIRender("crystal_changer" , function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    val map = ctrl.customData.asMap();
    val xzmc as string[] = [
        "无",//0
        "晶金座",//1
        "圣芒座",//2
        "虚御座",//3
        "非攻座",//4
        "时钟座",//5
        "遁甲座",//6
        "唤生座",//7
        "天炉座",//8
        "牧夫座",//9
        "生息座",//10
        "南极座",//11
        "解离座"//12
    ];
    val xzmc1 as string[] = [
        "无",//0
        "贪狼座",//1
        "避役座",//2
        "寒冰座",//3
        "振变座"//4
    ];
    var cc = isNull(map["size"]) ? 900 : map["size"] * 1;
    if (cc > 1500) {cc = 1500;}
    var cd = isNull(map["purity"]) ? 100 : map["purity"] * 1;
    if (cd > 120) {cd = 120;}
    var pg = isNull(map["collectiveCapability"]) ? 100 : map["collectiveCapability"] * 1;
    if (pg > 120) {pg = 120;}
    var xz = isNull(map["constellationName"]) ? 0 : map["constellationName"] * 1;
    if (xz > 12) {xz = 0;}
    var xz1 = isNull(map["trait"]) ? 0 : map["trait"] * 1;
    if (xz1 > 4) {xz1 = 0;}
    val gmxz1 = xzmc[xz];
    val xsxz1 = xzmc1[xz1];
    var info as string[] = [
        "§e§l///水晶构建系统///",
        "§e§l当前尺寸：" + cc,
        "§e§l当前纯度：" + cd,
        "§e§l当前抛光：" + pg,
        "§e§l当前共鸣星座：" + gmxz1,
        "§e§l当前修饰星座：" + xsxz1
    ];
    event.extraInfo = info;
});

MachineModifier.addSmartInterfaceType("crystal_changer", 
    SmartInterfaceType.create("size",900)
    .setHeaderInfo("§e///尺寸设置///")
    .setValueInfo("§e当前尺寸：%.2f")
    .setJeiTooltip("尺寸同步", 1)
    .setNotEqualMessage("无效尺寸数值")
    .setFooterInfo("§e/////////////////")
);
MachineModifier.addSmartInterfaceType("crystal_changer", 
    SmartInterfaceType.create("purity",100)
    .setHeaderInfo("§e///纯度设置///")
    .setValueInfo("§e当前纯度：%.2f")
    .setJeiTooltip("纯度同步", 1)
    .setNotEqualMessage("无效纯度数值")
    .setFooterInfo("§e/////////////////")
);
MachineModifier.addSmartInterfaceType("crystal_changer", 
    SmartInterfaceType.create("collectiveCapability",100)
    .setHeaderInfo("§e///抛光设置///")
    .setValueInfo("§e当前抛光：%.2f")
    .setJeiTooltip("抛光同步", 1)
    .setNotEqualMessage("无效抛光数值")
    .setFooterInfo("§e/////////////////")
);
MachineModifier.addSmartInterfaceType("crystal_changer", 
    SmartInterfaceType.create("constellationName",0)
    .setHeaderInfo("§e///共鸣星座设置///")
    .setValueInfo("§e当前共鸣星座ID%.2f：")
    .setJeiTooltip("共鸣星座同步", 1)
    .setNotEqualMessage("无效星座ID")
    .setFooterInfo("§e对应星座请查看jei")
);
MachineModifier.addSmartInterfaceType("crystal_changer", 
    SmartInterfaceType.create("trait",0)
    .setHeaderInfo("§e///修饰星座设置///")
    .setValueInfo("§e当前修饰星座ID%.2f：")
    .setJeiTooltip("修饰星座同步", 1)
    .setNotEqualMessage("无效星座ID")
    .setFooterInfo("§e对应星座请查看jei")
);

function dataget(event as FactoryRecipeFinishEvent,name as string,min as int,max as int) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val map = data.asMap();
    val get = ctrl.getSmartInterfaceData(name);
    val numf  = isNull(get) ? 1.0f : get.value;
    var num  = 1 * numf;
    num = ((num < min) || (num > max)) ? min : num;
    map[name] = num;
    ctrl.customData = data;
}

function output(ctrl as IMachineController) {
    val data = ctrl.customData;
    val map = data.asMap();
    val xzlb as string[] = [
        "zwf",//0
        "astralsorcery.constellation.mineralis",//晶金座1
        "astralsorcery.constellation.lucerna",//圣芒座2
        "astralsorcery.constellation.vicio",//虚御座3
        "astralsorcery.constellation.discidia",//非攻座4
        "astralsorcery.constellation.horologium",//时钟座5
        "astralsorcery.constellation.armara",//遁甲座6
        "astralsorcery.constellation.pelotrio",//唤生座7
        "astralsorcery.constellation.fornax",//天炉座8
        "astralsorcery.constellation.bootes",//牧夫座9
        "astralsorcery.constellation.aevitas",//生息座10
        "astralsorcery.constellation.octans",//南极座11
        "astralsorcery.constellation.evorsio"//解离座12
    ];
    val xzlb1 as string[] = [
        "zwf",//0
        "astralsorcery.constellation.vorux",//贪狼座1
        "astralsorcery.constellation.ulteria",//避役座2
        "astralsorcery.constellation.gelu",//寒冰座3
        "astralsorcery.constellation.alcara"//振变座4
    ];
    var cc = isNull(map["size"]) ? 900 : map["size"];
    var cd = isNull(map["purity"]) ? 100 : map["purity"];
    var pg = isNull(map["collectiveCapability"]) ? 100 : map["collectiveCapability"];
    var xz = isNull(map["constellationName"]) ? 0 : map["constellationName"];
    var xz1 = isNull(map["trait"]) ? 0 : map["trait"];
    val gmxz = xzlb[xz];
    val xsxz = xzlb1[xz1];
    if (xz == 0) {
        val tag as IData = {astralsorcery:{crystalProperties: {collectiveCapability: pg as int,size: cc as int ,fract: 0 as int,purity: cd as int,sizeOverride: -1 as int}}};
        if (cc <= 400) {
            return <astralsorcery:itemrockcrystalsimple>.withTag(tag);
        }
        else {
            return <astralsorcery:itemcelestialcrystal>.withTag(tag);
        }
    } 
    else {
        if (xz1 == 0) {
            val tag as IData = {astralsorcery:{constellationName: gmxz,crystalProperties: {collectiveCapability: pg as int,size: cc as int ,fract: 0 as int,purity: cd as int,sizeOverride: -1 as int}}};
            if (cc <= 400) {
                return <astralsorcery:itemtunedrockcrystal>.withTag(tag);
            }
            else {
                return <astralsorcery:itemtunedcelestialcrystal>.withTag(tag);
            }
        }
        else {
            val tag as IData = {astralsorcery:{constellationName: gmxz,trait: xsxz,crystalProperties: {collectiveCapability: pg as int,size: cc as int ,fract: 0 as int,purity: cd as int,sizeOverride: -1 as int}}};
            if (cc <= 400) {
                return <astralsorcery:itemtunedrockcrystal>.withTag(tag);
            }
            else {
                return <astralsorcery:itemtunedcelestialcrystal>.withTag(tag);
            }
        }
    }
}

//线程
val tbThead = FactoryRecipeThread.createCoreThread("§e数据同步系统");
val craftingThead = FactoryRecipeThread.createCoreThread("§e水晶塑造系统");
val crafting1Thead = FactoryRecipeThread.createCoreThread("§e星能聚合系统");

MachineModifier.setMaxThreads("crystal_changer", 0);
MachineModifier.addCoreThread("crystal_changer", tbThead);
MachineModifier.addCoreThread("crystal_changer", craftingThead);
MachineModifier.addCoreThread("crystal_changer", crafting1Thead);

RecipeBuilder.newBuilder("crystal_changer_tb","crystal_changer",25,0)
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        dataget(event,"size",0,1500);
        dataget(event,"purity",0,120);
        dataget(event,"collectiveCapability",0,120);
        dataget(event,"constellationName",0,12);
        dataget(event,"trait",0,4);
    })
    .setThreadName("§e数据同步系统")
    .setParallelized(false)
    .build();

RecipeBuilder.newBuilder("crystal_changer_craft","crystal_changer",20,5)
    .addItemInput(<additions:astral_metal_ingot>)
    .addFluidInput(<liquid:astralsorcery.liquidstarlight> * 8000)
    .addItemOutput(<astralsorcery:itemrockcrystalsimple>).addItemModifier(function(ctrl as IMachineController, oldItem as IItemStack) as IItemStack {
        return output(ctrl);
    })
    .addRecipeTooltip("§e根据输入数值决定产出")
    .addRecipeTooltip("§l§e尺寸范围: 0 ~ 1500","§l§e纯度范围: 0 ~ 120","§l§e抛光范围: 0 ~ 120","§l§e共鸣星座ID范围: 0 ~ 12","§l§e修饰星座ID范围: 0 ~ 4")
    .setThreadName("§e水晶塑造系统")
    .build();

val recipelist as IItemStack[IItemStack] = {
    <astralsorcery:itemcraftingcomponent> : <astralsorcery:itemcraftingcomponent:4>,
    <biomesoplenty:gem:1> : <additions:resonating_ruby>,
    <minecraft:glass_pane> : <astralsorcery:itemcraftingcomponent:3>,
    <minecraft:sand> : <minecraft:clay>,
    <minecraft:dirt> : <minecraft:grass>,
    <minecraft:ender_pearl> : <minecraft:ender_eye>,
    <minecraft:gunpowder> : <minecraft:glowstone_dust>,
    <minecraft:redstone> : <minecraft:gunpowder>,
    <minecraft:slime_ball> : <minecraft:magma_cream>,
    <minecraft:carrot> : <minecraft:golden_carrot>,
    <minecraft:melon> : <minecraft:speckled_melon>
};

var r = 1;
for iteminput , itemoutput in recipelist {
    RecipeBuilder.newBuilder("crystal_changer_craft1" + r,"crystal_changer",20,6)
        .addItemInput(iteminput)
        .addFluidInput(<liquid:astralsorcery.liquidstarlight> * 20)
        .addItemOutput(itemoutput)
        .setThreadName("§e星能聚合系统")
        .build();
    r += 1;
}