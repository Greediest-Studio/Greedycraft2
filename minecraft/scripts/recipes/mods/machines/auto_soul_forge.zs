/*
 * This script is created for the GreedyCraft 
 * 改好了，现在是三模式意志网络了（喜）
 */

#priority 20

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.FactoryRecipeEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.SmartInterfaceUpdateEvent;
import mods.modularmachinery.MachineStructureUpdateEvent;
import mods.modularmachinery.Sync;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.IngredientArrayBuilder;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

import native.net.minecraft.world.World;
import native.net.minecraft.util.math.BlockPos;
import native.WayofTime.bloodmagic.demonAura.WorldDemonWillHandler;
import native.WayofTime.bloodmagic.soul.EnumDemonWillType;

import mods.zenutils.DataUpdateOperation.REMOVE;

/*  DEFAULT,
    CORROSIVE,
    DESTRUCTIVE,
    VENGEFUL,
    STEADFAST */

MachineModifier.setMaxThreads("auto_soul_forge", 1);
MachineModifier.setInternalParallelism("auto_soul_forge", 1);
MachineModifier.setMaxParallelism("auto_soul_forge", 256);

MachineModifier.addCoreThread("auto_soul_forge", FactoryRecipeThread.createCoreThread("意志汲取模块")
    .addRecipe("will_absorption")
);

MMEvents.onStructureUpdate("auto_soul_forge", function(event as MachineStructureUpdateEvent) {
    var ctrl as IMachineController = event.controller;
    if (isNull(ctrl.customData.willList)) {
        var parallel = 1;
        parallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:0>) * 4;
        parallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:5>) * 8;
        parallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:1>) * 16;
        parallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:6>) * 32;
        parallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:2>) * 64;
        parallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:7>) * 128;
        parallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:3>) * 256;
        parallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:8>) * 512;
        parallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:4>) * 1024;
        parallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:9>) * 2048;
        ctrl.customData = ctrl.customData.update({willList : {
            parallel : parallel as int,
            raw : 0 as int,
            maxCapacity : 200000000 as int
        }});
    }
});

$expand IMachineController$getWillAmount() as int {
    if (!isNull(this.customData.willList)) {
        if (!isNull(this.customData.willList.raw)) {
            return this.customData.willList.raw as int;
        } else return 0;
    } else return 0;
}

$expand IMachineController$addWillAmount(amount as int) {
    var parallel as int = isNull(this.customData.willList) ? 1 : (isNull(this.customData.willList.parallel) ? 1 : this.customData.willList.parallel);
    var currentAmount as int = this.getWillAmount();
    var maxCapacity as int = 200000000;
    if (!isNull(this.customData.willList.maxCapacity)) {
        maxCapacity = this.customData.willList.maxCapacity as int;
    }
    var newAmount as int = currentAmount + amount;
    if (newAmount > maxCapacity) {
        newAmount = maxCapacity;
    }
    this.customData = this.customData.update({willList : {parallel : parallel, raw : newAmount, maxCapacity : maxCapacity}});
}

$expand IMachineController$removeWillAmount(amount as int) {
    var parallel as int = isNull(this.customData.willList) ? 1 : (isNull(this.customData.willList.parallel) ? 1 : this.customData.willList.parallel);
    var currentAmount as int = this.getWillAmount();
    var maxCapacity as int = 200000000;
    if (!isNull(this.customData.willList.maxCapacity)) {
        maxCapacity = this.customData.willList.maxCapacity as int;
    }
    if (currentAmount < amount) {
        this.customData = this.customData.update({willList : {parallel : parallel, raw : 0, maxCapacity : maxCapacity}});
    } else {
        this.customData = this.customData.update({willList : {parallel : parallel, raw : (currentAmount - amount), maxCapacity : maxCapacity}});
    }
}

MMEvents.onControllerGUIRender("auto_soul_forge", function(event as ControllerGUIRenderEvent) {
    var ctrl as IMachineController = event.controller;
    var maxCapacity as int = 200000000;
    if (!isNull(ctrl.customData.willList.maxCapacity)) {
        maxCapacity = ctrl.customData.willList.maxCapacity as int;
    }
    var info as string[] = [
        "§a///扩展狱火熔炉控制面板///",
        "§a机器名称：§eLV2 - 扩展狱火熔炉",
        "§a存储意志：§e" ~ (ctrl.getWillAmount() as string) ~ " / " ~ (maxCapacity as string),
        "§a最大单次汲取恶魔意志数量：§e" ~ (isNull(ctrl.customData.willList.parallel) ? "1" : (ctrl.customData.willList.parallel as string)),
    ];
    event.extraInfo = info;
});

