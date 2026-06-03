/*
 * This script is created for the GreedyCraft Tweaks by mc_Edwin.
 */

#priority 50

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
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifierBuilder;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.SmartInterfaceData;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.MachineUpgradeBuilder;
import mods.modularmachinery.MachineUpgradeHelper;

MachineModifier.setMaxThreads("elysia_etcher", 8);
MachineModifier.setInternalParallelism("elysia_etcher", 4);
MachineModifier.setMaxParallelism("elysia_etcher", 65536);

MMEvents.onControllerGUIRender("elysia_enricher", function(event as ControllerGUIRenderEvent) {
    var info as string[] = [
        "§e///大型精炼单元控制面板///",
        "§a机器名称：§eELYSIA单元 - 大型精炼单元"
    ];
    event.extraInfo = info;
});

zenClass distillRecipe {
    val input as ILiquidStack;
    val output as ILiquidStack = null;
    val byproduct as IItemStack = null;
    val totalRF as int;
    zenConstructor(i as ILiquidStack, o as ILiquidStack, b as IItemStack, RF as int) {
        input = i;
        output = o;
        byproduct = b;
        totalRF = RF;
    }
}

var distillRecipes as distillRecipe[] = [
    distillRecipe(<liquid:coal> * 200, <liquid:refined_oil> * 150, <thermalfoundation:material:833>, 5000),
    distillRecipe(<liquid:crude_oil> * 200, <liquid:refined_oil> * 200, <thermalfoundation:material:833>, 5000),
    distillRecipe(<liquid:refined_oil> * 150, <liquid:refined_fuel> * 150, <thermalfoundation:material:771>, 5000),
    distillRecipe(<liquid:refined_fuel> * 150, <liquid:mixed_hydrocarbon> * 150, null, 50000),
    distillRecipe(<liquid:brine> * 1000, <liquid:rich_brine> * 100, null, 100000),
    distillRecipe(<liquid:binnie.wine.carrot> * 500, <liquid:binnie.brandy.fruit> * 200, null, 5000),
    distillRecipe(<liquid:binnie.wine.cranberry> * 500, <liquid:binnie.brandy.fruit> * 200, null, 5000),
    distillRecipe(<liquid:binnie.cider.peach> * 500, <liquid:binnie.brandy.fruit> * 200, null, 5000),
    distillRecipe(<liquid:binnie.wine.banana> * 500, <liquid:binnie.brandy.fruit> * 200, null, 5000),
    distillRecipe(<liquid:binnie.liquor.elderberry> * 500, <liquid:binnie.spirit.neutral> * 200, null, 5000),
    distillRecipe(<liquid:binnie.liquor.cherry> * 500, <liquid:binnie.spirit.neutral> * 200, null, 5000),
    distillRecipe(<liquid:binnie.liquor.apricot> * 500, <liquid:binnie.spirit.neutral> * 200, null, 5000),
    distillRecipe(<liquid:binnie.liquor.pear> * 500, <liquid:binnie.spirit.neutral> * 200, null, 5000),
    distillRecipe(<liquid:binnie.liquor.fruit> * 500, <liquid:binnie.spirit.neutral> * 200, null, 5000),
    distillRecipe(<liquid:binnie.liquor.apple> * 500, <liquid:binnie.spirit.neutral> * 200, null, 5000),
    distillRecipe(<liquid:binnie.cider.apple> * 500, <liquid:binnie.brandy.apple> * 200, null, 5000),
    distillRecipe(<liquid:binnie.wine.apricot> * 500, <liquid:binnie.brandy.apricot> * 200, null, 5000),
    distillRecipe(<liquid:binnie.wine.citrus> * 500, <liquid:binnie.brandy.citrus> * 200, null, 5000),
    distillRecipe(<liquid:binnie.wine.cherry> * 500, <liquid:binnie.brandy.cherry> * 200, null, 5000),
    distillRecipe(<liquid:binnie.wine.elderberry> * 500, <liquid:binnie.brandy.elderberry> * 200, null, 5000),
    distillRecipe(<liquid:binnie.wine.plum> * 500, <liquid:binnie.brandy.plum> * 200, null, 5000),
    distillRecipe(<liquid:binnie.ciderpear> * 500, <liquid:binnie.brandy.pear> * 200, null, 5000),
    distillRecipe(<liquid:binnie.brandy.fruit> * 500, <liquid:binnie.liquor.fruit> * 200, null, 5000),
    distillRecipe(<liquid:binnie.brandy.apricot> * 500, <liquid:binnie.liquor.apricot> * 200, null, 5000),
    distillRecipe(<liquid:binnie.brandy.pear> * 500, <liquid:binnie.liquor.pear> * 200, null, 5000),
    distillRecipe(<liquid:binnie.brandy.elderberry> * 500, <liquid:binnie.liquor.elderberry> * 200, null, 5000),
    distillRecipe(<liquid:binnie.brandy.cherry> * 500, <liquid:binnie.liquor.cherry> * 200, null, 5000),
    distillRecipe(<liquid:resin> * 200, <liquid:tree_oil> * 100, <thermalfoundation:material:832>, 5000),
    distillRecipe(<liquid:canolaoil> * 100, <liquid:refinedcanolaoil> * 100, null, 1000),
    distillRecipe(<liquid:biocrude> * 200, <liquid:refined_biofuel> * 100, null, 5000),
    distillRecipe(<liquid:biomass> * 100, <liquid:bio.ethanol> * 30, null, 5000),
    distillRecipe(<liquid:blood> * 1000, <liquid:serum> * 10, null, 100000)
];

for recipe in distillRecipes {
    var builder = RecipeBuilder.newBuilder("distill_" ~ recipe.input.definition.name, "elysia_enricher", recipe.totalRF / 1000);
    builder.addEnergyPerTickInput(1000);
    builder.addFluidInput(recipe.input);
    builder.addFluidOutput(recipe.output);
    builder.addRecipeTooltip("§d精炼配方支持模块化电容升级，详情请查询“模块化电容”");
    if (!isNull(recipe.byproduct)) {
        builder.addItemOutput(recipe.byproduct);
    }
    builder.build();
}