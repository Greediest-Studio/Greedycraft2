/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50
#crafttweaker reloadable
#reloadable

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.RecipeTickEvent;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.RecipeCheckEvent;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("unitcell_builder", 1);
MachineModifier.setMaxParallelism("unitcell_builder", 256);
MachineModifier.setInternalParallelism("unitcell_builder", 1);

MachineModifier.addSmartInterfaceType("unitcell_builder", SmartInterfaceType.create("模式", 0.0f).setHeaderInfo("§e///运行模式设置///"));

MachineModifier.addCoreThread("unitcell_builder", FactoryRecipeThread.createCoreThread("星辰输入模块"));

MMEvents.onControllerGUIRender("unitcell_builder", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///晶胞重塑器控制面板///",
        "§a机器名称：§eLV3 - 晶胞重塑器"
    ];

    info += "§a尺寸参数：§e" ~ (event.controller.getSize() as string) ~ "§a，输出后为 §e0";
    info += "§a纯度参数：§e" ~ (event.controller.getPurity() as string) ~ "§a，输出后为 §e" ~ (((event.controller.getPurity() - 10000 < 0) ? 0 : (event.controller.getPurity() - 10000)) as string);
    info += "§a抛光参数：§e" ~ (event.controller.getCollective() as string) ~ "§a，输出后为 §e" ~ (((event.controller.getCollective() - 10000 < 0) ? 0 : (event.controller.getCollective() - 10000)) as string);
    val cc = (Math.log10(event.controller.getSize() as double == 0.0d ? 1.0d : event.controller.getSize() as double) * 100) as int;
    val cd = Math.sqrt(event.controller.getPurity() as double) as int > 100 ? 100 : Math.sqrt(event.controller.getPurity() as double) as int;
    val pg = Math.sqrt(event.controller.getCollective() as double) as int > 100 ? 100 : Math.sqrt(event.controller.getCollective() as double) as int;
    info += "§a输出水晶石数据：§e" ~ "§a尺寸：§e" ~ cc ~ "，§a纯度：§e" ~ cd ~ "，§a抛光：§e" ~ pg;

    event.extraInfo = info;
});

function addCFFusionRecipe(input as IIngredient, output as IItemStack, cost as int) {
    RecipeBuilder.newBuilder("cf_" + output.definition.id + output.metadata, "unitcell_builder", 10)
        .addItemInput(input)
        .addItemOutput(output)
        .addEnergyPerTickInput(cost / 10)
        .addSmartInterfaceDataInput("模式", 0)
        .addRecipeTooltip("§a运行模式：原子再构")
        .build();
}

$expand IMachineController$getCollective() as int {
    if (!isNull(this.customData.collective)) {
        return this.customData.collective as int;
    } else {
        return 0;
    }
}

$expand IMachineController$setCollective(num as int) {
    this.customData = this.customData.update({collective: num as int});
}

$expand IMachineController$addCollective(num as int) {
    this.setCollective(this.getCollective() + num);
}

$expand IMachineController$removeCollective(num as int) {
    this.setCollective(this.getCollective() - num);
}

$expand IMachineController$getPurity() as int {
    if (!isNull(this.customData.purity)) {
        return this.customData.purity as int;
    } else {
        return 0;
    }
}

$expand IMachineController$setPurity(num as int) {
    this.customData = this.customData.update({purity: num as int});
}

$expand IMachineController$addPurity(num as int) {
    this.setPurity(this.getPurity() + num);
}

$expand IMachineController$removePurity(num as int) {
    this.setPurity(this.getPurity() - num);
}

$expand IMachineController$getSize() as double {
    if (!isNull(this.customData.size)) {
        return this.customData.size as double;
    } else {
        return 0.0d;
    }
}

$expand IMachineController$setSize(num as double) {
    this.customData = this.customData.update({size: num as double});
}

$expand IMachineController$addSize(num as double) {
    this.setSize(this.getSize() + num);
}

$expand IMachineController$removeSize(num as double) {
    this.setSize(this.getSize() - num);
}

