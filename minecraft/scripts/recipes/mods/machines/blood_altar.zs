/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 * 被孤梦梦梦梦完全重做！！！
 */

#priority 50

import crafttweaker.world.IWorld;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.block.IBlock;
import crafttweaker.block.IBlockDefinition;
import crafttweaker.world.IBlockPos;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.data.IData;
import crafttweaker.player.IPlayer;
import crafttweaker.util.Math;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.FactoryRecipeEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.SmartInterfaceUpdateEvent;
import mods.modularmachinery.MachineStructureUpdateEvent;
import mods.modularmachinery.Sync;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MachineTickEvent;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.SmartInterfaceData;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.RecipeFinishEvent;
import mods.modularmachinery.RecipeTickEvent;

import mods.gctweaker.IBigInteger;
import mods.gctweaker.IBigDecimal;

MachineModifier.setMaxThreads("blood_altar", 1);
MachineModifier.setInternalParallelism("blood_altar", 2147483647);
MachineModifier.setMaxParallelism("blood_altar", 2147483647);

MachineModifier.addSmartInterfaceType("blood_altar", SmartInterfaceType.create("模式", 0));

MachineModifier.addCoreThread("blood_altar", FactoryRecipeThread.createCoreThread("源质净化模块").addRecipe("purify"));
MachineModifier.addCoreThread("blood_altar", FactoryRecipeThread.createCoreThread("宝珠输出模块"));
MachineModifier.addCoreThread("blood_altar", FactoryRecipeThread.createCoreThread("血之合成模块"));

$expand IMachineController$getAltarLevel() as int {
    if (!isNull(this.customData.level)) {
        return this.customData.level as int;
    } else {
        return 0;
    }
}

$expand IMachineController$getAltarCapacity() as string {
    if (!isNull(this.customData.capacityLP)) {
        return this.customData.capacityLP as string;
    } else {
        return "0";
    }
}

$expand IMachineController$getAltarLP() as string {
    if (!isNull(this.customData.LP)) {
        return this.customData.LP as string;
    } else {
        return "0";
    }
}

$expand IMachineController$getAltarMode() as int {
    if (!isNull(this.customData.mode)) {
        return this.customData.mode as int;
    } else {
        return 0;
    }
}

$expand IMachineController$getAltarSpeed() as int {
    if (!isNull(this.customData.speed)) {
        return this.customData.speed as int;
    } else {
        return 0;
    }
}

val capacity = [0,5000,25000,150000,1000000,10000000,30000000,80000000,200000000];
val orbname = ["未绑定气血宝珠","[虚弱]气血宝珠","[学徒]气血宝珠","[法师]气血宝珠","[导师]气血宝珠","[贤者]气血宝珠","[卓越]气血宝珠","[邪术]气血宝珠","[咒渊]气血宝珠"];

