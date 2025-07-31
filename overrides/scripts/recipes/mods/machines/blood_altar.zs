/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 * 被孤梦梦梦梦完全重做！！！
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
import mods.modularmachinery.SmartInterfaceUpdateEvent;
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

MachineModifier.setMaxThreads("blood_altar", 1);
MachineModifier.setInternalParallelism("blood_altar", 2147483647);
MachineModifier.setMaxParallelism("blood_altar", 2147483647);

MachineModifier.addSmartInterfaceType("blood_altar", SmartInterfaceType.create("模式", 0));

$expand IMachineController$getAltarLevel() as int {
    if (!isNull(this.customData.level)) {
        return this.customData.level as int;
    } else {
        return 0;
    }
}

$expand IMachineController$getAltarCapacity() as long {
    if (!isNull(this.customData.capacityLP)) {
        return this.customData.capacityLP as long;
    } else {
        return 0l;
    }
}

$expand IMachineController$getAltarLP() as long {
    if (!isNull(this.customData.LP)) {
        return this.customData.LP as long;
    } else {
        return 0l;
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

MMEvents.onMachinePreTick("blood_altar", function(event as MachineTickEvent) {
    var levelMap as int[string] = {
        "ONE" : 1,
        "TWO" : 2,
        "THREE" : 3,
        "FOUR" : 4,
        "FIVE" : 5,
        "SIX" : 6
    };
    //获取祭坛等级
    if (event.controller.world.getWorldTime() % 100 == 0 && (!event.controller.world.isRemote())) {
        var altarLevel as int = levelMap[event.controller.world.getBlock(event.controller.pos.down(4)).data.bloodAltar.upgradeLevel as string] as int;
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
    //定义最大容量
    if (event.controller.world.getWorldTime() % 40 == 0 && (!event.controller.world.isRemote())) {
        var capacity as long = ((pow(1.1, event.controller.getBlocksInPattern(<bloodmagic:blood_rune:7>) as double) as double * 10000L) as long + (2000L * event.controller.getBlocksInPattern(<bloodmagic:blood_rune:6>) as long));
        event.controller.customData = event.controller.customData.update({capacityLP : capacity});
    }
    //定义祭坛模式
    if (!isNull(event.controller.getSmartInterfaceData("模式"))) {
        if (event.controller.getSmartInterfaceData("模式").value > 1.0f || event.controller.getSmartInterfaceData("模式").value < 0.0f) {
            event.controller.customData = event.controller.customData.update({mode : 0});
        } else {
            event.controller.customData = event.controller.customData.update({mode : event.controller.getSmartInterfaceData("模式").value as int});
        }
    }
    //初始化祭坛容量
    if (isNull(event.controller.customData.LP)) {
        event.controller.customData = event.controller.customData.update({LP : 0L});
    }
    var world = event.controller.world;
    var altar = world.getBlock(event.controller.pos.down(4));
    var extractNum as int = (pow(1.2, (event.controller.getBlocksInPattern(<bloodmagic:blood_rune:5>) as double)) * 20) as int;
    var acceleration as int = event.controller.getBlocksInPattern(<bloodmagic:blood_rune:9>) as int;
    var checkTime as int = 20 - acceleration;
    if (checkTime < 1) {
        checkTime = 1;
    }
    //外界输入模式
    if (!world.isRemote() && world.getWorldTime() % checkTime == 0 && event.controller.getAltarMode() == 0) {
        var currentAltarAmount as int = altar.data.bloodAltar.Amount as int;
        if (currentAltarAmount > extractNum) {
            world.setBlockState(<blockstate:bloodmagic:altar>, altar.data.update({bloodAltar : {Amount : currentAltarAmount - extractNum}}), event.controller.pos.down(4));
            event.controller.customData = event.controller.customData.update({LP : event.controller.getAltarLP() + (extractNum as long)});
        } else if (currentAltarAmount > 0) {
            world.setBlockState(<blockstate:bloodmagic:altar>, altar.data.update({bloodAltar : {Amount : 0}}), event.controller.pos.down(4));
            event.controller.customData = event.controller.customData.update({LP : event.controller.getAltarLP() + (currentAltarAmount as long)});
        }
    }
    //向血之祭坛输出模式
    if (!world.isRemote() && world.getWorldTime() % checkTime == 0 && event.controller.getAltarMode() == 1) {
        var controllerLP as long = event.controller.getAltarLP();
        var altarCurrentAmount as int = altar.data.bloodAltar.Amount as int;
        var altarCapacity as int = altar.data.bloodAltar.capacity as int;
        var altarAvailableSpace as int = altarCapacity - altarCurrentAmount;
        if (controllerLP > 0 && altarAvailableSpace > 0) {
            var transferAmount as long = 0L;
            if (controllerLP > extractNum) {
                if (altarAvailableSpace >= extractNum) {
                    transferAmount = extractNum as long;
                } else {
                    transferAmount = altarAvailableSpace as long;
                }
            } else {
                if (altarAvailableSpace >= controllerLP) {
                    transferAmount = controllerLP;
                } else {
                    transferAmount = altarAvailableSpace as long;
                }
            }            
            if (transferAmount > 0) {
                world.setBlockState(<blockstate:bloodmagic:altar>, altar.data.update({bloodAltar : {Amount : altarCurrentAmount + (transferAmount as int)}}), event.controller.pos.down(4));
                event.controller.customData = event.controller.customData.update({LP : controllerLP - transferAmount});
            }
        }
    }
    //记录转移速率
    if (!world.isRemote() && world.getWorldTime() % 100 == 0) {
        var speed as int = event.controller.getBlocksInPattern(<bloodmagic:blood_rune:1>);
        var efficiency as int = event.controller.getBlocksInPattern(<bloodmagic:blood_rune:2>);
        var speedBuffer as double = 1.0d + 0.2d * speed;
        var efficiencyBuffer as double = pow(1.05d, efficiency as double);
        var LPperSecond as double = 100.0d * speedBuffer * efficiencyBuffer;
        event.controller.customData = event.controller.customData.update({speed : LPperSecond as int});
    }
});

MMEvents.onControllerGUIRender("blood_altar", function(event as ControllerGUIRenderEvent) {
    var levelName as string[int] = {
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
    var modeName as string[int] = {
        0 : "由外界输入",
        1 : "向外界输出"
    };
    var info as string[] = [
        "§a///血之祭坛控制面板///",
        "§a机器名称：§eLV1 - 血之祭坛",
        "§a祭坛等级：§e" ~ levelName[event.controller.getAltarLevel()] as string,
        "§a祭坛容量：§e" ~ event.controller.getAltarLP() as string ~ "/" ~ event.controller.getAltarCapacity() as string,
        "§a祭坛模式：§e" ~ modeName[event.controller.getAltarMode()] as string,
        "§a工作效率：§e" ~ event.controller.getAltarSpeed() as string ~ "每20tick",
        "§a转位效率：§e" ~ ((pow(1.2, (event.controller.getBlocksInPattern(<bloodmagic:blood_rune:5>) as double)) * 20) as int as string) ~ "每" ~ ((20 - event.controller.getBlocksInPattern(<bloodmagic:blood_rune:9>) as int) > 1 ? (20 - event.controller.getBlocksInPattern(<bloodmagic:blood_rune:9>) as int) : 1 as string) ~ "tick",
        "§d增容符文§e * " ~ event.controller.getBlocksInPattern(<bloodmagic:blood_rune:6>) as string ~ "     §d速度符文§e * " ~ event.controller.getBlocksInPattern(<bloodmagic:blood_rune:1>) as string,
        "§d超容符文§e * " ~ event.controller.getBlocksInPattern(<bloodmagic:blood_rune:7>) as string ~ "     §d转位符文§e * " ~ event.controller.getBlocksInPattern(<bloodmagic:blood_rune:5>) as string,
        "§d促进符文§e * " ~ event.controller.getBlocksInPattern(<bloodmagic:blood_rune:9>) as string ~ "     §d效率符文§e * " ~ event.controller.getBlocksInPattern(<bloodmagic:blood_rune:2>) as string
    ];
    event.extraInfo = info;
});

function addAltarRecipe(input as IIngredient, output as IItemStack, LP as int, level as int) {
    var recipe = RecipeBuilder.newBuilder((input.items[0].definition.id) ~ (input.items[0].metadata as string), "blood_altar", 1);
    recipe.addInput(input);
    recipe.addOutput(output);
    recipe.addPreCheckHandler(function(event as RecipeCheckEvent) {
        if (event.controller.getAltarLevel() < level) {
            event.setFailed("祭坛等级不足");
        }
    });
    recipe.addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        var speed as int = event.controller.getAltarSpeed() / 20;
        var time as int = Math.ceil((LP as double) / (speed as double)) as int;
        event.factoryRecipeThread.addModifier("recipetime", RecipeModifierBuilder.create("modularmachinery:duration", "input", time as float, 1, false).build());
    });
    recipe.addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
        if (event.controller.getAltarLP() < LP) {
            event.setFailed(false, "生命源质不足");
        }
    });
    recipe.addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val parallelism as int = event.activeRecipe.parallelism;
        event.controller.customData = event.controller.customData.update({LP : event.controller.getAltarLP() - (LP as long * parallelism) as long});
    });
    recipe.addRecipeTooltip("§e需求血之祭坛等级：" ~ (level as string));
    recipe.addRecipeTooltip("§e需求生命源质：" ~ (LP as string) ~ "点");
    recipe.addRecipeTooltip("§c配方加工时间以祭坛实际速度为准，配方显示时间仅为占位符！");
    recipe.build();
}

addAltarRecipe(<ore:ingotIron>, <minecraft:diamond>, 20000, 2);