addCFFusionRecipe(<ore:blockRedstone>, <actuallyadditions:block_crystal>, 400);
addCFFusionRecipe(<ore:blockLapis>, <actuallyadditions:block_crystal:1>, 400);
addCFFusionRecipe(<ore:blockDiamond>, <actuallyadditions:block_crystal:2>, 600);
addCFFusionRecipe(<ore:blockEmerald>, <actuallyadditions:block_crystal:4>, 1000);
addCFFusionRecipe(<ore:blockCoal>, <actuallyadditions:block_crystal:3>, 600);
addCFFusionRecipe(<ore:blockIron>, <actuallyadditions:block_crystal:5>, 800);
addCFFusionRecipe(<ore:dustRedstone>, <actuallyadditions:item_crystal>, 40);
addCFFusionRecipe(<ore:gemLapis>, <actuallyadditions:item_crystal:1>, 40);
addCFFusionRecipe(<ore:gemDiamond>, <actuallyadditions:item_crystal:2>, 60);
addCFFusionRecipe(<ore:gemEmerald>, <actuallyadditions:item_crystal:4>, 100);
addCFFusionRecipe(<ore:gemCoal>, <actuallyadditions:item_crystal:3>, 60);
addCFFusionRecipe(<ore:ingotIron>, <actuallyadditions:item_crystal:5>, 80);
addCFFusionRecipe(<actuallyadditions:item_misc:18>, <actuallyadditions:item_color_lens>, 5000);
addCFFusionRecipe(<actuallyadditions:item_color_lens>, <actuallyadditions:item_explosion_lens>, 5000);
addCFFusionRecipe(<actuallyadditions:item_explosion_lens>, <actuallyadditions:item_damage_lens>, 5000);
addCFFusionRecipe(<actuallyadditions:item_damage_lens>, <actuallyadditions:item_misc:18>, 5000);
addCFFusionRecipe(<actuallyadditions:block_laser_relay>, <actuallyadditions:block_laser_relay_fluids>, 2000);
addCFFusionRecipe(<actuallyadditions:block_laser_relay_fluids>, <actuallyadditions:block_laser_relay_item>, 2000);
addCFFusionRecipe(<actuallyadditions:block_laser_relay_item>, <actuallyadditions:block_laser_relay>, 2000);
addCFFusionRecipe(<ore:sand>, <minecraft:soul_sand>, 20000);
addCFFusionRecipe(<ore:rottenFlesh>, <minecraft:leather>, 8000);
addCFFusionRecipe(<minecraft:red_mushroom>, <minecraft:nether_wart>, 150000);
addCFFusionRecipe(<ore:gemQuartz>, <minecraft:prismarine_shard>, 30000);
addCFFusionRecipe(<ore:seedCanola>, <actuallyadditions:item_misc:23>, 2000);
addCFFusionRecipe(<minecraft:quartz_block>, <actuallyadditions:block_testifi_bucks_white_wall>, 10);
addCFFusionRecipe(<minecraft:quartz_block:1>, <actuallyadditions:block_testifi_bucks_green_wall>, 10);
addCFFusionRecipe(<ore:gemRedstone>, <thermalfoundation:material:893>, 4000);
addCFFusionRecipe(<ore:dustGlowstone>, <thermalfoundation:material:894>, 1500);
addCFFusionRecipe(<ore:enderpearl>, <thermalfoundation:material:895>, 2000);
addCFFusionRecipe(<ore:gemCertusQuartz>, <appliedenergistics2:material:1>, 1500);
addCFFusionRecipe(<ore:gemTofu>, <tofucraft:material:25>, 2500);
addCFFusionRecipe(<ore:nuggetPrimordial>, <thaumicwonders:primordial_grain>, 12000);
addCFFusionRecipe(<moretcon:oregravitoniumdense>, <moretcon:oregravitonium> * 4, 2000);

RecipeBuilder.newBuilder("cp_chaotic", "unitcell_builder", 400)
    .addItemInput(<ore:gemChaoticCocrystal>).setChance(0.0f)
    .addItemInput(<ore:ingotEverite> * 4)
    .addItemInput(<ore:gemTerrestrial> * 4)
    .addItemInput(<actuallyadditions:block_crystal_empowered:4> * 2)
    .addItemOutput(<draconicevolution:chaos_shard:2> * 2)
    .addItemOutput(<draconicevolution:chaos_shard:2>).setChance(0.5f)
    .addItemOutput(<draconicevolution:chaos_shard:2>).setChance(0.5f)
    .addItemOutput(<draconicevolution:chaos_shard:2>).setChance(0.5f)
    .addItemOutput(<draconicevolution:chaos_shard:2>).setChance(0.5f)
    .addSmartInterfaceDataInput("模式", 1)
    .addRecipeTooltip("§a运行模式：共晶复制")
    .addEnergyPerTickInput(12800)
    .build();
    
RecipeBuilder.newBuilder("cp_stormy", "unitcell_builder", 400)
    .addItemInput(<ore:gemStormyCocrystal>).setChance(0.0f)
    .addItemInput(<ore:ingotEverite> * 4)
    .addItemInput(<ore:gemTerrestrial> * 4)
    .addItemInput(<actuallyadditions:block_crystal_empowered:4> * 2)
    .addItemOutput(<gct_ores:stormy_fragment_small> * 2)
    .addItemOutput(<gct_ores:stormy_fragment_small>).setChance(0.5f)
    .addItemOutput(<gct_ores:stormy_fragment_small>).setChance(0.5f)
    .addItemOutput(<gct_ores:stormy_fragment_small>).setChance(0.5f)
    .addItemOutput(<gct_ores:stormy_fragment_small>).setChance(0.5f)
    .addSmartInterfaceDataInput("模式", 1)
    .addRecipeTooltip("§a运行模式：共晶复制")
    .addEnergyPerTickInput(12800)
    .build();
    
