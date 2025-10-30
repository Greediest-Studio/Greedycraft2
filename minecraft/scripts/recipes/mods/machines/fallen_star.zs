/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.game.IGame;
import crafttweaker.block.IBlock;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;


import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.RecipeFinishEvent;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.IMachineController;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("fallen_star", 0);
MachineModifier.setInternalParallelism("fallen_star", 1);
MachineModifier.setMaxParallelism("fallen_star", 1);
MachineModifier.addCoreThread("fallen_star", FactoryRecipeThread.createCoreThread("坠星执行模块"));
MachineModifier.addCoreThread("fallen_star", FactoryRecipeThread.createCoreThread("坠星采集模块").addRecipe("meteor_mine"));


$expand IMachineController$ getHarvestLevel() as int {
    if (!isNull(this.customData.harvestLevel)) {
        return this.customData.harvestLevel as int;
    } else {
        return -1;
    }
}

RecipeBuilder.newBuilder("meteor_mine", "fallen_star", 75)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val ctrl = event.controller;
        var pos = ctrl.pos.up(13);
        var pass = false;
        var i = -8;
        var j = -8;
        var k = -8;
        if (ctrl.getHarvestLevel() <= 0) {event.setFailed("未绑定挖掘等级，请使用镐子等工具右键控制器！");}
        while (k <= 8) {
            if (pass) {break;}
            while (j <= 8) {
                if (pass) {break;}
                while (i <= 8) {
                    if (pass) {break;}
                    val orepos = IBlockPos.create(pos.x + i, pos.y + j, pos.z + k);
                    val block = ctrl.world.getBlock(orepos);
                    if ((block.definition.id != "minecraft:obsidian") && (block.definition.id != "minecraft:air")) {
                        if (block.definition.harvestLevel <= ctrl.getHarvestLevel()) {
                            pass = true;
                        }
                    }
                    i += 1;
                }
                j += 1;
                i = -8;
            }
            k += 1;
            j = -8;
        }
        if (!pass) {event.setFailed("范围内不存在可采集矿石");}
    })
    .addEnergyPerTickInput(50)
    .addItemOutput(<minecraft:stone>).addItemModifier(function(controller, stack) {
        val ctrl = controller;
        var pos = ctrl.pos.up(13);
        var ore = <extratrees:logs.7:3>.asBlock();
        var count = 0;
        var a = true;
        var i = -8;
        var j = -8;
        var k = -8;
        while (k <= 8) {
            while (j <= 8) {
                while (i <= 8) {
                    val orepos = IBlockPos.create(pos.x + i, pos.y + j, pos.z + k);
                    val block = ctrl.world.getBlock(orepos);
                    if (block.definition.id != "minecraft:obsidian" && block.definition.id != "minecraft:air") {
                        if (a && block.definition.harvestLevel <= ctrl.getHarvestLevel()) {
                            ore = block;
                            count += 1;
                            a = false;
                            ctrl.world.catenation().sleep(5).then(function(world as IWorld, context) {ctrl.world.setBlockState(<blockstate:minecraft:air>,orepos);}).start();
                        }
                        if (!a && block.definition.id == ore.definition.id && block.meta == ore.meta) {
                            count += 1;
                            ctrl.world.catenation().sleep(5).then(function(world as IWorld, context) {ctrl.world.setBlockState(<blockstate:minecraft:air>,orepos);}).start();
                        }
                    }
                    i += 1;
                }
                j += 1;
                i = -8;
            }
            k += 1;
            j = -8;
        }
        if (count >= 1) {return (itemUtils.getItem(ore.definition.id,ore.meta) * count);}
        else {return <minecraft:stone>;}
    })
    .setThreadName("坠星采集模块")
    .addRecipeTooltip("§e自动采集坠星，请使用对应挖掘等级的匠魂工具右键控制器")
    .build();

MMEvents.onControllerGUIRender("fallen_star", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///坠星天矛控制面板///",
        "§a机器名称：§eLV3 - 坠星天矛",
        "§a挖掘等级：§e" ~ (event.controller.getHarvestLevel() as string)
    ];
    event.extraInfo = info;
});
