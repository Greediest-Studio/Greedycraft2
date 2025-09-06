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
MachineModifier.setInternalParallelism("mana_liquefactor", 1); 
MachineModifier.setMaxParallelism("mana_liquefactor", 1);

MachineModifier.setMaxThreads("mana_powereducer", 1);
MachineModifier.setInternalParallelism("mana_powereducer", 1); 
MachineModifier.setMaxParallelism("mana_powereducer", 1);

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

RecipeBuilder.newBuilder("mana_liquefaction1", "mana_liquefactor", 1, 5).addManaInput(1000).addFluidOutput(<liquid:mana>*1).setParallelized(false).build();
RecipeBuilder.newBuilder("mana_liquefaction2", "mana_liquefactor", 1, 4).addManaInput(10000).addFluidOutput(<liquid:mana>*10).setParallelized(false).build();
RecipeBuilder.newBuilder("mana_liquefaction3", "mana_liquefactor", 1, 3).addManaInput(100000).addFluidOutput(<liquid:mana>*100).setParallelized(false).build();
RecipeBuilder.newBuilder("mana_liquefaction4", "mana_liquefactor", 1, 2).addManaInput(1000000).addFluidOutput(<liquid:mana>*1000).setParallelized(false).build();
RecipeBuilder.newBuilder("mana_liquefaction5", "mana_liquefactor", 1, 1).addManaInput(10000000).addFluidOutput(<liquid:mana>*10000).setParallelized(false).build();
RecipeBuilder.newBuilder("mana_liquefaction6", "mana_liquefactor", 1, 0).addManaInput(100000000).addFluidOutput(<liquid:mana>*100000).setParallelized(false).build();

RecipeBuilder.newBuilder("mana_reduction1", "mana_powereducer", 1, 5).addFluidInput(<liquid:mana>*1).addManaOutput(1000).setParallelized(false).build();
RecipeBuilder.newBuilder("mana_reduction2", "mana_powereducer", 1, 4).addFluidInput(<liquid:mana>*10).addManaOutput(10000).setParallelized(false).build();
RecipeBuilder.newBuilder("mana_reduction3", "mana_powereducer", 1, 3).addFluidInput(<liquid:mana>*100).addManaOutput(100000).setParallelized(false).build();
RecipeBuilder.newBuilder("mana_reduction4", "mana_powereducer", 1, 2).addFluidInput(<liquid:mana>*1000).addManaOutput(1000000).setParallelized(false).build();
RecipeBuilder.newBuilder("mana_reduction5", "mana_powereducer", 1, 1).addFluidInput(<liquid:mana>*10000).addManaOutput(10000000).setParallelized(false).build();
RecipeBuilder.newBuilder("mana_reduction6", "mana_powereducer", 1, 0).addFluidInput(<liquid:mana>*100000).addManaOutput(100000000).setParallelized(false).build();