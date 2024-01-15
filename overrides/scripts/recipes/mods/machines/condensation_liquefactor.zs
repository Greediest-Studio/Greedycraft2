/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50


import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mods.modularmachinery.RecipeBuilder;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

import scripts.util.machines as MMUtil;

function addLiquefaction(output as ILiquidStack, gas as string) {
    RecipeBuilder.newBuilder("liquefaction_" + gas, "condensation_liquefactor", 20)
    .addGasInput(gas, 320)
    .addEnergyPerTickInput(200)
    .addFluidOutput(output)
    .build();
}

addLiquefaction(<liquid:liquid_air>, "air");
addLiquefaction(<liquid:bromine>, "bromine");
addLiquefaction(<liquid:liquid_hydrogen>, "hydrogen");
addLiquefaction(<liquid:liquid_helium>, "helium");
addLiquefaction(<liquid:liquid_nitrogen>, "nitrogen");
addLiquefaction(<liquid:liquid_oxygen>, "oxygen");
addLiquefaction(<liquid:liquid_fluorine>, "fluorine");
addLiquefaction(<liquid:liquid_neon>, "neon");
addLiquefaction(<liquid:liquid_chlorine>, "chlorine");
addLiquefaction(<liquid:liquid_argon>, "argon");
addLiquefaction(<liquid:liquid_krypton>, "krypton");
addLiquefaction(<liquid:liquid_xenon>, "xenon");
addLiquefaction(<liquid:liquid_radon>, "radon");
addLiquefaction(<liquid:iodine>, "iodine");