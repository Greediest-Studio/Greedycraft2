/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 * 被孤梦梦梦梦完全重做！！！
 */
 
/*
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
import mods.modularmachinery.SmartInterfaceUpdateEvent;
import mods.modularmachinery.Sync;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.SmartInterfaceData;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.FactoryRecipeThread;


val tbmk = FactoryRecipeThread.createCoreThread("同步模块");
val srmk = FactoryRecipeThread.createCoreThread("生命源质输入模块");
val hcmk = FactoryRecipeThread.createCoreThread("祭坛合成模块");

MachineModifier.addCoreThread("blood_altar", tbmk);
MachineModifier.addCoreThread("blood_altar", srmk);
MachineModifier.addCoreThread("blood_altar", hcmk);

MachineModifier.setMaxThreads("blood_altar", 0 as int);
MachineModifier.setInternalParallelism("blood_altar", 2147483647);

MMEvents.onControllerGUIRender("blood_altar" , function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val map = data.asMap();
    val rl = isNull(map["rl"]) ? 0 : map["rl"].asInt();
    val sd = isNull(map["sd"]) ? 0.0f : map["sd"].asFloat();
    val dqsd = sd + 1.0f;
    val zw = 1 * (isNull(map["zw"]) ? 0.0f : map["zw"].asInt());
    val zy = isNull(map["zy"]) ? 0.0f : map["zy"].asFloat();
    val dqrl = isNull(map["dqrl"]) ? 0 : map["dqrl"].asInt();
    val lvl = isNull(map["level"]) ? 1 : map["level"].asInt();
    val dczy = 1 * (zy * 400.0f);
    var info as string[] = [
        "§e///血之祭坛监控系统///",
        "§e当前血之祭坛等级：" + lvl,
        "§e当前生命源质储备：" + dqrl + "/" + rl ,
        "§e每次转移/消耗生命源质所需时间：" + zw + "§etick" ,
        "§e每次转移/消耗生命源质最大数量：" + dczy + "§emB" ,
        "§e合成速度：" + dqsd +"x"
    ];
    event.extraInfo = info;
});


function dataget(event as FactoryRecipeFinishEvent) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val map = data.asMap();
    val world = ctrl.world;
    val cpos = ctrl.pos;
    val apos = cpos.up(7);
    val adata = world.getBlock(apos).data;
    val levelmap as int[string] = {
        "ONE" : 1,
        "TWO" : 2,
        "THREE" : 3,
        "FOUR" : 4,
        "FIVE" : 5,
        "SIX" : 6
    };
    val level = isNull(adata.bloodAltar.upgradeLevel) ? 1 : levelmap[adata.bloodAltar.upgradeLevel];
    if ((isNull(map["level"]) ? 1 : map["level"].asInt()) < 7) {
        map["level"] = level;
    }
    map["rl"] = isNull(adata.bloodAltar.capacity) ? 10000 : adata.bloodAltar.capacity.asInt();//容量
    map["sd"] = isNull(adata.bloodAltar.consumptionMultiplier) ? 0 : adata.bloodAltar.consumptionMultiplier.asFloat();//速度符文
    map["zw"] = isNull(adata.bloodAltar.chargeFrequency) ? 0 as int : adata.bloodAltar.chargeFrequency.asFloat() * 1;//多少t工作一次(20 - 转位符文)
    map["zy"] = isNull(adata.bloodAltar.dislocationMultiplier) ? 1.0f : adata.bloodAltar.dislocationMultiplier.asFloat();//单次转移倍数
    val zw = isNull(map["zw"]) ? 0 : map["zw"].asInt();
    val sd = isNull(map["sd"]) ? 0 : map["sd"].asInt();
    val zy = isNull(map["zy"]) ? 1.0f : map["zy"].asFloat();
    val dczy = 1 * (zy * 400.0f);
    map["dczy"] = dczy;
    ctrl.customData = data;
}

function recipe(input as IItemStack,output as IItemStack,lp as float,minlvl as int) {

    RecipeBuilder.newBuilder(input.definition.id + lp, "blood_altar", 1, 3)
        .addPreCheckHandler(function(event as RecipeCheckEvent) {
            val map = event.controller.customData.asMap();
            val lvl = isNull(map["level"]) ? 1 : map["level"].asInt();
            if (minlvl > lvl) {event.setFailed("§e祭坛等级不足");}
            event.activeRecipe.maxParallelism = 16;
        })
        .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
            val ctrl = event.controller;
            val thread = event.factoryRecipeThread;
            val map = ctrl.customData.asMap();
            val sj = 1.0f * (isNull(map["sj"]) ? 0.0f : map["sj"].asInt());
            val time = (lp/10000.0f) * sj;
            thread.addModifier("recipetime", RecipeModifierBuilder.create("modularmachinery:duration", "input", sj, 1, false).build());
        })
        .addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
            val ctrl = event.controller;
            val data = ctrl.customData;
            val map = data.asMap();
            val dqrl = isNull(map["dqrl"]) ? 0 : map["dqrl"].asInt();
            if dqrl < lp {
                event.setFailed(false,"§e生命源质不足");
            }
        })
        .addItemInput(input)
        .setThreadName("祭坛合成模块")
        .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
            val bx = event.activeRecipe.parallelism;
            change(event,(-1 * lp) * bx);
        })
        .addRecipeTooltip(["§e消耗" + (1 * lp) + "§e点模块化内部生命源质","§eJEI显示配方时间仅供参考","§e实际配方时间见控制器","§e固定最大并行数：16"])
        .addItemOutput(output)
        .build();
}

function change(event as FactoryRecipeFinishEvent,lp as int) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val map = data.asMap();
    var dqrl = isNull(map["dqrl"]) ? 0 : map["dqrl"].asInt();
    dqrl += lp;
    map["dqrl"] = dqrl;
    ctrl.customData = data;
}

recipe(<minecraft:stone>,<bloodmagic:slate>,1000.0f,7);
recipe(<botania:manaresource:1>,<additions:pearl_of_knowledge>,250000.0f,7);
recipe(<thaumcraft:amber>,<thaumcraft:curio:1>,80000.0f,7);
recipe(<bloodmagic:lava_crystal>,<bloodmagic:activation_crystal>,10000.0f,7);
recipe(<minecraft:emerald>,<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:weak"}),2000.0f,7);
recipe(<minecraft:glowstone_dust>,<bloodarsenal:base_item:2>,2500.0f,7);
recipe(<bloodarsenal:base_item:3>,<bloodarsenal:base_item:4>,5000.0f,7);
recipe(<minecraft:ender_pearl>,<bloodmagic:teleposition_focus>,2000.0f,7);
recipe(<bloodarsenal:blood_diamond:1>,<bloodarsenal:blood_diamond:2>,100000.0f,7);
recipe(<minecraft:gold_ingot>,<animus:keybinding>,1000.0f,7);
recipe(<minecraft:magma_cream>,<bloodmagic:inscription_tool:2>.withTag({uses: 10}),1000.0f,7);
recipe(<minecraft:nether_star>,<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"}),80000.0f,7);
recipe(<additions:durasteel_ingot>,<tconevo:metal:25>,10000.0f,7);
recipe(<additions:cosmilite_block>,<additions:creative_shard>,850000.0f,7);
recipe(<additions:compressed_experience_block>,<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:magician"}),25000.0f,7);
recipe(<minecraft:book>,<bloodmagic:sanguine_book>,1000.0f,7);
recipe(<astralsorcery:itemcraftingcomponent:1>,<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:apprentice"}),5000.0f,7);
recipe(<bloodmagic:slate:1>,<bloodmagic:slate:2>,5000.0f,7);
recipe(<bloodmagic:slate:2>,<bloodmagic:slate:3>,15000.0f,7);
recipe(<bloodmagic:slate>,<bloodmagic:slate:1>,2000.0f,7);
recipe(<minecraft:ghast_tear>,<bloodmagic:inscription_tool:4>.withTag({uses: 10}),1000.0f,7);
recipe(<minecraft:iron_sword>,<bloodmagic:dagger_of_sacrifice>,3000.0f,7);
recipe(<minecraft:lapis_block>,<bloodmagic:inscription_tool:1>.withTag({uses: 10}),1000.0f,7);
recipe(<additions:blood_sigil>,<additions:true_blood_sigil>,150000.0f,7);
recipe(<aether_legacy:ambrosium_shard>,<thaumcraft:curio:4>,80000.0f,7);
recipe(<bloodmagic:blood_shard>,<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:master"}),40000.0f,7);
recipe(<minecraft:coal_block>,<bloodmagic:inscription_tool:5>.withTag({uses: 10}),2000.0f,7);
recipe(<minecraft:bucket>,<forge:bucketfilled>.withTag({FluidName: "lifeessence", Amount: 1000}),1000.0f,7);
recipe(<minecraft:prismarine_shard>,<animus:fragmenthealing>,1000.0f,7);
recipe(<avaritia:block_resource:2>,<bloodmagic:decorative_brick:2>,15000.0f,7);
recipe(<abyssalcraft:shadowgem>,<thaumcraft:curio:3>,80000.0f,7);
recipe(<minecraft:obsidian>,<bloodmagic:inscription_tool:3>.withTag({uses: 10}),1000.0f,7);
recipe(<minecraft:dye:14>,<bloodarsenal:blood_orange>,500.0f,7);
recipe(<bloodmagic:slate:3>,<bloodmagic:slate:4>,30000.0f,7);
recipe(<minecraft:glass_bottle>,<twilightforest:fiery_blood>,7000.0f,7);
recipe(<minecraft:log>,<bloodarsenal:blood_infused_wooden_log>,2000.0f,7);
recipe(<draconicevolution:wyvern_core>,<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"}),300000.0f,7);
recipe(<bloodmagic:slate:4>,<additions:slate_6>,200000.0f,7);
recipe(<bloodmagic:teleposition_focus>,<bloodmagic:teleposition_focus:1>,10000.0f,7);
recipe(<minecraft:glowstone>,<bloodmagic:inscription_tool:6>.withTag({uses: 10}),200000.0f,7);

recipe(<additions:slate_6>,<additions:slate_7>,1000000.0f,7);
recipe(<additions:cosmilite_ingot>,<additions:ghost_metal>,1280000.0f,7);
recipe(<jaopca:block.darkest>,<additions:darkest_stonebrick_large>,3840000.0f,7);
recipe(<additions:catalyst_star>,<additions:proliferation_star>,6400000.0f,7);
recipe(<minecraft:bone_block>,<additions:ivorium_ingot>,1280000.0f,7);

recipe(<additions:slate_7>,<additions:slate_8>,8000000.0f,8);
recipe(<additions:balanced_slate>,<additions:murderite_ingot>,20000000.0f,8);

RecipeBuilder.newBuilder("tongbu", "blood_altar", 50, 0)
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        dataget(event);
    })
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        if (!isNull(map["dqrl"]) && map["dqrl"] < 0) {
            map["dqrl"] = 0;
            ctrl.customData = data;
        }
    })
    .setParallelized(false)
    .setThreadName("同步模块")
    .addRecipeTooltip("§e与控制器上方血之祭坛同步","§e容量/合成/输入输出速度继承自血之祭坛")
    .build();

RecipeBuilder.newBuilder("tianjia", "blood_altar", 1, 1)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val zy = isNull(map["zy"]) ? 0.0f : map["zy"].asFloat();
        val dczy = 1 * (zy * 400.0f);
        event.activeRecipe.maxParallelism = dczy;
        if ((!isNull(map["dqrl"]) && !isNull(map["rl"])) && (map["dqrl"] >= map["rl"])) {
            map["dqrl"] = map["rl"];
            ctrl.customData = data;
            event.setFailed("§e祭坛已满");
        }
    })
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val thread = event.factoryRecipeThread;
        val zw = 1.0f * (isNull(map["zw"]) ? 20 : map["zw"]);
        thread.addModifier("tianjiashijian", RecipeModifierBuilder.create("modularmachinery:duration", "input", zw, 1, false).build());
    })
    .addFluidInput(<liquid:lifeessence> * 1)
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        val bx = event.activeRecipe.parallelism;
        change(event,bx);
    })
    .addRecipeTooltip(["§e添加生命源质","§eJEI显示配方仅供参考","§e实际见控制器"])
    .setThreadName("生命源质输入模块")
    .build();
*/