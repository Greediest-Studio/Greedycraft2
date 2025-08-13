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
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("fallen_star", 1);
MachineModifier.setInternalParallelism("fallen_star", 1);
MachineModifier.setMaxParallelism("fallen_star", 1);

MMEvents.onControllerGUIRender("fallen_star", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///坠星天矛控制面板///",
        "§a机器名称：§eLV3 - 坠星天矛"
    ];
    event.extraInfo = info;
});
