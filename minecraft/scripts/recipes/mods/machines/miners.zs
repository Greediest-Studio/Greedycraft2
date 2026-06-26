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
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.ctutils.utils.Math;
import mods.gctweaker.oreOutput;

import scripts.misc.miner_lib;
import scripts.misc.miner_lib.upgradeList;
import scripts.misc.miner_lib.getParallelism;
import scripts.misc.miner_lib.upgradeTooltip;

MachineModifier.setMaxParallelism("simple_miner", 1);
MachineModifier.setMaxThreads("simple_miner", 0);
MachineModifier.addCoreThread("simple_miner", FactoryRecipeThread.createCoreThread("简易采掘模块").addRecipe("simple_miner_main_1").addRecipe("simple_miner_main_2"));

MachineModifier.setMaxParallelism("basic_miner", 65536);
MachineModifier.setMaxThreads("basic_miner", 0);
MachineModifier.addCoreThread("basic_miner", FactoryRecipeThread.createCoreThread("基础采掘模块").addRecipe("basic_miner_main"));

MachineModifier.setMaxParallelism("advanced_miner", 65536);
MachineModifier.setMaxThreads("advanced_miner", 0);
MachineModifier.addCoreThread("advanced_miner", FactoryRecipeThread.createCoreThread("精密过滤采掘模块").addRecipe("advanced_miner_main"));

MachineModifier.setMaxParallelism("dimensional_miner", 65536);
MachineModifier.setMaxThreads("dimensional_miner", 0);
MachineModifier.addCoreThread("dimensional_miner", FactoryRecipeThread.createCoreThread("时空采掘模块").addRecipe("dimensional_miner_main"));