RecipeBuilder.newBuilder("will_absorption", "auto_soul_forge", 10)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val ctrl = event.controller;
        val chunkWill = WorldDemonWillHandler.getCurrentWill(ctrl.world.native, ctrl.pos.native, EnumDemonWillType.valueOf("DEFAULT") as EnumDemonWillType) as int;
        val rawWill = ctrl.getWillAmount() as int;
        if (chunkWill < 1 || rawWill >= 200000000) {
            event.setFailed("区块内无恶魔意志或机器内恶魔意志已满");
        }
        if (rawWill > 200000000) {
            ctrl.customData = ctrl.customData.update({willList : {raw : 200000000 as int}});
        }
    })
    .addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
        val ctrl = event.controller;
        val chunkWill = WorldDemonWillHandler.getCurrentWill(ctrl.world.native, ctrl.pos.native, EnumDemonWillType.valueOf("DEFAULT") as EnumDemonWillType) as int;
        val maxparallelism = isNull(ctrl.customData.willList) ? 1 : (isNull(ctrl.customData.willList.parallel) ? 1 : ctrl.customData.willList.parallel);
        val parallelism = min(min(maxparallelism as double, chunkWill), (200000000 - ctrl.getWillAmount()));
        if (chunkWill < 1 || ctrl.getWillAmount() >= 200000000) {
            event.setFailed(true,"区块内无恶魔意志或机器内恶魔意志已满");
        } else {
            event.preventProgressing("本次配方汲取" ~ (parallelism as string) ~ "点恶魔意志");
            event.activeRecipe.tick += 1;
        }
    })
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val ctrl = event.controller;
        val chunkWill = WorldDemonWillHandler.getCurrentWill(ctrl.world.native, ctrl.pos.native, EnumDemonWillType.valueOf("DEFAULT") as EnumDemonWillType) as int;
        val maxparallelism = isNull(ctrl.customData.willList) ? 1 : (isNull(ctrl.customData.willList.parallel) ? 1 : ctrl.customData.willList.parallel);
        val parallelism = min(min(maxparallelism as double, chunkWill), (200000000 - ctrl.getWillAmount()));
        WorldDemonWillHandler.drainWill(ctrl.world.native, ctrl.pos.native, EnumDemonWillType.valueOf("DEFAULT") as EnumDemonWillType, parallelism, true);
        ctrl.addWillAmount(parallelism);
    })
    .setParallelized(false)
    .addRecipeTooltip("§a汲取区块内恶魔意志")
    .setThreadName("意志汲取模块")
    .build();

function addHellForgeRecipe(inputs as IIngredient[], output as IItemStack, will as int) {
    var builder = RecipeBuilder.newBuilder("hell_forge_" ~ output.definition.id ~ (output.metadata as string), "auto_soul_forge", 100);
    for input in inputs {
        builder.addItemInput(input);
    }
    builder.addPreCheckHandler(function(event as RecipeCheckEvent) {
        var ctrl as IMachineController = event.controller;
        var parallel as int = event.activeRecipe.parallelism;
        if (ctrl.getWillAmount() < will * parallel) {
            event.setFailed("恶魔意志不足");
        }
    });
    builder.addItemOutput(output);
    builder.addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
        var ctrl as IMachineController = event.controller;
        var parallel as int = event.activeRecipe.parallelism;
        if (ctrl.getWillAmount() < will * parallel) {
            event.setFailed(false, "恶魔意志不足");
        }
    });
    builder.addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        var ctrl as IMachineController = event.controller;
        var parallel as int = event.activeRecipe.parallelism;
        ctrl.removeWillAmount(will * parallel);
    });
    builder.addRecipeTooltip("§a消耗恶魔意志" ~ will as string ~ "点");
    builder.build();
}


