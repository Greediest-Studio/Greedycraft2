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

MachineModifier.addCoreThread("blood_altar", FactoryRecipeThread.createCoreThread("源质净化模块").addRecipe("purify"));
MachineModifier.addCoreThread("blood_altar", FactoryRecipeThread.createCoreThread("宝珠输出模块").addRecipe("orb"));

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
    if (event.controller.world.getWorldTime() % 100 == 0 && (!event.controller.world.isRemote())) {
        if (event.controller.getBlocksInPattern(<additions:blood_rune_thread>) > 15) {
            event.controller.extraThreadCount = 15;
        } else {
            event.controller.extraThreadCount = event.controller.getBlocksInPattern(<additions:blood_rune_thread>) as int;
        }
    }
    //定义最大容量
    if (event.controller.world.getWorldTime() % 40 == 0 && (!event.controller.world.isRemote())) {
        var capacity as long = ((pow(1.1, event.controller.getBlocksInPattern(<bloodmagic:blood_rune:7>) as double) as double * 10000L) as long + (2000L * event.controller.getBlocksInPattern(<bloodmagic:blood_rune:6>) as long));
        event.controller.customData = event.controller.customData.update({capacityLP : capacity});
    }
    //定义祭坛模式
    if (!isNull(event.controller.getSmartInterfaceData("模式"))) {
        if (event.controller.getSmartInterfaceData("模式").value > 2.0f || event.controller.getSmartInterfaceData("模式").value < 0.0f) {
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
    //玩家LP转移
    if (!world.isRemote() && event.controller.getBlocksInPattern(<additions:blood_rune_personal>) > 0 && event.controller.getAltarMode() == 2) {
        var speed as int = pow(2, (event.controller.getBlocksInPattern(<additions:blood_rune_personal>) - 1) as double) as int;
        var uuid as string = event.controller.ownerUUID;
        if (!isNull(server.getPlayerByUUID(uuid)) && event.controller.getAltarLP() >= speed) {
            var player as IPlayer = server.getPlayerByUUID(uuid);
            event.controller.customData = event.controller.customData.update({LP : event.controller.getAltarLP() - (speed as long)});
            player.soulNetwork.currentEssence += speed as int;
        } else if (!isNull(server.getPlayerByUUID(uuid)) && event.controller.getAltarLP() < speed) {
            var player as IPlayer = server.getPlayerByUUID(uuid);
            player.soulNetwork.currentEssence += event.controller.getAltarLP() as int;
            event.controller.customData = event.controller.customData.update({LP : 0L});
        }
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
        1 : "向外界输出",
        2 : "转移到玩家网络（需要玩家符文）"
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
        "§d促进符文§e * " ~ event.controller.getBlocksInPattern(<bloodmagic:blood_rune:9>) as string ~ "     §d效率符文§e * " ~ event.controller.getBlocksInPattern(<bloodmagic:blood_rune:2>) as string,
        "§d线程符文§e * " ~ event.controller.getBlocksInPattern(<additions:blood_rune_thread>) as string ~ "     §d节流符文§e * " ~ event.controller.getBlocksInPattern(<additions:blood_rune_economy>) as string,
        "§d净化符文§e * " ~ event.controller.getBlocksInPattern(<additions:blood_rune_purify>) as string ~ "     §d宝珠符文§e * " ~ event.controller.getBlocksInPattern(<bloodmagic:blood_rune:8>) as string,
        "§d玩家符文§e * " ~ event.controller.getBlocksInPattern(<additions:blood_rune_personal>) as string
    ];
    event.extraInfo = info;
});

function economyCount(event as FactoryRecipeEvent) as double {
    var num as int = event.controller.getBlocksInPattern(<additions:blood_rune_economy>) as int;
    if (num >= 16) num = 16;
    return pow(0.9, num as double) as double;
}

