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
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("stratified_precipitator", 8);
MachineModifier.setInternalParallelism("stratified_precipitator", 1);
MachineModifier.setMaxParallelism("stratified_precipitator", 256);

MMEvents.onControllerGUIRender("stratified_precipitator", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///沉淀分离机控制面板///", "§a机器名称：§eLV4 - 沉淀分离机"];
    event.extraInfo = info;
});

RecipeBuilder.newBuilder("alkali", "stratified_precipitator", 600)
    .addFluidInput(<liquid:poor_brine> * 10000)
    .addFluidInput(<liquid:sodium_chloroplatinate_solution> * 666)
    .addEnergyPerTickInput(20000)
    .addItemOutput(<additions:potassium_chloroplatinate> * 3)
    .addItemOutput(<additions:potassium_chloroplatinate>).setChance(0.7f)
    .addItemOutput(<additions:potassium_chloroplatinate>).setChance(0.3f)
    .addItemOutput(<additions:rubidium_chloroplatinate>).setChance(0.1f)
    .addItemOutput(<additions:cesium_chloroplatinate>).setChance(0.15f)
    .addFluidOutput(<liquid:water> * 10000)
    .build();

RecipeBuilder.newBuilder("hou", "stratified_precipitator", 600)
    .addFluidInput(<liquid:ammonia_brine> * 1000)
    .addFluidInput(<liquid:carbon_dioxide> * 1000)
    .addEnergyPerTickInput(20000)
    .addItemOutput(<additions:sodium_hydrogen_carbonate>)
    .addFluidOutput(<liquid:ammonium_chloride_solution> * 666)
    .build();

RecipeBuilder.newBuilder("caminite", "stratified_precipitator", 600)
    .addFluidInput(<liquid:magnesium_sulfate_solution> * 1332)
    .addFluidInput(<liquid:sodium_hydroxide_solution> * 1332)
    .addEnergyPerTickInput(20000)
    .addItemOutput(<additions:magnesium_sulfate_hydroxide>)
    .addFluidOutput(<liquid:sodium_sulfate_solution> * 666)
    .build();