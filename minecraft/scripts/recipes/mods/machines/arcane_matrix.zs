/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */


#priority 50

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.player.IPlayer;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.ctutils.utils.Math;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.jei.JEI;

MMEvents.onControllerGUIRender("arcane_matrix", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///机械注魔矩阵控制面板///", "§a机器名称：§eLV4 - 机械注魔矩阵"];
    event.extraInfo = info;
});

MachineModifier.setMaxThreads("arcane_matrix", 8);
MachineModifier.setMaxParallelism("arcane_matrix", 256);
MachineModifier.setInternalParallelism("arcane_matrix", 1);

function addArcaneFusionRecipe(output as IItemStack, inputs as IIngredient[], aspects as int[string], knowledge as string) {
    var builder = RecipeBuilder.newBuilder("arcane_fusion_" + output.definition.id + output.metadata, "arcane_matrix", 10);
    for input in inputs {
        builder.addItemInput(input);
    }
    builder.addItemOutput(output);
    for aspect in aspects {
        builder.addAspcetInput(aspects[aspect], aspect);
    }
    builder.addPreCheckHandler(function(event as RecipeCheckEvent) {
        var uuid as string = event.controller.ownerUUID;
        if (!isNull(server.getPlayerByUUID(uuid))) {
            var player as IPlayer = event.controller.ownerPlayer;
            if (!(player.thaumcraftKnowledge.isResearchKnown(knowledge)) && knowledge != "") {
                event.setFailed("研究未解锁！");
            }
        } else {
            event.setFailed("玩家不在线！");
        }
    });
    if (knowledge != "") {
        builder.addRecipeTooltip("需求研究：" + knowledge);
    }
    builder.build();
}
