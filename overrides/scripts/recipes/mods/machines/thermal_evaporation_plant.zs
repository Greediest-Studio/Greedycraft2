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
import mods.jei.JEI;

MachineModifier.addSmartInterfaceType("thermal_evaporation_plant", 
    SmartInterfaceType.create("mode",1.0f)
        .setHeaderInfo("§e///模式设置///")
        .setValueInfo("§e///当前模式：%.2f")
        .setNotEqualMessage("§e模式非法")
        .setFooterInfo("§e/////////////////")
);

MachineModifier.setInternalParallelism("thermal_evaporation_plant", 256);

RecipeBuilder.newBuilder("r1","thermal_evaporation_plant",1)
    .addEnergyPerTickInput(100000)
    .addSmartInterfaceDataInput("mode", 1)
    .addFluidInputs(<liquid:water> * 1000)
    .addFluidOutput(<liquid:heavywater> * 100)
    .build();

RecipeBuilder.newBuilder("r1a","thermal_evaporation_plant",1)
    .addEnergyPerTickInput(100000)
    .addSmartInterfaceDataInput("mode", 2)
    .addFluidInputs(<liquid:water> * 1000)
    .addFluidOutput(<liquid:brine> * 100)
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