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
    info += "§a最大单次处理数量：" ~ (isNull(ctrl.customData.parallel) ? 1 : ctrl.customData.parallel) as string;
    info += "§a物品输入仓坐标：" ~ ((isNull(ctrl.customData.inputPos) || ctrl.customData.inputPos.length == 0) ? "未识别到" : ctrl.customData.inputPos[0] as string ~ "," ~ ctrl.customData.inputPos[1] as string ~ "," ~ ctrl.customData.inputPos[2] as string);
    info += "§a能源输入仓坐标：" ~ ((isNull(ctrl.customData.energyInputPos) || ctrl.customData.energyInputPos.length == 0) ? "未识别到" : ctrl.customData.energyInputPos[0] as string ~ "," ~ ctrl.customData.energyInputPos[1] as string ~ "," ~ ctrl.customData.energyInputPos[2] as string);
    info += "§a输出仓坐标：" ~ ((isNull(ctrl.customData.outputPos) || ctrl.customData.outputPos.length == 0) ? "未识别到" : ctrl.customData.outputPos[0] as string ~ "," ~ ctrl.customData.outputPos[1] as string ~ "," ~ ctrl.customData.outputPos[2] as string);
    event.extraInfo = info;
});

MMEvents.onStructureUpdate("arcane_melter", function(event as MachineStructureUpdateEvent) {
    val ctrl = event.controller;
    
    if (!ctrl.world.isRemote()) {
        var baseparallel = 16 as int;
        baseparallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:0>) * 4;
        baseparallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:1>) * 16;
        baseparallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:2>) * 64;
        baseparallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:3>) * 256;
        baseparallel += ctrl.getBlocksInPattern(<modularmachinery:blockparallelcontroller:4>) * 1024;
        ctrl.customData = ctrl.customData.update({baseParallel: baseparallel});

        var posStart = [ctrl.pos.x,ctrl.pos.y,ctrl.pos.z];
        var posEnd = [ctrl.pos.x,ctrl.pos.y,ctrl.pos.z];
        var input = [] as int[];
        var output = [] as int[];
        var energyInput = [] as int[];
        if (ctrl.facing == IFacing.west()) {
            posStart[0] = posStart[0] + 14;
            posStart[1] = posStart[1] + 10;
            posStart[2] = posStart[2] + 8;
            posEnd[0] = posEnd[0] - 1;
            posEnd[1] = posEnd[1] - 5;
            posEnd[2] = posEnd[2] - 7;
        }
        else if (ctrl.facing == IFacing.south()) {
            posStart[0] = posStart[0] + 8;
            posStart[1] = posStart[1] + 10;
            posStart[2] = posStart[2] + 1;
            posEnd[0] = posEnd[0] - 7;
            posEnd[1] = posEnd[1] - 5;
            posEnd[2] = posEnd[2] - 14;
        }
        else if (ctrl.facing == IFacing.north()) {
            posStart[0] = posStart[0] + 7;
            posStart[1] = posStart[1] + 10;
            posStart[2] = posStart[2] + 14;
            posEnd[0] = posEnd[0] - 8;
            posEnd[1] = posEnd[1] - 5;
            posEnd[2] = posEnd[2] - 1;
        }
        else if (ctrl.facing == IFacing.east()) {
            posStart[0] = posStart[0] + 1;
            posStart[1] = posStart[1] + 10;
            posStart[2] = posStart[2] + 7;
            posEnd[0] = posEnd[0] - 14;
            posEnd[1] = posEnd[1] - 5;
            posEnd[2] = posEnd[2] - 8;
        }
    
        var x = posStart[0];
        var y = posStart[1];
        var z = posStart[2];

        while ((x >= posEnd[0]) && ((input.length == 0) || (output.length == 0))) {
            while ((y >= posEnd[1]) && ((input.length == 0) || (output.length == 0))) {
                while ((z >= posEnd[2]) && ((input.length == 0) || (output.length == 0) || (energyInput.length == 0))) {
                    var block = ctrl.world.getBlock(x,y,z);
                    if ((block.definition.id has "modularmachinery:blockinputbus") || (block.definition.id == "modularmachinery:blockmeiteminputbus") || (block.definition.id == "modularmachinery:blockmepatternprovider")) {
                        input = [x,y,z];
                        ctrl.customData = ctrl.customData.deepUpdate({inputPos: input},{inputPos: OVERWRITE});
                    }
                    else if ((block.definition.id has "gugu-utils:aspecthatch") || (block.definition.id == "whimcraft:blockmeaspectoutputbus")) {
                        output = [x,y,z];
                        ctrl.customData = ctrl.customData.deepUpdate({outputPos: output},{outputPos: OVERWRITE});
                    }
                    else if (block.definition.id has "modularmachinery:blockenergyinputhatch") {
                        energyInput = [x,y,z];
                        ctrl.customData = ctrl.customData.deepUpdate({energyInputPos: energyInput},{energyInputPos: OVERWRITE});
                    }
                    z -= 1;
                }
                y -= 1;
                z = posStart[2];
            }
            x -= 1;
            y = posStart[1];
        }
    }
});