MMEvents.onStructureUpdate("blood_altar", function(event as MachineStructureUpdateEvent) {
    var levelMap as int[string] = {
        "ONE" : 1,
        "TWO" : 2,
        "THREE" : 3,
        "FOUR" : 4,
        "FIVE" : 5,
        "SIX" : 6
    };
    //获取祭坛等级
    if (!event.controller.world.isRemote()) {
        var altarBlock = event.controller.world.getBlock(event.controller.pos.down(4));
        if (!isNull(altarBlock) && !isNull(altarBlock.data) && !isNull(altarBlock.data.bloodAltar)) {
            var altarLevel as int = levelMap[altarBlock.data.bloodAltar.upgradeLevel as string] as int;
            var runeNum as int = 0;
            runeNum += event.controller.getBlocksInPattern(<bloodmagic:blood_rune>);
            runeNum += event.controller.getBlocksInPattern(<bloodmagic:blood_rune:1>);
            runeNum += event.controller.getBlocksInPattern(<bloodmagic:blood_rune:2>);
            runeNum += event.controller.getBlocksInPattern(<bloodmagic:blood_rune:3>);
            runeNum += event.controller.getBlocksInPattern(<bloodmagic:blood_rune:4>);
            runeNum += event.controller.getBlocksInPattern(<bloodmagic:blood_rune:5>);
            runeNum += event.controller.getBlocksInPattern(<bloodmagic:blood_rune:6>);
            runeNum += event.controller.getBlocksInPattern(<bloodmagic:blood_rune:7>);
            runeNum += event.controller.getBlocksInPattern(<bloodmagic:blood_rune:8>);
            runeNum += event.controller.getBlocksInPattern(<bloodmagic:blood_rune:9>);
            runeNum += event.controller.getBlocksInPattern(<bloodmagic:blood_rune:10>);
            runeNum += event.controller.getBlocksInPattern(<additions:blood_rune_economy>);
            runeNum += event.controller.getBlocksInPattern(<additions:blood_rune_purify>);
            runeNum += event.controller.getBlocksInPattern(<additions:blood_rune_thread>);
            runeNum += event.controller.getBlocksInPattern(<additions:blood_rune_personal>);
        if (altarLevel <= 5) {
            event.controller.customData = event.controller.customData.update({level : altarLevel as int});
        } else if (
            event.controller.world.getBlock(event.controller.pos.north(14).west(14)).definition.id == "additions:crimsonite_block" &&
            event.controller.world.getBlock(event.controller.pos.north(14).east(14)).definition.id == "additions:crimsonite_block" &&
            event.controller.world.getBlock(event.controller.pos.south(14).west(14)).definition.id == "additions:crimsonite_block" &&
            event.controller.world.getBlock(event.controller.pos.south(14).east(14)).definition.id == "additions:crimsonite_block" &&
            runeNum >= 284
        ) {
            if (
                event.controller.world.getBlock(event.controller.pos.up(1).north(18).west(18)).definition.id == "additions:darkest_stonebrick_large" &&
                event.controller.world.getBlock(event.controller.pos.up(1).north(18).east(18)).definition.id == "additions:darkest_stonebrick_large" &&
                event.controller.world.getBlock(event.controller.pos.up(1).south(18).west(18)).definition.id == "additions:darkest_stonebrick_large" &&
                event.controller.world.getBlock(event.controller.pos.up(1).south(18).east(18)).definition.id == "additions:darkest_stonebrick_large" &&
                runeNum >= 416
            ) {
                if (
                    event.controller.world.getBlock(event.controller.pos.up(2).north(22).west(22)).definition.id == "additions:murderite_block" &&
                    event.controller.world.getBlock(event.controller.pos.up(2).north(22).east(22)).definition.id == "additions:murderite_block" &&
                    event.controller.world.getBlock(event.controller.pos.up(2).south(22).west(22)).definition.id == "additions:murderite_block" &&
                    event.controller.world.getBlock(event.controller.pos.up(2).south(22).east(22)).definition.id == "additions:murderite_block" &&
                    runeNum >= 580
                ) {
                    event.controller.customData = event.controller.customData.update({level : 9});
                } else {
                    event.controller.customData = event.controller.customData.update({level : 8});
                }
            } else {
                event.controller.customData = event.controller.customData.update({level : 7});
            }
            } else {
                event.controller.customData = event.controller.customData.update({level : 6});
            }
        }
    //调整机器线程
        if (event.controller.getBlocksInPattern(<additions:blood_rune_thread>) > 15) {
            event.controller.extraThreadCount = 15;
        } else {
            event.controller.extraThreadCount = event.controller.getBlocksInPattern(<additions:blood_rune_thread>) as int;
        }
    //定义最大容量
        val capacity = (IBigDecimal.create("10000") * (IBigDecimal.create("1.1").pow(event.controller.getBlocksInPattern(<bloodmagic:blood_rune:7>) as int)) + IBigDecimal.create("2000") * IBigDecimal.create(event.controller.getBlocksInPattern(<bloodmagic:blood_rune:6>))).toStringScale0();
        event.controller.customData = event.controller.customData.update({capacityLP : capacity});
    //转移速率
        var speed as int = event.controller.getBlocksInPattern(<bloodmagic:blood_rune:1>);
        var efficiency as int = event.controller.getBlocksInPattern(<bloodmagic:blood_rune:2>);
        var speedBuffer as double = 1.0d + 0.2d * speed;
        var efficiencyBuffer as double = pow(1.05d, efficiency as double);
        var LPperSecond as double = 100.0d * speedBuffer * efficiencyBuffer;
        event.controller.customData = event.controller.customData.update({speed : LPperSecond as int});
    }
});

