/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50


import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.Sync;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;

import scripts.util.machines as MMUtil;

MachineModifier.setMaxParallelism("great_laser_alloyer", 4096);
MachineModifier.setInternalParallelism("great_laser_alloyer", 1);
MachineModifier.setMaxThreads("great_laser_alloyer", 8);

MMEvents.onControllerGUIRender("great_laser_alloyer", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///激光真空组合机控制面板///", "§a机器名称：§eLV5 - 激光真空组合机"];
    event.extraInfo = info;
});

RecipeBuilder.newBuilder("laseralloy_cadmium_chachalcogenide", "great_laser_alloyer", 1000)
    .addItemInput(<ore:dustCadmiumOxide> * 10)
    .addItemInput(<ore:dustCadmiumSulfide> * 5)
    .addItemInput(<ore:dustCadmiumSelenide> * 3)
    .addItemInput(<ore:dustCadmiumTelluride> * 3)
    .addItemInput(<ore:dustCadmiumPolonide> * 2)
    .addLaserInput(1.0E7)
    .addEnergyPerTickInput(1000000000)
    .setMaxThreads(1)
    .addFluidOutput(<liquid:cadmium_chalcogenide> * 2880)
    .build();

RecipeBuilder.newBuilder("laseralloy_boundless_alloy", "great_laser_alloyer", 200)
    .addItemInput(<ore:dustSky> * 8)
    .addItemInput(<ore:dustVoid> * 8)
    .addItemInput(<ore:dustAetherium> * 4)
    .addItemInput(<ore:dustCreativeAlloy> * 2)
    .addLaserInput(1.0E7)
    .addEnergyPerTickInput(800000000)
    .setMaxThreads(1)
    .addFluidOutput(<liquid:boundless_alloy> * 2880)
    .build();