//饿啊
$expand RecipePrimer$addItemUpgradeOutput(item as IItemStack, upgrade as string, chance as float) as RecipePrimer {
    var tooltip as string = "";
    if (upgrade == BASIC) {
        tooltip = "§a无需采掘升级";
    } else if (upgrade == STAINLESS) {
        tooltip = "§a需求：不锈钢采掘升级";
    } else if (upgrade == DURASTEEL) {
        tooltip = "§a需求：耐钢采掘升级";
    } else if (upgrade == AEONSTEEL) {
        tooltip = "§a需求：恒钢采掘升级";
    } else if (upgrade == CHROMASTEEL) {
        tooltip = "§a需求：炫钢采掘升级";
    } else if (upgrade == COSMILITE) {
        tooltip = "§a需求：寰宇采掘升级";
    } else if (upgrade == FINALLIUM) {
        tooltip = "§a需求：终焉采掘升级";
    } else if (upgrade == WAVITE) {
        tooltip = "§a需求：波动采掘升级";
    }
    return this.addItemOutput(item).setChance(chance).addItemModifier(function(ctrl as IMachineController, item as IItemStack) as IItemStack {
        if (upgrade == BASIC || ctrl.hasMachineUpgrade(upgrade)) {
            return item;
        } else {
            return null;
        }
    }).setPreViewNBT({display:{Lore:[tooltip as string]}}).setIgnoreOutputCheck(true);
}

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
MMEvents.onControllerGUIRender("simple_miner", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///简易采掘机控制面板///",
        "§a机器名称：§eLV0 - 简易采掘机",
        "§a并行数：" ~ (isNull(event.controller.customData.bx) ? 1 : event.controller.customData.bx)
    ];
    if (event.controller.world.dimension != 0 && event.controller.world.dimension != -1) {
        info += "§a采掘维度：错误，简易采掘机仅可在主世界和下界采掘";
    } else {
        info += "§a采掘维度：" ~ oreOutput.getdimName(event.controller.world.dimension);
    }

    event.extraInfo = info;
});

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
RecipeBuilder.newBuilder("simple_miner_main_1","simple_miner",200)
    .addDimensionInput(0)
    .addEnergyPerTickInput(200)
    .addItemUpgradeOutput(<minecraft:iron_ore>, BASIC, 0.15)
    .addItemUpgradeOutput(<minecraft:gold_ore>, BASIC, 0.1)
    .addItemUpgradeOutput(<thermalfoundation:ore>, BASIC, 0.125)
    .addItemUpgradeOutput(<thermalfoundation:ore:1>, BASIC, 0.125)
    .addItemUpgradeOutput(<thermalfoundation:ore:2>, BASIC, 0.1)
    .addItemUpgradeOutput(<thermalfoundation:ore:3>, BASIC, 0.1)
    .addItemUpgradeOutput(<thermalfoundation:ore:4>, BASIC, 0.175)
    .addItemUpgradeOutput(<thermalfoundation:ore:5>, BASIC, 0.1)
    .addItemUpgradeOutput(<thermalfoundation:ore:6>, BASIC, 0.025)
    .addItemUpgradeOutput(<thermalfoundation:ore:7>, BASIC, 0.01)
    .addItemUpgradeOutput(<actuallyadditions:block_misc:3>, BASIC, 0.075)
    .addItemUpgradeOutput(<additions:chromium_ore>, BASIC, 0.025)
    .addItemUpgradeOutput(<mekanism:oreblock>, BASIC, 0.075)
    .addItemUpgradeOutput(<additions:zinc_ore>, BASIC, 0.1)
    .addItemUpgradeOutput(<divinerpg:rupee_ore>, BASIC, 0.05)
    .addItemUpgradeOutput(<divinerpg:realmite_ore>, BASIC, 0.05)
    .addItemUpgradeOutput(<divinerpg:arlemite_ore>, BASIC, 0.04)
    .addItemUpgradeOutput(<minecraft:coal>, BASIC, 0.2)
    .addItemUpgradeOutput(<thermalfoundation:material:893>, BASIC, 0.2)
    .addItemUpgradeOutput(<minecraft:redstone>, BASIC, 0.225)
    .addItemUpgradeOutput(<minecraft:dye:4>, BASIC, 0.175)
    .addItemUpgradeOutput(<minecraft:diamond>, BASIC, 0.04)
    .addItemUpgradeOutput(<minecraft:emerald>, BASIC, 0.015)
    .addItemUpgradeOutput(<astralsorcery:blockmarble>, STAINLESS, 0.15)
    .addItemUpgradeOutput(<netherex:basalt>, STAINLESS, 0.15)
    .addItemUpgradeOutput(<minecraft:obsidian>, STAINLESS, 0.1)
    .addItemUpgradeOutput(<astralsorcery:blockcustomore:1>, STAINLESS, 0.04)
    .addItemUpgradeOutput(<appliedenergistics2:material>, STAINLESS, 0.1)
    .addItemUpgradeOutput(<appliedenergistics2:material:1>, STAINLESS, 0.03)
    .addItemUpgradeOutput(<mysticalagriculture:crafting:5>, STAINLESS, 0.2)
    .addItemUpgradeOutput(<additions:experience_ingot>, STAINLESS, 0.2)
    .addItemUpgradeOutput(<mysticalagriculture:crafting>, STAINLESS, 0.2)
    .addItemUpgradeOutput(<thermalfoundation:material:772>, STAINLESS, 0.075)
    .addItemUpgradeOutput(<minecraft:flint>, STAINLESS, 0.1)
    .addItemUpgradeOutput(<minecraft:quartz>, STAINLESS, 0.1)
    .addItemUpgradeOutput(<astralsorcery:itemcraftingcomponent>, STAINLESS, 0.05)
    .addItemUpgradeOutput(<additions:manganese_ore>, DURASTEEL, 0.15)
    .addItemUpgradeOutput(<nuclearcraft:ore:7>, DURASTEEL, 0.125)
    .addItemUpgradeOutput(<additions:aqualite_ore>, DURASTEEL, 0.075)
    .addItemUpgradeOutput(<additions:aeroite_ore>, DURASTEEL, 0.1)
    .addItemUpgradeOutput(<thaumcraft:ore_cinnabar>, DURASTEEL, 0.15)
    .addItemUpgradeOutput(<abyssalcraft:abyore>, DURASTEEL, 0.075)
    .addItemUpgradeOutput(<journey:shadiumore>, DURASTEEL, 0.04)
    .addItemUpgradeOutput(<journey:luniumore>, DURASTEEL, 0.04)
    .addItemUpgradeOutput(<taiga:meteorite_block>, DURASTEEL, 0.03)
    .addItemUpgradeOutput(<taiga:meteoritecobble_block>, DURASTEEL, 0.05)
    .addItemUpgradeOutput(<tiths:ore_broken_bedrock>, DURASTEEL, 0.075)
    .setThreadName("简易采掘模块")
    .setParallelized(false)
    .build();