MMEvents.onMachinePreTick("blood_altar", function(event as MachineTickEvent) {
    val world = event.controller.world;
    val altar = world.getBlock(event.controller.pos.down(4));
    var extractNum = IBigInteger.create((IBigDecimal.create("1.2").pow(event.controller.getBlocksInPattern(<bloodmagic:blood_rune:5>)) * IBigDecimal.create("20")).toStringScale0());
    var acceleration as int = event.controller.getBlocksInPattern(<bloodmagic:blood_rune:9>) as int;
    var checkTime as int = (20 - acceleration) > 1 ? (20 - acceleration) : 1;
    
    //定义祭坛模式
    if (!isNull(event.controller.getSmartInterfaceData("模式")) && world.getWorldTime() % 20 == 0) {
        if (event.controller.getSmartInterfaceData("模式").value > 2.0f || event.controller.getSmartInterfaceData("模式").value < 0.0f) {
            event.controller.customData = event.controller.customData.update({mode : 0});
        } else {
            event.controller.customData = event.controller.customData.update({mode : event.controller.getSmartInterfaceData("模式").value as int});
        }
    }
    //初始化祭坛容量
    if (isNull(event.controller.customData.LP)) {
        event.controller.customData = event.controller.customData.update({LP : "0"});
    }
    //外界输入模式
    if (!world.isRemote() && world.getWorldTime() % checkTime == 0 && event.controller.getAltarMode() == 0) {
        if (!isNull(altar) && !isNull(altar.data) && !isNull(altar.data.bloodAltar)) {
            val currentAltarAmount = IBigInteger.create(altar.data.bloodAltar.Amount as string);
            val controllerAvailableSpace = IBigInteger.create(event.controller.getAltarCapacity()) - IBigInteger.create(event.controller.getAltarLP());
            val transferBlood = currentAltarAmount.min(controllerAvailableSpace);
            world.setBlockState(<blockstate:bloodmagic:altar>, altar.data.update({bloodAltar : {Amount : (currentAltarAmount.toString() as int - transferBlood.toString() as int)}}), event.controller.pos.down(4));
            event.controller.customData = event.controller.customData.update({LP : (IBigInteger.create(event.controller.getAltarLP()) + transferBlood).toString()});
        }
    }
    //向血之祭坛输出模式
    if (!world.isRemote() && world.getWorldTime() % checkTime == 0 && event.controller.getAltarMode() == 1) {
        if (!isNull(altar) && !isNull(altar.data) && !isNull(altar.data.bloodAltar)) {
            var controllerLP = IBigInteger.create(event.controller.getAltarLP());
            var altarCurrentAmount as int = altar.data.bloodAltar.Amount as int;
            var altarCapacity as int = altar.data.bloodAltar.capacity as int;
            var altarAvailableSpace as int = altarCapacity - altarCurrentAmount;
            if (altarAvailableSpace > 0) {
                var transferAmount = IBigInteger.create(altarAvailableSpace).min(IBigInteger.create(extractNum.toString()));
                world.setBlockState(<blockstate:bloodmagic:altar>, altar.data.update({bloodAltar : {Amount : altarCurrentAmount + transferAmount.toString() as int}}), event.controller.pos.down(4));
                event.controller.customData = event.controller.customData.update({LP : (controllerLP - transferAmount).toString()});
            }
        }
    }
});