MMEvents.onMachinePreTick("arcane_melter", function(event as MachineTickEvent) {
    val ctrl = event.controller;

    if (!(ctrl.world.isRemote()) && !isNull(ctrl.customData.inputPos) && (ctrl.customData.inputPos.length != 0) && !isNull(ctrl.customData.outputPos) && (ctrl.customData.outputPos.length != 0) && (ctrl.world.getWorldTime() % 20 == 0)) {
        val input = ctrl.world.getItemHandler(IBlockPos.create(ctrl.customData.inputPos[0],ctrl.customData.inputPos[1],ctrl.customData.inputPos[2]));
        val energyInputPos = IBlockPos.create(ctrl.customData.energyInputPos[0],ctrl.customData.energyInputPos[1],ctrl.customData.energyInputPos[2]);
        val outputPos = IBlockPos.create(ctrl.customData.outputPos[0],ctrl.customData.outputPos[1],ctrl.customData.outputPos[2]);
        var data = ctrl.world.getBlock(outputPos).data;
        var parallel = isNull(ctrl.customData.baseParallel) ? 1 as int : ctrl.customData.baseParallel as int;
        var aspectsMap = {} as int[string];
        var keyMap = {} as int[string];
        var count = 0 as int;
        var needenergy = 0 as long;

        ctrl.customData = ctrl.customData.update({parallel: parallel});

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
            needenergy += (100 * amount) as long;
        }
        if (!isNull(ctrl.world.getBlock(energyInputPos).data.energy) && ctrl.world.getBlock(energyInputPos).data.energy.asLong() >= needenergy) {
            ctrl.world.setBlockState(ctrl.world.getBlockState(energyInputPos),ctrl.world.getBlock(energyInputPos).data.deepUpdate({energy: (ctrl.world.getBlock(energyInputPos).data.energy.asLong() - needenergy)}),energyInputPos);
            ctrl.world.setBlockState(ctrl.world.getBlockState(outputPos),data,outputPos);
        }
    }
});

RecipeBuilder.newBuilder("aspect","arcane_melter", 20)
    .addEnergyPerTickInput(100)
    .addItemInput(<minecraft:tnt>.withTag({ench: [{lvl: 1, id: 255}]})).setPreViewNBT({ench: [{lvl: 100, id: 3}], display: {Lore: ["§9所有放置于输入仓的物品都将被消耗"], Name: "§7示例输入"}})
    .addRecipeTooltip("§9物品输入仓(支持ME输入仓)，源质输出仓(同上)，能源输入仓均至少放置一个")
    .addRecipeTooltip("§9且会自动选取且仅选取各一个仓室进行输入输出")
    .addRecipeTooltip("§9优先选取坐标XYZ值更大者且优先级Z>Y>X")
    .addRecipeTooltip("§9每输出1点源质消耗100RF")
    .addRecipeTooltip("§9配方运行结束时若能源输入仓中RF不足则不输出源质")
    .addRecipeTooltip("§9自带16并行")
    .build();

/* 
RecipeAdapterBuilder.create("arcane_melter", "thaumcraft:whimcraft_smelter")
    .addEnergyPerTickInput(100)
    .build();
*/
/* {Aspects: [{amount: 0721,key: "ciallo~"}]} */