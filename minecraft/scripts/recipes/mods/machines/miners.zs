/*
I'm gonna give you everything ~
ideal world's theory ~
over that end of the world ~
最高の愛の中で ~
I'm gonna give you everything ~
ideal world's theory ~
over that end of the world ~
change my word, further away ~
*/

#priority 30
#norun

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineUpgradeBuilder;
import mods.modularmachinery.MachineUpgradeHelper;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeModifier;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.MachineStructureUpdateEvent;
import mods.ctutils.utils.Math;
import mods.gctweaker.oreOutput;

import scripts.misc.miner_lib;
import scripts.misc.miner_lib.upgradeList;
import scripts.misc.miner_lib.getParallelism;
import scripts.misc.miner_lib.upgradeTooltip;

MachineModifier.setMaxParallelism("basic_miner", 65536);
MachineModifier.setMaxThreads("basic_miner", 0);
MachineModifier.addCoreThread("basic_miner", FactoryRecipeThread.createCoreThread("基础采掘模块").addRecipe("basic_miner_main"));

MachineModifier.setMaxParallelism("advanced_miner", 65536);
MachineModifier.setMaxThreads("advanced_miner", 0);
MachineModifier.addCoreThread("advanced_miner", FactoryRecipeThread.createCoreThread("精密过滤采掘模块").addRecipe("advanced_miner_main"));

MachineModifier.setMaxParallelism("dimensional_miner", 65536);
MachineModifier.setMaxThreads("dimensional_miner", 0);
MachineModifier.addCoreThread("dimensional_miner", FactoryRecipeThread.createCoreThread("时空采掘模块").addRecipe("dimensional_miner_main"));

//结构更新
MMEvents.onStructureUpdate("basic_miner", function(event as MachineStructureUpdateEvent) {
    val ctrl as IMachineController = event.controller;
    val bx = getParallelism(ctrl) as int;
    ctrl.customData = {bx: bx};
});

MMEvents.onStructureUpdate("advanced_miner", function(event as MachineStructureUpdateEvent) {
    val ctrl as IMachineController = event.controller;
    val bx = getParallelism(ctrl) as int;
    var list = isNull(ctrl.customData.dims) ? [] as int [] : ctrl.customData.dims as int [];

    if (!(list has ctrl.world.dimension)) {
        list += ctrl.world.dimension;
    }

    if (!(list has 0) && ctrl.hasMachineUpgrade("miner_upg_dimoverworld")) {
        list += 0;
    } else
    if (ctrl.world.dimension != 0 && list has 0 && !ctrl.hasMachineUpgrade("miner_upg_dimoverworld")) {
        val l = list;
        list = [] as int[];
        for d in l {
            if (d != 0) {
                list += d;
            }
        }
    }

    if (!(list has 1) && ctrl.hasMachineUpgrade("miner_upg_dimend")) {
        list += 1;
    } else
    if (ctrl.world.dimension != 1 && list has 1 && !ctrl.hasMachineUpgrade("miner_upg_dimend")) {
        val l = list;
        list = [] as int[];
        for d in l {
            if (d != 1) {
                list += d;
            }
        }
    }

    if (!(list has -1) && ctrl.hasMachineUpgrade("miner_upg_dimnether")) {
        list += -1;
    } else
    if (ctrl.world.dimension != -1 && list has -1 && !ctrl.hasMachineUpgrade("miner_upg_dimnether")) {
        val l = list;
        list = [] as int[];
        for d in l {
            if (d != -1) {
                list += d;
            }
        }
    }

    ctrl.customData = {bx: bx,dims: list};
});

MMEvents.onStructureUpdate("dimensional_miner", function(event as MachineStructureUpdateEvent) {
    val ctrl as IMachineController = event.controller;
    val bx = getParallelism(ctrl) as int;
    val sk = ctrl.hasMachineUpgrade("miner_upg_multidim") ? 1 : 0;
    if (isNull(ctrl.customData.dims)) {
        ctrl.customData = {bx: bx,dims:[],sk: sk};
    } else {
        ctrl.customData = {bx: bx,dims: ctrl.customData.dims,sk: sk};
    }
});