RecipeBuilder.newBuilder("as_crystal", "unitcell_builder", 1200)
    .addItemInput(<ore:dustAstralMetal>)
    .addEnergyPerTickInput(6400)
    .setParallelized(false)
    .setMaxThreads(1)
    .addItemOutput(<astralsorcery:itemcelestialcrystal>)
        .setPreViewNBT({astralsorcery: {crystalProperties: {sizeOverride: -1}}})
        .addItemModifier(function(controller as IMachineController, stack as IItemStack) {
            var realCollective as int = Math.sqrt(controller.getCollective() as double) as int;
            var realPurity as int = Math.sqrt(controller.getPurity() as double) as int;
            var realSize as int = (Math.log10(controller.getSize() as double == 0.0d ? 1.0d : controller.getSize() as double) * 100) as int;
            var data as IData = {astralsorcery: {crystalProperties: {
                collectiveCapability: (realCollective > 100) ? 100 : realCollective as int,
                size : realSize as int,
                purity : (realPurity > 100) ? 100 : realPurity as int,
                sizeOverride: -1
            }}};
            return <astralsorcery:itemcelestialcrystal>.withTag(data);
        })
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        var controller as IMachineController = event.controller;
        if (controller.getCollective() > 10000) {
            controller.removeCollective(10000);
        } else {
            controller.setCollective(0);
        }
        if (controller.getPurity() > 10000) {
            controller.removePurity(10000);
        } else {
            controller.setPurity(0);
        }
        controller.setSize(0);
    })
    .addSmartInterfaceDataInput("模式", 2)
    .addRecipeTooltip(
        "§a运行模式：星辰重塑",
        "§a向机器中输入对应物品以提升水晶石参数：",
        "§e尺寸：§c100×log₁₀<尺寸参数>",
        "§e纯度：§c<纯度参数>⁰˙⁵%§e（最大100%）",
        "§e抛光：§c<抛光参数>⁰˙⁵%§e（最大100%）"
    )
    .build();

val sizeItems as double[IIngredient] = {
    <ore:gemAquamarine> : 1.5E2,
    <ore:ingotAstralStarmetal> : 8.0E2,
    <ore:gemAquamarineStarlight> : 5.0E3,
    <ore:ingotAstralMetal> : 2.0E8,
    <ore:ingotNasalum> : 1.0E8,
    <ore:gemHoshine> : 3.0E10,
    <ore:ingotZodiacite> : 5.0E15,
    <ore:ingotArimite> : 1.0E15
};

val sizeMax as double[IIngredient] = {
    <ore:gemAquamarine> : 1.0E3,
    <ore:ingotAstralStarmetal> : 1.0E4,
    <ore:gemAquamarineStarlight> : 1.0E5,
    <ore:ingotAstralMetal> : 1.0E9,
    <ore:ingotNasalum> : 1.0E10,
    <ore:gemHoshine> : 1.0E12,
    <ore:ingotZodiacite> : 1.0E16,
    <ore:ingotArimite> : 1.0E16
};

for item in sizeItems {
    if (item.items.length > 0) {
        RecipeBuilder.newBuilder("as_z_size_" + item.items[0].definition.id + item.items[0].metadata, "unitcell_builder", 1)
            .addItemInput(item)
            .addPreCheckHandler(function(event as RecipeCheckEvent) {
                var controller as IMachineController = event.controller;
                if (controller.getSize() >= sizeMax[item] as double) {
                    event.setFailed("§e当前材料无法继续添加尺寸参数");
                }
            })
            .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
                var controller as IMachineController = event.controller;
                if (controller.getSize() + sizeItems[item] as double > sizeMax[item] as double) {
                    controller.setSize(sizeMax[item] as double);
                } else {
                    controller.addSize(sizeItems[item] as double);
                }
            })
            .setThreadName("星辰输入模块")
            .addRecipeTooltip("增加" + sizeItems[item] + "点尺寸参数，上限为" + sizeMax[item] + "点")
            .setParallelized(false)
            .build();
    }
}

RecipeBuilder.newBuilder("as_z_purity", "unitcell_builder", 1)
    .addItemInput(<ore:sand>)
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        var controller as IMachineController = event.controller;
        var parallelism as int = event.activeRecipe.parallelism;
        controller.addPurity(parallelism * 10);
    })
    .setThreadName("星辰输入模块")
    .addRecipeTooltip("增加10点纯度参数")
    .build();

RecipeBuilder.newBuilder("as_z_collective", "unitcell_builder", 1)
    .addItemInput(<ore:itemClay>)
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        var controller as IMachineController = event.controller;
        var parallelism as int = event.activeRecipe.parallelism;
        controller.addCollective(parallelism * 10);
    })
    .setThreadName("星辰输入模块")
    .addRecipeTooltip("增加10点抛光参数")
    .build();