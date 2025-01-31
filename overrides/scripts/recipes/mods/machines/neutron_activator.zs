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

MachineModifier.setInternalParallelism("neutron_activator", 1000000000);

RecipeBuilder.newBuilder("po","neutron_activator",1)
    .addEnergyPerTickInput(10000)
    .addGasInput(<gas:nuclearwaste> * 10)
    .addGasInput(<gas:polonium> * 1)
    .addRecipeTooltip("§2内置近乎无穷的并行数，就看你产能能不能跟上了（笑")
    .build();

RecipeBuilder.newBuilder("tritium","neutron_activator",1)
    .addEnergyPerTickInput(1000)
    .addGasInput(<gas:lithium> * 1)
    .addGasInput(<gas:tritium> * 1)
    .addRecipeTooltip("§2内置近乎无穷的并行数，就看你产能能不能跟上了（笑")
    .build();