//GUI
MMEvents.onControllerGUIRender("basic_miner", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///基础采掘机控制面板///",
        "§a机器名称：§eLV1 - 基础采掘机",
        "§a并行数：" ~ (isNull(event.controller.customData.bx) ? 1 : event.controller.customData.bx),
        "§a采掘维度：" ~ oreOutput.getdimName(event.controller.world.dimension)
    ];
    event.extraInfo = info;
});

MMEvents.onControllerGUIRender("advanced_miner", function(event as ControllerGUIRenderEvent) {
    var dim = "§a采掘维度：";
    var info as string[] = [
        "§a///精密过滤采掘机控制面板///",
        "§a机器名称：§eLV3 - 精密过滤采掘机",
        "§a并行数：" ~ (isNull(event.controller.customData.bx) ? 1 : event.controller.customData.bx)
    ];

    if (isNull(event.controller.customData.dims)) {
        dim = "§a采掘维度：无";
    } else {
        val dimList = event.controller.customData.dims as int[];
        for d in dimList {
            dim = dim ~ oreOutput.getdimName(d) ~ " ";
        }
    }

    info += dim;
    event.extraInfo = info;
});

MMEvents.onControllerGUIRender("dimensional_miner", function(event as ControllerGUIRenderEvent) {
    var dim = "§a采掘维度：";
    var info as string[] = [
        "§a///时空相位采掘机控制面板///",
        "§a机器名称：§eLV5 - 时空相位采掘机",
        "§a并行数：" ~ (isNull(event.controller.customData.bx) ? 1 : event.controller.customData.bx)
    ];
    var sk =  (isNull(event.controller.customData.sk) || event.controller.customData.sk == 0) ? "§c未安装时空升级" : "§a已安装时空升级";
    if (isNull(event.controller.customData.dims)) {
        dim = "§a采掘维度：无";
    } else {
        val dimList = event.controller.customData.dims as int[];
        for d in dimList {
            dim = dim ~ oreOutput.getdimName(d) ~ " ";
        }
    }
    
    info += sk;
    info += dim;
    event.extraInfo = info;
});

//配方
RecipeBuilder.newBuilder("basic_miner_main","basic_miner",200)
    .addEnergyPerTickInput(200)
    .addItemOutput(<minecraft:grass>)
    .addItemModifier(function(ctrl as IMachineController, item as IItemStack) as IItemStack {return null;})
    .setIgnoreOutputCheck(true)//别删
    .addDynamicOutput(function(ctrl as IMachineController) {
        val dim = ctrl.world.dimension;
        val bx = ctrl.customData.bx;
        var output = [] as IItemStack[];

        for u in upgradeList {
            val list = oreOutput.getOreOutputList(dim,u,bx) as IItemStack[];
            if (list.length != 0 && (u == BASIC || ctrl.hasMachineUpgrade(u))) {
                for i in list {
                    output += i;
                }
            }
        }

        return output;
    }).setIgnoreOutputCheck(true)
    .setThreadName("基础采掘模块")
    .setParallelized(false)
    .setLoadJEI(false)
    .build();

RecipeBuilder.newBuilder("advanced_miner_main","advanced_miner",200)
    .addEnergyPerTickInput(200)
    .addItemOutput(<minecraft:grass>)
    .addItemModifier(function(ctrl as IMachineController, item as IItemStack) as IItemStack {return null;})
    .setIgnoreOutputCheck(true)//别删
    .addDynamicOutput(function(ctrl as IMachineController) {
        val dimList = isNull(ctrl.customData.dims) ? [] as int[] : ctrl.customData.dims as int[];
        val bx = ctrl.customData.bx;
        var output = [] as IItemStack[];

        if (dimList.length != 0) {
            for dim in dimList {
                for u in upgradeList {
                    val list = oreOutput.getOreOutputList(dim,u,(bx / dimList.length) as int) as IItemStack[];
                    if (list.length != 0 && (u == BASIC || ctrl.hasMachineUpgrade(u))) {
                        for i in list {
                            output += i;
                        }
                    }
                }
            }
        }

        return output;
    }).setIgnoreOutputCheck(true)
    .setThreadName("精密过滤采掘模块")
    .setParallelized(false)
    .setLoadJEI(false)
    .build();

