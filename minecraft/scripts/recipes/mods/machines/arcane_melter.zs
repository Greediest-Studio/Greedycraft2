/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */


#priority 50

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.world.IWorld;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.player.IPlayer;
import crafttweaker.container.IContainer;
import crafttweaker.block.IBlock;
import crafttweaker.world.IBlockPos;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.ctutils.utils.Math;
import mods.modularmachinery.ControllerGUIRenderEvent;
import crafttweaker.world.IFacing;
import mods.randomtweaker.thaumcraft.IAspect;
import mods.randomtweaker.thaumcraft.IAspectList;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.MachineStructureUpdateEvent;
import mods.jei.JEI;
import mods.zenutils.DataUpdateOperation.OVERWRITE;
import mods.zenutils.DataUpdateOperation.APPEND;
import mods.zenutils.DataUpdateOperation.MERGE;
import mods.zenutils.DataUpdateOperation.REMOVE;
import mods.zenutils.DataUpdateOperation.BUMP;
import mods.zenutils.ItemHandler;

MMEvents.onControllerGUIRender("arcane_melter", function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    var info as string[] = ["§a///源质升华炉控制面板///", "§a机器名称：§eLV4 - 源质升华炉"];
    info += "§a最大单次处理数量：" ~ (isNull(ctrl.customData.baseparallel) ? 1 : ctrl.customData.baseparallel) as string;
    info += "§a物品输入仓数量：" ~ ((isNull(ctrl.customData.inputPos) || ctrl.customData.inputPos.length == 0) ? "未识别到" : ctrl.customData.inputPos.asList().length as string);
    info += "§a能源输入仓坐标：" ~ ((isNull(ctrl.customData.energyInputPos) || ctrl.customData.energyInputPos.length == 0) ? "未识别到" : ctrl.customData.energyInputPos[0] as string ~ "," ~ ctrl.customData.energyInputPos[1] as string ~ "," ~ ctrl.customData.energyInputPos[2] as string);
    info += "§a源质输出仓坐标：" ~ ((isNull(ctrl.customData.outputPos) || ctrl.customData.outputPos.length == 0) ? "未识别到" : ctrl.customData.outputPos[0] as string ~ "," ~ ctrl.customData.outputPos[1] as string ~ "," ~ ctrl.customData.outputPos[2] as string);
    info += ctrl.customData.a;
    event.extraInfo = info;
});

MMEvents.onStructureUpdate("arcane_melter", function(event as MachineStructureUpdateEvent) {
    val ctrl = event.controller;
    if (!ctrl.world.isRemote()) {
        var baseparallel = 16 as int;
        baseparallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:0>) * 4;
        baseparallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:5>) * 8;
        baseparallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:1>) * 16;
        baseparallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:6>) * 32;
        baseparallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:2>) * 64;
        baseparallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:7>) * 128;
        baseparallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:3>) * 256;
        baseparallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:8>) * 512;
        baseparallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:4>) * 1024;
        baseparallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:9>) * 2048;

        var inputPosList = ctrl.getBlockPosInPattern(<modularmachinery:blockinputbus:*>) as IBlockPos[];
        if (ctrl.getBlocksInPattern(<modularmachinery:blockmeiteminputbus>) != 0) {
            for pos in ctrl.getBlockPosInPattern(<modularmachinery:blockmeiteminputbus>) {
                inputPosList += pos;
            }
        }
        if (ctrl.getBlocksInPattern(<modularmachinery:blockmepatternprovider>) != 0) {
            for pos in ctrl.getBlockPosInPattern(<modularmachinery:blockmepatternprovider>) {
                inputPosList += pos;
            }
        }
        var outputPosList = ctrl.getBlocksInPattern(<gugu-utils:aspecthatch:1>) == 0 ? ctrl.getBlockPosInPattern(<whimcraft:blockmeaspectoutputbus>) as IBlockPos[] : ctrl.getBlockPosInPattern(<gugu-utils:aspecthatch:1>) as IBlockPos[];
        var energyPosList = ctrl.getBlockPosInPattern(<modularmachinery:blockenergyinputhatch:*>) as IBlockPos[];

        var inputPos = {inputPos: []} as IData;
        if (inputPosList.length != 0) {
            for pos in inputPosList {
                inputPos = inputPos.deepUpdate({inputPos: [[ctrl.pos.x + pos.x,ctrl.pos.y + pos.y,ctrl.pos.z + pos.z]]},{inputPos: APPEND});
            }
        }
        var outputPos = [] as int[];
        if (outputPosList.length != 0) {
            for pos in outputPosList {
                outputPos += ctrl.pos.x + pos.x;
                outputPos += ctrl.pos.y + pos.y;
                outputPos += ctrl.pos.z + pos.z;
                break;
            }
        }
        var energyPos = [] as int[];
        if (energyPosList.length != 0) {
            for pos in energyPosList {
                energyPos += ctrl.pos.x + pos.x;
                energyPos += ctrl.pos.y + pos.y;
                energyPos += ctrl.pos.z + pos.z;
                break;
            }
        }
        ctrl.customData = inputPos.deepUpdate({outputPos: outputPos},APPEND).deepUpdate({energyInputPos: energyPos},APPEND).deepUpdate({baseParallel: baseparallel},APPEND).deepUpdate({a: inputPosList.length},APPEND);
    }
});

