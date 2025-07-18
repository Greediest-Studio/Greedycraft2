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
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;

import mod.mekanism.gas.IGasStack;

MachineModifier.setMaxThreads("elysia_pyrolyzer", 1);
MachineModifier.setInternalParallelism("elysia_pyrolyzer", 4);
MachineModifier.setMaxParallelism("elysia_pyrolyzer", 65536);

RecipeBuilder.newBuilder("phosphorus", "elysia_pyrolyzer", 400)
    .addItemInput(<ore:gemApatite> * 2)
    .addItemInput(<ore:gemQuartz> * 3)
    .addItemInput(<ore:fuelCoke> * 5)
    .addEnergyPerTickInput(1024)
    .addGasOutput(<gas:carbonoxide> * 5000)
    .addFluidOutput(<liquid:phosphorus> * 72)
    .addItemOutput(<thermalfoundation:material:864> * 3)
    .addRecipeTooltip("§d热解配方支持模块化电容升级，详情请查询“模块化电容”")
    .build();

RecipeBuilder.newBuilder("strontium", "elysia_pyrolyzer", 400)
    .addItemInput(<ore:dustStrontiumSulfate> * 1)
    .addItemInput(<ore:fuelCoke> * 4)
    .addEnergyPerTickInput(1024)
    .addGasOutput(<gas:carbonoxide> * 4000)
    .addItemOutput(<additions:strontium_sulfide> * 1)
    .addRecipeTooltip("§d热解配方支持模块化电容升级，详情请查询“模块化电容”")
    .build();

RecipeBuilder.newBuilder("barium", "elysia_pyrolyzer", 400)
    .addItemInput(<ore:dustBariumSulfate> * 1)
    .addItemInput(<ore:fuelCoke> * 4)
    .addEnergyPerTickInput(1024)
    .addGasOutput(<gas:carbonoxide> * 4000)
    .addItemOutput(<additions:barium_sulfide> * 1)
    .addRecipeTooltip("§d热解配方支持模块化电容升级，详情请查询“模块化电容”")
    .build();

RecipeBuilder.newBuilder("calcium", "elysia_pyrolyzer", 600)
    .addItemInput(<ore:blockCalciumCarbonate> * 1)
    .addEnergyPerTickInput(1024)
    .addGasOutput(<gas:carbonoxide> * 9000)
    .addItemOutput(<additions:calcium_oxide> * 9)
    .addRecipeTooltip("§d热解配方支持模块化电容升级，详情请查询“模块化电容”")
    .build();