MMEvents.onControllerGUIRender("blood_altar", function(event as ControllerGUIRenderEvent) {
    val levelName as string[int] = {
        1 : "血徒祭坛（一级）",
        2 : "血印祭坛（二级）",
        3 : "血纹祭坛（三级）",
        4 : "血咒祭坛（四级）",
        5 : "血魂祭坛（五级）",
        6 : "血焰祭坛（六级）",
        7 : "血灵祭坛（七级）",
        8 : "血浴祭坛（八级）",
        9 : "血神祭坛（九级）"
    };
    val modeName as string[int] = {
        0 : "由外界输入",
        1 : "向外界输出",
        2 : "转移到玩家网络"
    };
    val levelSpeedMutiplierMap as int[int] = {
        1 : 1,
        2 : 1,
        3 : 2,
        4 : 4,
        5 : 20,
        6 : 80,
        7 : 400,
        8 : 2000,
        9 : 10000
    };
    var info as string[] = [
        "§a///血之祭坛控制面板///",
        "§a机器名称：§eLV1 - 血之祭坛",
        "§a祭坛等级：§e" ~ levelName[event.controller.getAltarLevel()] as string,
        "§a祭坛容量：§e" ~ event.controller.getAltarLP() as string ~ "/" ~ event.controller.getAltarCapacity() as string,
        "§a祭坛模式：§e" ~ modeName[event.controller.getAltarMode()] as string,
        "§a工作效率：§e" ~ (event.controller.getAltarSpeed() * levelSpeedMutiplierMap[event.controller.getAltarLevel()]) as string ~ "mB每" ~ ((20 - event.controller.getBlocksInPattern(<bloodmagic:blood_rune:9>) as int) > 1 ? (20 - event.controller.getBlocksInPattern(<bloodmagic:blood_rune:9>) as int) : 1 as string) ~ "tick",
        "§a转位效率：§e" ~ ((pow(1.2, (event.controller.getBlocksInPattern(<bloodmagic:blood_rune:5>) as double)) * 20) as int as string) ~ "mB每" ~ ((20 - event.controller.getBlocksInPattern(<bloodmagic:blood_rune:9>) as int) > 1 ? (20 - event.controller.getBlocksInPattern(<bloodmagic:blood_rune:9>) as int) : 1 as string) ~ "tick",
        "§d增容符文§e * " ~ event.controller.getBlocksInPattern(<bloodmagic:blood_rune:6>) as string ~ "     §d速度符文§e * " ~ event.controller.getBlocksInPattern(<bloodmagic:blood_rune:1>) as string ~ "     §d超容符文§e * " ~ event.controller.getBlocksInPattern(<bloodmagic:blood_rune:7>) as string,
        "§d转位符文§e * " ~ event.controller.getBlocksInPattern(<bloodmagic:blood_rune:5>) as string ~ "     §d促进符文§e * " ~ event.controller.getBlocksInPattern(<bloodmagic:blood_rune:9>) as string ~ "     §d效率符文§e * " ~ event.controller.getBlocksInPattern(<bloodmagic:blood_rune:2>) as string,
        "§d线程符文§e * " ~ event.controller.getBlocksInPattern(<additions:blood_rune_thread>) as string ~ "     §d节流符文§e * " ~ event.controller.getBlocksInPattern(<additions:blood_rune_economy>) as string ~ "     §d净化符文§e * " ~ event.controller.getBlocksInPattern(<additions:blood_rune_purify>) as string,
        "§d宝珠符文§e * " ~ event.controller.getBlocksInPattern(<bloodmagic:blood_rune:8>) as string ~ "     §d玩家符文§e * " ~ event.controller.getBlocksInPattern(<additions:blood_rune_personal>) as string
    ];

    val sd = event.controller.getBlocksInPattern(<bloodmagic:blood_rune:1>);
    val zw = event.controller.getBlocksInPattern(<bloodmagic:blood_rune:5>);
    val bz = event.controller.getBlocksInPattern(<bloodmagic:blood_rune:8>);
    val cj = event.controller.getBlocksInPattern(<bloodmagic:blood_rune:9>);
    val wj = event.controller.getBlocksInPattern(<additions:blood_rune_personal>);
    val player = server.getPlayerByUUID(event.controller.ownerUUID);
    if (!isNull(player) && !isNull(player.soulNetwork) && server.players has player && event.controller.world.getPlayers() has player) {
        val orbTier = player.soulNetwork.orbTier;
        var maxcapacity = ((1.0f + 0.02f * bz) * capacity[orbTier]) as int;
        var maxtransform = (20.0f * (1 + (cj > 19 ? 19 : cj)) as float * (1.0f + sd as float / 5) as float * pow(1.2, zw) * pow(2.0, wj)) as int;
        var transform = 0;

        if (maxtransform < 0) {
            maxtransform = 2147483647;
            info += "§d警告：LP交互速率已溢出";
        }
        if (maxcapacity < 0) {
            maxcapacity = 2147483647;
            info += "§d警告：玩家LP网络最大容量已溢出";
        }

        if (IBigInteger.create(event.controller.getAltarLP()).min(IBigInteger.create("2147483647")).toString() as int > maxtransform) {
            transform = maxtransform;
        } else {
            transform = IBigInteger.create(event.controller.getAltarLP()).min(IBigInteger.create("2147483647")).toString() as int;
        }
        if (transform > maxcapacity - player.soulNetwork.currentEssence) {
            transform = maxcapacity - player.soulNetwork.currentEssence;
        }
        if (transform < 0) {
            transform = 0;
            info += "§d警告：玩家当前LP网络已超出上限";
        }

        info += "§aLP输出至玩家LP网络最大速率(mB/s)：§e" ~ maxtransform;
        info += "§aLP输出至玩家LP网络实际速率(mB/s)：§e" ~ transform;
        info += "§a玩家LP网络最大容量：§e" ~ maxcapacity ~ "  §a玩家当前LP网络§e：" ~ player.soulNetwork.currentEssence;
    }

    event.extraInfo = info;
});

