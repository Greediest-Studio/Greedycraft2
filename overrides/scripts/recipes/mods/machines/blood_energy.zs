/*
 * This script is created for the GreedyCraft 
 * 为了美观和方便交互将两者拆分为不同机器
 * (其实是不会用工厂控制器)
 */

#priority 20

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.MachineModifier;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxParallelism("blood_energy", 1000000000 as int);
MachineModifier.setInternalParallelism("blood_energy", 64 as int);

RecipeBuilder.newBuilder("blood", "blood_energy", 1)
    .addRecipeTooltip("自带64并行！")
    .addFluidInput(<liquid:substrate_lifeessence> * 100)
    .addAspectInput("victus", 25)
    .addEnergyPerTickInput(10000)
    .addFluidOutput(<liquid:lifeessence> * 100)
    .build();
    