addHellForgeRecipe([<minecraft:cauldron>, <ore:stone>, <ore:gemLapis>, <ore:gemDiamond>],
<bloodmagic:demon_crucible>, 100);
addHellForgeRecipe([<bloodmagic:soul_forge>, <ore:stone>, <ore:gemLapis>, <ore:blockGlass>],
<bloodmagic:demon_crystallizer>, 100);
addHellForgeRecipe([<ore:blockIron>, <ore:stone>, <ore:gemLapis>, <bloodmagic:item_demon_crystal:*>],
<bloodmagic:demon_pylon>, 50);
addHellForgeRecipe([<ore:dustGlowstone>, <ore:dustRedstone>, <ore:blockGlass>, <ore:stone>],
<bloodmagic:item_routing_node>, 5);
addHellForgeRecipe([<ore:dustGlowstone>, <ore:dustRedstone>, <ore:ingotGold>, <bloodmagic:item_routing_node>],
<bloodmagic:input_routing_node>, 25);
addHellForgeRecipe([<ore:dustGlowstone>, <ore:dustRedstone>, <ore:ingotIron>, <bloodmagic:item_routing_node>],
<bloodmagic:output_routing_node>, 25);
addHellForgeRecipe([<ore:blockIron>, <ore:gemDiamond>, <bloodmagic:slate:2>],
<bloodmagic:master_routing_node>, 200);
addHellForgeRecipe([<minecraft:diamond_chestplate>, <bloodmagic:soul_gem>, <ore:blockIron>, <ore:obsidian>],
<bloodmagic:sentient_armour_gem>, 150);
addHellForgeRecipe([<ore:stickWood>, <bloodmagic:slate:1>, <ore:gemLapis> * 2],
<bloodmagic:node_router>, 5);
addHellForgeRecipe([<bloodmagic:item_demon_crystal:2> * 2, <bloodmagic:ritual_diviner>, <bloodmagic:blood_shard>],
<bloodmagic:ritual_dismantler>, 100);
addHellForgeRecipe([<ore:blockGlass>, <ore:stone>, <bloodmagic:slate>],
<bloodmagic:component:10>, 10);
addHellForgeRecipe([<ore:dustRedstone>, <ore:dyeWhite>, <ore:gunpowder>, <ore:coal>],
<bloodmagic:arcane_ashes>, 0);
addHellForgeRecipe([<ore:ingotGold>, <ore:dustRedstone>, <ore:blockGlass>, <bloodmagic:item_demon_crystal:*>],
<bloodmagic:demon_will_gauge>, 50);
addHellForgeRecipe([<ore:gemDiamond>, <forge:bucketfilled>.withTag({FluidName: "lifeessence", Amount: 1000}), <minecraft:dragon_breath>, <bloodarsenal:blood_infused_glowstone>],
<bloodarsenal:blood_diamond>, 512);
addHellForgeRecipe([<bloodmagic:component:27>, <bloodmagic:sigil_holding>, <ore:chest>, <ore:leather>],
<bloodarsenal:sigil_augmented_holding>, 1600);
addHellForgeRecipe([<bloodmagic:soul_gem:3>, <bloodmagic:sigil_blood_light>, <bloodarsenal:gem:2>, <bloodmagic:sigil_air>],
<bloodarsenal:sigil_sentience>, 4096);
addHellForgeRecipe([<ore:ingotGold>, <bloodarsenal:base_item:2>, <bloodmagic:component:8>, <forge:bucketfilled>.withTag({FluidName: "lifeessence", Amount: 1000})],
<bloodarsenal:base_item:3>, 32);
addHellForgeRecipe([<bloodmagic:soul_gem>, <ore:ingotStainlessSteel>],
<tconevo:metal:30>, 2);
addHellForgeRecipe([<additions:darkest_core>, <evilcraft:promise:2>, <ore:ingotBoundMetal> * 2],
<additions:darkest_ingot> * 2, 1600);
addHellForgeRecipe([<additions:slate_7>, <ore:ingotBalancedMatrix>],
<additions:balanced_slate> * 2, 1800);

