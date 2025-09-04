/*
 * This script is created for the GreedyCraft Tweaks by 孤梦梦.
 */

#priority 50
#loader crafttweaker reloadable

import crafttweaker.world.IWorld;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.block.IBlock;
import crafttweaker.block.IBlockDefinition;
import crafttweaker.world.IBlockPos;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.data.IData;
import crafttweaker.util.Math;

import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.Sync;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;

MachineModifier.setMaxThreads("mana_liquefactor", 1);
MachineModifier.setInternalParallelism("mana_liquefactor", 2147483647);
MachineModifier.setMaxParallelism("mana_liquefactor", 2147483647);

MMEvents.onControllerGUIRender("mana_liquefactor", function(event as ControllerGUIRenderEvent) {
    val info as string[] = [
        "§a///魔力液化机控制面板///",
        "§a机器名称：§eLV2 - 魔力液化机"
    ];
    event.extraInfo = info;
});

MMEvents.onControllerGUIRender("mana_powereducer", function(event as ControllerGUIRenderEvent) {
    val info as string[] = [
        "§a///魔力释能机控制面板///",
        "§a机器名称：§eLV2 - 魔力释能机"
    ];
    event.extraInfo = info;
});

RecipeBuilder.newBuilder("mana_liquefaction3", "mana_liquefactor", 1).addManaInput(100000).addFluidOutput(<liquid:mana>*100).build();

RecipeBuilder.newBuilder("mana_reduction3", "mana_powereducer", 1).addFluidInput(<liquid:mana>*100).addManaOutput(100000).build();