MMEvents.onMachinePreTick("arcane_melter", function(event as MachineTickEvent) {
    val ctrl = event.controller;

    if (!(ctrl.world.isRemote()) && !isNull(ctrl.customData.inputPos) && (ctrl.customData.inputPos.length != 0) && (ctrl.customData.inputPos[0].length != 0) && !isNull(ctrl.customData.outputPos) && (ctrl.customData.outputPos.length != 0) && (ctrl.world.getWorldTime() % 20 == 0)) {
        val outputPos = IBlockPos.create(ctrl.customData.outputPos[0],ctrl.customData.outputPos[1],ctrl.customData.outputPos[2]);
        var data = ctrl.world.getBlock(outputPos).data;
        var parallel = isNull(ctrl.customData.baseParallel) ? 1 as int : ctrl.customData.baseParallel as int;
        var aspectsMap = {} as int[string];
        var keyMap = {} as int[string];
        var count = 0 as int;
        var needenergy = 0 as long;

        ctrl.customData = ctrl.customData.update({parallel: parallel});
        var n = 0;
        while (n <= (ctrl.customData.inputPos.length - 1)) {
            val input = ctrl.world.getItemHandler(IBlockPos.create(ctrl.customData.inputPos[n][0],ctrl.customData.inputPos[n][1],ctrl.customData.inputPos[n][2]));
            for solt , item in input {
                if (!isNull(item)) {
                    var aspectList = item.getAspects();
                    if (item.amount <= (parallel - count)) {
                        for aspect in aspectList {
                            if (isNull(aspectsMap[aspect.getName().toLowerCase()])) {
                                aspectsMap[aspect.getName().toLowerCase()] = (aspectList.getAmount(aspect) * item.amount);
                            }
                            else {
                                aspectsMap[aspect.getName().toLowerCase()] = aspectsMap[aspect.getName().toLowerCase()] + (aspectList.getAmount(aspect) * item.amount);
                            }
                        }
                        input.setStackInSlot(solt,null);
                     count += item.amount;
                    }
                    else {
                        for aspect in aspectList {
                            if (isNull(aspectsMap[aspect.getName().toLowerCase()])) {
                                aspectsMap[aspect.getName().toLowerCase()] = (aspectList.getAmount(aspect) * (parallel - count));
                            }
                            else {
                                aspectsMap[aspect.getName().toLowerCase()] = aspectsMap[aspect.getName().toLowerCase()] + (aspectList.getAmount(aspect) * (parallel - count));
                            }
                        }
                        input.setStackInSlot(solt,item.withAmount(item.amount - (parallel - count)));
                        count += (parallel - count);
                    }
                }
            }
            n += 1;
        }

        if (!isNull(data.Aspects) && (data.Aspects.asList().length != 0)) {
            var i = 0;
            while (i <= (data.Aspects.asList().length - 1)) {
                keyMap[data.Aspects.asList()[i].key] = data.Aspects.asList()[i].amount;
                i += 1;
            }
            data = data.deepUpdate({Aspects: data.Aspects},REMOVE);
            data = data.deepUpdate({Aspects: []},APPEND);
        }
        for name, amount in aspectsMap {
            if (!isNull(keyMap[name])) {
                aspectsMap[name] = keyMap[name] + amount;
            }
        }
        for name, amount in keyMap {
            if (isNull(aspectsMap[name])) {
                aspectsMap[name] = amount;
            }
        }
        for name , amount in aspectsMap {
            data = data.deepUpdate({Aspects: [{amount: (amount as int),key: name}]},{Aspects: APPEND});
            needenergy += (100l * amount as long * pow(2,n - 1)) as long;
        }
        if (!isNull(ctrl.customData.energyInputPos)) {
            val energyInputPos = IBlockPos.create(ctrl.customData.energyInputPos[0],ctrl.customData.energyInputPos[1],ctrl.customData.energyInputPos[2]);
            if (!isNull(ctrl.world.getBlock(energyInputPos).data.energy) && ctrl.world.getBlock(energyInputPos).data.energy.asLong() >= needenergy) {
                ctrl.world.setBlockState(ctrl.world.getBlockState(energyInputPos),ctrl.world.getBlock(energyInputPos).data.deepUpdate({energy: (ctrl.world.getBlock(energyInputPos).data.energy.asLong() - needenergy)}),energyInputPos);
                ctrl.world.setBlockState(ctrl.world.getBlockState(outputPos),data,outputPos);
            }
        }
    }
});

RecipeBuilder.newBuilder("aspect","arcane_melter", 20)
    .addEnergyPerTickInput(100)
    .addItemInput(<minecraft:tnt>.withTag({ench: [{lvl: 1, id: 255}]})).setPreViewNBT({ench: [{lvl: 100, id: 3}], display: {Lore: ["§9所有放置于输入仓的物品都将被消耗"], Name: "§7示例输入"}})
    .addRecipeTooltip("§9提取输入物品中的所有源质")
    .addRecipeTooltip("§9每输出1点源质消耗100RF,每多一个输入仓能耗翻倍")
    .build();
