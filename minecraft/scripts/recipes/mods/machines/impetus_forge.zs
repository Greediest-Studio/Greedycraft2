/*
 * This script is created for the GreedyCraft Tweaks by 孤梦梦.
 */


#priority 50

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("impetus_forge", 1);
MachineModifier.setInternalParallelism("impetus_forge", 1);
MachineModifier.setMaxParallelism("impetus_forge", 256);

MMEvents.onControllerGUIRender("impetus_forge", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///元动冶炼炉控制面板///", "§a机器名称：§eLV4 - 元动冶炼炉"];
    event.extraInfo = info;
});

RecipeBuilder.newBuilder("impetusite", "impetus_forge",60)
    .addItemInput(<ore:ingotPrimordial>)
    .addDimensionInput(14676)
    .addImpetusInput(1000)
    .addItemOutput(<additions:impetusite_ingot>)
    .build();