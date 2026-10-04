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
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.RecipeTickEvent;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.ctutils.utils.Math;
import mods.jei.JEI;

MachineModifier.setMaxThreads("reverser", 1);
MachineModifier.setMaxParallelism("reverser", 65536);
MachineModifier.setInternalParallelism("reverser", 1);

MMEvents.onControllerGUIRender("reverser", function(event as ControllerGUIRenderEvent) {
    var info as string[] = ["§a///反转灌注器控制面板///", "§a机器名称：§eLV4 - 反转灌注器"];
    event.extraInfo = info;
});

val recipeList as IIngredient[IItemStack] = {
    <additions:reversed_orichalcos> : <ore:ingotOrichalcos>,
    <abyssalcraft:antibeef> : <minecraft:beef>,
    <abyssalcraft:antichicken> : <minecraft:chicken>,
    <abyssalcraft:antipork> : <minecraft:porkchop>,
    <abyssalcraft:antiflesh> : <minecraft:rotten_flesh>,
    <abyssalcraft:antibone> : <minecraft:bone>,
    <abyssalcraft:antispidereye> : <minecraft:spider_eye>,
    <abyssalcraft:anticorflesh> : <abyssalcraft:corflesh>,
    <abyssalcraft:anticorbone> : <abyssalcraft:corbone>,
    <gct_additions:reversed_alf_cobble_stone> : <gct_additions:alf_cobble_stone>,
    <gct_additions:reversed_alf_dirt> : <gct_additions:alf_dirt>,
    <gct_additions:reversed_alf_grass> : <gct_additions:alf_grass>,
    <gct_additions:reversed_alf_stone> : <gct_additions:alf_stone>,
    <gct_additions:reversed_dreamwood_log> : <gct_additions:dreamwood_log>,
    <gct_additions:reversed_dreamwood_leaves> : <gct_additions:dreamwood_leaves>,
    <gct_additions:reversed_dreamwood_plank> : <botania:dreamwood:1>,
    <gct_additions:reversed_dreamwood_slab> : <botania:dreamwood1slab>,
    <gct_additions:reversed_dreamwood_stairs> : <botania:dreamwood1stairs>,
    <gct_additions:reversed_dreamwood_plank_rottened> : <botania:dreamwood:2>
};

var i = 0;
for recipe in recipeList {
    RecipeBuilder.newBuilder("reverser_" + i, "reverser", 40).addItemInput(recipeList[recipe]).addItemOutput(recipe).addFluidInput(<liquid:liquidantimatter> * 500).build();
    i += 1;
}