RecipeBuilder.newBuilder("dimensional_miner_main","dimensional_miner",200)
    .addEnergyPerTickInput(200)
    .addItemOutput(<minecraft:grass>)
    .addItemModifier(function(ctrl as IMachineController, item as IItemStack) as IItemStack {return null;})
    .setIgnoreOutputCheck(true)//别删
    .addDynamicOutput(function(ctrl as IMachineController) {
        val dimList = isNull(ctrl.customData.dims) ? [] as int[] : ctrl.customData.dims as int[];
        val bx = ctrl.customData.bx;
        var output = [] as IItemStack[];

        if (dimList.length != 0) {
            for dim in dimList {
                if (ctrl.hasMachineUpgrade("miner_upg_multidim") || dim == ctrl.world.dimension) {
                    for u in upgradeList {
                        val list = oreOutput.getOreOutputList(dim,u,(bx / dimList.length) as int) as IItemStack[];
                        if (list.length != 0 && (u == BASIC || ctrl.hasMachineUpgrade(u))) {
                            for i in list {
                                output += i;
                            }
                        }
                    }
                }
            }
        }

        return output;
    }).setIgnoreOutputCheck(true)
    .setThreadName("时空采掘模块")
    .setParallelized(false)
    .setLoadJEI(false)
    .build();

//JEI配方
val miners = ["basic_miner","advanced_miner","dimensional_miner"];
for dimId, dimName in oreOutput.getDimList() {
    for m in miners {
        val r = RecipeBuilder.newBuilder(m ~ dimId,m,200)
            .addEnergyPerTickInput(200)
            .addDimensionInput(dimId)
            .addRecipeTooltip("§d以上矿石产自§a" ~ dimName ~ "§d(§aId: " ~ dimId ~ "§d)")
            .addRecipeTooltip("§d高级矿石产出需要§a模块化升级组件§d，具体请查询§a模块化电容§d")
            .setThreadName("114514");
        if (m == "advanced_miner" && (dimId == -1 || dimId == 0 || dimId == 1)) {
            if (dimId == -1) {
                r.addRecipeTooltip("§d即使矿机不在该维度，若已安装§a模块化电容-维度链接[下界]§d也可采掘该维度");
            } 
            else if (dimId == 0) {
                r.addRecipeTooltip("§d即使矿机不在该维度，若已安装§a模块化电容-维度链接[主世界]§d也可采掘该维度");
            } 
            else if (dimId == 1) {
                r.addRecipeTooltip("§d即使矿机不在该维度，若已安装§a模块化电容-维度链接[末地]§d也可采掘该维度");
            }
        }
        if (m == "dimensional_miner") {
            r.addRecipeTooltip("§d需使用§a维度放大镜§d来§a标记§d/§a解绑§d维度");
            r.addRecipeTooltip("§d仅在安装§a时空采掘升级§d时可跨维度采掘");
        }
        for upgrade in oreOutput.getUpgradeList(dimId) {
            val list = oreOutput.getoreList(dimId,upgrade);
            if (list.length != 0) {
                for o in list {
                    var tooltip = upgradeTooltip(o);
                    r.addItemOutput(o.ore * o.amount).setChance(o.chance).setPreViewNBT({display:{Lore:[tooltip,"§3请注意输出仓大小，超出容量的部分将被§d全部销毁"]}});
                }
            }
        }
        r.build();
    }
}