//试剂类
addHellForgeRecipe([<ore:listAllsugar>, <minecraft:water_bucket>, <minecraft:water_bucket>],
<bloodmagic:component>, 3);
addHellForgeRecipe([<minecraft:lava_bucket>, <ore:dustRedstone>, <ore:cobblestone>, <ore:blockCoal>],
<bloodmagic:component:1>, 10);
addHellForgeRecipe([<ore:itemGhastTear>, <ore:feather> * 2],
<bloodmagic:component:2>, 20);
addHellForgeRecipe([<minecraft:iron_pickaxe>, <minecraft:iron_axe>, <minecraft:iron_shovel>, <ore:gunpowder>],
<bloodmagic:component:3>, 10);
addHellForgeRecipe([<minecraft:bucket>, <ore:string> * 2, <ore:gunpowder>],
<bloodmagic:component:4>, 10);
addHellForgeRecipe([<ore:treeSapling> * 2, <ore:sugarcane>, <ore:listAllsugar>],
<bloodmagic:component:5>, 20);
addHellForgeRecipe([<bloodmagic:sigil_water>, <bloodmagic:sigil_air>, <bloodmagic:sigil_lava>, <ore:obsidian>],
<bloodmagic:component:6>, 30);
addHellForgeRecipe([<bloodmagic:sigil_divination>, <ore:blockGlass> * 2, <ore:dustGlowstone>],
<bloodmagic:component:7>, 0);
addHellForgeRecipe([<ore:dustGlowstone>, <ore:dustRedstone>, <ore:nuggetGold>, <ore:gunpowder>],
<bloodmagic:component:8>, 10);
addHellForgeRecipe([<bloodmagic:teleposer>, <minecraft:water_bucket>, <minecraft:lava_bucket>, <ore:rodBlaze>], 
<bloodmagic:component:9>, 50);
addHellForgeRecipe([<ore:glowstone>, <ore:torch>, <ore:dustRedstone> * 2],
<bloodmagic:component:11>, 10);
addHellForgeRecipe([<ore:string>, <ore:ingotGold> * 2, <ore:blockIron>],
<bloodmagic:component:12>, 10);
addHellForgeRecipe([<ore:foodCookie> * 2, <ore:listAllsugar>, <ore:stone>],
<bloodmagic:component:13>, 100);
addHellForgeRecipe([<ore:blockIron>, <ore:blockGold>, <ore:obsidian>, <ore:cobblestone>],
<bloodmagic:component:14>, 200);
addHellForgeRecipe([<ore:soulSand> * 2, <ore:stone>, <ore:obsidian>],
<bloodmagic:component:15>, 50);
addHellForgeRecipe([<ore:pearlEnderEye>, <ore:enderpearl>, <ore:ingotGold> * 2],
<bloodmagic:component:16>, 70);
addHellForgeRecipe([<bloodmagic:teleposer>, <ore:gemGlowstone>, <ore:blockRedstone>, <ore:ingotGold>],
<bloodmagic:component:17>, 200);
addHellForgeRecipe([<bloodmagic:teleposer>, <ore:gemDiamond>, <ore:enderpearl>, <ore:obsidian>],
<bloodmagic:component:18>, 200);
addHellForgeRecipe([<ore:chest>, <ore:leather>, <ore:string> * 2],
<bloodmagic:component:27>, 20);
addHellForgeRecipe([<ore:itemFlint> * 2, <bloodmagic:cutting_fluid>],
<bloodmagic:component:30>, 120);
addHellForgeRecipe([<ore:blockSlime> * 2, <ore:leather>, <ore:string>],
<bloodmagic:component:31>, 20);
addHellForgeRecipe([<ore:ice>, <minecraft:snowball> * 2, <ore:dustRedstone>],
<bloodmagic:component:32>, 10);
addHellForgeRecipe([<bloodmagic:component>, <ore:gemPrismarine>, <minecraft:glass_bottle>, <ore:fish>],
<bloodarsenal:base_item:6>, 40);
addHellForgeRecipe([<bloodmagic:component:17>, <ore:pearlEnderEye>, <ore:chestEnder>, <minecraft:end_crystal>],
<bloodarsenal:base_item:7>, 800);
addHellForgeRecipe([<bloodarsenal:base_item:8> * 32, <bloodmagic:decorative_brick:2> * 8, <minecraft:golden_apple:1> * 4, <ore:netherStar> * 16],
<bloodarsenal:base_item:9>, 16384);
addHellForgeRecipe([<ore:listAllsugar>, <ore:workbench>, <minecraft:dispenser>, <minecraft:brick_block>],
<animus:component>, 32);
addHellForgeRecipe([<ore:barsIron>, <ore:enderpearl>, <minecraft:glass_bottle>, <ore:endstone>],
<animus:component:1>, 32);
addHellForgeRecipe([<minecraft:iron_pickaxe> * 4],
<animus:component:2>, 32);
addHellForgeRecipe([<ore:treeSapling>, <ore:treeLeaves>, <minecraft:tallgrass:*>, <ore:foodCooked>],
<animus:component:3>, 20);
addHellForgeRecipe([<ore:sand>, <minecraft:water_bucket>, <minecraft:fishing_rod>, <ore:itemGhastTear>],
<animus:component:4>, 20);
addHellForgeRecipe([<ore:endstone>, <ore:enderpearl>, <ore:obsidian>, <ore:chest>],
<animus:component:5>, 32);
addHellForgeRecipe([<ore:dustWigthium>, <ore:dustDarkest>, <ore:nuggetSentientMetal>, <ore:gunpowder>],
<additions:reagent_ghost>, 1000);
addHellForgeRecipe([<ore:dustCosmilite>, <ore:dustScientificite>, <ore:dustEugardite>, <ore:ingotEverite>],
<additions:reagent_godness>, 1600);

