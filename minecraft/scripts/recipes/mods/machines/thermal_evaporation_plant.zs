/*
 * This script is created for the GreedyCraft Tweaks by 咕咕咕.
 */

#priority 50

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.SmartInterfaceType;
import mods.ctutils.utils.Math;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MMEvents;
import mods.jei.JEI;

MachineModifier.setInternalParallelism("thermal_evaporation_plant", 32);
MachineModifier.setMaxThreads("thermal_evaporation_plant", 1);
MachineModifier.setMaxParallelism("thermal_evaporation_plant", 65536);

MachineModifier.addSmartInterfaceType("thermal_evaporation_plant", SmartInterfaceType.create("配方选择", 0.0f));

RecipeBuilder.newBuilder("r1","thermal_evaporation_plant",1)
    .addEnergyPerTickInput(100000)
    .addFluidInputs(<liquid:water> * 1000)
    .addFluidOutput(<liquid:heavywater> * 100)
    .addSmartInterfaceDataInput("配方选择", 0.0f)
    .build();

RecipeBuilder.newBuilder("r1a","thermal_evaporation_plant",1)
    .addEnergyPerTickInput(100000)
    .addFluidInputs(<liquid:water> * 1000)
    .addFluidOutput(<liquid:brine> * 100)
    .addSmartInterfaceDataInput("配方选择", 1.0f)
    .build();

RecipeBuilder.newBuilder("r2","thermal_evaporation_plant",1)
    .addEnergyPerTickInput(10000)
    .addFluidInputs(<liquid:brine> * 1000)
    .addFluidOutput(<liquid:liquidlithium> * 100)
    .build();

RecipeBuilder.newBuilder("r3","thermal_evaporation_plant",1)
    .addEnergyPerTickInput(10000)
    .addFluidInputs(<liquid:liquidsodium> * 1000)
    .addFluidOutput(<liquid:liquidsuperheatedsodium> * 1)
    .build();

MMEvents.onControllerGUIRender("thermal_evaporation_plant", function(event as ControllerGUIRenderEvent) {
    var mode as int = event.controller.getControllerMode("模式");
    var info as string[] = [
        "§a///电热热力蒸馏塔控制面板///",
        "§a机器名称：§eLV3 - 电热热力蒸馏塔"
    ];
    event.extraInfo = info;
});
