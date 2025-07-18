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

MachineModifier.setMaxThreads("elysia_vaporizer", 1);
MachineModifier.setInternalParallelism("elysia_vaporizer", 4);
MachineModifier.setMaxParallelism("elysia_vaporizer", 65536);

function addVaporization(output as ILiquidStack, gas as IGasStack) {
    RecipeBuilder.newBuilder("vaporization_" + gas.NAME, "elysia_vaporizer", 20)
    .addFluidInput(output)
    .addEnergyPerTickInput(200)
    .addGasOutput(gas * 320)
    .addRecipeTooltip("§d汽化配方支持模块化电容升级，详情请查询“模块化电容”")
    .build();
}

addVaporization(<liquid:liquid_air>, <gas:air>);
addVaporization(<liquid:bromine>, <gas:bromine>);
addVaporization(<liquid:liquid_hydrogen>, <gas:hydrogen>);
addVaporization(<liquid:liquid_helium>, <gas:helium>);
addVaporization(<liquid:liquid_nitrogen>, <gas:nitrogen>);
addVaporization(<liquid:liquid_oxygen>, <gas:oxygen>);
addVaporization(<liquid:liquid_fluorine>, <gas:fluorine>);
addVaporization(<liquid:liquid_neon>, <gas:neon>);
addVaporization(<liquid:liquid_chlorine>, <gas:chlorine>);
addVaporization(<liquid:liquid_argon>, <gas:argon>);
addVaporization(<liquid:liquid_krypton>, <gas:krypton>);
addVaporization(<liquid:liquid_xenon>, <gas:xenon>);
addVaporization(<liquid:liquid_radon>, <gas:radon>);
addVaporization(<liquid:iodine>, <gas:iodine>);
addVaporization(<liquid:hecryo_liquid>, <gas:hecryo_gas>);