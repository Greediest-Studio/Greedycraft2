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
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.jei.JEI;

import native.thaumcraft.api.aspects.Aspect;
import native.java.util.ArrayList;

var aspects as Aspect[] = Aspect.getCompoundAspects() as Aspect[];

MMEvents.onControllerGUIRender("aspect_crafter", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///要素合成机控制面板///", "§a机器名称：§eLV5 - 要素合成机"];
    event.extraInfo = info;
});

MachineModifier.setMaxThreads("aspect_crafter", 65536);
MachineModifier.setMaxParallelism("aspect_crafter", 1);
MachineModifier.setInternalParallelism("aspect_crafter", 1);

for aspect in aspects {
    if (!isNull(aspect.components)) {
        var components as Aspect[] = aspect.components;
        if (components.length == 2) {
            var tag0 as string = aspect.tag;
            var tag1 as string = components[0].tag;
            var tag2 as string = components[1].tag;
            RecipeBuilder.newBuilder("aspect_craft" + aspect.tag, "aspect_crafter", 1)
                .addAspcetInput(1, tag1)
                .addAspcetInput(1, tag2)
                .addAspcetOutput(1, tag0)
                .addEnergyPerTickInput(100)
                .build();
        }
    }
}

RecipeBuilder.newBuilder("aspect_craftcthulhu", "aspect_crafter", 1)
    .addAspcetInput(1, "coralos")
    .addAspcetInput(1, "dreadia")
    .addAspcetInput(1, "abyss")
    .addAspcetOutput(1, "cthulhu")
    .addEnergyPerTickInput(100)
    .build();