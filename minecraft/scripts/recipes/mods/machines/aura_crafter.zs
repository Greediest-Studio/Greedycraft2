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

MachineModifier.setMaxParallelism("aura_crafter", 256);
MachineModifier.setInternalParallelism("aura_crafter", 1);
MachineModifier.setMaxThreads("aura_crafter", 8);

MMEvents.onControllerGUIRender("aura_crafter", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///灵气聚集台控制面板///", "§a机器名称：§eLV4 - 灵气聚集台"];
    event.extraInfo = info;
});

RecipeBuilder.newBuilder("aurune_craft", "aura_crafter", 240)
    .addItemInput(<ore:ingotSky> * 2)
    .addItemInput(<ore:ingotEarth> * 2)
    .addItemInput(<ore:ingotEverite> * 1)
    .addItemInput(<naturesaura:gold_powder> * 2)
    .addItemInput(<ore:gemAmbrosium> * 4)
    .addAuraInput(1000, true)
    .addGasInput(<gas:air> * 1000)
    .addGasInput(<gas:airnether> * 1000)
    .addGasInput(<gas:airend> * 1000)
    .addItemOutput(<additions:aurune_ingot> * 3)
    .build();

RecipeBuilder.newBuilder("sky_craft", "aura_crafter", 120)
    .addItemInput(<ore:ingotAuraIron> * 4)
    .addItemInput(<ore:dustDiamond>)
    .addAuraInput(200, true)
    .addGasInput(<gas:air> * 500)
    .addGasInput(<gas:airnether> * 500)
    .addItemOutput(<naturesaura:sky_ingot> * 2)
    .build();

RecipeBuilder.newBuilder("earth_craft", "aura_crafter", 180)
    .addItemInput(<ore:ingotHolysteel> * 2)
    .addItemInput(<ore:ingotTerrasteel>)
    .addAuraInput(800, true)
    .addGasInput(<gas:air> * 800)
    .addGasInput(<gas:airend> * 800)
    .addItemOutput(<gct_mobs:earth_ingot> * 2)
    .build();

RecipeBuilder.newBuilder("iron_craft", "aura_crafter", 100)
    .addItemInput(<ore:ingotIron>)
    .addAuraInput(100, true)
    .addItemOutput(<naturesaura:infused_iron>)
    .build();