function economyCount(event as FactoryRecipeEvent) as IBigDecimal {
    return IBigDecimal.create("0.9").pow(min(event.controller.getBlocksInPattern(<additions:blood_rune_economy>), 16));
}

function addAltarRecipe(input as IIngredient, output as IItemStack, costLP as string, level as int) {
    val LP = IBigDecimal.create(costLP);
    val levelSpeedMutiplierMap as int[int] = {
        1 : 1,
        2 : 1,
        3 : 2,
        4 : 4,
        5 : 20,
        6 : 80,
        7 : 400,
        8 : 2000,
        9 : 10000
    };
    RecipeBuilder.newBuilder((input.items[0].definition.id) ~ (input.items[0].metadata as string), "blood_altar", 1)
        .addInput(input)
        .addOutput(output)
        .addPreCheckHandler(function(event as RecipeCheckEvent) {
            if (event.controller.getAltarLevel() < level) {
                event.setFailed("祭坛等级不足");
            }
        })
        .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
            val speed = IBigDecimal.create(max(event.controller.getAltarSpeed() / 20 * levelSpeedMutiplierMap[level],1) as string);
            val time = IBigDecimal.one().max((LP * economyCount(event)) / speed).toStringScale0() as int;
            event.factoryRecipeThread.addModifier("recipetime", RecipeModifierBuilder.create("modularmachinery:duration", "input", (time > 1 ? time as float : 1.0f), 1, false).build());
        })
        .addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
            val parallelism = IBigDecimal.create(event.activeRecipe.parallelism as string);
            val speed = IBigDecimal.create(max(event.controller.getAltarSpeed() / 20 * levelSpeedMutiplierMap[level],1) as string);
            val time = IBigDecimal.one().max((LP * economyCount(event)) / speed);
            val ctrlLP = IBigDecimal.create(event.controller.getAltarLP());
            if (time.toStringScale0() as int <= 1) {
                if (ctrlLP.min(economyCount(event) * LP * parallelism / time) == ctrlLP) {
                    event.controller.customData = event.controller.customData.update({LP : "0"});
                } else {
                    event.controller.customData = event.controller.customData.update({LP : (ctrlLP - (economyCount(event) * LP * parallelism / time)).toStringScale0()});
                }
            }
            if (ctrlLP.min((economyCount(event) * LP * parallelism / time) - IBigDecimal.one()) == ctrlLP) {
                if (event.activeRecipe.tick > 2) {
                    event.activeRecipe.tick -= 2;
                    event.preventProgressing("生命源质不足，需要每tick" ~ ((economyCount(event) * LP * parallelism / time).toStringScale0() ~ "点生命源质"));
                } else {
                    event.setFailed(true,"生命源质不足，需要每tick" ~ (economyCount(event) * LP * parallelism / time).toStringScale0() ~ "点生命源质，合成进度已回退至0");
                }
                event.controller.customData = event.controller.customData.update({LP : "0"});
            } else {
                event.controller.customData = event.controller.customData.update({LP : (ctrlLP - (economyCount(event) * LP * parallelism / time)).toStringScale0()});
            }
        })
        .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
            val parallelism = IBigDecimal.create(event.activeRecipe.parallelism as string);
            val speed = IBigDecimal.create(max(event.controller.getAltarSpeed() / 20 * levelSpeedMutiplierMap[level],1) as string);
            val time = IBigDecimal.one().max((LP * economyCount(event)) / speed);
            val ctrlLP = IBigDecimal.create(event.controller.getAltarLP());
            if (event.activeRecipe.totalTick <= 1) {
                event.controller.customData = event.controller.customData.update({LP : (ctrlLP - (economyCount(event) * LP * parallelism / time)).toStringScale0()});
            }
        })
        .addRecipeTooltip("§e需求血之祭坛等级：" ~ (level as string))
        .addRecipeTooltip("§e需求生命源质：" ~ costLP ~ "点")
        .addRecipeTooltip("§c配方加工时间以祭坛实际速度为准，配方显示时间仅为占位符！")
        .setThreadName("血之合成模块")
        .build();
}

RecipeBuilder.newBuilder("test", "blood_altar", 1)
    .addItemInput(<bloodmagic:sacrificial_dagger:1>).setChance(0)
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        event.controller.customData = event.controller.customData.update({LP : event.controller.getAltarCapacity()});
    })
    .setLoadJEI(false)
    .build();

