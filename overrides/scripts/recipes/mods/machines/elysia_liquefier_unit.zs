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

MachineModifier.setMaxThreads("elysia_liquefier", 1);
MachineModifier.setInternalParallelism("elysia_liquefier", 4);
MachineModifier.setMaxParallelism("elysia_liquefier", 65536);

MMEvents.onControllerGUIRender("elysia_liquefier", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§e///大型液化单元控制面板///",
        "§a机器名称：§eELYSIA单元 - 大型液化单元"
    ];
    event.extraInfo = info;
});

function addLiquefaction(output as ILiquidStack, gas as IGasStack) {
    RecipeBuilder.newBuilder("liquefaction_" + gas.NAME, "elysia_liquefier", 20)
    .addGasInput(gas * 320)
    .addEnergyPerTickInput(200)
    .addFluidOutput(output)
    .addRecipeTooltip("§d液化配方支持模块化电容升级，详情请查询“模块化电容”")
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
addLiquefaction(<liquid:hecryo_liquid>, <gas:hecryo_gas>);