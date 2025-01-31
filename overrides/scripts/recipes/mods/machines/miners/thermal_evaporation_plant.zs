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
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setInternalParallelism("thermal_evaporation_plant", 100000000);

RecipeBuilder.newBuilder("r1","thermal_evaporation_plant",1)
    .addEnergyPerTickInput(1000000)
    .addFluidInputs(<liquid:water> * 10000)
    .addFluidOutput(<liquid:brine> * 1000)
    .addFluidOutput(<liquid:heavywater> * 1000)
    .addRecipeTooltip("§2内置近乎无穷的并行数，就看你产能能不能跟上了（笑")
    .build();

RecipeBuilder.newBuilder("r2","thermal_evaporation_plant",1)
    .addEnergyPerTickInput(100000)
    .addFluidInputs(<liquid:brine> * 10000)
    .addFluidOutput(<liquid:liquidlithium> * 1000)
    .addRecipeTooltip("§2内置近乎无穷的并行数，就看你产能能不能跟上了（笑")
    .build();

RecipeBuilder.newBuilder("r3","thermal_evaporation_plant",1)
    .addEnergyPerTickInput(100000)
    .addFluidInputs(<liquid:liquidsodium> * 10000)
    .addFluidOutput(<liquid:liquidsuperheatedsodium> * 10)
    .addRecipeTooltip("§2内置近乎无穷的并行数，就看你产能能不能跟上了（笑")
    .build();