RecipeBuilder.newBuilder("purify", "blood_altar", 1)
    .addFluidInput(<liquid:substrate_lifeessence>)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val parallelism = event.activeRecipe.parallelism as long;
        val output = event.controller.getBlocksInPattern(<additions:blood_rune_purify>) as long;
        val ctrlLP = IBigInteger.create(event.controller.getAltarLP());
        if (event.controller.getBlocksInPattern(<additions:blood_rune_purify>) < 1) {
            event.setFailed("缺少净化符文");
        }
        if ((ctrlLP + IBigInteger.create((parallelism * output) as string)).min(ctrlLP) == ctrlLP) {
            event.setFailed("祭坛容量已满");
        }
    })
    .addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
        val parallelism = event.activeRecipe.parallelism as long;
        val output = event.controller.getBlocksInPattern(<additions:blood_rune_purify>) as long;
        val ctrlLP = IBigInteger.create(event.controller.getAltarLP());
        if ((ctrlLP + IBigInteger.create((parallelism * output) as string)).min(ctrlLP) == ctrlLP) {
            event.preventProgressing("祭坛容量已满");
        }
    })
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val parallelism = event.activeRecipe.parallelism as long;
        val output = event.controller.getBlocksInPattern(<additions:blood_rune_purify>) as long;
        val ctrlLP = IBigInteger.create(event.controller.getAltarLP());
        var newLP = ctrlLP + IBigInteger.create((parallelism * output) as string);
        if (newLP.min(ctrlLP) == ctrlLP) {
            newLP = ctrlLP;
        }
        event.controller.customData = event.controller.customData.update({LP : newLP.toString()});
    })
    .addRecipeTooltip("§a此配方仅在祭坛上有净化符文时生效")
    .setThreadName("源质净化模块")
    .build();

RecipeBuilder.newBuilder("orb", "blood_altar", 20)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        var player = server.getPlayerByUUID(event.controller.ownerUUID);
        if (!isNull(player) && !isNull(player.soulNetwork)) {
            var maxcapacity = ((1.0f + 0.02f * event.controller.getBlocksInPattern(<bloodmagic:blood_rune:8>)) * capacity[player.soulNetwork.orbTier]) as int;
            if (maxcapacity < 0) {
                maxcapacity = 2147483647;
            }
            else if (player.soulNetwork.currentEssence >= maxcapacity) {
                event.setFailed("玩家LP网络已满");
            }
        } else {
            event.setFailed("玩家未在线或数据无效");
        }
    })
    .addItemInput(<bloodmagic:blood_orb>).setChance(0.0f).setPreViewNBT({orb: "bloodmagic:weak", display: {Lore: ["任意等级气血宝珠均可"]}})
    .setParallelized(false)
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val sd = event.controller.getBlocksInPattern(<bloodmagic:blood_rune:1>);
        val zw = event.controller.getBlocksInPattern(<bloodmagic:blood_rune:5>);
        val bz = event.controller.getBlocksInPattern(<bloodmagic:blood_rune:8>);
        val cj = event.controller.getBlocksInPattern(<bloodmagic:blood_rune:9>);
        val wj = event.controller.getBlocksInPattern(<additions:blood_rune_personal>);
        val player = server.getPlayerByUUID(event.controller.ownerUUID);
        if (!isNull(player) && !isNull(player.soulNetwork)) {
            val orbTier = player.soulNetwork.orbTier;
            var maxcapacity = ((1.0f + 0.02f * bz) * capacity[orbTier]) as int;
            var maxtransform = (20.0f * (1 + (cj > 19 ? 19 : cj)) as float * (1 + sd / 5) as float * pow(1.2, zw) * pow(2.0, wj)) as int;

            if (maxtransform < 0) {
                maxtransform = 2147483647;
            }
            if (maxcapacity < 0) {
                maxcapacity = 2147483647;
            }

            var transform = IBigInteger.create(maxtransform as string).min(IBigInteger.create(event.controller.getAltarLP())).toString() as int;

            if (transform > maxcapacity - player.soulNetwork.currentEssence) {
                transform = maxcapacity - player.soulNetwork.currentEssence;
            }
            if (transform < 0) {
                transform = 0;
            }
            if (player.soulNetwork.currentEssence < 0) {
                player.soulNetwork.currentEssence = 0;
            }

            player.soulNetwork.currentEssence += transform;
            event.controller.customData = event.controller.customData.update({LP : (IBigInteger.create(event.controller.getAltarLP()) - IBigInteger.create(transform as string)).toString()});
        }
    })
    .addRecipeTooltip("§a输出速率为§e20*促进符文数*(1+0.2*速度符文数)*1.2^转位符文数§a")
    .addRecipeTooltip("§a存在§e玩家符文§a时无需在输入仓放置宝珠，且输出速率额外获得§e2^玩家符文数§a倍修正")
    .setThreadName("宝珠输出模块")
    .build();

