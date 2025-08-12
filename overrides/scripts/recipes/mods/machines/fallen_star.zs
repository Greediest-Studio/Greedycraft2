/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.game.IGame;

import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.RecipeFinishEvent;
import mods.modularmachinery.RecipePrimer;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("fallen_star", 0);
MachineModifier.setInternalParallelism("fallen_star", 1);
MachineModifier.setMaxParallelism("fallen_star", 1);
MachineModifier.addCoreThread("fallen_star", FactoryRecipeThread.createCoreThread("坠星执行模块"));
MachineModifier.addCoreThread("fallen_star", FactoryRecipeThread.createCoreThread("坠星采集模块")/*.addRecipe("meteor_mine")*/);