//晶簇类
addHellForgeRecipe([<bloodmagic:item_demon_crystal> * 4],
<bloodmagic:demon_crystal>, 100);
addHellForgeRecipe([<bloodmagic:item_demon_crystal:1> * 4],
<bloodmagic:demon_crystal:1>, 100);
addHellForgeRecipe([<bloodmagic:item_demon_crystal:2> * 4],
<bloodmagic:demon_crystal:2>, 100);
addHellForgeRecipe([<bloodmagic:item_demon_crystal:3> * 4],
<bloodmagic:demon_crystal:3>, 100);
addHellForgeRecipe([<bloodmagic:item_demon_crystal:4> * 4],
<bloodmagic:demon_crystal:4>, 100);

//魂石类
addHellForgeRecipe([<ore:dustRedstone>, <ore:ingotGold>, <ore:blockGlass>, <ore:dyeBlue>],
<bloodmagic:soul_gem>, 1);
addHellForgeRecipe([<bloodmagic:soul_gem>, <ore:gemDiamond>, <ore:blockRedstone>, <ore:blockLapis>],
<bloodmagic:soul_gem:1>, 20);
addHellForgeRecipe([<bloodmagic:soul_gem:1>, <ore:gemDiamond>, <ore:blockGold>, <bloodmagic:slate:2>],
<bloodmagic:soul_gem:2>, 50);
addHellForgeRecipe([<bloodmagic:soul_gem:2>, <bloodmagic:slate:3>, <bloodmagic:blood_shard>, <bloodmagic:item_demon_crystal>],
<bloodmagic:soul_gem:3>, 100);
addHellForgeRecipe([<bloodmagic:soul_gem:3>, <ore:netherStar>],
<bloodmagic:soul_gem:4>, 500);
addHellForgeRecipe([<bloodmagic:soul_gem:4>, <ore:ingotCrimsonite>, <ore:coreBasic>, <ore:ingotSoularium>],
<gctcore:soul_gem>, 2000);
addHellForgeRecipe([<gctcore:soul_gem>, <ore:ingotEthaxium>, <ore:gemRemorseful>, <ore:ingotShadowium>],
<gctcore:soul_gem:1>, 10000);
addHellForgeRecipe([<gctcore:soul_gem:1>, <ore:ingotEverite>, <ore:coreExcellent>],
<gctcore:soul_gem:2>, 50000);
addHellForgeRecipe([<gctcore:soul_gem:2>, <ore:ingotWigthium>, <ore:ingotCthulhurite>, <ore:ingotGhostMetal>],
<gctcore:soul_gem:3>, 220000);
addHellForgeRecipe([<gctcore:soul_gem:3>, <ore:ingotEldritchSteel>, <ore:ingotAzathothium>, <ore:gemHermaphroditic>],
<gctcore:soul_gem:4>, 1000000);
addHellForgeRecipe([<gctcore:soul_gem:4>, <ore:ingotMurderite>, <ore:ingotBalancedMatrix>, <ore:coreOrdered>],
<gctcore:soul_gem:5>, 3600000);

//饰品类
addHellForgeRecipe([<bloodarsenal:soul_pendant>, <bloodarsenal:gem:2>, <ore:blockRedstone>, <ore:gemLapis>],
<bloodarsenal:soul_pendant:1>, 40);
addHellForgeRecipe([<bloodarsenal:soul_pendant:1>, <bloodarsenal:gem:2>, <ore:blockGold>, <bloodmagic:slate:2>],
<bloodarsenal:soul_pendant:2>, 100);
addHellForgeRecipe([<bloodarsenal:soul_pendant:2>, <bloodmagic:blood_shard:*>, <bloodmagic:slate:3>, <bloodmagic:item_demon_crystal:*>],
<bloodarsenal:soul_pendant:3>, 600);
addHellForgeRecipe([<bloodarsenal:soul_pendant:3>, <bloodarsenal:blood_diamond>, <bloodarsenal:slate>, <ore:netherStar>],
<bloodarsenal:soul_pendant:4>, 3000);

//填充类
addHellForgeRecipe([<bloodmagic:soul_gem>],
<bloodmagic:soul_gem>.withTag({souls: 64.0}), 64);
addHellForgeRecipe([<bloodmagic:soul_gem:1>],
<bloodmagic:soul_gem:1>.withTag({souls: 256.0}), 256);
addHellForgeRecipe([<bloodmagic:soul_gem:2>],
<bloodmagic:soul_gem:2>.withTag({souls: 1024.0}), 1024);
addHellForgeRecipe([<bloodmagic:soul_gem:3>],
<bloodmagic:soul_gem:3>.withTag({souls: 4096.0}), 4096);
addHellForgeRecipe([<bloodmagic:soul_gem:4>],
<bloodmagic:soul_gem:4>.withTag({souls: 16384.0}), 16384);