RecipeBuilder.newBuilder("orb1", "blood_altar", 20)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        var player = server.getPlayerByUUID(event.controller.ownerUUID);
        if (!isNull(player) && !isNull(player.soulNetwork)) {
            var maxcapacity = ((1.0f + 0.02f * event.controller.getBlocksInPattern(<bloodmagic:blood_rune:8>)) * capacity[player.soulNetwork.orbTier]) as int;
            if (maxcapacity < 0) {
                maxcapacity = 2147483647;
            }
            else if (event.controller.getBlocksInPattern(<additions:blood_rune_personal>) < 1) {
                event.setFailed("缺少玩家符文");
            }
            else if (player.soulNetwork.currentEssence >= maxcapacity) {
                event.setFailed("玩家LP网络已满");
            }
        } else {
            event.setFailed("玩家未在线或数据无效");
        }
    })
    .setParallelized(false)
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val sd = event.controller.getBlocksInPattern(<bloodmagic:blood_rune:1>);
        val zw = event.controller.getBlocksInPattern(<bloodmagic:blood_rune:5>);
        val bz = event.controller.getBlocksInPattern(<bloodmagic:blood_rune:8>);
        val cj = event.controller.getBlocksInPattern(<bloodmagic:blood_rune:9>);
        val wj = event.controller.getBlocksInPattern(<additions:blood_rune_personal>);
        val player = server.getPlayerByUUID(event.controller.ownerUUID);
        if (!isNull(player) && !isNull(player.soulNetwork)) {
            val orbTier = player.soulNetwork.orbTier;
            var maxcapacity = ((1.0f + 0.02f * bz) * capacity[orbTier]) as int;
            var maxtransform = (20.0f * (1 + (cj > 19 ? 19 : cj)) as float * (1 + sd / 5) as float * pow(1.2, zw) * pow(2.0, wj)) as int;

            if (maxtransform < 0) {
                maxtransform = 2147483647;
            }
            if (maxcapacity < 0) {
                maxcapacity = 2147483647;
            }

            var transform = IBigInteger.create(maxtransform as string).min(IBigInteger.create(event.controller.getAltarLP())).toString() as int;

            if (transform > maxcapacity - player.soulNetwork.currentEssence) {
                transform = maxcapacity - player.soulNetwork.currentEssence;
            }
            if (transform < 0) {
                transform = 0;
            }
            if (player.soulNetwork.currentEssence < 0) {
                player.soulNetwork.currentEssence = 0;
            }

            player.soulNetwork.currentEssence += transform;
            event.controller.customData = event.controller.customData.update({LP : (IBigInteger.create(event.controller.getAltarLP()) - IBigInteger.create(transform as string)).toString()});
        }
    })
    .setLoadJEI(false)
    .setThreadName("宝珠输出模块")
    .build();

