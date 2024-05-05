/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

import mod.mekanism.gas.IGasStack;
import mods.modularmachinery.RecipeBuilder;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

import scripts.util.machines as MMUtil;

function addLiquefaction(output as ILiquidStack, gas as IGasStack) {
    RecipeBuilder.newBuilder("liquefaction_" + gas.NAME, "condensation_liquefactor", 20)
    .addGasInput(gas * 320)
    .addEnergyPerTickInput(200)
    .addFluidOutput(output)
    .build();
}

addLiquefaction(<liquid:liquid_air>, <gas:air>);
addLiquefaction(<liquid:bromine>, <gas:bromine>);
addLiquefaction(<liquid:liquid_hydrogen>, <gas:hydrogen>);
addLiquefaction(<liquid:liquid_helium>, <gas:helium>);
addLiquefaction(<liquid:liquid_nitrogen>, <gas:nitrogen>);
addLiquefaction(<liquid:liquid_oxygen>, <gas:oxygen>);
addLiquefaction(<liquid:liquid_fluorine>, <gas:fluorine>);
addLiquefaction(<liquid:liquid_neon>, <gas:neon>);
addLiquefaction(<liquid:liquid_chlorine>, <gas:chlorine>);
addLiquefaction(<liquid:liquid_argon>, <gas:argon>);
addLiquefaction(<liquid:liquid_krypton>, <gas:krypton>);
addLiquefaction(<liquid:liquid_xenon>, <gas:xenon>);
addLiquefaction(<liquid:liquid_radon>, <gas:radon>);
addLiquefaction(<liquid:iodine>, <gas:iodine>);