/*
 * This script is created for the GreedyCraft Tweaks by 孤梦梦.
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
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.FactoryRecipeEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import crafttweaker.world.IFacing;

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

MachineModifier.setMaxThreads("mana_liquefactor", 1);
MachineModifier.setInternalParallelism("mana_liquefactor", 1); 
MachineModifier.setMaxParallelism("mana_liquefactor", 1);

MachineModifier.setMaxThreads("mana_powereducer", 1);
MachineModifier.setInternalParallelism("mana_powereducer", 1); 
MachineModifier.setMaxParallelism("mana_powereducer", 1);

MMEvents.onControllerGUIRender("mana_liquefactor", function(event as ControllerGUIRenderEvent) {
    val info as string[] = [
        "§a///魔力液化机控制面板///",
        "§a机器名称：§eLV2 - 魔力液化机"
    ];
    event.extraInfo = info;
});

MMEvents.onControllerGUIRender("mana_powereducer", function(event as ControllerGUIRenderEvent) {
    val info as string[] = [
        "§a///魔力释能机控制面板///",
        "§a机器名称：§eLV2 - 魔力释能机"
    ];
    event.extraInfo = info;
});

RecipeBuilder.newBuilder("mana_reduction1", "mana_powereducer", 1, 5).addFluidInput(<liquid:mana>*1).addManaOutput(1000).setParallelized(false).build();
RecipeBuilder.newBuilder("mana_reduction2", "mana_powereducer", 1, 4).addFluidInput(<liquid:mana>*10).addManaOutput(10000).setParallelized(false).build();
RecipeBuilder.newBuilder("mana_reduction3", "mana_powereducer", 1, 3).addFluidInput(<liquid:mana>*100).addManaOutput(100000).setParallelized(false).build();
RecipeBuilder.newBuilder("mana_reduction4", "mana_powereducer", 1, 2).addFluidInput(<liquid:mana>*1000).addManaOutput(1000000).setParallelized(false).build();
RecipeBuilder.newBuilder("mana_reduction5", "mana_powereducer", 1, 1).addFluidInput(<liquid:mana>*10000).addManaOutput(10000000).setParallelized(false).build();
RecipeBuilder.newBuilder("mana_reduction6", "mana_powereducer", 1, 0).addFluidInput(<liquid:mana>*100000).addManaOutput(100000000).setParallelized(false).build();

MMEvents.onStructureUpdate("mana_liquefactor", function(event as MachineStructureUpdateEvent) {
    val ctrl = event.controller;
    var data = ctrl.customData;
    var posStart = [(ctrl.pos.x + 3),(ctrl.pos.y + 3),(ctrl.pos.z + 3)];
    var posEnd = [(ctrl.pos.x - 3),(ctrl.pos.y + 2),(ctrl.pos.z - 3)];
    var x = posStart[0];
    var y = posStart[1];
    var z = posStart[2];
    if (!isNull(data.inputPos)) {
        data = data.deepUpdate({inputPos: data.inputPos},REMOVE);
    }
    if (!isNull(data.outputPos)) {
        data = data.deepUpdate({outputPos: data.outputPos},REMOVE);
    }
    while (x >= posEnd[0]) {
        while (y >= posEnd[1]) {
            while (z >= posEnd[2]) {
                val block = ctrl.world.getBlock(x,y,z);
                if (block.definition.id == "gugu-utils:sparkmanahatch" && block.meta == 0) {
                    var input = [x,y,z] as int[];
                    data = data.deepUpdate({inputPos: [input]},APPEND);
                }
                else if (block.definition.id has "modularmachinery:blockfluidoutputhatch") {
                    var output = [x,y,z] as int[];
                    data = data.deepUpdate({outputPos: [output]},APPEND);
                }
                z = z - 1;
            }
            y = y - 1;
            z = posStart[2];
        }
        x = x - 1;
        y = posStart[1];
    }
    ctrl.customData = data;
});

MMEvents.onMachinePreTick("mana_liquefactor", function(event as MachineTickEvent) {
    val ctrl = event.controller;
    var inputPosList = [] as IBlockPos[];
    var inputData = [] as IData[];
    var mana = 0 as int;
    //var size = [100,4000,16000,64000,204800,1310720,41943040,2147483647] as int[];
    var parallel = 0 as int;
    var manaData = {parallel: 0} as IData;

    if (!(ctrl.world.isRemote()) && !isNull(ctrl.customData.inputPos) && (ctrl.customData.inputPos.length != 0)) {
        var x = 0;
        while (x <= (ctrl.customData.inputPos.length - 1)) {
            inputPosList = inputPosList + IBlockPos.create(ctrl.customData.inputPos[x][0],ctrl.customData.inputPos[x][1],ctrl.customData.inputPos[x][2]);
            x += 1;
        }
        x = 0;
        for pos in inputPosList {
            inputData = inputData + ctrl.world.getBlock(pos).data;
        }
        for data in inputData {
            mana = mana + data.mana.asInt();
        }
        if (mana < 1000) {
            ctrl.customData = ctrl.customData.deepUpdate({parallel: (parallel + (isNull(ctrl.customData.parallel) ? 0 : ctrl.customData.parallel))},{parallel: OVERWRITE});
        }
        else if (mana >= 100000000) {
            parallel = 100000000;
            ctrl.customData = ctrl.customData.deepUpdate({parallel: (parallel + (isNull(ctrl.customData.parallel) ? 0 : ctrl.customData.parallel))},{parallel: OVERWRITE});
            for i, data in inputData {
                if (parallel >= data.mana.asInt()) {
                    ctrl.world.setBlockState(ctrl.world.getBlockState(inputPosList[i]),data.deepUpdate({mana: 0},OVERWRITE),inputPosList[i]);
                    parallel -= data.mana.asInt();
                }
                else {
                    ctrl.world.setBlockState(ctrl.world.getBlockState(inputPosList[i]), data.deepUpdate({mana: (data.mana.asInt() - parallel)}, OVERWRITE), inputPosList[i]);
                    break;
                }
            }
        }
        else if (mana >= 10000000) {
            parallel = 10000000;
            ctrl.customData = ctrl.customData.deepUpdate({parallel: (parallel + (isNull(ctrl.customData.parallel) ? 0 : ctrl.customData.parallel))},{parallel: OVERWRITE});
            for i, data in inputData {
                if (parallel >= data.mana.asInt()) {
                    ctrl.world.setBlockState(ctrl.world.getBlockState(inputPosList[i]),data.deepUpdate({mana: 0},OVERWRITE),inputPosList[i]);
                    parallel -= data.mana.asInt();
                }
                else {
                    ctrl.world.setBlockState(ctrl.world.getBlockState(inputPosList[i]), data.deepUpdate({mana: (data.mana.asInt() - parallel)}, OVERWRITE), inputPosList[i]);
                    break;
                }
            }
        }
        else if (mana >= 1000000) {
            parallel = 1000000;
            ctrl.customData = ctrl.customData.deepUpdate({parallel: (parallel + (isNull(ctrl.customData.parallel) ? 0 : ctrl.customData.parallel))},{parallel: OVERWRITE});
            for i, data in inputData {
                if (parallel >= data.mana.asInt()) {
                    ctrl.world.setBlockState(ctrl.world.getBlockState(inputPosList[i]),data.deepUpdate({mana: 0},OVERWRITE),inputPosList[i]);
                    parallel -= data.mana.asInt();
                }
                else {
                    ctrl.world.setBlockState(ctrl.world.getBlockState(inputPosList[i]), data.deepUpdate({mana: (data.mana.asInt() - parallel)}, OVERWRITE), inputPosList[i]);
                    break;
                }
            }
        }
        else if (mana >= 100000) {
            parallel = 100000;
            ctrl.customData = ctrl.customData.deepUpdate({parallel: (parallel + (isNull(ctrl.customData.parallel) ? 0 : ctrl.customData.parallel))},{parallel: OVERWRITE});
            for i, data in inputData {
                if (parallel >= data.mana.asInt()) {
                    ctrl.world.setBlockState(ctrl.world.getBlockState(inputPosList[i]),data.deepUpdate({mana: 0},OVERWRITE),inputPosList[i]);
                    parallel -= data.mana.asInt();
                }
                else {
                    ctrl.world.setBlockState(ctrl.world.getBlockState(inputPosList[i]), data.deepUpdate({mana: (data.mana.asInt() - parallel)}, OVERWRITE), inputPosList[i]);
                    break;
                }
            }
        }
        else if (mana >= 10000) {
            parallel = 10000;
            ctrl.customData = ctrl.customData.deepUpdate({parallel: (parallel + (isNull(ctrl.customData.parallel) ? 0 : ctrl.customData.parallel))},{parallel: OVERWRITE});
            for i, data in inputData {
                if (parallel >= data.mana.asInt()) {
                    ctrl.world.setBlockState(ctrl.world.getBlockState(inputPosList[i]),data.deepUpdate({mana: 0},OVERWRITE),inputPosList[i]);
                    parallel -= data.mana.asInt();
                }
                else {
                    ctrl.world.setBlockState(ctrl.world.getBlockState(inputPosList[i]), data.deepUpdate({mana: (data.mana.asInt() - parallel)}, OVERWRITE), inputPosList[i]);
                    break;
                }
            }
        }
        else if (mana >= 1000) {
            parallel = 1000;
            ctrl.customData = ctrl.customData.deepUpdate({parallel: (parallel + (isNull(ctrl.customData.parallel) ? 0 : ctrl.customData.parallel))},{parallel: OVERWRITE});
            for i, data in inputData {
                if (parallel >= data.mana.asInt()) {
                    ctrl.world.setBlockState(ctrl.world.getBlockState(inputPosList[i]),data.deepUpdate({mana: 0},OVERWRITE),inputPosList[i]);
                    parallel -= data.mana.asInt();
                }
                else {
                    ctrl.world.setBlockState(ctrl.world.getBlockState(inputPosList[i]), data.deepUpdate({mana: (data.mana.asInt() - parallel)}, OVERWRITE), inputPosList[i]);
                    break;
                }
            }
        }
    }
});

RecipeBuilder.newBuilder("mana","mana_liquefactor", 1)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        if (isNull(event.controller.customData.parallel) || event.controller.customData.parallel == 0 || event.controller.customData.parallel < 1000) {
            event.setFailed("§9缺少魔力输入");
        }
    })
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        val thread = event.factoryRecipeThread;
        val ctrl = event.controller;
        val data = ctrl.customData;
        var parallel = 0;
        if (data.parallel.asInt() >= 100000000) {parallel = 100000;}
        else if (data.parallel.asInt() >= 10000000) {parallel = 10000;}
        else if (data.parallel.asInt() >= 1000000) {parallel = 1000;}
        else if (data.parallel.asInt() >= 100000) {parallel = 100;}
        else if (data.parallel.asInt() >= 10000) {parallel = 10;}
        else if (data.parallel.asInt() >= 1000) {parallel = 1;}
        thread.addPermanentModifier("mana", RecipeModifierBuilder.create("modularmachinery:fluid","output",(parallel - 1),0,false).build());
    })
    .addFluidOutput(<liquid:mana>*1)
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val ctrl = event.controller;
        if (ctrl.customData.parallel.asInt() >= 100000000) {ctrl.customData = ctrl.customData.deepUpdate({parallel: (ctrl.customData.parallel.asInt() - 100000000)},OVERWRITE);}
        else if (ctrl.customData.parallel.asInt() >= 10000000) {ctrl.customData = ctrl.customData.deepUpdate({parallel: (ctrl.customData.parallel.asInt() - 10000000)},OVERWRITE);}
        else if (ctrl.customData.parallel.asInt() >= 1000000) {ctrl.customData = ctrl.customData.deepUpdate({parallel: (ctrl.customData.parallel.asInt() - 1000000)},OVERWRITE);}
        else if (ctrl.customData.parallel.asInt() >= 100000) {ctrl.customData = ctrl.customData.deepUpdate({parallel: (ctrl.customData.parallel.asInt() - 100000)},OVERWRITE);}
        else if (ctrl.customData.parallel.asInt() >= 10000) {ctrl.customData = ctrl.customData.deepUpdate({parallel: (ctrl.customData.parallel.asInt() - 10000)},OVERWRITE);}
        else if (ctrl.customData.parallel.asInt() >= 1000) {ctrl.customData = ctrl.customData.deepUpdate({parallel: (ctrl.customData.parallel.asInt() - 1000)},OVERWRITE);}
    })
    .addRecipeTooltip("§9每tick运行一次配方，无视并行")
    .addRecipeTooltip("§9转换比率(Mana:元始魔力)：1000:1")
    .addRecipeTooltip("§9最大产出(mB/tick)：100000")
    .addRecipeTooltip("§9单次产出一定为10的整数次方mB")
    //.addRecipeTooltip("§9输出仓容量不足不会停止消耗Mana")
    .setParallelized(false)
    .build();