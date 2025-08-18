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

RecipeBuilder.newBuilder("meteor_mine", "fallen_star", 20)
    .addEnergyPerTickInput(50)
    .addItemOutput(<minecraft:stone>).addItemModifier(function(controller, stack) {
        var pos = controller.pos.up(13);
        var x = pos.x;
        var y = pos.y;
        var z = pos.z;
        var start as IBlock = controller.world.getBlocksByCenterAndRadius(pos, 8)[0];
        var pass as bool = false;
        for i in 0 to controller.world.getBlocksByCenterAndRadius(pos, 8).length {
            if (controller.world.getBlocksByCenterAndRadius(pos, 8)[i].definition.id != "minecraft:obsidian") {
                start = controller.world.getBlocksByCenterAndRadius(pos, 8)[i];
                pass = true;
                break;
            }
        }
        if ((start.definition.getHarvestLevel() > controller.getHarvestLevel()) || start.definition.hardness == -1) {
            pass = false;
        }
        if (pass) {
            var num as int = 0;
            for i in controller.world.getBlocksByCenterAndRadius(pos, 8) {
                var block as IBlock = i;
                if (block.definition.id == start.definition.id) {
                    num += 1;
                }
            }
            val output as IItemStack = itemUtils.getItem(start.definition.id, start.meta);
            server.commandManager.executeCommandSilent(server, "fill " + (x + 8) + " " + (y + 8) + " " + (z + 8) + " " + (x - 8) + " " + (y) + " " + (z - 8) + " air 0 replace " + start.definition.id + " " + start.meta);
            server.commandManager.executeCommandSilent(server, "fill " + (x + 8) + " " + (y) + " " + (z + 8) + " " + (x - 8) + " " + (y - 8) + " " + (z - 8) + " air 0 replace " + start.definition.id + " " + start.meta);
            return output * num;
        }
        return <minecraft:air>;
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