function addAltarRecipe(input as IIngredient, output as IItemStack, LP as int, level as int) {
    var levelSpeedMutiplierMap as int[int] = {
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
    var recipe = RecipeBuilder.newBuilder((input.items[0].definition.id) ~ (input.items[0].metadata as string), "blood_altar", 1);
    recipe.addInput(input);
    recipe.addOutput(output);
    recipe.addPreCheckHandler(function(event as RecipeCheckEvent) {
        if (event.controller.getAltarLevel() < level) {
            event.setFailed("祭坛等级不足");
        }
    });
    recipe.addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        var speed as int = event.controller.getAltarSpeed() / 20 * levelSpeedMutiplierMap[level] as int;
        var time as int = Math.ceil((LP as double * economyCount(event)) / (speed as double)) as int;
        event.factoryRecipeThread.addModifier("recipetime", RecipeModifierBuilder.create("modularmachinery:duration", "input", time as float, 1, false).build());
    });
    recipe.addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
        val parallelism as int = event.activeRecipe.parallelism;
        if ((event.controller.getAltarLP() < (economyCount(event) * LP * parallelism) as long) && (event.activeRecipe.totalTick - event.activeRecipe.tick) == 1) {
            event.preventProgressing("生命源质不足，需要总计" ~ (economyCount(event) * LP * parallelism) as long as string ~ "点生命源质");
        }
    });
    recipe.addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val parallelism as int = event.activeRecipe.parallelism;
        event.controller.customData = event.controller.customData.update({LP : event.controller.getAltarLP() - ((economyCount(event) * LP * parallelism) as long) as long});
    });
    recipe.addRecipeTooltip("§e需求血之祭坛等级：" ~ (level as string));
    recipe.addRecipeTooltip("§e需求生命源质：" ~ (LP as string) ~ "点");
    recipe.addRecipeTooltip("§c配方加工时间以祭坛实际速度为准，配方显示时间仅为占位符！");
    recipe.build();
}

RecipeBuilder.newBuilder("purify", "blood_altar", 1)
    .addFluidInput(<liquid:substrate_lifeessence>)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        if (event.controller.getBlocksInPattern(<additions:blood_rune_purify>) < 1) {
            event.setFailed("缺少净化符文");
        }
    })
    .addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
        val parallelism as int = event.activeRecipe.parallelism;
        var output as int = event.controller.getBlocksInPattern(<additions:blood_rune_purify>);
        if (event.controller.getAltarLP() + parallelism * output > event.controller.getAltarCapacity()) {
            event.preventProgressing("祭坛容量已满");
        }
    })
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val parallelism as int = event.activeRecipe.parallelism;
        var output as int = event.controller.getBlocksInPattern(<additions:blood_rune_purify>);
        event.controller.customData = event.controller.customData.update({LP : event.controller.getAltarLP() + (parallelism * output) as long});
    })
    .addRecipeTooltip("§a此配方仅在祭坛上有净化符文时生效")
    .setThreadName("源质净化模块")
    .build();

RecipeBuilder.newBuilder("orb", "blood_altar", 1)
    .setParallelized(false)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        if (event.controller.getBlocksInPattern(<bloodmagic:blood_rune:8>) < 1) {
            event.setFailed("缺少宝珠符文");
        }
    })
    .addFactoryPreTickHandler(function(event as FactoryRecipeTickEvent) {
        if (event.controller.getAltarLP() < 1) {
            event.preventProgressing("生命源质不足，需要至少1点生命源质");
        }
    })
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        event.controller.customData = event.controller.customData.update({LP : event.controller.getAltarLP() - 1 as long});
    })
    .addLifeEssenceOutput(1, false)
    .addRecipeTooltip("§a此配方仅在祭坛上有宝珠符文时生效")
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

addAltarRecipe(<ore:stone>, <bloodmagic:slate>, 1000, 1);
addAltarRecipe(<bloodmagic:slate>, <bloodmagic:slate:1>, 2000, 2);
addAltarRecipe(<bloodmagic:slate:1>, <bloodmagic:slate:2>, 5000, 3);
addAltarRecipe(<bloodmagic:slate:2>, <bloodmagic:slate:3>, 15000, 4);
addAltarRecipe(<bloodmagic:slate:3>, <bloodmagic:slate:4>, 30000, 5);
addAltarRecipe(<bloodmagic:slate:4>, <additions:slate_6>, 200000, 6);
addAltarRecipe(<additions:slate_6>, <additions:slate_7>, 1000000, 7);
addAltarRecipe(<additions:slate_7>, <additions:slate_8>, 50000000, 8);
addAltarRecipe(<additions:slate_8>, <additions:slate_9>, 300000000, 9);