RecipeBuilder.newBuilder("simple_miner_main_2","simple_miner",200)
    .addDimensionInput(-1)
    .addEnergyPerTickInput(200)
    .addItemUpgradeOutput(<minecraft:soul_sand>, BASIC, 0.5)
    .addItemUpgradeOutput(<minecraft:magma>, BASIC, 0.15)
    .addItemUpgradeOutput(<minecraft:quartz>, BASIC, 0.3)
    .addItemUpgradeOutput(<betternether:cincinnasite>, BASIC, 0.3)
    .addItemUpgradeOutput(<netherex:rime_crystal>, BASIC, 0.2)
    .addItemUpgradeOutput(<minecraft:glowstone_dust>, BASIC, 0.3)
    .addItemUpgradeOutput(<thermalfoundation:material:894>, BASIC, 0.15)
    .addItemUpgradeOutput(<tconstruct:ore>, STAINLESS, 0.15)
    .addItemUpgradeOutput(<tconstruct:ore:1>, STAINLESS, 0.15)
    .addItemUpgradeOutput(<divinerpg:netherite_ore>, STAINLESS, 0.15)
    .addItemUpgradeOutput(<journey:hellstoneore>, STAINLESS, 0.1)
    .addItemUpgradeOutput(<netherendingores:ore_nether_modded_1:4>, STAINLESS, 0.05)
    .addItemUpgradeOutput(<rftools:dimensional_shard>, STAINLESS, 0.1)
    .addItemUpgradeOutput(<divinerpg:bloodgem>, STAINLESS, 0.09)
    .addItemUpgradeOutput(<additions:emberstone_ore>, DURASTEEL, 0.075)
    .addItemUpgradeOutput(<additions:netherite_scrap>, DURASTEEL, 0.005)
    .addItemUpgradeOutput(<journey:firestoneclump>, DURASTEEL, 0.075)
    .setThreadName("简易采掘模块")
    .setParallelized(false)
    .build();

RecipeBuilder.newBuilder("basic_miner_main","basic_miner",200)
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val bx = isNull(data.bx) ? 1 : data.bx;
        val thread = event.factoryRecipeThread;
        thread.addModifier("rf", RecipeModifierBuilder.create("modularmachinery:energy","input",bx,1,false).build());
    })
    .addEnergyPerTickInput(200)
    .addItemOutput(<minecraft:grass>)
    .addItemModifier(function(ctrl as IMachineController, item as IItemStack) as IItemStack {return null;})
    .setIgnoreOutputCheck(true)//别删
    .addDynamicOutput(function(ctrl as IMachineController) {
        val dim = ctrl.world.dimension;
        val bx = ctrl.customData.bx;
        var output = [] as IItemStack[];

        for u in upgradeList {
            val list = oreOutput.getOreOutputList(dim,u,bx,false) as IItemStack[];
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
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val bx = isNull(data.bx) ? 1 : data.bx;
        val thread = event.factoryRecipeThread;
        val dimList = isNull(data.dims) ? [] as int[] : data.dims as int[];
        thread.addModifier("rf", RecipeModifierBuilder.create("modularmachinery:energy","input",(bx * max(1,dimList.length)),1,false).build());
    })
    .addEnergyPerTickInput(200)
    .addItemOutput(<minecraft:grass>)
    .addItemModifier(function(ctrl as IMachineController, item as IItemStack) as IItemStack {return null;})
    .setIgnoreOutputCheck(true)//别删
    .addDynamicOutput(function(ctrl as IMachineController) {
        val data = ctrl.customData;
        val dimList = isNull(data.dims) ? [] as int[] : data.dims as int[];
        val bx = data.bx;
        var output = [] as IItemStack[];

        if (dimList.length != 0) {
            for dim in dimList {
                for u in upgradeList {
                    val list = oreOutput.getOreOutputList(dim,u,(bx / max(1,dimList.length)) as int,false) as IItemStack[];
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
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val bx = isNull(data.bx) ? 1 : data.bx;
        val thread = event.factoryRecipeThread;
        thread.addModifier("rf", RecipeModifierBuilder.create("modularmachinery:energy","input",bx,1,false).build());
    })
    .addEnergyPerTickInput(200)
    .addItemOutput(<minecraft:grass>)
    .addItemModifier(function(ctrl as IMachineController, item as IItemStack) as IItemStack {return null;})
    .setIgnoreOutputCheck(true)//别删
    .addDynamicOutput(function(ctrl as IMachineController) {
        val data = ctrl.customData;
        val dimList = isNull(data.dims) ? [] as int[] : data.dims as int[];
        val bx = data.bx;
        var output = [] as IItemStack[];

        if (dimList.length != 0) {
            for dim in dimList {
                if (ctrl.hasMachineUpgrade("miner_upg_multidim") || dim == ctrl.world.dimension) {
                    for u in upgradeList {
                        val list = oreOutput.getOreOutputList(dim,u,(bx / max(1,dimList.length)) as int,false) as IItemStack[];
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