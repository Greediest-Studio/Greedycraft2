/*
 * This script is created for the GreedyCraft Tweaks by 孤梦梦.
 */

#priority 50

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.world.IWorld;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.player.IPlayer;
import crafttweaker.container.IContainer;
import crafttweaker.block.IBlock;
import crafttweaker.world.IBlockPos;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.ctutils.utils.Math;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.FactoryRecipeEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import crafttweaker.world.IFacing;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.MachineStructureUpdateEvent;
import mods.jei.JEI;
import mods.zenutils.DataUpdateOperation.OVERWRITE;
import mods.zenutils.DataUpdateOperation.APPEND;
import mods.zenutils.DataUpdateOperation.MERGE;
import mods.zenutils.DataUpdateOperation.REMOVE;
import mods.zenutils.DataUpdateOperation.BUMP;

MachineModifier.setMaxThreads("mana_liquefactor", 1);
MachineModifier.setInternalParallelism("mana_liquefactor", 2147483647); 
MachineModifier.setMaxParallelism("mana_liquefactor", 2147483647);

MachineModifier.setMaxThreads("mana_powereducer", 1);
MachineModifier.setInternalParallelism("mana_powereducer", 2147483647); 
MachineModifier.setMaxParallelism("mana_powereducer", 2147483647);

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

RecipeBuilder.newBuilder("mana_reduction", "mana_powereducer", 1)
    .addFluidInput(<liquid:mana> * 1)
    .addManaOutput(1000)
    .build();

RecipeBuilder.newBuilder("mana_liquefaction", "mana_liquefactor", 1)
    .addFluidOutput(<liquid:mana> * 1)
    .addManaInput(1000)
    .build();
