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
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.jei.JEI;

import mods.zenutils.DataUpdateOperation.MERGE;

import native.thaumcraft.api.aspects.AspectHelper;
import native.thaumcraft.api.aspects.AspectList;
import native.thaumcraft.api.aspects.Aspect;

MMEvents.onControllerGUIRender("arcane_melter", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///源质升华炉控制面板///", "§a机器名称：§eLV4 - 源质升华炉"];
    event.extraInfo = info;
});

MachineModifier.setMaxThreads("arcane_melter", 16);
MachineModifier.setMaxParallelism("arcane_melter", 2048);
MachineModifier.setInternalParallelism("arcane_melter", 64);

RecipeAdapterBuilder.create("arcane_melter", "thaumcraft:whimcraft_smelter")
    .addEnergyPerTickInput(100)
    .build();