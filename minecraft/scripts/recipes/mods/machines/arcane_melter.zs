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

import native.net.minecraft.util.math.BlockPos;
import native.thaumcraft.api.aspects.AspectList;
import native.com.xinyihl.whimcraft.common.title.TitleMEAspectOutputBus;

MMEvents.onControllerGUIRender("arcane_melter", function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    var info as string[] = ["§a///源质升华炉控制面板///", "§a机器名称：§eLV4 - 源质升华炉"];
    info += "§a最大单次处理数量：" ~ (isNull(ctrl.customData.baseParallel) ? 1 : ctrl.customData.baseParallel) as string;
    info += "§a物品输入仓数量：" ~ ((isNull(ctrl.customData.inputPos) || ctrl.customData.inputPos.length == 0) ? "未识别到" : ctrl.customData.inputPos.asList().length as string);
    info += "§a能源输入仓坐标：" ~ ((isNull(ctrl.customData.energyInputPos) || ctrl.customData.energyInputPos.length == 0) ? "未识别到" : ctrl.customData.energyInputPos[0] as string ~ "," ~ ctrl.customData.energyInputPos[1] as string ~ "," ~ ctrl.customData.energyInputPos[2] as string);
    info += "§a源质输出仓坐标：" ~ ((isNull(ctrl.customData.outputPos) || ctrl.customData.outputPos.length == 0) ? "未识别到" : ctrl.customData.outputPos[0] as string ~ "," ~ ctrl.customData.outputPos[1] as string ~ "," ~ ctrl.customData.outputPos[2] as string);
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
        var outputPosList = ctrl.getBlockPosInPattern(<whimcraft:blockmeaspectoutputbus>) as IBlockPos[];
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
        ctrl.customData = inputPos.deepUpdate({outputPos: outputPos},APPEND).deepUpdate({energyInputPos: energyPos},APPEND).deepUpdate({baseParallel: baseparallel},APPEND);
    }
});

MMEvents.onMachinePreTick("arcane_melter", function(event as MachineTickEvent) {
    val ctrl = event.controller;

    if (!(ctrl.world.isRemote()) && !isNull(ctrl.customData.inputPos) && ctrl.customData.inputPos.length != 0 && ctrl.customData.inputPos[0].length != 0 && !isNull(ctrl.customData.outputPos) && ctrl.customData.outputPos.length >= 3 && ctrl.world.getWorldTime() % 20 == 0) {
        val outputTile = ctrl.world.native.getTileEntity(BlockPos(ctrl.customData.outputPos[0], ctrl.customData.outputPos[1], ctrl.customData.outputPos[2]));
        if (outputTile instanceof TitleMEAspectOutputBus) {
            val outputBus = outputTile as TitleMEAspectOutputBus;
            val parallel = isNull(ctrl.customData.baseParallel) ? 1 as int : ctrl.customData.baseParallel as int;
            var pendingAspects as AspectList = AspectList();
            var outputEssentia as AspectList = AspectList();
            var processedCount = 0 as int;
            var inputIndex = 0 as int;

            for aspect in outputBus.essentia.getAspects() {
                if (!isNull(aspect)) {
                    outputEssentia.add(aspect, outputBus.essentia.getAmount(aspect));
                }
            }
            if (outputEssentia.size() != outputBus.essentia.size()) {
                outputBus.setAspects(outputEssentia);
                outputBus.sync();
            }

            ctrl.customData = ctrl.customData.update({parallel: parallel});
            while (inputIndex < ctrl.customData.inputPos.length && processedCount < parallel) {
                val input = ctrl.world.getItemHandler(IBlockPos.create(ctrl.customData.inputPos[inputIndex][0], ctrl.customData.inputPos[inputIndex][1], ctrl.customData.inputPos[inputIndex][2]));
                for slot, item in input {
                    if (!isNull(item) && processedCount < parallel) {
                        val consumeAmount = item.amount <= parallel - processedCount ? item.amount : parallel - processedCount;
                        val itemAspects = AspectList(item.native);
                        for aspect in itemAspects.getAspects() {
                            if (!isNull(aspect)) {
                                pendingAspects.add(aspect, itemAspects.getAmount(aspect) * consumeAmount);
                            }
                        }
                        input.setStackInSlot(slot, consumeAmount == item.amount ? null : item.withAmount(item.amount - consumeAmount));
                        processedCount += consumeAmount;
                    }
                }
                inputIndex += 1;
            }

            if (processedCount > 0) {
                outputEssentia.add(pendingAspects);
                var needEnergy = 0 as long;
                for aspect in outputEssentia.getAspects() {
                    needEnergy += (100l * outputEssentia.getAmount(aspect) as long * pow(2, ctrl.customData.inputPos.length - 1)) as long;
                }

                if (!isNull(ctrl.customData.energyInputPos) && ctrl.customData.energyInputPos.length >= 3) {
                    val energyInputPos = IBlockPos.create(ctrl.customData.energyInputPos[0], ctrl.customData.energyInputPos[1], ctrl.customData.energyInputPos[2]);
                    val energyData = ctrl.world.getBlock(energyInputPos).data;
                    if (!isNull(energyData.energy) && energyData.energy.asLong() >= needEnergy) {
                        ctrl.world.setBlockState(ctrl.world.getBlockState(energyInputPos), energyData.deepUpdate({energy: energyData.energy.asLong() - needEnergy}), energyInputPos);
                        outputBus.setAspects(outputEssentia);
                        outputBus.sync();
                    }
                }
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
