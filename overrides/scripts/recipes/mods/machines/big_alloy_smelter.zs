/*
 * This script is created for the GreedyCraft Tweaks by 孤梦梦梦梦
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
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifierBuilder;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.SmartInterfaceData;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.FactoryRecipeThread;

val dzmk = FactoryRecipeThread.createCoreThread("§e§l合金锻造模块");
val drsr = FactoryRecipeThread.createCoreThread("§e§l电容安装模块");
val drsc = FactoryRecipeThread.createCoreThread("§e§l电容拆卸模块");

MachineModifier.setMaxThreads("big_alloy_smelter", 0);
MachineModifier.addCoreThread("big_alloy_smelter", dzmk);
MachineModifier.addCoreThread("big_alloy_smelter", drsr);
MachineModifier.addCoreThread("big_alloy_smelter", drsc);

//等级 速率 并行 id
static drlb as float[][IItemStack] = {
    <enderio:item_basic_capacitor> : [1.0f,1.0f,1.0f,1.0f],
    <enderio:item_basic_capacitor:1> : [2.0f,2.0f,1.0f,2.0f],
    <enderio:item_basic_capacitor:2> : [3.0f,4.0f,1.0f,3.0f],
    <enderio:item_capacitor_grainy> : [0.5f,1.0f,1.0f,4.0f],
    <enderio:item_capacitor_crystalline> : [3.5f,6.0f,2.0f,5.0f],
    <enderio:item_capacitor_melodic> : [4.0f,8.0f,4.0f,6.0f],
    <enderio:item_capacitor_stellar> : [5.0f,12.0f,6.0f,7.0f],
    <enderio:item_capacitor_silver> : [1.0f,1.0f,1.0f,8.0f],
    <enderio:item_capacitor_energetic_silver> : [2.0f,4.0f,2.0f,9.0f],
    <enderio:item_capacitor_vivid> : [3.0f,6.0f,2.0f,10.0f],
    <draconicevolution:wyvern_energy_core> : [6.0f,16.0f,8.0f,11.0f],
    <draconicevolution:draconic_energy_core> : [7.0f,24.0f,12.0f,12.0f],
    <contenttweaker:chaotic_energy_core> : [8.0f,32.0f,16.0f,13.0f]
};

static drlb1 as string[int] = {
    0 : "占位",
    1 : "基础电容",
    2 : "双层电容",
    3 : "八位电容",
    4 : "基岩粉电容",
    5 : "晶化合金电容",
    6 : "旋律合金电容",
    7 : "恒星合金电容",
    8 : "银质电容",
    9 : "充能银电容",
    10 : "生动合金电容",
    11 : "飞龙能量核心",
    12 : "觉醒龙能量核心",
    13 : "混沌龙能量核心"
};

static drlb2 as IItemStack[int] = {
    1 : <enderio:item_basic_capacitor>,
    2 : <enderio:item_basic_capacitor:1>,
    3 : <enderio:item_basic_capacitor:2>,
    4 : <enderio:item_capacitor_grainy>,
    5 : <enderio:item_capacitor_crystalline>,
    6 : <enderio:item_capacitor_melodic>,
    7 : <enderio:item_capacitor_stellar>,
    8 : <enderio:item_capacitor_silver>,
    9 : <enderio:item_capacitor_energetic_silver>,
    10 : <enderio:item_capacitor_vivid>,
    11 : <draconicevolution:wyvern_energy_core>,
    12 : <draconicevolution:draconic_energy_core>,
    13 : <contenttweaker:chaotic_energy_core>
};

MMEvents.onControllerGUIRender("big_alloy_smelter" , function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    val map = ctrl.customData.asMap();
    val id = isNull(map["id"]) ? 0 : map["id"].asInt();
    val dj = isNull(map["dj"]) ? 0.0f : map["dj"].asFloat();
    val sl = isNull(map["sl"]) ? 0 : map["sl"].asInt();
    val bx = isNull(map["bx"]) ? 1 : map["bx"].asInt();
    val info0 as string[] = [
        "§e§l///合金锻造工厂监控系统///",
        "§e§l当前电容：无",
    ];
    val info as string[] = [
        "§e§l///合金锻造工厂监控系统///",
        "§e§l当前电容：" + drlb1[id],
        "§e§l当前电容等级：" + dj,
        "§e§l当前锻造速率：" + sl,
        "§e§l允许最大并行：" + bx
    ];
    if (id == 0) {
        event.extraInfo = info0;
    }
    else {
        event.extraInfo = info;
    }
});

function recipe(recipenum as int,output as IIngredient,input as IIngredient[],RF as int,time as float) {
    val tRF = ((1.0f * RF) / time);
    RecipeBuilder.newBuilder("bigalloysmelter" + recipenum,"big_alloy_smelter",(1 * time),0)
        .addPreCheckHandler(function(event as RecipeCheckEvent) {
            val ctrl = event.controller;
            val map = ctrl.customData.asMap();
            val bx = isNull(map["bx"]) ? 1 : map["bx"].asInt();
            val id = isNull(map["id"]) ? 0 : map["id"].asInt();
            if (id == 0) {
                event.setFailed("§4§l尚未安装电容");
            }
            event.activeRecipe.maxParallelism = bx;
        })
        .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
            val ctrl = event.controller;
            val map = ctrl.customData.asMap();
            val thread = event.factoryRecipeThread;
            val sl = 1.0f * (isNull(map["sl"]) ? 1 : map["sl"].asFloat());
            thread.addModifier("sl", RecipeModifierBuilder.create("modularmachinery:duration", "input", (1.0 / sl), 1, false).build());
            thread.addModifier("nl", RecipeModifierBuilder.create("modularmachinery:energy", "input", sl, 1, false).build());
        })
        .addEnergyPerTickInput(tRF)
        .addItemInputs(input)
        .setThreadName("§e§l合金锻造模块")
        .addItemOutput(output)
        .build();
}

for dr , list in drlb {
    val dj = list[0];
    val sl = (1 * list[1]);
    val bx = (1 * list[2]);
    val id = (1 * list[3]);
    RecipeBuilder.newBuilder("drsr" + id,"big_alloy_smelter",40,1)
        .addPreCheckHandler(function(event as RecipeCheckEvent) {
            val map = event.controller.customData.asMap();
            val check = isNull(map["id"]) ? 0 : (1 * map["id"].asFloat());
            if !(check == 0) {
                event.setFailed("§4§l已安装电容，无法进行安装");
            }
        })
        .addItemInput(dr)
        .addRecipeTooltip(["§e§l安装电容","§e§l电容等级：" + dj,"§e§l锻造速率：" + sl,"§e§l最大允许并行数：" + bx])
        .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
            val ctrl = event.controller;
            val data = ctrl.customData;
            val map = data.asMap();
            map["id"] = id;
            map["dj"] = dj;
            map["sl"] = sl;
            map["bx"] = bx;
            ctrl.customData = data;
        })
        .setParallelized(false)
        .setThreadName("§e§l电容安装模块")
        .build();
}

RecipeBuilder.newBuilder("drsc","big_alloy_smelter",40,2)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val map = event.controller.customData.asMap();
        val id = isNull(map["id"]) ? 0 : map["id"].asInt();
        if (id == 0) {
            event.setFailed("§4§l没电容你在拆什么(恼");
        }
    })
    .addItemInput(<mekanism:configurator>).setChance(0.0f)
    .addItemOutput(<enderio:item_capacitor_grainy>.withTag({display: {Name: "输出由已安装电容决定", Lore: ["当然你想要只输出基岩粉电容我也可以改(笑"]}}))
    .addItemModifier(function(ctrl as IMachineController, oldItem as IItemStack) as IItemStack {
        val map = ctrl.customData.asMap();
        val id = isNull(map["id"]) ? 0 : map["id"].asInt();
        val output = drlb2[id];
        return output;
    })
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        map["id"] = 0;
        map["dj"] = 0.0;
        map["sl"] = 0;
        map["bx"] = 1;
        ctrl.customData = data;
    })
    .setParallelized(false)
    .setThreadName("§e§l电容拆卸模块")
    .addRecipeTooltip("§4§l拆卸电容")
    .build();

recipe(1 , <modularmachinery:itemmodularium> * 2, [<ore:ingotIron>, <ore:ingotBronze>, <ore:dustRedstone>], 2000, 10.0f);
recipe(2 , <modularmachinery:itemmodularium> * 2, [<ore:ingotConductiveIron>, <ore:ingotBronze>], 2000, 10.0f);
recipe(3 , <tconevo:material> * 2, [<ore:ingotAdamant>, <ore:ingotManyullyn> * 2, <ore:ingotEnderium> * 2], 7500, 30.0f);
recipe(4 , <additions:netherite_ingot>, [<ore:gemAncientDebris> * 4, <ore:ingotGold> * 4], 6000, 50.0f);
recipe(5 , <additions:enderite_ingot>, [<ore:gemResonantDebris> * 4, <ore:ingotIridium> * 4], 6000, 50.0f);
recipe(6 , <additions:stainless_steel_ingot> * 4, [<ore:ingotManganeseSteel> * 4, <ore:ingotNickel>, <ore:ingotChromium>], 4000, 12.0f);
recipe(7 , <additions:manganese_steel_ingot> * 2, [<ore:ingotSteel> * 2, <ore:ingotManganese>], 1200, 4.0f);
recipe(8 , <enderio:item_alloy_ingot:8> * 2, [<ore:obsidian>, <ore:ingotDarkSteel> * 2, <ore:enderpearl>], 800, 2.0f);
recipe(9 , <taiga:terrax_ingot> * 2, [<ore:ingotKarmesine>, <ore:ingotJauxum>, <ore:ingotOvium>], 2000, 10.0f); 
recipe(10 , <taiga:triberium_ingot>, [<ore:ingotTiberium> * 5, <ore:ingotBasalt>], 2000, 10.0f);
recipe(11 , <taiga:triberium_ingot>, [<ore:ingotTiberium> * 5, <ore:ingotDilithium> * 2], 2000, 10.0f);
recipe(12 , <taiga:fractum_ingot> * 2, [<ore:ingotTriberium> * 3, <ore:obsidian> * 3, <ore:ingotAbyssum>], 2000, 10.0f);
recipe(13 , <taiga:violium_ingot> * 2, [<ore:ingotAurorium> * 3, <ore:ingotArdite> * 2], 2000, 10.0f);
recipe(14 , <taiga:proxii_ingot> * 3, [<ore:ingotPrometheum> * 3, <ore:ingotPalladium> * 3, <ore:ingotEezo>], 2000, 10.0f);
recipe(15 , <taiga:tritonite_ingot> * 2, [<ore:ingotCobalt> * 3, <ore:ingotTerrax> * 2], 2000, 10.0f);
recipe(16 , <taiga:ignitz_ingot> * 2, [<ore:ingotArdite> * 2, <ore:ingotTerrax> * 2, <ore:ingotOsram>], 2000, 10.0f);
recipe(17 , <taiga:imperomite_ingot> * 2, [<ore:ingotDuranite> * 3, <ore:ingotPrometheum>, <ore:ingotAbyssum>], 2000, 10.0f);
recipe(18 , <taiga:solarium_ingot> * 2, [<ore:ingotNucleum>, <ore:ingotUru> * 2, <ore:ingotValyrium> * 2], 2000, 10.0f);
recipe(19 , <taiga:nihilite_ingot>, [<ore:ingotVibranium>, <ore:ingotSolarium>], 2000, 10.0f);
recipe(20 , <taiga:adamant_ingot> * 3, [<ore:ingotVibranium>, <ore:ingotSolarium>, <ore:ingotIox> * 3], 2000, 10.0f);
recipe(21 , <gct_ores:densite_ingot>, [<ore:ingotOsram>, <ore:ingotSeismum>], 2000, 10.0f);
recipe(22 , <taiga:dyonite_ingot> * 3, [<ore:ingotTriberium> * 3, <ore:ingotFractum>, <ore:ingotDensite>], 2000, 10.0f);
recipe(23 , <taiga:nucleum_ingot> * 3, [<ore:ingotProxii> * 3, <ore:ingotAbyssum>, <ore:ingotOsram>], 2000, 10.0f);
recipe(24 , <taiga:nucleum_ingot> * 3, [<ore:ingotImperomite> * 3, <ore:ingotOsram>, <ore:ingotEezo>], 2000, 10.0f);
recipe(25 , <taiga:nucleum_ingot> * 3, [<ore:ingotNiob> * 3, <ore:ingotEezo>, <ore:ingotAbyssum>], 2000, 10.0f);
recipe(26 , <taiga:lumix_ingot>, [<ore:ingotPalladium>, <ore:ingotTerrax>], 2000, 10.0f);
recipe(27 , <taiga:seismum_ingot> * 4, [<ore:obsidian> * 4, <ore:ingotTriberium> * 2, <ore:ingotEezo>], 2000, 10.0f);
recipe(28 , <taiga:astrium_ingot> * 2, [<ore:ingotTerrax> * 3, <ore:ingotAurorium> * 2], 2000, 10.0f);
recipe(29 , <taiga:niob_ingot> * 3, [<ore:ingotPalladium> * 3, <ore:ingotDuranite>, <ore:ingotOsram>], 2000, 10.0f);
recipe(30 , <taiga:yrdeen_ingot> * 3, [<ore:ingotUru> * 3, <ore:ingotValyrium> * 3, <ore:ingotOsram>], 2000, 10.0f);
recipe(31 , <taiga:yrdeen_ingot> * 3, [<ore:ingotUru> * 3, <ore:ingotValyrium> * 3, <ore:ingotEezo>], 2000, 10.0f);
recipe(32 , <taiga:yrdeen_ingot> * 3, [<ore:ingotUru> * 3, <ore:ingotValyrium> * 3, <ore:ingotAbyssum>], 2000, 10.0f);
recipe(33 , <gct_ores:reditrite_ingot> * 4, [<ore:ingotOsram> * 2, <ore:ingotObsidiorite> * 9], 2000, 10.0f);
recipe(34 , <gct_ores:reditrite_ingot> * 4, [<ore:ingotOsram> * 2, <ore:blockObsidiorite>], 2000, 10.0f);
recipe(35 , <taiga:iox_ingot> * 1, [<ore:ingotEezo> * 2, <ore:ingotAbyssum> * 2, <ore:ingotReditrite> * 4], 2000, 10.0f);
recipe(36 , <taiga:obsidiorite_ingot>, [<ore:obsidian>, <ore:ingotMeteorite>], 2000, 10.0f);
recipe(37 , <extendedcrafting:material> * 1, [<ore:ingotIron>, <ore:ingotCosmicNeutronium>], 1000, 10.0f);
recipe(38 , <divinerpg:shadow_bar>, [<ore:ingotRupee>, <ore:ingotRealmite>], 2000, 10.0f);
recipe(39 , <additions:heavenite_ingot>, [<ore:ingotUru> * 3, <ore:ingotLighteum> * 2, <ore:ingotStripium> * 3], 2000, 10.0f);
recipe(40 , <additions:ghostite_ingot>, [<ore:ingotValyrium>, <ore:ingotManarium>], 2000, 10.0f);
recipe(41 , <additions:waringlium_ingot> * 3, [<ore:ingotSwinium> * 2, <ore:ingotStripium> * 2, <ore:obsidian> * 6], 2000, 10.0f);
recipe(42 , <additions:tierite_ingot> * 2, [<ore:ingotCloudite> * 3, <ore:ingotTerrax> * 3, <ore:ingotVibranium> * 2], 2000, 10.0f);
recipe(43 , <additions:cheatieum_ingot> * 2, [<ore:ingotMangisite> * 2, <ore:ingotGhostite>, <ore:ingotManyullyn> * 3], 2000, 10.0f);
recipe(44 , <additions:idiessite_ingot>, [<ore:ingotSoilium> * 3, <ore:ingotHeavenite>, <ore:ingotAdamant>], 2000, 10.0f);
recipe(45 , <additions:moltenium_ingot> * 2, [<ore:ingotOsram> * 4, <ore:ingotHeavenite> * 2, <ore:ingotDimesium>], 2000, 10.0f);
recipe(46 , <additions:ranglium_ingot>, [<ore:ingotIdiessite>, <ore:ingotCheatieum>, <ore:ingotCloudite>], 2000, 10.0f);
recipe(47 , <additions:godiarite_ingot> * 3, [<ore:ingotAdamant> * 3, <ore:ingotTogrium> * 2, <ore:ingotYoggleseum> * 2], 2000, 10.0f);
recipe(48 , <additions:rainite_ingot> * 3, [<ore:ingotRanglium> * 2, <ore:ingotIdiessite> * 2, <ore:ingotOneo> * 3], 2000, 10.0f);
recipe(49 , <additions:panloeseum_ingot> * 3, [<ore:ingotGhostite> * 4, <ore:ingotBreakium>], 2000, 10.0f);
recipe(50 , <additions:typhoonite_ingot> * 2, [<ore:ingotMoltenium> * 2, <ore:ingotGodiarite> * 2, <ore:ingotXenidium>], 2000, 10.0f);
recipe(51 , <additions:fallenium_ingot> * 2, [<ore:ingotVanadium> * 2, <ore:ingotGallium> * 3, <ore:ingotFenzium> * 2], 2000, 10.0f);
recipe(52 , <additions:phoenixite_ingot> * 2, [<ore:ingotFenzium> * 3, <ore:ingotDawnium> * 2], 2000, 10.0f);
recipe(53 , <additions:depthite_ingot> * 3, [<ore:ingotRainite> * 2, <ore:ingotBreakium> * 4, <ore:ingotGallium> * 2], 2000, 10.0f);
recipe(54 , <additions:lovaquite_ingot> * 2, [<ore:ingotFallenium> * 2, <ore:ingotMolybdenum> * 2, <ore:ingotLosessium>], 2000, 10.0f);
recipe(55 , <additions:rangolarite_ingot> * 2, [<ore:ingotPhoenixite> * 3, <ore:ingotDepthite>], 2000, 10.0f);
recipe(56 , <additions:clearite_ingot> * 3, [<ore:ingotIndium> * 2, <ore:ingotSissidium> * 2, <ore:ingotTyphoonite> * 2], 2000, 10.0f);
recipe(57 , <additions:wefenium_ingot> * 2, [<ore:ingotLovaquite> * 3, <ore:ingotTtwo> * 2, <ore:ingotTierite>], 2000, 10.0f);
recipe(58 , <additions:errorite_ingot> * 3, [<ore:ingotAntimony> * 2, <ore:ingotCirclium> * 3, <ore:ingotRangolarite> * 4], 2000, 10.0f);
recipe(59 , <additions:numbereum_ingot> * 2, [<ore:ingotRapesesium> * 2, <ore:ingotWefenium> * 3], 2000, 10.0f);
recipe(60 , <additions:babyrite_ingot> * 3, [<ore:ingotGold> * 7, <ore:ingotRubium> * 2, <ore:ingotClearite>], 2000, 10.0f);
recipe(61 , <additions:leadite_ingot> * 3, [<ore:ingotCirclium> * 2, <ore:ingotTechnetium>, <ore:ingotFallenium> * 6], 2000, 10.0f);
recipe(62 , <additions:martisite_ingot> * 3, [<ore:ingotCestium> * 4, <ore:ingotLeadite> * 3, <ore:ingotNumbereum> * 3], 2000, 10.0f);
recipe(63 , <additions:flashite_ingot> * 6, [<ore:ingotFraxinium> * 2, <ore:ingotTreasurite> * 2, <ore:ingotErrorite> * 2], 2000, 10.0f);
recipe(64 , <additions:overlaite_ingot> * 3, [<ore:ingotMartisite>, <ore:ingotClearite>], 2000, 10.0f);
recipe(65 , <plustic:osgloglasingot>, [<ore:ingotOsmium>, <ore:ingotRefinedGlowstone>, <ore:ingotRefinedObsidian>], 2000, 10.0f);
recipe(66 , <nuclearcraft:alloy:16> * 2, [<ore:ingotZirconium>, <ore:ingotMolybdenum>], 2000, 10.0f);
recipe(67 , <additions:clock_alloy_ingot> * 2, [<ore:dustTime>, <ore:ingotMelodicAlloy> * 2, <divinerpg:mysterious_clock>], 10000, 60.0f);
recipe(68 , <additions:twilit_alloy_ingot> * 3, [<twilightforest:torchberries> * 6, <ore:ingotBlackholeAlloy> * 1, <ore:ingotApocalypsium> * 2], 500000, 150.0f);
recipe(69 , <additions:mist_alloy_ingot>, [<ore:ingotMelodicAlloy> * 2, <ore:ingotCrystallineAlloy>, <abyssalcraft:stone:6> * 4], 25000, 55.0f);
recipe(70 , <additions:sharpen_alloy_ingot> * 2, [<ore:ingotMistAlloy>, <ore:ingotStellarAlloy> * 2, <gct_ores:rainboquartz> * 6], 125000, 240.0f);
recipe(71 , <additions:killer_alloy_ingot> * 3, [<ore:ingotTwilitAlloy>, <ore:ingotEvilMetal> * 4, <ore:ingotFlamium> * 3], 400000, 200.0f);
recipe(72 , <additions:curse_alloy_ingot>, [<ore:ingotDarkSteel> * 5, <ore:ingotSoulium> * 3, <ore:ingotBlackholeAlloy>], 350000, 180.0f);
recipe(73 , <additions:blackhole_alloy_ingot> * 2, [<ore:ingotStellarAlloy>, <draconicevolution:chaos_shard:1> * 4, <ore:ingotVoid>], 300000, 200.0f);
recipe(74 , <additions:creative_alloy_ingot> * 2, [<ore:ingotBlackholeAlloy> * 2, <ore:ingotBalancedMatrix>, <ore:shardCreative>], 1000000, 1000.0f);
recipe(75 , <tconevo:material> * 2, [<ore:ingotManyullyn> * 2, <ore:ingotAdamant>, <ore:ingotEnderium> * 2], 50000, 20.0f);
recipe(76 , <additions:daynight_ingot>, [<ore:ingotFalsite>, <ore:ingotVentium>, <ore:ingotHorizonite>], 5000, 10.0f);
recipe(77 , <additions:porpezite_ingot> * 2, [<ore:ingotRuthenium>, <ore:ingotRhodium>, <ore:ingotPalladium> * 3], 4000, 10.0f);
recipe(78 , <plustic:osmiridiumingot> * 2, [<ore:ingotOsmium>, <ore:ingotIridium>], 2000, 10.0f);
recipe(79 , <nuclearcraft:alloy:12> * 2, [<ore:ingotZirconium> * 2, <ore:ingotTin>], 2000, 10.0f);
recipe(80 , <moretcon:ingotirradium> * 2, [<ore:ingotIridium>, <ore:ingotRadium>], 4000, 10.0f);
recipe(81 , <additions:blueprint_laser_gun>, [<ore:ingotPhotonium>, <additions:blueprint>, <ore:ingotCrystalMatrix>], 800000, 400.0f);
recipe(82 , <additions:blueprint_ring>, [<ore:ingotValkyrie>, <additions:blueprint>, <ore:ingotEverite>], 1600000, 600.0f);
recipe(83 , <additions:ascensionite_ingot> * 2, [<ore:ingotLimonite> * 4, <ore:ingotRosite> * 2, <ore:ingotEmberstone> * 1], 4000, 10.0f);
recipe(84 , <additions:heavyalloy_ingot> * 2, [<ore:ingotLead> * 9, <ore:ingotThallium> * 2, <ore:ingotBismuth> * 4], 3000, 10.0f);
recipe(85 , <journey:orbaditeingot> * 1, [<ore:ingotIron> * 1, <ore:ingotCytosinite> * 1], 1000, 10.0f); 

recipe(1000 , <nuclearcraft:alloy:2> * 2, [<ore:ingotGraphite> * 2, <ore:gemDiamond> * 1], 8000, 10.0f); 
recipe(1001 , <enderio:item_material:48> * 2, [<ore:itemPlantgreen> * 12, <ore:slimeball> * 1], 2000, 10.0f); 
recipe(1002 , <enderio:item_material:48> * 2, [<ore:dustCoal> * 2, <ore:slimeball> * 1,<ore:dyeGreen> * 2], 2000, 10.0f); 
recipe(1003 , <enderio:item_material:49> * 2, [<ore:itemPlantbrown> * 12, <ore:slimeball> * 1], 8000, 10.0f); 
recipe(1004 , <enderio:item_material:49> * 2, [<ore:dustCoal> * 2, <ore:slimeball> * 1,<ore:dyeBrown> * 2], 8000, 10.0f); 
recipe(1005 , <enderio:item_material:50> * 2, [<ore:dustCoal> * 6, <ore:slimeball> * 1], 2000, 10.0f); 
recipe(1006 , <enderio:item_material:50> * 1, [<ore:dustCoal> * 3, <ore:egg> * 1], 1500, 10.0f); 
recipe(1007 , <enderio:item_alloy_ingot> * 1, [<ore:ingotIron> * 1, <ore:dustCoal> * 1,<ore:itemSilicon> * 1], 10000, 10.0f); 
recipe(1008 , <enderio:item_alloy_ingot:6> * 1, [<ore:ingotIron> * 1, <ore:dustCoal> * 1,<ore:obsidian> * 1], 20000, 10.0f); 
recipe(1009 , <thermalfoundation:material:162> * 3, [<ore:ingotIron> * 2, <ore:ingotNickel> * 1], 3000, 10.0f); 
recipe(1010 , <enderio:item_alloy_ingot:4> * 1, [<ore:ingotIron> * 1, <ore:dustRedstone> * 1], 10000, 10.0f); 
recipe(1011 , <enderio:item_alloy_ingot:5> * 1, [<ore:ingotIron> * 1, <ore:enderpearl> * 1], 10000, 10.0f); 
recipe(1012 , <enderio:block_fused_quartz> * 1, [<ore:blockQuartz> * 1], 5000, 10.0f); 
recipe(1013 , <enderio:block_fused_quartz> * 1, [<ore:gemQuartz> * 4], 5000, 10.0f);  
recipe(1014 , <enderio:block_enlightened_fused_quartz> * 1, [<ore:blockGlassHardened> * 1, <ore:dustGlowstone> * 4], 5000, 10.0f); 
recipe(1015 , <minecraft:deadbush> * 1, [<ore:treeSapling> * 1], 2000, 10.0f); 
recipe(1016 , <enderio:item_material:72> * 1, [<ore:ingotBrickNether> * 1, <ore:cropNetherWart> * 4, <ore:itemClay> * 6], 20000, 10.0f); 
recipe(1017 , <enderio:block_industrial_insulation> * 1, [<ore:dustLapis> * 1, <ore:wool> * 1, <ore:dustTin> * 1], 5000, 10.0f); 
recipe(1018 , <nuclearcraft:alloy:11> * 2, [<ore:gemBoronArsenide> * 1, <ore:ingotExtreme> * 1], 9000, 10.0f); 
recipe(1019 , <enderio:item_alloy_ingot> * 1, [<ore:ingotSteel> * 1, <ore:itemSilicon> * 1], 10000, 10.0f); 
recipe(1020 , <enderio:item_alloy_ingot:3> * 1, [<ore:itemSilicon> * 1, <ore:dustRedstone> * 1], 10000, 10.0f); 
recipe(1021 , <minecraft:cookie> * 8, [<ore:dustWheat> * 1, <ore:beanCocoa> * 1], 2000, 10.0f); 
recipe(1022 , <enderio:item_material:70> * 2, [<ore:dustWheat> * 3, <ore:egg> * 1], 2000, 10.0f); 
recipe(1023 , <nuclearcraft:alloy:6> * 2, [<ore:ingotBoron> * 1, <ore:ingotSteel> * 1], 6000, 10.0f); 
recipe(1024 , <nuclearcraft:alloy:1> * 2, [<ore:ingotFerroboron> * 1, <ore:ingotLithium> * 1], 9000, 10.0f); 
recipe(1025 , <nuclearcraft:alloy:10> * 1, [<ore:ingotHardCarbon> * 1, <ore:ingotTough> * 1], 16000, 10.0f); 
recipe(1026 , <enderio:item_material:75> * 1, [<ore:dustBedrock> * 1, <ore:dustCoal> * 1,], 5000, 10.0f); 
recipe(1027 , <enderio:item_alloy_endergy_ingot> * 1, [<ore:gravel> * 1, <ore:itemClay> * 1, <ore:cobblestone> * 1], 5000, 10.0f); 
recipe(1028 , <minecraft:dye:1> * 12, [<minecraft:beetroot> * 1, <ore:itemClay> * 3, <ore:egg> * 6], 15000, 10.0f); 
recipe(1029 , <thermalfoundation:material:163> * 4, [<ore:ingotCopper> * 3, <ore:ingotTin> * 1], 10000, 10.0f); 
recipe(1030 , <thermalfoundation:material:160> * 1, [<ore:ingotIron> * 1, <ore:coal> * 4], 10000, 10.0f); 
recipe(1031 , <thermalfoundation:material:164> * 2, [<ore:ingotCopper> * 1, <ore:ingotNickel> * 1,], 4000, 10.0f); 
recipe(1032 , <thermalfoundation:material:165> * 4, [<ore:ingotCopper> * 3, <ore:ingotSilver> * 1, <ore:dustRedstone> * 12], 32000, 10.0f); 
recipe(1033 , <thermalfoundation:material:161> * 2, [<ore:ingotSilver> * 1, <ore:ingotGold> * 1], 2000, 10.0f); 
recipe(1034 , <enderio:item_alloy_endergy_ingot:5> * 1, [<ore:dustRedstone> * 1, <ore:ingotSilver> * 1, <ore:dustGlowstone> * 1], 10000, 10.0f); 
recipe(1035 , <thermalfoundation:material:166> * 4, [<ore:ingotTin> * 3, <ore:ingotSilver> * 1, <ore:dustGlowstone> * 4], 32000, 10.0f); 
recipe(1036 , <enderio:item_material:39> * 4, [<ore:ingotLead> * 3, <ore:ingotPlatinum> * 1, <ore:enderpearl> * 4], 4000, 10.0f); 
recipe(1037 , <nuclearcraft:alloy:3> * 3, [<ore:ingotBoron> * 2, <ore:ingotMagnesium> * 1], 4000, 10.0f); 
recipe(1038 , <nuclearcraft:alloy:4> * 2, [<ore:ingotLithium> * 1, <ore:ingotManganeseDioxide> * 1], 6000, 10.0f); 
recipe(1039 , <nuclearcraft:alloy:16> * 2, [<ore:ingotZirconium> * 1, <ore:ingotMolybdenum> * 1], 2000, 10.0f); 
recipe(1040 , <enderio:item_alloy_ingot:1> * 1, [<ore:dustRedstone> * 1, <ore:ingotGold> * 1, <ore:dustGlowstone> * 1], 10000, 10.0f); 
recipe(1041 , <enderio:item_alloy_ingot:7> * 1, [<ore:soulSand> * 1, <ore:ingotGold> * 1], 10000, 10.0f); 
recipe(1042 , <enderio:item_alloy_endergy_ingot:1> * 1, [<ore:ingotGold> * 1, <ore:itemPulsatingPowder> * 1], 10000, 10.0f); 
recipe(1043 , <enderio:item_material:76> * 2, [<ore:itemClay> * 1, <ore:dustGlowstone> * 1], 5000, 10.0f); 
recipe(1044 , <enderio:item_dark_steel_upgrade> * 1, [<enderio:block_dark_iron_bars> * 1, <ore:itemClay> * 1, <ore:string> * 4], 30000, 10.0f); 
recipe(1045 , <enderio:item_alloy_endergy_ingot:3> * 2, [<ore:netherStar> * 1, <ore:ingotMelodicAlloy> * 1, <ore:itemClay> * 4], 20000, 100.0f); 
recipe(1046 , <thermalfoundation:material:167> * 2, [<ore:ingotEnderiumBase> * 2, <ore:sand> * 1], 25000, 10.0f); 
recipe(1047 , <enderio:item_material:3> * 1, [<ore:itemPowderPhotovoltaic> * 3], 15000, 10.0f); 
recipe(1048 , <enderio:item_material:1> * 1, [<ore:itemSimpleMachineChassi> * 1, <ore:dyeMachine> * 1], 3600, 10.0f); 
recipe(1049 , <enderio:item_material:54> * 1, [<ore:itemEndSteelMachineChassi> * 1, <ore:dyeEnhancedMachine> * 1], 3600, 10.0f); 
recipe(1050 , <enderio:item_material:53> * 1, [<ore:itemSimpleMachineChassi> * 1, <ore:dyeSoulMachine> * 1], 3600, 10.0f); 
recipe(1051 , <enderio:item_alloy_endergy_ingot:2> * 1, [<ore:ingotEndSteel> * 1, <minecraft:chorus_fruit_popped> * 1], 20000, 10.0f); 
recipe(1052 , <enderio:item_alloy_ingot:8> * 1, [<ore:endstone> * 1, <ore:ingotDarkSteel> * 1, <ore:obsidian> * 1], 20000, 10.0f); 
recipe(1053 , <enderio:item_alloy_ingot:2> * 1, [<ore:ingotEnergeticAlloy> * 1, <ore:enderpearl> * 1], 10000, 10.0f);
recipe(1054 , <tconstruct:ingots:2> * 1, [<ore:ingotCobalt> * 1, <ore:ingotArdite> * 1], 10000, 10.0f);
recipe(1055 , <redstonerepository:material:1> * 1, [<ore:ingotEnderium> * 1, <ore:dustCryotheum> * 4], 10000, 10.0f);
recipe(1056 , <tiths:ingot_oraclium> * 1, [<ore:ingotPolarium> * 1, <ore:ingotAltairium> * 1], 10000, 10.0f);