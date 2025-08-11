#priority 30


import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineUpgradeBuilder;
import mods.modularmachinery.MachineUpgradeHelper;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeModifier;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MMEvents;
import mods.ctutils.utils.Math;

MachineModifier.setMaxParallelism("air_collector", 256);
MachineModifier.setInternalParallelism("air_collector", 1);
MachineModifier.setMaxThreads("air_collector", 1);

RecipeBuilder.newBuilder("overworld_air", "air_collector", 2)
    .addDimensionInput(0)
    .addEnergyPerTickInput(100)
    .addGasOutput(<gas:air> * 500)
    .build();

RecipeBuilder.newBuilder("nether_air", "air_collector", 2)
    .addDimensionInput(-1)
    .addEnergyPerTickInput(100)
    .addGasOutput(<gas:airnether> * 500)
    .build();

RecipeBuilder.newBuilder("end_air", "air_collector", 2)
    .addDimensionInput(1)
    .addEnergyPerTickInput(100)
    .addGasOutput(<gas:airend> * 500)
    .build();

RecipeBuilder.newBuilder("abyss_air1", "air_collector", 2)
    .addDimensionInput(50)
    .addEnergyPerTickInput(100)
    .addGasOutput(<gas:airabyss> * 500)
    .build();

RecipeBuilder.newBuilder("abyss_air2", "air_collector", 2)
    .addDimensionInput(51)
    .addEnergyPerTickInput(100)
    .addGasOutput(<gas:airabyss> * 500)
    .build();

RecipeBuilder.newBuilder("abyss_air3", "air_collector", 2)
    .addDimensionInput(52)
    .addEnergyPerTickInput(100)
    .addGasOutput(<gas:airabyss> * 500)
    .build();

RecipeBuilder.newBuilder("abyss_air4", "air_collector", 2)
    .addDimensionInput(53)
    .addEnergyPerTickInput(100)
    .addGasOutput(<gas:airabyss> * 500)
    .build();

RecipeBuilder.newBuilder("abyss_air5", "air_collector", 2)
    .addDimensionInput(54)
    .addEnergyPerTickInput(100)
    .addGasOutput(<gas:airabyss> * 500)
    .build();

RecipeBuilder.newBuilder("abyss_air6", "air_collector", 2)
    .addDimensionInput(55)
    .addEnergyPerTickInput(100)
    .addGasOutput(<gas:airabyss> * 500)
    .build();

MMEvents.onControllerGUIRender("air_collector", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§a///空气收集器控制面板///",
        "§a机器名称：§eLV2 - 空气收集器"
    ];
    event.extraInfo = info;
});