addAltarRecipe(<ore:gemEmerald>, <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:weak"}), 2000, 1);
addAltarRecipe(<ore:ingotAstralStarmetal>, <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:apprentice"}), 5000, 2);
addAltarRecipe(<ore:blockCompressedExperience>, <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:magician"}), 25000, 3);
addAltarRecipe(<bloodmagic:blood_shard>, <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:master"}), 40000, 4);
addAltarRecipe(<ore:netherStar>, <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:archmage"}), 80000, 5);
addAltarRecipe(<draconicevolution:wyvern_core>, <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:transcendent"}), 300000, 6);
addAltarRecipe(<ore:gemPrismarine>, <animus:fragmenthealing>, 1000, 2);
addAltarRecipe(<ore:gemAmber>, <thaumcraft:curio:1>, 80000, 6);
addAltarRecipe(<ore:ingotDurasteel>, <tconevo:metal:25>, 10000, 3);
addAltarRecipe(<ore:blockLapis>, <bloodmagic:inscription_tool:1>, 1000, 3);
addAltarRecipe(<minecraft:magma_cream>, <bloodmagic:inscription_tool:2>, 1000, 3);
addAltarRecipe(<ore:obsidian>, <bloodmagic:inscription_tool:3>, 1000, 3);
addAltarRecipe(<minecraft:ghast_tear>, <bloodmagic:inscription_tool:4>, 1000, 3);
addAltarRecipe(<ore:blockCoal>, <bloodmagic:inscription_tool:5>, 2000, 4);
addAltarRecipe(<ore:glowstone>, <bloodmagic:inscription_tool:6>, 200000, 6);
addAltarRecipe(<bloodarsenal:blood_diamond:1>, <bloodarsenal:blood_diamond:2>, 100000, 5);
addAltarRecipe(<additions:blood_sigil>, <additions:true_blood_sigil>, 150000, 6);
addAltarRecipe(<minecraft:book>, <bloodmagic:sanguine_book>, 1000, 1);
addAltarRecipe(<bloodmagic:teleposition_focus>, <bloodmagic:teleposition_focus:1>, 10000, 4);
addAltarRecipe(<ore:ingotIron>, <bloodarsenal:base_item:4>, 5000, 3);
addAltarRecipe(<ore:gemAmbrosium>, <thaumcraft:curio:4>, 80000, 6);
addAltarRecipe(<minecraft:glass_bottle>, <twilightforest:fiery_blood>, 7000, 4);
addAltarRecipe(<ore:enderpearl>, <bloodmagic:teleposition_focus>, 2000, 4);
addAltarRecipe(<bloodmagic:lava_crystal>, <bloodmagic:activation_crystal>, 10000, 3);
addAltarRecipe(<ore:dustGlowstone>, <bloodarsenal:base_item:2>, 2500, 3);
addAltarRecipe(<ore:ingotGold>, <animus:keybinding>, 1000, 3);
addAltarRecipe(<ore:gemShadow>, <thaumcraft:curio:3>, 80000, 6);
addAltarRecipe(<minecraft:bucket>, <forge:bucketfilled>.withTag({FluidName: "lifeessence", Amount: 1000}), 1000, 1);
addAltarRecipe(<ore:manaPearl>, <additions:pearl_of_knowledge>, 250000, 6);
addAltarRecipe(<minecraft:iron_sword>, <bloodmagic:dagger_of_sacrifice>, 3000, 2);
addAltarRecipe(<ore:logWood>, <bloodarsenal:blood_infused_wooden_log>, 2000, 2);
addAltarRecipe(<ore:blockCosmilite>, <additions:creative_shard>, 850000, 6);
addAltarRecipe(<ore:dyeOrange>, <bloodarsenal:blood_orange>, 500, 2);
addAltarRecipe(<ore:blockCrystalMatrix>, <bloodmagic:decorative_brick:2>, 15000, 5);
addAltarRecipe(<ore:ingotCosmilite>, <additions:ghost_metal>, 2560000, 7);
addAltarRecipe(<ore:blockDarkest>, <additions:darkest_stonebrick_large>, 3840000, 7);
addAltarRecipe(<additions:catalyst_star>, <additions:proliferation_star>, 6400000, 7);
addAltarRecipe(<minecraft:bone_block>, <additions:ivorium_ingot>, 1280000, 7);
addAltarRecipe(<additions:balanced_slate>, <additions:murderite_ingot>, 80000000, 8);
addAltarRecipe(<gct_ores:blue_print_forge>, <modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:builder_3"}), 100000, 6);

addAltarRecipe(<ore:stone>, <bloodmagic:slate>, 1000, 1);
addAltarRecipe(<bloodmagic:slate>, <bloodmagic:slate:1>, 2000, 2);
addAltarRecipe(<bloodmagic:slate:1>, <bloodmagic:slate:2>, 5000, 3);
addAltarRecipe(<bloodmagic:slate:2>, <bloodmagic:slate:3>, 15000, 4);
addAltarRecipe(<bloodmagic:slate:3>, <bloodmagic:slate:4>, 30000, 5);
addAltarRecipe(<bloodmagic:slate:4>, <additions:slate_6>, 200000, 6);
addAltarRecipe(<additions:slate_6>, <additions:slate_7>, 1000000, 7);
addAltarRecipe(<additions:slate_7>, <additions:slate_8>, 50000000, 8);
addAltarRecipe(<additions:slate_8>, <additions:slate_9>, 300000000, 9);

